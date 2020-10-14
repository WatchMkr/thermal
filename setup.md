```
sudo apt install alacritty neovim lm-sensors stress-ng system76-cuda-latest devscripts cargo dh-systemd libdbus-1-dev libusb-1.0-0-dev
mkdir Projects
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
tensorman run --gpu python -- ./scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --batch_size=64 --model=inception3 --variable_update=parameter_server --use_fp16=True --num_gpus=4
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
