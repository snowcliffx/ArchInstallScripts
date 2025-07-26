mkfs.fat -F 32 /dev/nvme0n1p1
mkfs.ext4 -i 262144 -m 1 /dev/nvme0n1p2

mount /dev/nvme0n1p2 /mnt
mkdir /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot

pacstrap -K /mnt base base-devel linux linux-firmware intel-ucode nano man-db man-pages dhcpcd iwd
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
