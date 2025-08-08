SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
is_reinstall=0
case "$1" in
    r) is_reinstall=1;;
esac
if [ "$is_reinstall" -eq 1 ] ; then
echo "____________reinstall____________"
rm -rf /home/phult/.espressif
rm -rf ${SCRIPT_DIR}/build
else
echo "____________setup path____________"
fi
cd ${SCRIPT_DIR}/esp-idf
./install.sh
source ./export.sh
cd ..
# rm -rf build && cd esp-idf && ./install.sh && . ./export.sh && cd ..
