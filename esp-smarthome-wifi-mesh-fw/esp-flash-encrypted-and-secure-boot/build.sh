app_name="esp-touch-test-fw.bin"
cp -f esp-flash-encrypted-and-secure-boot/key/secure-bootloader-key-256.bin build/bootloader/
make bootloader -j8
mkdir esp-flash-encrypted-and-secure-boot/build
make -j8
espsecure.py sign_data --keyfile esp-flash-encrypted-and-secure-boot/key/secure_boot_signing_key_1.0.0.alpha.4.pem build/$app_name
espsecure.py sign_data --keyfile esp-flash-encrypted-and-secure-boot/key/secure_boot_signing_key_1.0.0.alpha.4.pem build/partitions.bin
# espsecure.py sign_data --keyfile esp-flash-encrypted-and-secure-boot/key/secure_boot_signing_key_1.0.0.alpha.4.pem build/ota_data_initial.bin
espsecure.py encrypt_flash_data --keyfile esp-flash-encrypted-and-secure-boot/key/flash_encryption_key_1.0.0.alpha.4.bin --address 0x10000 -o esp-flash-encrypted-and-secure-boot/build/app-encrypted.bin build/$app_name
espsecure.py encrypt_flash_data --keyfile esp-flash-encrypted-and-secure-boot/key/flash_encryption_key_1.0.0.alpha.4.bin --address 0x8000 -o esp-flash-encrypted-and-secure-boot/build/partitions-encrypted.bin build/partitions.bin
espsecure.py encrypt_flash_data --keyfile esp-flash-encrypted-and-secure-boot/key/flash_encryption_key_1.0.0.alpha.4.bin --address 0xe000 -o esp-flash-encrypted-and-secure-boot/build/ota_data_initial-encrypted.bin build/ota_data_initial.bin
espsecure.py encrypt_flash_data --keyfile esp-flash-encrypted-and-secure-boot/key/flash_encryption_key_1.0.0.alpha.4.bin --address 0x0 -o esp-flash-encrypted-and-secure-boot/build/bootloader-reflash-digest-encrypted.bin build/bootloader/bootloader-reflash-digest.bin
# espsecure.py encrypt_flash_data --keyfile esp-flash-encrypted-and-secure-boot/key/flash_encryption_key_1.0.0.alpha.4.bin --address 0x1000 -o build/bootloader/bootloader-encrypted.bin build/bootloader/bootloader.bin