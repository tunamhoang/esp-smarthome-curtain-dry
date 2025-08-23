# Hướng dẫn build và đóng gói firmware rèm

Tài liệu này mô tả các bước chuẩn bị môi trường, build mã nguồn và đóng gói bộ firmware để gửi cho đối tác hoặc tự nạp vào thiết bị.

## 1. Chuẩn bị môi trường ESP‑IDF

1. Di chuyển vào thư mục dự án con:
   ```bash
   cd esp-smarthome-wifi-mesh-fw
   ```
2. Cài đặt hoặc cập nhật ESP‑IDF:
   ```bash
   ./setup_env.sh
   ```
3. Nạp biến môi trường (thực hiện mỗi khi mở terminal mới):
   ```bash
   source ~/esp-idf/export.sh   # hoặc ". ./setup_env.sh" nếu script đã thiết lập IDF_PATH
   ```

## 2. Build firmware

```bash
./build.sh
```
Sau bước này các file *.bin đã được mã hóa sẽ nằm trong `esp-flash-encrypted-and-secure-boot/build/`.

## 3. Thu gom và đóng gói

1. Thu gom file cần gửi:
   ```bash
   ./produce.sh
   ```
   Script sẽ copy các file đã mã hóa (`app-encrypted.bin`, `bootloader-reflash-digest-encrypted.bin`, `ota_data_initial-encrypted.bin`, `partitions-encrypted.bin`) cùng script `flash_encrypted.sh` vào thư mục `produce/firmware/`.

2. Tạo gói nén để gửi cho đối tác:
   ```bash
   cd produce
   zip -r firmware-package.zip firmware
   ```
   File `firmware-package.zip` chứa thư mục `firmware` cùng các file *.bin và script nạp.

## 4. Hướng dẫn đối tác nạp firmware

1. Giải nén `firmware-package.zip` và kết nối thiết bị với cổng USB.
2. Trong thư mục `firmware` vừa giải nén, chạy:
   ```bash
   chmod +x flash_encrypted.sh
   ./flash_encrypted.sh
   ```
   Script sẽ tự tìm cổng serial (mặc định `/dev/ttyUSB0` trên Linux) và sử dụng `esptool.py` để ghi các file nhị phân vào flash.

## 5. Ghi chú

- Các bước trên yêu cầu máy tính đã cài đặt đầy đủ driver USB‑to‑Serial.
- Nếu cần build lại ở máy khác, lặp lại bước chuẩn bị môi trường trước khi chạy `build.sh`.
- Att USB port sang wsl và phân quyền user:
leeman@LAPTOP-KC8I5S35:~/esp-curtain-mesh-dry-fw$ sudo chgrp dialout /dev/ttyUSB0
leeman@LAPTOP-KC8I5S35:~/esp-curtain-mesh-dry-fw$ ls -l /dev/ttyUSB0
crw-rw---- 1 root dialout 188, 0 Aug 23 10:13 /dev/ttyUSB0
