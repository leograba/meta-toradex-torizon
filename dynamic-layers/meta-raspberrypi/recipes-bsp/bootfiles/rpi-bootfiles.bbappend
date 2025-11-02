FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

do_deploy:append:raspberrypi5() {
    if [ -f ${DEPLOY_DIR_IMAGE}/boot.scr-${MACHINE} ]; then
        # Provide a legacy boot script for the RPi firmware/bootflow stage.
        install -m 0644 ${DEPLOY_DIR_IMAGE}/boot.scr-${MACHINE} ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/boot.scr.uimg
        install -m 0644 ${DEPLOY_DIR_IMAGE}/boot.scr-${MACHINE} ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/boot.scr
    else
        bbfatal "Missing boot.scr-${MACHINE} in ${DEPLOY_DIR_IMAGE}"
    fi
}

do_deploy[depends] += "u-boot-distro-boot:do_deploy"
