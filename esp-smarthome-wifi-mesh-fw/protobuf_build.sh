#!/bin/bash
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
echo ${SCRIPT_DIR}
PROTOBUF_DIR=${SCRIPT_DIR}/components/protobuf/smarthome-protobuf
cd ${PROTOBUF_DIR}
rm -rf ./build/v1/c-out
mkdir ./build/v1/c-out
protoc --c_out=./build/v1/c-out -I ./proto/v1 ./proto/v1/client-main-message.proto
protoc --c_out=./build/v1/c-out -I ./proto/v1 ./proto/v1/client-message.proto
protoc --c_out=./build/v1/c-out -I ./proto/v1 ./proto/v1/common-message.proto
# protoc --c_out=./build/v1/c-out -I ./proto/v1 ./proto/v1/gateway-message.proto
protoc --c_out=./build/v1/c-out -I ./proto/v1 ./proto/v1/mesh-message.proto
protoc --c_out=./build/v1/c-out -I ./proto/v1 ./proto/v1/server-main-message.proto
protoc --c_out=./build/v1/c-out -I ./proto/v1 ./proto/v1/server-message.proto
cd ${SCRIPT_DIR}

# rm -rf ./components/periph_mesh/proto/c-out
# mkdir ./components/periph_mesh/proto/c-out
# protoc --c_out=./components/periph_mesh/proto/c-out -I ./components/periph_mesh/proto/ ./components/periph_mesh/proto/mesh_proto.proto
