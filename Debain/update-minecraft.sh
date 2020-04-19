#!/bin/bash

# to do make alias in bashrc
#-------------------------------------------------
## make .bin
#mkdir ~/.bin
#
## compy script to .bin
#cp update-minecraft.sh ~/.bin
#
## update minecraft with upmc from bash
#echo alias upmc='sh /home/lemler3/.bashrc
#-------------------------------------------------

## get minecraft tar file
wget https://launcher.mojang.com/download/Minecraft.tar.gz

## extract 
tar -xzvf Minecraft.tar.gz

## make minecraft folder
mkdir ~/.minecraft 

##remove old mc app
rm -rf ~/.minecraft/minecraft-launcher

## move minecraft-launcher to .minecraft 
mv -f minecraft-launcher ~/.minecraft

## remove tar ball
rm Minecraft.tar.gz

## grab the icon
wget https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/i/977e8c4f-1c99-46cd-b070-10cd97086c08/d36qrs5-017c3744-8c94-4d47-9633-d85b991bf2f7.png/v1/fill/w_512,h_512,q_75,strp/minecraft_hd_icon___mac___pc_by_hunterkharon-d36qrs5.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwic3ViIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl0sIm9iaiI6W1t7InBhdGgiOiIvaS85NzdlOGM0Zi0xYzk5LTQ2Y2QtYjA3MC0xMGNkOTcwODZjMDgvZDM2cXJzNS0wMTdjMzc0NC04Yzk0LTRkNDctOTYzMy1kODViOTkxYmYyZjcucG5nIiwid2lkdGgiOiI8PTUxMiIsImhlaWdodCI6Ijw9NTEyIn1dXX0.fHcEZTOhH9F2SMaLYOE-lqlgA_L5l-7Mmtp6sgbq3j4
mv minecraft_hd_icon___mac___pc_by_hunterkharon-d36qrs5.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwic3ViIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsImF1 ~/.minecraft/minecraft-launcher/mc.png

## set/make desktop file
rm ~/.local/share/applications/minecraft.desktop
echo [Desktop Entry] >> 								~/.local/share/applications/minecraft.desktop
echo Version=1.1 >> 									~/.local/share/applications/minecraft.desktop
echo Type=Application >> 								~/.local/share/applications/minecraft.desktop
echo Name=Minecraft >> 									~/.local/share/applications/minecraft.desktop
echo Comment=A small descriptive blurb about this application. >> 			~/.local/share/applications/minecraft.desktop
echo Icon=/home/lemler3/.minecraft/minecraft-launcher/mc.png >> 			~/.local/share/applications/minecraft.desktop
echo Exec=/home/lemler3/.minecraft/minecraft-launcher/minecraft-launcher >> 		~/.local/share/applications/minecraft.desktop
echo Actions= >> 									~/.local/share/applications/minecraft.desktop
echo Categories=Game >>									~/.local/share/applications/minecraft.desktop

