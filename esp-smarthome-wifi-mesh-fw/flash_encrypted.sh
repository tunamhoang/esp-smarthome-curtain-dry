flash_port=error
ostype="$(uname -s)"

case "$ostype" in
    Darwin)
        echo "-------------FLASH FOR OSX----------------"
        for i in {1..10}
        do
            flash_port=$(ls /dev/tty* | grep /dev/tty.usb* | awk '{ print $1}')
            if [ "x$flash_port" != "x" ]; then
                echo "Serial port $flash_port"
                break
            fi
            sleep 1
        done
        ;;
    Linux)
        echo "-------------FLASH FOR LINUX----------------"
        flash_port=/dev/ttyUSB0
        ;;
    *)
        echo "unknown: $ostype"
        ;;
esac

if [ $flash_port != "error" ]; then
    echo "Flash to port" "$flash_port"

    # espefuse.py --port $flash_port --do-not-confirm burn_key secure_boot_v1 esp-flash-encrypted-and-secure-boot/key/secure-bootloader-key-256.bin
    # espefuse.py --port $flash_port --do-not-confirm burn_key flash_encryption esp-flash-encrypted-and-secure-boot/key/flash_encryption_key_1.0.0.alpha.4.bin
    # espefuse.py --port $flash_port --do-not-confirm burn_efuse FLASH_CRYPT_CNT 1
    # espefuse.py --port $flash_port --do-not-confirm burn_efuse FLASH_CRYPT_CONFIG 0xf

    # espefuse.py --port $flash_port --do-not-confirm burn_efuse DISABLE_DL_ENCRYPT 1
    # espefuse.py --port $flash_port --do-not-confirm burn_efuse DISABLE_DL_DECRYPT 1
    # espefuse.py --port $flash_port --do-not-confirm burn_efuse DISABLE_DL_CACHE 1

    esptool.py --chip esp32 --port $flash_port --baud 921600 --before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 40m --flash_size detect --force \
    0x0 esp-flash-encrypted-and-secure-boot/build/bootloader-reflash-digest-encrypted.bin \
    0x9000 esp-flash-encrypted-and-secure-boot/build/partitions-encrypted.bin \
    0xE000 esp-flash-encrypted-and-secure-boot/build/ota_data_initial-encrypted.bin \
    0x10000 esp-flash-encrypted-and-secure-boot/build/app-encrypted.bin

    idf.py --port $flash_port -b 921600 monitor
    echo "done"
elif [ "$(flash_port)" == "error" ]; then
    echo "Error Flash Encrypt"
fi
