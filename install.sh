#!/bin/bash

set -o nounset # -------------------- error when referencing undefined variable
set -o errexit # -------------------------------------- exit when command fails

INSTALL_PATH=$PWD
function installDependencies() {
  sudo apt update
  sudo apt-get install libjsoncpp-dev python3-xcbgen libxcb-composite0-dev \
    libcppunit-dev libboost-dev libfreetype6-dev libxcb1-dev libxcb-util0-dev \
    libxcb-randr0-dev libxcb-ewmh-dev libxcb-icccm4-dev xcb-proto i3-wm \
    libiw-dev libasound2-dev libmpdclient-dev libmpdclient-dev libasound2-dev \
    feh fonts-powerline compton nitrogen rxvt-unicode xcompmgr redshift-gtk \
    network-manager network-manager-gnome gnome-screensaver xautolock rofi \
    g++ libgtk-3-dev gtk-doc-tools gnutls-bin valac intltool libpcre2-dev \
    libglib3.0-cil-dev libgnutls28-dev libgirepository1.0-dev libxml2-utils \
    gperf build-essential konsole libpulse-dev libconfig-dev libdrm-dev \
	asciidoc -y
}

function installBspwm() {
  # sudo apt install bspwm
  # echo "exec bspwm" >> ~/.xsession

  cd ~
  sudo apt-get install libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-shape0-dev
  [ -d "$HOME/bspwm" ] && rm -rf $HOME/bspwm
  git clone https://github.com/baskerville/bspwm.git
  [ -d "$HOME/sxhkd" ] && rm -rf $HOME/sxhkd
  git clone https://github.com/baskerville/sxhkd.git
  cd bspwm && make && sudo make install
  cd ../sxhkd && make && sudo make install

  [ -d "$HOME/.config/bspwm" ] && echo "bspwm dir exists..." || mkdir $HOME/.config/bspwm
  [ -d "$HOME/.config/sxhkd" ] && echo "sxhkd dir exists..." || mkdir $HOME/.config/sxhkd

  cp /usr/local/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
  cp /usr/local/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/
  chmod u+x ~/.config/bspwm/bspwmrc
}

function installPolybar() {
  [ -d "$HOME/polybar" ] && rm -rf $HOME/polybar
  git clone https://github.com/polybar/polybar.git $HOME/polybar
  cd $HOME/polybar
  ./build.sh
  cd -
}

function installI3() {
  sudo apt install bspwm -y
}

function setupPolybar() {
  [ -d "$HOME/.config/bspwm" ] && echo "bspwm dir exists..." || mkdir $HOME/.config/bspwm
  [ -d "$HOME/.config/sxhkd" ] && echo "sxhkd dir exists..." || mkdir $HOME/.config/sxhkd
  sudo chmod +x $INSTALL_PATH/bspwm/bspwmrc
  sudo chmod +x $INSTALL_PATH/sxhkd/sxhkdrc
  ln -s $INSTALL_PATH/bspwm/bspwmrc ~/.config/bspwm/bspwmrc -f
  ln -s $INSTALL_PATH/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc -f
  ln -s $INSTALL_PATH/polybar/config ~/.config/polybar/config -f

  ln -s $INSTALL_PATH/xinitrc ~/.xinitrc -f
  sudo chmod u+x $INSTALL_PATH/polybar/launch.sh
  ln -s $INSTALL_PATH/polybar/launch.sh ~/.config/polybar/launch.sh -f

}

function installCompton() {
  git clone https://github.com/chjj/compton.git
  cd compton
  make
  make docs
  make install
  ln -s $INSTALL_PATH/compton/compton.conf ~/.config/compton.conf -f
}

function setupWallpaperFolder() {
  [ -d "$HOME/.config/wallpapers" ] && echo "wallpapers dir exists..." || mkdir $HOME/.config/wallpapers
  ln -s $INSTALL_PATH/wallpapers/night_mountains_snow_sky_stars.jpg ~/.config/wallpapers -f
}
echo $INSTALL_PATH
installDependencies
installBspwm
installPolybar
setupPolybar
setupWallpaperFolder
