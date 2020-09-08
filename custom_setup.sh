#!/bin/bash

set -o nounset # -------------------- error when referencing undefined variable
set -o errexit # -------------------------------------- exit when command fails

function setupPolybar() {
  [ -d "$HOME/.config/bspwm" ] && echo "bspwm dir exists..." || mkdir $HOME/.config/bspwm
  [ -d "$HOME/.config/sxhkd" ] && echo "sxhkd dir exists..." || mkdir $HOME/.config/sxhkd
  sudo chmod +x $PWD/bspwm/bspwmrc
  sudo chmod +x $PWD/sxhkd/sxhkdrc
  ln -s $PWD/bspwm/bspwmrc ~/.config/bspwm/bspwmrc -f
  ln -s $PWD/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc -f
  ln -s $PWD/polybar/config ~/.config/polybar/config -f

  ln -s $PWD/xinitrc ~/.xinitrc -f

}

setupPolybar
