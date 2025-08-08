rm -rf fw
mkdir fw
# cp build/esp-mesh-touch-fw-encrypted.bin fw/
# cp build/partitions-encrypted.bin fw/
# cp build/bootloader/bootloader-reflash-digest-encrypted.bin fw/
# cp build/ota_data_initial-encrypted.bin fw/
# cp flash_fw.sh fw/
# cp flash_fw.bat fw/
cp build/esp-mesh-touch-fw.bin fw/
cp build/partitions.bin fw/
cp build/bootloader/bootloader.bin fw/
cp build/ota_data_initial.bin fw/
tar -czvf esp_mesh_fw.tar.gz fw
