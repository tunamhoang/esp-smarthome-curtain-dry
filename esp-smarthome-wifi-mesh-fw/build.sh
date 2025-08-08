SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
while IFS=":" read -r CONFIG_KEY VALUE; do
    BUILD_TYPE=$(grep -v '^#' sdkconfig | grep "^$CONFIG_KEY=y")
    if [ -n "$BUILD_TYPE" ]; then
        IFS=":" read BUILD_NAME BUILD_VER_NAME <<< "$VALUE"
        break
    fi
done <<EOF
CONFIG_DEVICE_TYPE_THERMOSTAT:tuya-thermostat:THERMOSTAT_VER
CONFIG_DEVICE_TYPE_TOUCH_CURTAIN:tuya-touch-curtain:CURTAIN_VER
CONFIG_DEVICE_TYPE_TOUCH_SCENE:tuya-touch-scene:SCENE_VER
CONFIG_DEVICE_TYPE_TOUCH:tuya-touch:TOUCH_VER
CONFIG_DEVICE_TYPE_REMOTE_GATEWAY:tuya-remote-gateway:REMOTE_GATEWAY_VER
CONFIG_DEVICE_TYPE_PIR:tuya-pir:PIR_VER
EOF

PROJECT_VER=$(grep -v '^#' version.txt|grep ${BUILD_VER_NAME}|sed 's/=/ /g'| egrep -o "([0-9]+\.[0-9]+\.[0-9]+)")
# VERSION=`cat ./version.txt`
app_name="${BUILD_NAME}-v${PROJECT_VER}.bin"
echo "Building ${app_name}..."
idf.py build
cp -f esp-flash-encrypted-and-secure-boot/key/secure-bootloader-key-256.bin build/bootloader/
idf.py bootloader
mkdir esp-flash-encrypted-and-secure-boot/build
idf.py build
if [ $? -ne 0 ]; then
    echo "\033[31mBuild failed, exiting.\033[0m"
    exit 1
fi
espsecure.py sign_data --keyfile esp-flash-encrypted-and-secure-boot/key/secure_boot_signing_key_1.0.0.alpha.4.pem --version 1 build/$app_name
espsecure.py encrypt_flash_data --keyfile esp-flash-encrypted-and-secure-boot/key/flash_encryption_key_1.0.0.alpha.4.bin --address 0x10000 -o esp-flash-encrypted-and-secure-boot/build/app-encrypted.bin build/$app_name
espsecure.py encrypt_flash_data --keyfile esp-flash-encrypted-and-secure-boot/key/flash_encryption_key_1.0.0.alpha.4.bin --address 0x9000 -o esp-flash-encrypted-and-secure-boot/build/partitions-encrypted.bin build/partition_table/partition-table.bin
espsecure.py encrypt_flash_data --keyfile esp-flash-encrypted-and-secure-boot/key/flash_encryption_key_1.0.0.alpha.4.bin --address 0xE000 -o esp-flash-encrypted-and-secure-boot/build/ota_data_initial-encrypted.bin build/ota_data_initial.bin
espsecure.py encrypt_flash_data --keyfile esp-flash-encrypted-and-secure-boot/key/flash_encryption_key_1.0.0.alpha.4.bin --address 0x0 -o esp-flash-encrypted-and-secure-boot/build/bootloader-reflash-digest-encrypted.bin build/bootloader/bootloader-reflash-digest.bin
