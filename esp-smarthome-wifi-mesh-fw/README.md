# esp_mesh_touch_fw

## Build and flash

1. Change version in *version.txt*

2. Build

    ```bash
    ./build.sh
    ```

3. Flash

    ```bash
    ./build.sh && ./flash_encrypted.sh
    ```

    ```bash
    esptool.py --port /dev/cu.usbserial-0001 --baud 921600 erase_flash --force
    ```
    
## Auto Detect Hardware

| Version |    Type    |          Hardware          | IO34 | IO35 | IO36 | MTCH | DAC |  NAME  | MODEL |  HW_VER   |
|:-------:|:----------:|:--------------------------:|:----:|:----:|:----:|:----:|:---:|:------:|:-----:|:---------:|
|  VER1   |   Touch    |                            |      |      |      |      |     |        |       |           |
|  VER1   |   Touch    |          Touch 1           |  0   |  0   |  0   |  no  | no  | SWITCH | WT1-1 |  ST4.4-1  |
|  VER1   |   Touch    |        Touch 1 30A         |  0   |  0   |  0   |  no  | no  | SWITCH | WH1-1 | ST4.4-1H  |
|  VER1   |   Touch    |          Touch 2           |  0   |  1   |  0   | yes  | no  | SWITCH | WT1-2 |  ST4.4-2  |
|  VER1   |   Touch    |          Touch 3           |  1   |  0   |  0   | yes  | no  | SWITCH | WT1-3 |  ST4.4-3  |
|  VER1   |   Touch    |          Touch 4           |  1   |  1   |  0   | yes  | no  | SWITCH | WT1-4 |  ST4.4-4  |
|  VER1   |  Curtain   |    Touch 4 curtain uart    |  1   |  1   |  0   | yes  | no  | SWITCH | WC1-4 |  ST4.4-4  |
|  VER1   |    PIR     |            PIR             |  0   |  0   |  0   |  no  | no  |   MD   |  MD1  |  SMD1.0   |
|  VER1   | Thermostat |      Thermostat UART       |  0   |  0   |  0   |  no  | no  |  TMD   | GW0U  |   TMS01   |
|  VER1   | Thermostat |       Thermostat SPI       |  0   |  0   |  1   |  no  | no  |  TMD   | GW0S  |   TMS01   |
|  VER1   | Thermostat |      Thermostat_UART       |  0   |  1   |  0   |  no  | no  |  TMD   | GW0U  |   TMS01   |
|  VER1   | Thermostat |      Thermostat_UART       |  1   |  1   |  1   |  no  | no  |  TMD   | GW0U  |   TMS01   |
|  VER1   |     IR     |         GW-IR-UART         |  0   |  0   |  0   |  no  | no  |   GW   | GW1U  | SGW3.7-1U |
|  VER1   |     IR     |       GW-IR-RF-UART        |  0   |  0   |  1   |  no  | no  |   GW   | GW3U  | SGW3.7-3U |
|  VER1   |     IR     |      GW-IR-TEMP-HBUS       |  0   |  1   |  0   |  no  | no  |   GW   | GW5H  | SGW3.7-5H |
|  VER1   |     IR     |        GW-FULL-HBUS        |  0   |  1   |  1   |  no  | no  |   GW   | GW7H  | SGW3.7-7H |
|  VER1   |     IR     |         GW-IR-SPI          |  1   |  0   |  0   |  no  | no  |   GW   | GW1S  | SGW3.7-1S |
|  VER1   |     IR     |        GW-IR-RF-SPI        |  1   |  0   |  1   |  no  | no  |   GW   | GW3S  | SGW3.7-3S |
|  VER1   |     IR     |         GW-IR-HBUS         |  1   |  1   |  0   |  no  | no  |   GW   | GW1H  | SGW3.7-1H |
|  VER1   |     IR     |       GW-IR-RF-HBUS        |  1   |  0   |  1   |  no  | no  |   GW   | GW3H  | SGW3.7-3H |
|  VER2   |            |                            |      |      |      |      |     |        |       |           |
|  VER2   |   Touch    |                            |      |      |      |      |     |        |       |           |
|  VER2   |   Touch    |          Touch 1           |  0   |  0   |  1   |  no  | no  | SWITCH | WT2-1 |  ST4.6-1  |
|  VER2   |   Touch    |        Touch 1 30A         |  0   |  0   |  0   |  no  | no  | SWITCH | WH2-1 | ST4.6-1H  |
|  VER2   |   Touch    |          Touch 2           |  0   |  1   |  1   |  no  | no  | SWITCH | WT2-2 |  ST4.6-2  |
|  VER2   |   Touch    |      Touch 2 curtain       |  0   |  1   |  0   |  no  | no  | SWITCH | WC2-2 | ST4.6-2C  |
|  VER2   |   Touch    |          Touch 3           |  1   |  0   |  1   | yes  | yes | SWITCH | WT2-3 |  ST4.6-3  |
|  VER2   |   Touch    |          Touch 4           |  1   |  1   |  1   | yes  | yes | SWITCH | WT2-4 |  ST4.6-4  |
|  VER2   |  Curtain   |    Touch 2 curtain uart    |  0   |  1   |  0   | yes  | yes | SWITCH | WC2-2 | ST4.6-2C  |
|  VER2   |  Curtain   | Touch 2 curtain drycontact |  1   |  1   |  0   | yes  | yes | SWITCH | WC2-2 | ST4.6-2C  |
|  VER2   |  Curtain   |    Touch 4 curtain uart    |  1   |  1   |  1   | yes  | yes | SWITCH | WC2-4 | ST4.6-4C  |
|  VER2   |  Curtain   | Touch 4 curtain drycontact |  1   |  0   |  0   | yes  | yes | SWITCH | WC2-4 | ST4.6-4C  |
|  VER1   |     IR     |        GW-IR-RF-485        |  0   |  0   |  1   |  no  | no  |   GW   | GW3R  | SGW3.7-3R |
|  VER3   |            |                            |      |      |      |      |     |        |       |           |
|  VER3   |   Touch    |          Touch 1           |  0   |  0   |  1   |  no  | no  | SWITCH | WT3-1 |  ST5.0-1  |
|  VER3   |   Touch    |        Touch 1  30A        |  0   |  0   |  0   |  no  | no  | SWITCH | WH3-1 | ST5.0-1H  |
|  VER3   |   Touch    |          Touch 2           |  0   |  1   |  1   |  no  | no  | SWITCH | WT3-2 |  ST5.0-2  |
|  VER3   |   Touch    |      Touch 2 curtain       |  0   |  1   |  0   |  no  | no  | SWITCH | WC3-2 | ST5.0-2C  |
|  VER3   |   Touch    |          Touch 3           |  1   |  0   |  1   |  no  | no  | SWITCH | WT3-3 |  ST5.0-3  |
|  VER3   |   Touch    |          Touch 4           |  1   |  1   |  1   |  no  | no  | SWITCH | WT3-4 |  ST5.0-4  |
|  VER3   |  Curtain   |    Touch 2 curtain uart    |  0   |  1   |  0   |  no  | no  | SWITCH | WC3-2 | ST5.0-2C  |
|  VER3   |  Curtain   |    Touch 4 curtain uart    |  1   |  1   |  0   |  no  | no  | SWITCH | WC3-4 | ST5.0-4C  |
|  VER3   |  Curtain   |    Touch 4 curtain uart    |  1   |  1   |  1   |  no  | no  | SWITCH | WC3-4 | ST5.0-4C  |
|  VER3   |  Curtain   | Touch 4 curtain drycontact |  1   |  0   |  0   |  no  | no  | SWITCH | WC3-4 | ST5.0-4C  |
|  VER3   |  Curtain   | Touch 2 curtain drycontact |  0   |  0   |  1   |  no  | no  | SWITCH | WC3-2 | ST5.0-2C  |
|  VER3   |   Touch    |          Touch 6           |  0   |  0   |  0   |  no  | no  | SWITCH | WT3-6 |  ST5.0-6  |


