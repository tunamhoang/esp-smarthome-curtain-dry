rm -rf produce/firmware/app-encrypted.bin
rm -rf produce/firmware/bootloader-reflash-digest-encrypted.bin
rm -rf produce/firmware/ota_data_initial-encrypted.bin
rm -rf produce/firmware/partitions-encrypted.bin
cp esp-flash-encrypted-and-secure-boot/build/app-encrypted.bin produce/firmware/
cp esp-flash-encrypted-and-secure-boot/build/bootloader-reflash-digest-encrypted.bin produce/firmware/
cp esp-flash-encrypted-and-secure-boot/build/ota_data_initial-encrypted.bin produce/firmware/
cp esp-flash-encrypted-and-secure-boot/build/partitions-encrypted.bin produce/firmware/
