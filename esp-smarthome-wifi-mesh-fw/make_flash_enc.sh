SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
APP_NAME=esp-mesh-touch-fw
ESPTOOL=${SCRIPT_DIR}/esp-idf/components/esptool_py/esptool/esptool.py
ESPEFUSE=${SCRIPT_DIR}/esp-idf/components/esptool_py/esptool/espefuse.py
ESPSECURE=${SCRIPT_DIR}/esp-idf/components/esptool_py/esptool/espsecure.py
KEY_ENCRYPTION=${SCRIPT_DIR}/esp-flash-encrypted-and-secure-boot/key/flash_encryption_key_1.0.0.alpha.4.bin
KEY_SECURE_BOOT=${SCRIPT_DIR}/esp-flash-encrypted-and-secure-boot/key/secure-bootloader-key-256.bin
KEY_SECURE_BOOT_SIGNING=${SCRIPT_DIR}/esp-flash-encrypted-and-secure-boot/key/secure_boot_signing_key_1.0.0.alpha.4.pem

cp $KEY_SECURE_BOOT ${SCRIPT_DIR}/build/bootloader/
make bootloader -j8
make -j8

# ${ESPSECURE} sign_data --version 1 --keyfile ${KEY_SECURE_BOOT_SIGNING} --output ${SCRIPT_DIR}/build/${APP_NAME}-signed.bin ${SCRIPT_DIR}/build/${APP_NAME}-unsigned.bin
# ${ESPSECURE} sign_data --version 1 --keyfile ${KEY_SECURE_BOOT_SIGNING} --output ${SCRIPT_DIR}/build/partitions-signed.bin ${SCRIPT_DIR}/build/partitions-unsigned.bin
${ESPSECURE} sign_data --version 1 --keyfile ${KEY_SECURE_BOOT_SIGNING} --output ${SCRIPT_DIR}/build/${APP_NAME}-signed.bin ${SCRIPT_DIR}/build/${APP_NAME}.bin
${ESPSECURE} sign_data --version 1 --keyfile ${KEY_SECURE_BOOT_SIGNING} --output ${SCRIPT_DIR}/build/partitions-signed.bin ${SCRIPT_DIR}/build/partitions.bin

# ${ESPSECURE} encrypt_flash_data --keyfile ${KEY_ENCRYPTION} --address 0x10000 --output ${SCRIPT_DIR}/build/${APP_NAME}-encrypted.bin ${SCRIPT_DIR}/build/${APP_NAME}-signed.bin
# ${ESPSECURE} encrypt_flash_data --keyfile ${KEY_ENCRYPTION} --address 0x08000 --output ${SCRIPT_DIR}/build/partitions-encrypted.bin ${SCRIPT_DIR}/build/partitions-signed.bin
${ESPSECURE} encrypt_flash_data --keyfile ${KEY_ENCRYPTION} --address 0x10000 --output ${SCRIPT_DIR}/build/${APP_NAME}-encrypted.bin ${SCRIPT_DIR}/build/${APP_NAME}.bin
${ESPSECURE} encrypt_flash_data --keyfile ${KEY_ENCRYPTION} --address 0x09000 --output ${SCRIPT_DIR}/build/partitions-encrypted.bin ${SCRIPT_DIR}/build/partitions.bin
${ESPSECURE} encrypt_flash_data --keyfile ${KEY_ENCRYPTION} --address 0x0e000 --output ${SCRIPT_DIR}/build/ota_data_initial-encrypted.bin ${SCRIPT_DIR}/build/ota_data_initial.bin
${ESPSECURE} encrypt_flash_data --keyfile ${KEY_ENCRYPTION} --address 0x00000 --output ${SCRIPT_DIR}/build/bootloader/bootloader-reflash-digest-encrypted.bin ${SCRIPT_DIR}/build/bootloader/bootloader-reflash-digest.bin
${ESPSECURE} encrypt_flash_data --keyfile ${KEY_ENCRYPTION} --address 0x01000 --output ${SCRIPT_DIR}/build/bootloader/bootloader-encrypted.bin ${SCRIPT_DIR}/build/bootloader/bootloader.bin

OSTYPE=linux
case "$OSTYPE" in
    solaris*)
        echo "-------------FLASH FOR SOLARIS----------------"
        ;;
    darwin*)
        echo "-------------FLASH FOR OSX----------------"
        PORT=/dev/tty.SLAB_USBtoUART
        ${ESPEFUSE} --port  ${PORT} summary
        # $esptool --port /dev/tty.SLAB_USBtoUART erase_flash
        ${ESPTOOL} --chip esp32 --port ${PORT} --baud 921600 --before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 40m --flash_size detect \
        0x10000 ${SCRIPT_DIR}/build/${APP_NAME}-encrypted.bin \
        0x08000 ${SCRIPT_DIR}/build/partitions-encrypted.bin \
        0x00000 ${SCRIPT_DIR}/build/bootloader/bootloader-reflash-digest-encrypted.bin \
        0x0e000 ${SCRIPT_DIR}/build/ota_data_initial-encrypted.bin
        ;;
    linux*)
        echo "-------------FLASH FOR LINUX----------------"
        PORT=/dev/ttyUSB0
        ${ESPEFUSE} --port  ${PORT} summary
        # ${ESPTOOL} --port /dev/ttyUSB1 erase_flash
        ${ESPTOOL} --chip esp32 --port ${PORT} --baud 921600 --before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 40m --flash_size detect \
        0x10000 ${SCRIPT_DIR}/build/${APP_NAME}-encrypted.bin \
        0x09000 ${SCRIPT_DIR}/build/partitions-encrypted.bin \
        0x00000 ${SCRIPT_DIR}/build/bootloader/bootloader-reflash-digest-encrypted.bin \
        0x0e000 ${SCRIPT_DIR}/build/ota_data_initial-encrypted.bin

        make monitor
        ;;
    bsd*)
        echo "-------------FLASH FOR BSD----------------"
        ;;
    msys*)
        echo "-------------FLASH FOR WINDOWN----------------"
        ;;
    *)
        echo "unknown: $OSTYPE"
        ;;
esac
# make monitor
