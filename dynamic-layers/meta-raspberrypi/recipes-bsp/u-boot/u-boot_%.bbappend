FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# Apply bootdelay workaround via Kconfig fragment
SRC_URI:append:raspberrypi5 = " file://rpi5-bootdelay.cfg"
