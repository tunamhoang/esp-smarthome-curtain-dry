SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
ESPSECURE=${SCRIPT_DIR}/esp-idf/components/esptool_py/esptool/espsecure.py
KEY_DIR=${SCRIPT_DIR}/esp-flash-encrypted-and-secure-boot/key
${ESPSECURE} extract_public_key --keyfile ${KEY_DIR}/secure_boot_signing_key_1.0.0.alpha.4.pem ${KEY_DIR}/signature_verification_key_1.0.0.alpha.4.bin
${ESPSECURE} digest_private_key --keyfile ${KEY_DIR}/secure_boot_signing_key_1.0.0.alpha.4.pem ${KEY_DIR}/flash_encryption_key_1.0.0.alpha.4.bin
echo "Copy: "$PWD"/key/signature_verification_key_1.0.0.alpha.4.bin"
