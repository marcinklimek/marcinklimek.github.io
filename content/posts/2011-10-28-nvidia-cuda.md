---
title: nvidia cuda
author: Marcin Klimek
type: posts
date: 2011-10-28T20:18:57+00:00
url: /nvidia-cuda/
categories:
  - link
format: link
created: 2023-11-18T19:04
updated: 2024-06-11T14:11
---
copy from:  
http://samiux.blogspot.com/2011/05/howto-nvidia-cuda-toolkit-40-on-ubuntu.html

HOWTO : nVidia CUDA Toolkit 4.0 on Ubuntu 11.04 Desktop  
The CUDA Toolkit 4.0 is released on May 2011. If you have nVidia display card that have several CUDAs on it, you will interested in this tutorial. This time, I would like to show you how to install CUDA Toolkit 4.0 on Ubuntu 11.04 Desktop.

You will experience a more faster desktop after the installation of CUDA Toolkit 4.0. Meanwhile, if you installed SMPlayer, you can playback 1080p videos with the help of vdpau.

Step 1 :

Add the CUDA 4.0 PPA.  
sudo add-apt-repository ppa:aaron-haviland/cuda-4.0

Thanks for the developer of CUDA 4.0 PPA &#8211; Aaron Haviland of his contribution to make CUDA Toolkit to be installed easily.

Step 2 :

sudo apt-get update  
sudo apt-get upgrade

64-bit :  
sudo apt-get install nvidia-cuda-gdb nvidia-cuda-toolkit nvidia-compute-profiler libnpp4 nvidia-cuda-doc libcudart4 libcublas4 libcufft4 libcusparse4 libcurand4 nvidia-current nvidia-opencl-dev nvidia-current-dev nvidia-cuda-dev opencl-headers

32-bit :  
sudo apt-get install nvidia-cuda-gdb nvidia-cuda-toolkit nvidia-compute-profiler lib32npp4 nvidia-cuda-doc lib32cudart4 lib32cublas4 lib32cufft4 lib32cusparse4 lib32curand4 nvidia-current nvidia-opencl-dev nvidia-current-dev nvidia-cuda-dev opencl-headers

Step 2a (Optional) :

If you do not have any nVidia driver installed before or you encounter any problem of booting up your system, you need to do the following command. Otherwise, this step is not required at all.

sudo nvidia-xconfig

**This step may not be required.

Step 3 :

Reboot your system.

Step 4 (Optional) :

To install SMPlayer.

sudo apt-get install smplayer smplayer-translations smplayer-themes

Then set it to use &#8220;vdpau&#8221; at &#8220;Output Driver&#8221; at &#8220;Preference&#8221;.

Step 5 (Optional) :

Once installed the CUDA Toolkit and nVidia drivers, you can download the sample codes for testing.

sudo apt-get install freeglut3-dev libxi-dev libXmu-dev

wget http://developer.download.nvidia.com/compute/cuda/4\_0/sdk/gpucomputingsdk\_4.0.17_linux.run

sudo chmod +x gpucomputingsdk\_4.0.17\_linux.run  
./gpucomputingsdk\_4.0.17\_linux.run

Accept the default settings.

cd NVIDIA\_GPU\_computing_SDK/C  
make

** Please ignore the warning messages for unsupported gcc version. That is no harm at all.

Run the sample codes.

cd NVIDIA\_GPU\_computing_SDK/C/bin/linux/release  
./deviceQuery  
./nbody