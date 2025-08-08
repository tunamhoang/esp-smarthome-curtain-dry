PORT=error
ostype="$(uname -s)"

case "$ostype" in
    Darwin)
        echo "-------------FLASH FOR OSX----------------"
        PREFIX_PORT=/dev/tty.usb*
        ;;
    Linux)
        echo "-------------FLASH FOR LINUX----------------"
        PREFIX_PORT=/dev/ttyUSB*
        ;;
    *)
        echo "unknown: $ostype"
        ;;
esac
for i in {1..10}
do
    PORT=$(ls /dev/tty* | grep ${PREFIX_PORT} | awk '{ print $1}')
    if [ "x$PORT" != "x" ]; then
        echo "Serial port $PORT"
        break
    fi
    sleep 1
done
if [ $PORT != "error" ]; then
    echo "Flash to port" "$PORT"

    esptool.py --chip esp32 --port $PORT --baud 921600 --before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 40m --flash_size detect --force \
    0x0 ./bootloader-reflash-digest-encrypted.bin \
    0x9000 ./partitions-encrypted.bin \
    0xE000 ./ota_data_initial-encrypted.bin \
    0x10000 ./app-encrypted.bin

    # idf.py --port $PORT -b 921600 monitor
    echo "-------------FLASH SUCCESSSFUL-------------"
elif [ "$(PORT)" == "error" ]; then
    echo "Error Flash Encrypt"
fi
