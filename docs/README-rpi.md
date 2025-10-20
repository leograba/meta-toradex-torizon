Setup
======
1. Create the project directory:
```bash
$ mkdir common-torizon; cd common-torizon
```
2. Fetch the Yocto Project reference layers required by Common Torizon:
```bash
$ git clone https://git.yoctoproject.org/poky -b scarthgap
$ git clone https://git.openembedded.org/openembedded-core -b scarthgap
$ git clone https://git.yoctoproject.org/meta-yocto -b scarthgap
$ git clone https://git.yoctoproject.org/meta-security -b scarthgap
$ git clone https://git.yoctoproject.org/meta-virtualization -b scarthgap
$ git clone https://github.com/openembedded/meta-openembedded.git -b scarthgap
```
3. Fetch Raspberry Pi BSP layers and dependencies:
```bash
$ git clone https://github.com/agherzan/meta-raspberrypi.git -b scarthgap
$ git clone https://git.yoctoproject.org/meta-lts-mixins -b scarthgap/u-boot
```
4. Fetch Torizon layers:
```bash
$ git clone https://github.com/torizon/meta-toradex-torizon.git -b scarthgap-7.x.y
$ git clone https://github.com/uptane/meta-updater.git -b scarthgap
```
5. Arrange the directory structure expected by `setup-environment`:
```bash
$ mkdir -p layers
$ mv poky openembedded-core meta-yocto meta-security meta-virtualization meta-openembedded meta-raspberrypi meta-lts-mixins meta-toradex-torizon meta-updater layers/
$ ln -s layers/meta-toradex-torizon/scripts/setup-environment torizon-setup-environment
```

Build
======
1. Configure the build environment for Raspberry Pi 5:
```bash
$ MACHINE=raspberrypi5 DISTRO=common-torizon . ./torizon-setup-environment build-rpi
```
This creates the build directory `build-rpi`, where all artifacts will be placed.
2. Build Torizon OS:
```bash
$ bitbake torizon-docker
```
The resulting images are under `build-rpi/deploy/images/raspberrypi5/`, including the `.wic` image.

Boot the Image from an SD Card
======
1. Flash the generated `.wic` image to a microSD card. Replace `/dev/<sdcard>` with the device corresponding to your SD card (verify with `lsblk`), and ensure it is unmounted. You can write the compressed image directly with `bmaptool`:
```bash
$ bmaptool copy --nobmap torizon-docker-raspberrypi5-*.wic.bz2 /dev/<sdcard>
```
If `bmaptool` is unavailable, use `dd` instead:
```bash
$ bunzip2 -k torizon-docker-raspberrypi5-*.wic.bz2
$ sudo dd if=torizon-docker-raspberrypi5-*.wic of=/dev/<sdcard> bs=4M status=progress conv=fsync
```
2. Insert the microSD card into the Raspberry Pi 5 and power it on. The board will boot into Torizon OS.
