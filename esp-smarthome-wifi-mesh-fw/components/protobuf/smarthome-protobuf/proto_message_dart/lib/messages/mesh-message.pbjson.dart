///
//  Generated code. Do not modify.
//  source: mesh-message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use meshRegisterRequestDescriptor instead')
const MeshRegisterRequest$json = const {
  '1': 'MeshRegisterRequest',
  '2': const [
    const {'1': 'hardwareId', '3': 1, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'model', '3': 2, '4': 1, '5': 9, '10': 'model'},
    const {'1': 'hwVersion', '3': 3, '4': 1, '5': 9, '10': 'hwVersion'},
    const {'1': 'regToken', '3': 4, '4': 1, '5': 9, '10': 'regToken'},
    const {'1': 'deviceToken', '3': 5, '4': 1, '5': 9, '10': 'deviceToken'},
    const {'1': 'deviceId', '3': 6, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'fwVersion', '3': 7, '4': 1, '5': 9, '10': 'fwVersion'},
  ],
};

/// Descriptor for `MeshRegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List meshRegisterRequestDescriptor = $convert.base64Decode('ChNNZXNoUmVnaXN0ZXJSZXF1ZXN0Eh4KCmhhcmR3YXJlSWQYASABKAlSCmhhcmR3YXJlSWQSFAoFbW9kZWwYAiABKAlSBW1vZGVsEhwKCWh3VmVyc2lvbhgDIAEoCVIJaHdWZXJzaW9uEhoKCHJlZ1Rva2VuGAQgASgJUghyZWdUb2tlbhIgCgtkZXZpY2VUb2tlbhgFIAEoCVILZGV2aWNlVG9rZW4SGgoIZGV2aWNlSWQYBiABKAlSCGRldmljZUlkEhwKCWZ3VmVyc2lvbhgHIAEoCVIJZndWZXJzaW9u');
@$core.Deprecated('Use meshRegisterResponseDescriptor instead')
const MeshRegisterResponse$json = const {
  '1': 'MeshRegisterResponse',
  '2': const [
    const {'1': 'hardwareId', '3': 1, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'deviceToken', '3': 2, '4': 1, '5': 9, '10': 'deviceToken'},
    const {'1': 'wsEnpoint', '3': 3, '4': 1, '5': 9, '10': 'wsEnpoint'},
    const {'1': 'dataType', '3': 4, '4': 1, '5': 14, '6': '.DataType', '10': 'dataType'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `MeshRegisterResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List meshRegisterResponseDescriptor = $convert.base64Decode('ChRNZXNoUmVnaXN0ZXJSZXNwb25zZRIeCgpoYXJkd2FyZUlkGAEgASgJUgpoYXJkd2FyZUlkEiAKC2RldmljZVRva2VuGAIgASgJUgtkZXZpY2VUb2tlbhIcCgl3c0VucG9pbnQYAyABKAlSCXdzRW5wb2ludBIlCghkYXRhVHlwZRgEIAEoDjIJLkRhdGFUeXBlUghkYXRhVHlwZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use meshOnChangedMessageDescriptor instead')
const MeshOnChangedMessage$json = const {
  '1': 'MeshOnChangedMessage',
  '2': const [
    const {'1': 'hardwareId', '3': 1, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'serverConnected', '3': 2, '4': 1, '5': 13, '10': 'serverConnected'},
  ],
};

/// Descriptor for `MeshOnChangedMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List meshOnChangedMessageDescriptor = $convert.base64Decode('ChRNZXNoT25DaGFuZ2VkTWVzc2FnZRIeCgpoYXJkd2FyZUlkGAEgASgJUgpoYXJkd2FyZUlkEigKD3NlcnZlckNvbm5lY3RlZBgCIAEoDVIPc2VydmVyQ29ubmVjdGVk');
@$core.Deprecated('Use meshDisconnectMessageDescriptor instead')
const MeshDisconnectMessage$json = const {
  '1': 'MeshDisconnectMessage',
  '2': const [
    const {'1': 'rootChannel', '3': 1, '4': 1, '5': 13, '10': 'rootChannel'},
  ],
};

/// Descriptor for `MeshDisconnectMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List meshDisconnectMessageDescriptor = $convert.base64Decode('ChVNZXNoRGlzY29ubmVjdE1lc3NhZ2USIAoLcm9vdENoYW5uZWwYASABKA1SC3Jvb3RDaGFubmVs');
@$core.Deprecated('Use meshMessageDescriptor instead')
const MeshMessage$json = const {
  '1': 'MeshMessage',
  '2': const [
    const {'1': 'meshRegisterRequest', '3': 1, '4': 1, '5': 11, '6': '.MeshRegisterRequest', '10': 'meshRegisterRequest'},
    const {'1': 'meshRegisterResponse', '3': 2, '4': 1, '5': 11, '6': '.MeshRegisterResponse', '10': 'meshRegisterResponse'},
    const {'1': 'meshOnChangedMessage', '3': 3, '4': 1, '5': 11, '6': '.MeshOnChangedMessage', '10': 'meshOnChangedMessage'},
    const {'1': 'meshDisconnectMessage', '3': 4, '4': 1, '5': 11, '6': '.MeshDisconnectMessage', '10': 'meshDisconnectMessage'},
  ],
};

/// Descriptor for `MeshMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List meshMessageDescriptor = $convert.base64Decode('CgtNZXNoTWVzc2FnZRJGChNtZXNoUmVnaXN0ZXJSZXF1ZXN0GAEgASgLMhQuTWVzaFJlZ2lzdGVyUmVxdWVzdFITbWVzaFJlZ2lzdGVyUmVxdWVzdBJJChRtZXNoUmVnaXN0ZXJSZXNwb25zZRgCIAEoCzIVLk1lc2hSZWdpc3RlclJlc3BvbnNlUhRtZXNoUmVnaXN0ZXJSZXNwb25zZRJJChRtZXNoT25DaGFuZ2VkTWVzc2FnZRgDIAEoCzIVLk1lc2hPbkNoYW5nZWRNZXNzYWdlUhRtZXNoT25DaGFuZ2VkTWVzc2FnZRJMChVtZXNoRGlzY29ubmVjdE1lc3NhZ2UYBCABKAsyFi5NZXNoRGlzY29ubmVjdE1lc3NhZ2VSFW1lc2hEaXNjb25uZWN0TWVzc2FnZQ==');
