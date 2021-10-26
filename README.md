# wmanager

Window manager dotfiles

Refs:
https://github.com/L04DB4L4NC3R/DEC/blob/master/polybar/config.ini

https://github.com/Makpoc/dotfiles/blob/master/config/sxhkd/sxhkdrc

No awesome fonts?

```bash
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
```

Launch to external monitor

eDP-1 = Local monitor
HDMI-1 = External monitor

```bash
xrandr --output eDP-1 --primary --mode 1600x900 --rotate normal --output HDMI-1 --mode 1920x1080 --rotate normal --right-of eDP-1
```

 Using IntelliJ IDEA / Android Studio with bspwm?
```bash
wmname LG3D
```
