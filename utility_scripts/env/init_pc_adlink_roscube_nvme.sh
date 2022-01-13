#!/bin/bash

###################################################################################
# Tested on ADLink ROScube-X with 2TB m.2 NVME and Intel PCIe Wifi Card 
# --> Flashed with Vendor Supplied "mfi_rqx_580" BSP/Image  
# --> R32 (release), REVISION: 5.0, GCID: 25531747, BOARD: t186ref, EABI: aarch6
# --> Kernel : 4.9.201-v1.0.8
###################################################################################

############## Transfer Rootfs to NVME 
echo "------------> Formatting NVME"
sudo parted /dev/nvme0n1 mklabel gpt
sudo parted -a opt /dev/nvme0n1 mkpart primary ext4 0% 100%
sudo mkfs.ext4 /dev/nvme0n1p1
sudo mount /dev/nvme0n1p1 /mnt
sudo rsync -axHAWX --numeric-ids --info=progress2 --exclude={"/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/","/media/*","/lost+found"} / /mnt
echo "------------> NVME Initialized"
## Creating NVME Service Config 
echo "------------> Creating setnvmeroot.service Config"
echo "[Unit]" >> setnvmeroot.service
echo "Description=Change rootfs to SSD in M.2 key M slot (nvme0n1)" >> setnvmeroot.service
echo "DefaultDependencies=no" >> setnvmeroot.service
echo "Conflicts=shutdown.target" >> setnvmeroot.service
echo "After=systemd-remount-fs.service" >> setnvmeroot.service
echo "Before=local-fs-pre.target local-fs.target shutdown.target" >> setnvmeroot.service
echo "Wants=local-fs-pre.target" >> setnvmeroot.service
echo "ConditionPathExists=/dev/nvme0n1p1" >> setnvmeroot.service
echo "ConditionPathExists=/etc/setnvmeroot.conf" >> setnvmeroot.service
echo "ConditionVirtualization=!container" >> setnvmeroot.service
echo "[Service]" >> setnvmeroot.service
echo "Type=oneshot" >> setnvmeroot.service
echo "RemainAfterExit=yes" >> setnvmeroot.service
echo "ExecStart=/sbin/setnvmeroot.sh" >> setnvmeroot.service
echo "[Install]" >> setnvmeroot.service
echo "WantedBy=default.target" >> setnvmeroot.service
sudo mv setnvmeroot.service /etc/systemd/system
echo "------------> Service Config moved to : /etc/systemd/system"
## Creating NVME Root Script 
echo "------------> Creating setnvmeroot.sh Boot Script"
echo "#!/bin/sh" >> setnvmeroot.sh
echo "NVME_DRIVE="/dev/nvme0n1p1"" >> setnvmeroot.sh
echo "CHROOT_PATH="/nvmeroot"" >> setnvmeroot.sh
echo "INITBIN=/lib/systemd/systemd" >> setnvmeroot.sh
echo "EXT4_OPT="-o defaults -o errors=remount-ro -o discard"" >> setnvmeroot.sh
echo "modprobe ext4" >> setnvmeroot.sh
echo "mkdir -p /nvmeroot" >> setnvmeroot.sh
echo "mount -t ext4 -o defaults -o errors=remount-ro -o discard /dev/nvme0n1p1 /nvmeroot" >> setnvmeroot.sh
echo "cd /nvmeroot" >> setnvmeroot.sh
echo "/bin/systemctl --no-block switch-root /nvmeroot" >> setnvmeroot.sh
sudo mv setnvmeroot.sh /sbin
echo "------------> Boot Script moved to : /sbin"
## Initialize setnvmeroot Service
sudo chmod 777 /sbin/setnvmeroot.sh
systemctl daemon-reload
sudo systemctl enable setnvmeroot.service
sudo cp /etc/systemd/system/setnvmeroot.service /mnt/etc/systemd/system/setnvmeroot.service
sudo cp /sbin/setnvmeroot.sh /mnt/sbin/setnvmeroot.sh
sudo touch /etc/setnvmeroot.conf
echo 'Service to set the rootfs to the nvme SSD installed.'
echo 'Make sure that you have copied the rootfs to nvme SSD.'
echo 'Reboot for changes to take effect.'
echo "------------> Transferred rootfs to NVME Successfully"