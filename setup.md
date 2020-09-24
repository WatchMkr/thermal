```
sudo apt install alacritty neovim lm-sensors stress-ng system76-cuda-latest devscripts cargo dh-systemd libdbus-1-dev libusb-1.0-0-dev
sudo apt install neovim
mkdir Project
cd Projects
git clone https://github.com/WatchMkr/thermal.git
git clone https://github.com/pop-os/system76-power.git
git clone https://github.com/wilicc/gpu-burn.git
cd gpu-burn
nvim Makefile
Makefile change - NVCC=${GCCPATH}/bin/nvcc
```
