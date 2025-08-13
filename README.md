
//Cách đóng gói firmware để gửi cho đối tác
//Build firmware

//Vào thư mục dự án:

cd esp-smarthome-wifi-mesh-fw
//Nếu chưa build, chạy:

./build.sh
//(Sau bước này các file *.bin mã hóa sẽ nằm trong esp-flash-encrypted-and-secure-boot/build/.)

//Thu thập file cần gửi

//Chạy script thu gom:

./produce.sh
//Script sẽ copy các file đã mã hóa (app-encrypted.bin, bootloader-reflash-digest-encrypted.bin, ota_data_initial-encrypted.bin, partitions-encrypted.bin) và script flash_encrypted.sh vào thư mục produce/firmware/.

//Đóng gói

//Tạo file nén để gửi cho đối tác:

cd produce
zip -r firmware-package.zip firmware
//Gửi file firmware-package.zip cho đối tác. Khi giải nén, họ sẽ nhận được thư mục firmware chứa các file *.bin và flash_encrypted.sh.

//Hướng dẫn đối tác nạp

//Kết nối thiết bị với cổng USB.

//Trong thư mục firmware vừa giải nén, chạy:

chmod +x flash_encrypted.sh
./flash_encrypted.sh
//Script sẽ tự tìm cổng serial (mặc định /dev/ttyUSB0 trên Linux) và sử dụng esptool.py để ghi các file nhị phân vào flash.


Nếu chưa có ESP-IDF

Install or update ESP‑IDF
If you haven’t already:

cd esp-smarthome-curtain-dry/esp-smarthome-wifi-mesh-fw
./setup_env.sh
Load the ESP‑IDF environment (each new terminal session):

source ~/esp-idf/export.sh   # or . ./setup_env.sh if it sets IDF_PATH
This adds idf.py and other tools to your PATH.

Build again:

./build.sh
