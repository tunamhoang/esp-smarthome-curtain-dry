///
//  Generated code. Do not modify.
//  source: server-main-message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use messageHeaderDescriptor instead')
const MessageHeader$json = const {
  '1': 'MessageHeader',
  '2': const [
    const {'1': 'accessToken', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'deviceId', '3': 3, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'hardwareId', '3': 4, '4': 1, '5': 9, '10': 'hardwareId'},
  ],
};

/// Descriptor for `MessageHeader`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageHeaderDescriptor = $convert.base64Decode('Cg1NZXNzYWdlSGVhZGVyEiAKC2FjY2Vzc1Rva2VuGAEgASgJUgthY2Nlc3NUb2tlbhIWCgZ1c2VySWQYAiABKAlSBnVzZXJJZBIaCghkZXZpY2VJZBgDIAEoCVIIZGV2aWNlSWQSHgoKaGFyZHdhcmVJZBgEIAEoCVIKaGFyZHdhcmVJZA==');
@$core.Deprecated('Use mainMessageDescriptor instead')
const MainMessage$json = const {
  '1': 'MainMessage',
  '2': const [
    const {'1': 'serverMessage', '3': 1, '4': 1, '5': 11, '6': '.ServerMessage', '10': 'serverMessage'},
    const {'1': 'clientMessage', '3': 2, '4': 1, '5': 11, '6': '.ClientMessage', '10': 'clientMessage'},
    const {'1': 'meshMessage', '3': 3, '4': 1, '5': 11, '6': '.MeshMessage', '10': 'meshMessage'},
  ],
};

/// Descriptor for `MainMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mainMessageDescriptor = $convert.base64Decode('CgtNYWluTWVzc2FnZRI0Cg1zZXJ2ZXJNZXNzYWdlGAEgASgLMg4uU2VydmVyTWVzc2FnZVINc2VydmVyTWVzc2FnZRI0Cg1jbGllbnRNZXNzYWdlGAIgASgLMg4uQ2xpZW50TWVzc2FnZVINY2xpZW50TWVzc2FnZRIuCgttZXNoTWVzc2FnZRgDIAEoCzIMLk1lc2hNZXNzYWdlUgttZXNoTWVzc2FnZQ==');
@$core.Deprecated('Use mainMessageContainerDescriptor instead')
const MainMessageContainer$json = const {
  '1': 'MainMessageContainer',
  '2': const [
    const {'1': 'messageHeader', '3': 1, '4': 1, '5': 11, '6': '.MessageHeader', '10': 'messageHeader'},
    const {'1': 'mainMessage', '3': 2, '4': 1, '5': 11, '6': '.MainMessage', '10': 'mainMessage'},
  ],
};

/// Descriptor for `MainMessageContainer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mainMessageContainerDescriptor = $convert.base64Decode('ChRNYWluTWVzc2FnZUNvbnRhaW5lchI0Cg1tZXNzYWdlSGVhZGVyGAEgASgLMg4uTWVzc2FnZUhlYWRlclINbWVzc2FnZUhlYWRlchIuCgttYWluTWVzc2FnZRgCIAEoCzIMLk1haW5NZXNzYWdlUgttYWluTWVzc2FnZQ==');
