#!/bin/bash
mkdir -p armbian
#https://mirrors.tuna.tsinghua.edu.cn/armbian-releases/uefi-x86/archive/
curl -# -o armbian/armbian.img.xz https://mirrors.tuna.tsinghua.edu.cn/armbian-releases/uefi-x86/archive/Armbian_25.2.1_Uefi-x86_noble_current_6.12.13.img.xz
xz -d armbian/armbian.img.xz
ls -lh armbian/

mkdir -p output
#docker run --privileged --rm -v $(pwd)/output:/output -v $(pwd)/supportFiles:/supportFiles:ro debian:buster /supportFiles/build.sh 

docker run --privileged --rm \
        -v $(pwd)/output:/output \
        -v $(pwd)/supportFiles:/supportFiles:ro \
        -v $(pwd)/armbian/armbian.img:/mnt/armbian.img \
        debian:buster \
        /supportFiles/build.sh