
function installDependencies() {
  sudo apt update
  sudo apt-get install slim python3-xcbgen libxcb-composite0-dev libpulse-dev \
    libcppunit-dev libboost-dev libfreetype6-dev libxcb1-dev libxcb-util0-dev \
    libxcb-randr0-dev libxcb-ewmh-dev libxcb-icccm4-dev xcb-proto i3-wm \
    libiw-dev libasound2-dev libmpdclient-dev libmpdclient-dev libasound2-dev \
    feh fonts-powerline compton nitrogen rxvt-unicode xcompmgr redshift-gtk \
    network-manager network-manager-gnome gnome-screensaver xautolock rofi \
    g++ libgtk-3-dev gtk-doc-tools gnutls-bin valac intltool libpcre2-dev \
    libglib3.0-cil-dev libgnutls28-dev libgirepository1.0-dev libxml2-utils \
    gperf build-essential -y
}

function installBspwm() {
  sudo apt install i3 -y
}

function installI3() {
  sudo apt install bspwm -y
}

function installPolybar() {

}

installDependencies
