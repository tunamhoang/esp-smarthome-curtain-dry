
espsecure.py extract_public_key --keyfile key/secure_boot_signing_key_1.0.0.alpha.4.pem key/signature_verification_key_1.0.0.alpha.4.bin
espsecure.py digest_private_key --keyfile key/secure_boot_signing_key_1.0.0.alpha.4.pem key/flash_encryption_key_1.0.0.alpha.4.bin
echo "Copy: "$PWD"/key/signature_verification_key_1.0.0.alpha.4.bin"
