# Smarthome Protobuf

This repo is using as a submodule for applications about Smarthome

## How to use

- Just clone this repo and import into your source in the appropriate language wihtin build folder

- In this repo comming with `generate` script but this is just using for CI. This script will compare 2 last version of git and find that have any change on proto file to build

## Release new tag version

Please create new merequest from develop to master when you want to release new version. CI will catch the first line of merge quest message and using format `[tag]`:

- If that line equal with version pattern, CI will generate your version
- If not the CI will auto plus 1 into patch of newest tag version

## Dart library

In root have directory `proto_message_dart` that is the source for Dart to use as a library (not submodule). Place lines below into `pubspec.yaml`

```yaml
protobuf_messages_internal:
  git:
    url: git@git.sunshinetech.vn:dev/common-libraries/smarthome-protobuf.git
    ref: master
    path: proto_message_dart
```

Change `ref` to compatible with `tag` or `branch` on the repo to use the source on your version

## Make change on proto

Install [protobuf](https://github.com/protocolbuffers/protobuf) and using following command to build:

```shell
protoc --{your-language}=/dest/ -I /proto/source /path/to/proto/file
```

Example

```shell
protoc --java-out=./build/v1/java-out -I ./proto/v1 ./proto/v1/common-message.proto
```

Output file was generated in `./build/v1/java-out`

If you create new proto file, please create it into `proto/{version}` folder.

If you want to build for C or Dart language, you have to install external plugin for that. Read [Build for C](#build-for-c) and [Build for Dart](#build-for-dart)

### <a name="build-for-c">Build for C</a>

Following instruction in this [protobuf-c](https://github.com/protobuf-c/protobuf-c) to install plugin that will help you build proto file for C language.

### <a name="build-for-dart">Build fo Dart</a>

You must install Dart SDK on your computer, and following instruction in [dart-protoc-plugin](https://github.com/dart-lang/protobuf/tree/master/protoc_plugin) to install
