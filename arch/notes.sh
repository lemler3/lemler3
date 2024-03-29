## user and groups
sudo usermod lemler3 -G sys,log,network,floppy,scanner,power,rfkill,users,video,storage,optical,lp,audio,wheel,adm,users
## sudo gpasswd -a lemler3 vboxusers ## after installing virtualbox

# enable daylight savings
sudo timedatectl set-ntp true

## get faster mirrorlist
sudo pacman -S reflector rsync --noconfirm
#old#sudo reflector --verbose --country 'United States' -l 5 --sort rate --save /etc/pacman.d/mirrorlist && time sudo pacman -Syyu
sudo reflector --age 6 --latest 20 --fastest 20 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist && time sudo pacman -Syyu

## install graphics for nvidia
sudo pacman -S nvidia nvidia-utils lib32-nvidia-utils nvidia-settings lib32-libglvnd lib32-opencl-nvidia --noconfirm

## install yay
sudo pacman -S git --noconfirm && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && yay -S yay --noconfirm

## install base system packages
yay -S bash-completion jdk-lts  amd-ucode alsa-utils libvdpau-va-gl usbutils man ffmpegthumbnailer --noconfirm
## save alsamixer sound settings
# sudo alsactl store

## set default java
# archlinux-java status
# sudo archlinux-java set java-8-openjdk

## set up qt6 settings (notes) (need to make into bash script)
# 1) yay -S  qt6ct adwaita-qt6-git qgnomeplatform-qt6 # for gtk2 qt5-styleplugins gtk-engine-murrine
# 2) sudo nano /etc/profile # and add the following lines:
# export QT_QPA_PLATFORMTHEME="qt5ct"
# export QT_AUTO_SCREEN_SCALE_FACTOR=1
# 3) source the file by using: source /etc/profile
# 4) Start qt5ct

## install basic applications && enable cronie && enable ufw
yay -S firefox discord steam minecraft-launcher runelite obs-studio v4l2loopback-dkms pamac-aur timeshift thunderbird lutris deluge-gtk gufw runescape-launcher google-chrome cronie --noconfirm && sudo systemctl enable --now cronie && sudo systemctl enable --now ufw

##install virtualbox
yay -S virtualbox-host-modules-arch virtualbox virtualbox-ext-oracle virtualbox-guest-iso vde2 --noconfirm
# sudo vboxreload
# sudo modprobe vboxdrv
sudo gpasswd -a lemler3 vboxusers

##install wine
sudo pacman -S wine-staging --noconfirm
## Wine Dependencies
sudo pacman -S lib32-giflib lib32-mpg123 openal lib32-openal lib32-v4l-utils lib32-libpulse opencl-icd-loader lib32-opencl-icd-loader lib32-libxslt lib32-libva lib32-gtk3 lib32-gst-plugins-base-libs  lib32-vulkan-icd-loader lib32-sdl2 vkd3d lib32-vkd3d sane libgphoto2 cups samba dosbox --noconfirm

## better font such as japanese characters
## (broken) ttf-qurancomplex-fonts
yay -S ttf-arphic-uming ttf-baekmuk gnu-free-fonts noto-fonts-emoji ttf-monaco  ttf-ms-fonts noto-fonts noto-fonts-cjk --noconfirm
sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d

## lightdm-gtk main monitor
#sudo nano /etc/lightdm/lightdm-gtk-greeter.conf
#======================
#active-monitor=
#======================

## fix gdm to be on main monitor
#sudo cp ~/.config/monitors.xml ~gdm/.config/

## tray icons in gnome
yay -S  libappindicator-gtk2 libappindicator-gtk3

## about:config for firefox (gnome)
#layers.acceleration.force-enabled
#general.autoscroll
#media.hardware-video-decoding.force-enabled

##set up powerline-shell for bash shell
#sudo pacman -S python-pip
#sudo pip install powerline-shell
#mkdir -p ~/.config/powerline-shell && \
#powerline-shell --generate-config > ~/.config/powerline-shell/config.json
#nano ~/.bashrc
#======================
#function _update_ps1() {
#    PS1=$(powerline-shell $?)
#}
#
#if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi
#======================

### fix steam ( 4 manjaro really)
##forshotcuts
#sh -c 'STEAM_FRAME_FORCE_CLOSE=1 steam'
###or you can set it in your environment.
#sudo nano "/etc/environment"

#======================
#export STEAM_FRAME_FORCE_CLOSE=1
#steam
#======================
