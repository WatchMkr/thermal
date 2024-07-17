```
sudo apt install neovim lm-sensors stress-ng devscripts cargo libdbus-1-dev libusb-1.0-0-dev nvidia-cuda-toolkit
mkdir Projects
cd Projects
git clone https://github.com/WatchMkr/thermal.git
git clone https://github.com/pop-os/system76-power.git
```

GPU Burn
```
git clone https://github.com/wilicc/gpu-burn.git
cd gpu-burn
make CUDAPATH=/usr/
make
```

Watts
```
wget https://raw.githubusercontent.com/jackpot51/dotfiles/main/files/bin/cpu-watts
chmod +x cpu-watts
./cpu-watts
```

Using GPU Burn (from the gpuburn directory)
```
./gpuburn -tc 600
```

Using stress-ng (10 minutes, all CPU threads)
```
stress-ng --cpu 0 --timeout 10m
```

Watch CPU freq on all cores
```
watch -n 1 "cat /proc/cpuinfo | grep 'MHz'"
```

Watch sensors
```
watch sensors
```

Watch nvidia fan, temp and watts
```
watch nvidia-smi
```

Testing new fans curves that are managed by thelio-io. git clone the thermal and system76-power repos mentions at the top of this doc, then:
```
sudo apt install debhelper cargo libdbus-1-dev libusb-1.0-0-dev
cd ~/Project/
cp thermal/system76-power-rebuild.sh ../system76-power
cd system76-power
chmod system76-power-rebuild.sh
```
Use a text editor to modify fan curves in src/fan.rs. To rebuild and test the fan curves, run the following command and reboot.
```
./system76-power-rebuild.sh
```

Using IPMI
```
sudo ipmitool sdr dump /tmp/ipmitool.cache
sudo ipmitool sdr -S /tmp/ipmitool.cache type Temperature
```


AI Benchmarks
```
sudo apt install tensorman
sudo apt install nvidia-container-runtime
sudo usermod -aG docker $USER
 log out and back in
cd Projects
git clone https://github.com/tensorflow/benchmarks.git
cd benchmarks
```

Inception v3 - FP16
```
tensorman run --gpu python -- ./scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --batch_size=128 --model=inception3 --variable_update=parameter_server --use_fp16=True --num_gpus=4
```

Inception v4 - FP16
```
tensorman run --gpu python -- ./scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --batch_size=64 --model=inception4 --variable_update=parameter_server --use_fp16=True --num_gpus=4
```

Resnet50 - FP 16
```
tensorman run --gpu python -- ./scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --batch_size=128 --model=resnet50 --variable_update=parameter_server --use_fp16=True --num_gpus=4
```

Resnet152 - FP16
```
tensorman run --gpu python -- ./scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --batch_size=64 --model=resnet152 --variable_update=parameter_server --use_fp16=True --num_gpus=4
```

VGG16 (Might be disk IO bound)
```
tensorman run --gpu python -- ./scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --batch_size=128 --model=vgg16 --variable_update=parameter_server --use_fp16=True --num_gpus=4
```

NASNET (fails to run)
```
tensorman run --gpu python -- ./scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --batch_size=128 --model=nasnet --variable_update=parameter_server --use_fp16=True --num_gpus=4
```

**System thermal design testing**<br>
The above test are short and good for measuring component performance but not the chassis and its thermal system. Training models take hours or days. Intense GPU use over an extended period of time demonstrates the systems performance in real-world scenarios. Use ```--num_epochs=1``` to lengthen the test. For Resnet50, quad 20180Ti GPUs and batch size 128, each epoch is roughly 10 minutes. 90 epochs trains around 76% accuracy (about 15 hours on 4 2080Ti GPUs).

**Resources**<br>

Benchmarks<br>
https://github.com/tensorflow/benchmarks<br>
TF CNN Benchmark details<br>
https://github.com/tensorflow/benchmarks/tree/master/scripts/tf_cnn_benchmarks<br>
Tools for preparing datasets<br>
https://github.com/tensorflow/tpu/tree/master/tools/datasets#imagenet_to_gcspy<br>
Imagenet Setup<br>
https://cloud.google.com/tpu/docs/imagenet-setup<br>
Image downloader<br>
https://github.com/mf1024/ImageNet-datasets-downloader<br>
