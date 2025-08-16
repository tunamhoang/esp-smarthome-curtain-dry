# Tài liệu mô tả hoạt động của công tắc rèm

## Luồng tổng quát

1. **Thiết bị nhận thông điệp qua mesh**  
   Hàm `_mesh_process_data` trong `periph_mesh.c` giải mã dữ liệu đến và lần lượt chuyển cho các bộ xử lý con, trong đó có `periph_mesh_curtain_process_message` chuyên xử lý thông điệp rèm.

2. **Xử lý thông điệp rèm ở lớp mesh**  
   - `periph_mesh_curtain_process_message` kiểm tra thông điệp `CurtainSwitcherClientRequest`.  
     *Nếu phần cứng đích trùng khớp thiết bị hiện tại* → gửi sự kiện nội bộ để motor xử lý;  
     *Nếu thiết bị là nút gốc* → chuyển tiếp thông điệp tới nút đích hoặc lên server.  
   - `periph_mesh_curtain_monitor_events` lắng nghe sự kiện `MONITOR_CURTAIN_EVENT` từ lớp giám sát và đóng gói thông tin phần trăm mở/đóng để báo cáo lên mạng mesh bằng `periph_mesh_curtain_report_msg`.

3. **Giám sát và kích hoạt motor**  
   Khi nhận sự kiện `PERIPH_MESH_CURTAIN_REQUEST`, `periph_monitor.c` trích xuất giá trị phần trăm màn in/out, gọi `periph_motor_set_pos` để điều chỉnh motor và phát sự kiện `MONITOR_CURTAIN_EVENT` phản hồi trạng thái mới.

4. **Điều khiển motor**
   - API chung `periph_motor`  
     `periph_motor_init` tạo peripheral theo cấu hình (UART hoặc dry‑contact) và gán hàm thao tác tương ứng; `periph_motor_control` và `periph_motor_set_pos` phân luồng xuống driver cụ thể.  
     Kiểu điều khiển được định nghĩa trong `motor_control_t` với các lệnh mở/đóng/dừng cho màn đơn và màn đôi; các API cài đặt vị trí và truy vấn vị trí nằm ở cuối header.
   - **Driver UART**  
     `periph_motor_uart_control` gửi chuỗi lệnh UART chuẩn hóa (open/close/stop) cho từng motor, tự động dừng nếu lệnh trước ngược hướng với lệnh hiện tại và cập nhật vị trí sau khi dừng.  
     `periph_motor_uart_set_pos` chuyển phần trăm cần đặt thành giá trị byte (đảo 100%) rồi truyền lệnh “set position” tới từng motor.
   - **Driver dry‑contact**  
     `periph_motor_drycontact_control` kích GPIO theo cặp tiếp điểm a/b, xử lý trường hợp lặp lại hoặc đảo chiều bằng cách chèn lệnh dừng, đồng thời cập nhật biến vị trí in/out.  
     `periph_motor_drycontact_set_pos` ánh xạ giá trị phần trăm >50% thành “mở” và ≤50% thành “đóng”, gọi các lệnh điều khiển tương ứng cho từng màn.

## Chức năng điều khiển của công tắc rèm

- **Mở/đóng/dừng màn đơn**: `MOTOR_SINGLE_CTRL_OPEN`, `MOTOR_SINGLE_CTRL_CLOSE`, `MOTOR_SINGLE_CTRL_STOP`.
- **Mở/đóng/dừng màn trái (in) hoặc phải (out)**: `MOTOR_IN_CTRL_*` và `MOTOR_OUT_CTRL_*`.
- **Đặt vị trí phần trăm**: `periph_motor_set_pos` (đi qua UART hoặc dry‑contact); motor sẽ di chuyển rồi phản hồi vị trí thực tế lên mesh thông qua chuỗi sự kiện nêu trên.

Sơ đồ điều khiển:

`Client/App` → (Mesh Message) → `periph_mesh_curtain_process_message` → `periph_monitor` → `periph_motor_*` → Motor → Phản hồi vị trí → `periph_mesh_curtain_report_msg` → (Mesh Response).

Tài liệu này cung cấp cái nhìn hàm‑tới‑hàm về cách firmware xử lý lệnh công tắc rèm, từ lớp mạng mesh tới driver motor, giúp việc mở rộng hoặc debug trở nên dễ dàng.

