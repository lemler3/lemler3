##add user

useradd -m -g users -G wheel -s /bin/bash lemler3
paswwd lemler3
EDITOR=nano visudo
un comment "# %wheel ALL=(ALL) NOPASSWD: ALL"

##get faster mirrorlist
sudo pacman -S reflector rsync curl
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo reflector --verbose --country 'United States'  -l 5 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syyu

##get fastest mirrorlist on everyreboot
sudo nano /etc/systemd/system/reflector.service
*****************
[Unit]
Description=Pacman mirrorlist update
Requires=network-online.target
After=network-online.target

[Service]
Type=oneshot
ExecStart=/usr/bin/reflector --protocol http --latest 30 --number 20 --sort rate --save /etc/pacman.d/mirrorlist

[Install]
RequiredBy=multi-user.target
*****************
sudo systemctl enable reflector

## set up graphics
sudo pacman -S nvidia nvidia-utils lib32-nvidia-utils nvidia-settings
sudo nvidia-xconfig
sudo nvidia-settings (enable fullpipline compositing)
nano /etc/X11/xorg.conf

Section "InputClass"
	Identifier "My Mouse"
	Driver "libinput"
	MatchIsPointer "yes"
	Option "AccelProfile" "flat"
	Option "AccelSpeed" "0"
EndSection

## install yay
sudo pacman -S go git base-devel linux-headers

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

##install system packages
bash-completion jdk8 flashplugin intel-ucode network-manager-applet unrar

##set default java
archlinux-java status
archlinux-java set


###set up qt5 settings
1) Install qt5ct qt5-styleplugins
2) Set environment variables in /etc/profile and add the following lines:
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
3) source the file by using: source /etc/profile
4) Start qt5ct
5) In the first tab Appearance choose Standard Dialogs: default (some people get crashes if they choose GTK3)
Because we used /etc/profile to set the environment variables back in step 2), after you reboot, both the user & root accounts will be able to benefit from these changes.
(If you find that certain widget styles are missing, you can see if qt5-styleplugins brings a fix for you.) 



## install basic applications
yay -S firefox google-chrome discord steam minecraft-launcher osbuddy runelite-launcher obs-studio pamac-aur timeshift thunderbird transmission-gtk lutris
sudo systemctl enable cronie (for timeshift to work properly)

##install virtualbox
yay -S virtualbox-host-dkms virtualbox virtualbox-ext-oracle virtualbox-guest-iso 
sudo vboxreload
sudo modprobe vboxdrv
sudo gpasswd -a lemler3 vboxusers

##install wine
sudo pacman -S giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader cups samba dosbox lib32-sdl2 vkd3d lib32-vkd3d sane libgphoto2 wine-staging

#set up powerline-shell for bash shell
sudo pacman -S python-pip 
sudo pip install powerline-shell
mkdir -p ~/.config/powerline-shell && \
powerline-shell --generate-config > ~/.config/powerline-shell/config.json
nano ~/.bashrc

******************
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
******************

sudo pacman -S nerd-font-complete
ubuntu-mono-nerd-reg