| NAME | IR | RF | SENSOR | UART | SPI | HOMEBUS |
|:----:|:--:|:--:|:------:|:----:|:---:|:-------:|
|  GW  | B0 | B1 |   B2   |  U   |  S  |    H    |

Gatewat name: GW[B0B1B2][U|S|H] => B0B1B2 => Binary select by bit B0, B1, B2
Example: 

| NAME | IR | RF | SENSOR | UART | SPI | HOMEBUS | MODEL | EXPLAIN                               |
|:----:|:--:|:--:|:------:|:----:|:---:|:-------:|-------|---------------------------------------|
|  GW  | x  |    |   x    |  x   |     |         | GW5U  | Support IR, Sensor and UART Interface |
|  GW  | x  | x  |   x    |      |     |    x    | GW7H  | Support Full with Homebus interface   |

## Mesh

- https service
- websocket service

## Secure boot

```
/Users/tuan/Projects/2019/sunshine/esp_mesh_touch_fw/key/signature_verification_key_1.0.0.alpha.4.bin
```

## SmartHome device specification

- [Smarthome Specification](docs/smarthome-device-specification.md)

## Voice control SmartHome device

- [Google Assistant](docs/voice-control-smarthome-device.md)

## AIRCOND

- https://github.com/rjdekker/MHI2MQTT
- `git apply idf.path`

