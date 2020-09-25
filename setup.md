```
sudo apt install alacritty neovim lm-sensors stress-ng system76-cuda-latest devscripts cargo dh-systemd libdbus-1-dev libusb-1.0-0-dev
mkdir Project
cd Projects
git clone https://github.com/WatchMkr/thermal.git
git clone https://github.com/pop-os/system76-power.git
git clone https://github.com/wilicc/gpu-burn.git
cd gpu-burn
nvim Makefile
Makefile change - NVCC=${GCCPATH}/bin/nvcc
```

```
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 20
sudo update-alternatives --auto gcc 
sudo update-alternatives --auto g++
sudo update-alternatives --set gcc /usr/bin/gcc-8
sudo update-alternatives --set g++ /usr/bin/g++-8
```
