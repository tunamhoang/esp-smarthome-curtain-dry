# espefuse.py --port /dev/ttyUSB4 --do-not-confirm burn_key secure_boot flash-encrypt-secure-boot/key/secure-bootloader-key-256.bin
# espefuse.py --port /dev/ttyUSB4 --do-not-confirm burn_key flash_encryption flash-encrypt-secure-boot/key/flash_encryption_key_1.0.0.alpha.4.bin
# espefuse.py --port /dev/ttyUSB4 --do-not-confirm burn_efuse FLASH_CRYPT_CNT 1
# espefuse.py --port /dev/ttyUSB4 --do-not-confirm burn_efuse FLASH_CRYPT_CONFIG 0xf
for i in {1..500}
do
    for x in "$*/dev/ttyUSB*"
    do
        echo "Flash $i times"   
        esptool.py --chip esp32 --port $x --baud 2000000 --before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 40m --flash_size detect 0x10000 flash-encrypt-secure-boot/build/esp-touch-app-encrypted.bin 0x8000 flash-encrypt-secure-boot/build/partitions-encrypted.bin 0x0 flash-encrypt-secure-boot/build/bootloader-reflash-digest-encrypted.bin 0xe000 flash-encrypt-secure-boot/build/ota_data_initial-encrypted.bin
# make monitor
# https://sm-api.sunshinetech.vn/v1/oauth/login?client_id=sunshine-tech-dev&redirect_uri=https%3A%2F%2Foauth-redirect.googleusercontent.com%2Fr%2Fsunshine-smarthome-dev-5a90b&redirect=%2Fv1%2Foauth%2Fauth%3Fresponse_type%3Dcode%26client_id%3Dsunshine-tech-dev%26redirect_uri%3Dhttps%3A%2F%2Foauth-redirect.googleusercontent.com%2Fr%2Fsunshine-smarthome-dev-5a90b%26state%3DCuwCQVBoSlZ2Y1h0aURORFExS3NIYWpDa2VadllGMWZPcldxQkJOOEVSVzh4bFJuZDRrbjNVNnpsT2lMa2hZaVNSUnp5MDFObS1yNmJFSVZMcm1FNlNXOXFQNmtsWlE2MXM5RzRvSTJDZV9VRjNOeS03REVJYS10VWR4MGZYQV9fZG52dndZdlZrb3YxdkJSZFF0bEdQVEg3djhOTUltZnBCanFCaURNcDdXM3c5U05pVHhfa2MxVjQ5RmdrdG9CbkhPUTJxcG1FQ3hwVXZ4a1dOOE5zTUJyaWpESG5sU2JLSkg5aVE0bXBlMHZVYW9ZS2duaENMX2EwS0NybGNiYVFoakFzRXpMaTFUV0R0aVRPU21VbFN4ejRVTXVmT2dUNmtwVkFGbVgtN0dvTHhqMzZibHFVZTEtNTBOdXlOVmtpeFI1TW0wQlVseVJVV1ZWV3VFRTJGXzluaXNrWnVJZDhsX2gybGdOWU5WYjVnThIdY2hyb21lY2FzdDovL3NldHRpbmdzL2hhbmRvZmYYASJLaHR0cHM6Ly9vYXV0aC1yZWRpcmVjdC5nb29nbGV1c2VyY29udGVudC5jb20vci9zdW5zaGluZS1zbWFydGhvbWUtZGV2LTVhOTBiKhVzc3RoY20uZGVtb0BnbWFpbC5jb20yIHN1bnNoaW5lLXNtYXJ0aG9tZS1kZXYtNWE5MGJfZGV2&state=CuwCQVBoSlZ2Y1h0aURORFExS3NIYWpDa2VadllGMWZPcldxQkJOOEVSVzh4bFJuZDRrbjNVNnpsT2lMa2hZaVNSUnp5MDFObS1yNmJFSVZMcm1FNlNXOXFQNmtsWlE2MXM5RzRvSTJDZV9VRjNOeS03REVJYS10VWR4MGZYQV9fZG52dndZdlZrb3YxdkJSZFF0bEdQVEg3djhOTUltZnBCanFCaURNcDdXM3c5U05pVHhfa2MxVjQ5RmdrdG9CbkhPUTJxcG1FQ3hwVXZ4a1dOOE5zTUJyaWpESG5sU2JLSkg5aVE0bXBlMHZVYW9ZS2duaENMX2EwS0NybGNiYVFoakFzRXpMaTFUV0R0aVRPU21VbFN4ejRVTXVmT2dUNmtwVkFGbVgtN0dvTHhqMzZibHFVZTEtNTBOdXlOVmtpeFI1TW0wQlVseVJVV1ZWV3VFRTJGXzluaXNrWnVJZDhsX2gybGdOWU5WYjVnThIdY2hyb21lY2FzdDovL3NldHRpbmdzL2hhbmRvZmYYASJLaHR0cHM6Ly9vYXV0aC1yZWRpcmVjdC5nb29nbGV1c2VyY29udGVudC5jb20vci9zdW5zaGluZS1zbWFydGhvbWUtZGV2LTVhOTBiKhVzc3RoY20uZGVtb0BnbWFpbC5jb20yIHN1bnNoaW5lLXNtYXJ0aG9tZS1kZXYtNWE5MGJfZGV2

#for i in {1..500}
#do
#    echo "Flash $i times"
#    ESPPORT=/dev/ttyUSB3 make flash monitor
#    echo "done"
#    sleep 2
#done
        ESPPORT=$x make monitor
        echo "done"
        sleep 3
    done
done