## Change logs

- 1.1.0: 
    + Update IDF master (4.0): d7e659df27cf00b5f831686bb94162a97bea62be
    + Inc websocket task stack
    + fix pinout 3 touch v2
- 1.6.0:
    + Downdate IDF (v3.3)
    + Fix mesh network problem
    + Add support date/night brightness control
    + Update tcp_transport to IDF 4.0
    + Register device over websocket
    + Fash switch to ROOT when OTA
    + Validate password wifi to avoid bootloop
    + Response dev mode on blufi read_data 
- 1.8.0
    + Update transport_tcp
    + Fixed PING/PONG Websocket
    + Fixed Lost intnernet problem
    + Add bridge on Root
- 2.0.0 ([Test form release](docs/test-form-v2.0.0.md))
    + Update driver touch (using interrupt timer)
    + Disable waive root when disconnect websocket
    + Don't start mesh if invalid access key/id
- 2.2.0
    + Support Homekit gateway
    + Optimize touch
- 2.2.1
    + Change WiFi Tx power to 10dBm
    + Support curtain drycontact
    + In config mode:
        + Triple tap to join gateway homekit (currently disabled) or restart device
        + Long tap to check OTA (using default AP)
    + Speed up building mesh network
    + Optimize touch (increase slide windows and slow down touch threshold)
- 2.2.2
    + Fix bug LED - double LED are on
- 2.2.3
    + Support touch curtain drycontact
- 3.0.0
    + New feature
        + Double tap (support all touch version)
        + Touch scene (support all touch version)
        + Auto off (support all touch version)
        + Support PIR device (MD1)
        + PIR active time
        + Support touch scene device (WT3-6)
        + Support root bridge offline for PIR and Touch
        + Update submodule for protobuf
    + Mesh network
        + Optimize
            + Limit node join in mesh
            + Switch mesh if root have enough node (mesh_id generate with channel param)
            + Send update-switcher-state instead switcher-onchage when login successed
            + Optimize memory (~25KB(IR), 38KB(Touch))
        + Fixbug
            + Timeout websocket (restart after reconnected fail 15 minute)
        + New feature
            + Mesh log (send log device to server)
            + Separate mesh_process_rb task
            + Separate ringbuf (mesh_rb and my_rb) to offload root
    + User behavior
        + Reset user config when add device to another account or pressed 5 times in config mode
        + Increase reactivity for touch ESP
        + Support time accept touch for touch ESP
        + Support time accept press for touch MTCH
        + Support scan homekit mesh first
        + Set default LED day/night brigthness (50%(day) and 25%(night))
    + Other Fixbug
        + Separate touch curtain from touch (menuconfig)
        + Change touch-driver in core 0 and WiFi (mesh) in core 1
        + Fix bug LED:
            + Duplicate when control bridge
            + Both LED on and off turn on
            + LED IR turn off when received learn IR/RF request
        + Storage
            + Add reserved variable for fixed storage size
- 3.0.1
    + New feature:
        + Support Thermostat (UART, SPI)
        + Support Aircond RS485
        + Change Websocket endpoint feature
    + Fix bug:
        + Error auto detect for Touch Curtain drycontact
        + Error LED behavior when set scene for touch
        + Error control for Touch Curtain drycontact
