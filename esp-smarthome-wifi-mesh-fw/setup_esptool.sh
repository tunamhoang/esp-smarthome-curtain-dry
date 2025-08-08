# rm -rf esp-idf/components/esptool_py/esptool
wget https://github.com/espressif/esptool/archive/refs/tags/v2.6.tar.gz
tar -xvf v2.6.tar.gz
cp -R esptool-2.6/. esp-idf/components/esptool_py/esptool/.
rm -rf esptool-2.6
rm -rf v2.6.tar.gz
