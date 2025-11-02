FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# Apply Raspberry Pi 5 specific Kconfig fragments
SRC_URI:append:raspberrypi5 = " file://rpi5-fit.cfg"
SRC_URI:append:raspberrypi5 = " file://0002-bootm-arm64-update-load-address-after-relocation.patch"
SRC_URI:remove:raspberrypi5 = " file://0001-rpi-always-set-fdt_addr-with-firmware-provided-FDT-address.patch"

# Track latest upstream release for Raspberry Pi 5
SRCREV:raspberrypi5 = "e50b1e8715011def8aff1588081a2649a2c6cd47"
PV:raspberrypi5 = "2025.10+git${SRCPV}"

# Force legacy distro boot instead of bootflow for now
UBOOT_ENV_EXTRA:append:raspberrypi5 = "\nbootcmd=run distro_bootcmd\n"
