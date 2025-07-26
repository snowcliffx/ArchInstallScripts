ln -sf /usr/share/zoneinfo/Europe/Istanbul /etc/localtime
hwclock --systohc
nano /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=trq" > /etc/vconsole.conf
echo "archonur" > /etc/hostname
echo "127.0.1.1 archonur" >> /etc/hosts

passwd
useradd -m -G audio,video,wheel,input onur
passwd onur

EDITOR=nano visudo
systemctl enable fstrim.timer
nano /etc/mkinitcpio.conf

pacman -S --noconfirm efibootmgr
efibootmgr --create --disk /dev/nvme0n1 --part 1 --label "Arch Linux" --loader /vmlinuz-linux --unicode 'root='$(grep -o "^UUID=[a-z0-9-]*[a-z0-9]" /etc/fstab)' rw quiet nowatchdog zswap.enable=0 split_lock_detect=off initrd=\initramfs-linux.img'

echo "blacklist nouveau" >> /etc/modprobe.d/nvidia.conf
echo "blacklist iTCO_wdt" >> /etc/modprobe.d/nvidia.conf
echo "options nvidia_drm modeset=1" >> /etc/modprobe.d/nvidia.conf

pacman -S noto-fonts ttf-jetbrains-mono ttf-mononoki-nerd ttf-dejavu ttf-liberation btop fastfetch brightnessctl duf ncdu xdg-user-dirs cpupower xdg-desktop-portal-hyprland wl-clipboard pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber git nano foot yazi firefox ncspot waybar swaybg bemenu mesa intel-media-driver nvidia-open
