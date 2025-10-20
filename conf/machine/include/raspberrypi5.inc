WKS_FILE:sota = "torizon-raspberrypi-sota.wks"

TORIZON_TTY_DEVICE ?= "serial0,115200"
OSTREE_KERNEL_ARGS:sota = "quiet logo.nologo vt.global_cursor_default=0 plymouth.ignore-serial-consoles splash fbcon=map:10 console=tty1 console=${TORIZON_TTY_DEVICE} root=LABEL=otaroot rootfstype=ext4"

RPI_USE_U_BOOT = "1"
ENABLE_UART = "1"
PREFERRED_PROVIDER_u-boot-default-script = "u-boot-distro-boot"
PREFERRED_RPROVIDER_network-configuration = "networkmanager"
VIRTUAL-RUNTIME_network_manager = "networkmanager"
IMAGE_INSTALL:remove = " connman connman-systemd connman-client network-configuration"

UBOOT_BOOT_PARTITION_NUMBER = "1"
OTAROOT_PARTITION_NUMBER = "2"

IMAGE_FSTYPES:append = " wic"

hostname:pn-base-files = "raspberrypi5"

LICENSE_FLAGS_ACCEPTED += " synaptics-killswitch"

PACKAGE_EXCLUDE:append = " connman connman-conf connman-systemd connman-client"
