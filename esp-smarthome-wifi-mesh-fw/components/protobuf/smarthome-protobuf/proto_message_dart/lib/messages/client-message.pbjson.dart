///
//  Generated code. Do not modify.
//  source: client-message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use forceUpdateFirmwareDeviceClientRequestDescriptor instead')
const ForceUpdateFirmwareDeviceClientRequest$json = const {
  '1': 'ForceUpdateFirmwareDeviceClientRequest',
  '2': const [
    const {'1': 'hardwareId', '3': 1, '4': 1, '5': 9, '10': 'hardwareId'},
  ],
};

/// Descriptor for `ForceUpdateFirmwareDeviceClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forceUpdateFirmwareDeviceClientRequestDescriptor = $convert.base64Decode('CiZGb3JjZVVwZGF0ZUZpcm13YXJlRGV2aWNlQ2xpZW50UmVxdWVzdBIeCgpoYXJkd2FyZUlkGAEgASgJUgpoYXJkd2FyZUlk');
@$core.Deprecated('Use forceUpdateFirmwareDeviceClientResponseDescriptor instead')
const ForceUpdateFirmwareDeviceClientResponse$json = const {
  '1': 'ForceUpdateFirmwareDeviceClientResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `ForceUpdateFirmwareDeviceClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forceUpdateFirmwareDeviceClientResponseDescriptor = $convert.base64Decode('CidGb3JjZVVwZGF0ZUZpcm13YXJlRGV2aWNlQ2xpZW50UmVzcG9uc2USGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use updateDeviceClientRequestDescriptor instead')
const UpdateDeviceClientRequest$json = const {
  '1': 'UpdateDeviceClientRequest',
  '2': const [
    const {'1': 'updateMode', '3': 1, '4': 1, '5': 13, '10': 'updateMode'},
    const {'1': 'hardwareId', '3': 2, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'reactivity', '3': 3, '4': 1, '5': 13, '10': 'reactivity'},
    const {'1': 'brightness', '3': 4, '4': 1, '5': 13, '10': 'brightness'},
    const {'1': 'timeDelay', '3': 5, '4': 1, '5': 13, '10': 'timeDelay'},
    const {'1': 'sceneActiveMap', '3': 6, '4': 1, '5': 13, '10': 'sceneActiveMap'},
  ],
};

/// Descriptor for `UpdateDeviceClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDeviceClientRequestDescriptor = $convert.base64Decode('ChlVcGRhdGVEZXZpY2VDbGllbnRSZXF1ZXN0Eh4KCnVwZGF0ZU1vZGUYASABKA1SCnVwZGF0ZU1vZGUSHgoKaGFyZHdhcmVJZBgCIAEoCVIKaGFyZHdhcmVJZBIeCgpyZWFjdGl2aXR5GAMgASgNUgpyZWFjdGl2aXR5Eh4KCmJyaWdodG5lc3MYBCABKA1SCmJyaWdodG5lc3MSHAoJdGltZURlbGF5GAUgASgNUgl0aW1lRGVsYXkSJgoOc2NlbmVBY3RpdmVNYXAYBiABKA1SDnNjZW5lQWN0aXZlTWFw');
@$core.Deprecated('Use updateDeviceClientResponseDescriptor instead')
const UpdateDeviceClientResponse$json = const {
  '1': 'UpdateDeviceClientResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateDeviceClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDeviceClientResponseDescriptor = $convert.base64Decode('ChpVcGRhdGVEZXZpY2VDbGllbnRSZXNwb25zZRIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use updateWSEndpointClientRequestDescriptor instead')
const UpdateWSEndpointClientRequest$json = const {
  '1': 'UpdateWSEndpointClientRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'wsEnpoint', '3': 2, '4': 1, '5': 9, '10': 'wsEnpoint'},
  ],
};

/// Descriptor for `UpdateWSEndpointClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateWSEndpointClientRequestDescriptor = $convert.base64Decode('Ch1VcGRhdGVXU0VuZHBvaW50Q2xpZW50UmVxdWVzdBIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSHAoJd3NFbnBvaW50GAIgASgJUgl3c0VucG9pbnQ=');
@$core.Deprecated('Use updateWSEndpointClientResponseDescriptor instead')
const UpdateWSEndpointClientResponse$json = const {
  '1': 'UpdateWSEndpointClientResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateWSEndpointClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateWSEndpointClientResponseDescriptor = $convert.base64Decode('Ch5VcGRhdGVXU0VuZHBvaW50Q2xpZW50UmVzcG9uc2USLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use deleteDeviceClientRequestDescriptor instead')
const DeleteDeviceClientRequest$json = const {
  '1': 'DeleteDeviceClientRequest',
  '2': const [
    const {'1': 'hardwareId', '3': 1, '4': 1, '5': 9, '10': 'hardwareId'},
  ],
};

/// Descriptor for `DeleteDeviceClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteDeviceClientRequestDescriptor = $convert.base64Decode('ChlEZWxldGVEZXZpY2VDbGllbnRSZXF1ZXN0Eh4KCmhhcmR3YXJlSWQYASABKAlSCmhhcmR3YXJlSWQ=');
@$core.Deprecated('Use deleteDeviceClientResponseDescriptor instead')
const DeleteDeviceClientResponse$json = const {
  '1': 'DeleteDeviceClientResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `DeleteDeviceClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteDeviceClientResponseDescriptor = $convert.base64Decode('ChpEZWxldGVEZXZpY2VDbGllbnRSZXNwb25zZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use getSwitchersClientRequestDescriptor instead')
const GetSwitchersClientRequest$json = const {
  '1': 'GetSwitchersClientRequest',
  '2': const [
    const {'1': 'hardwareId', '3': 1, '4': 1, '5': 9, '10': 'hardwareId'},
  ],
};

/// Descriptor for `GetSwitchersClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSwitchersClientRequestDescriptor = $convert.base64Decode('ChlHZXRTd2l0Y2hlcnNDbGllbnRSZXF1ZXN0Eh4KCmhhcmR3YXJlSWQYASABKAlSCmhhcmR3YXJlSWQ=');
@$core.Deprecated('Use getSwitchersClientResponseDescriptor instead')
const GetSwitchersClientResponse$json = const {
  '1': 'GetSwitchersClientResponse',
  '2': const [
    const {'1': 'switchers', '3': 1, '4': 1, '5': 11, '6': '.Switcher', '10': 'switchers'},
    const {'1': 'deviceId', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetSwitchersClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSwitchersClientResponseDescriptor = $convert.base64Decode('ChpHZXRTd2l0Y2hlcnNDbGllbnRSZXNwb25zZRInCglzd2l0Y2hlcnMYASABKAsyCS5Td2l0Y2hlclIJc3dpdGNoZXJzEhoKCGRldmljZUlkGAIgASgJUghkZXZpY2VJZBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use getSwitcherClientRequestDescriptor instead')
const GetSwitcherClientRequest$json = const {
  '1': 'GetSwitcherClientRequest',
  '2': const [
    const {'1': 'switcher', '3': 1, '4': 1, '5': 13, '10': 'switcher'},
    const {'1': 'hardwareId', '3': 2, '4': 1, '5': 9, '10': 'hardwareId'},
  ],
};

/// Descriptor for `GetSwitcherClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSwitcherClientRequestDescriptor = $convert.base64Decode('ChhHZXRTd2l0Y2hlckNsaWVudFJlcXVlc3QSGgoIc3dpdGNoZXIYASABKA1SCHN3aXRjaGVyEh4KCmhhcmR3YXJlSWQYAiABKAlSCmhhcmR3YXJlSWQ=');
@$core.Deprecated('Use getSwitcherClientResponseDescriptor instead')
const GetSwitcherClientResponse$json = const {
  '1': 'GetSwitcherClientResponse',
  '2': const [
    const {'1': 'switcher', '3': 1, '4': 1, '5': 13, '10': 'switcher'},
    const {'1': 'powerState', '3': 2, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'device', '3': 3, '4': 1, '5': 11, '6': '.Device', '10': 'device'},
    const {'1': 'datetime', '3': 4, '4': 1, '5': 11, '6': '.DateTime', '10': 'datetime'},
    const {'1': 'deviceId', '3': 5, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetSwitcherClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSwitcherClientResponseDescriptor = $convert.base64Decode('ChlHZXRTd2l0Y2hlckNsaWVudFJlc3BvbnNlEhoKCHN3aXRjaGVyGAEgASgNUghzd2l0Y2hlchIrCgpwb3dlclN0YXRlGAIgASgOMgsuUG93ZXJTdGF0ZVIKcG93ZXJTdGF0ZRIfCgZkZXZpY2UYAyABKAsyBy5EZXZpY2VSBmRldmljZRIlCghkYXRldGltZRgEIAEoCzIJLkRhdGVUaW1lUghkYXRldGltZRIaCghkZXZpY2VJZBgFIAEoCVIIZGV2aWNlSWQSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use getLogSwitcherClientRequestDescriptor instead')
const GetLogSwitcherClientRequest$json = const {
  '1': 'GetLogSwitcherClientRequest',
  '2': const [
    const {'1': 'switcher', '3': 1, '4': 1, '5': 13, '10': 'switcher'},
    const {'1': 'hardwareId', '3': 2, '4': 1, '5': 9, '10': 'hardwareId'},
  ],
};

/// Descriptor for `GetLogSwitcherClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLogSwitcherClientRequestDescriptor = $convert.base64Decode('ChtHZXRMb2dTd2l0Y2hlckNsaWVudFJlcXVlc3QSGgoIc3dpdGNoZXIYASABKA1SCHN3aXRjaGVyEh4KCmhhcmR3YXJlSWQYAiABKAlSCmhhcmR3YXJlSWQ=');
@$core.Deprecated('Use getLogSwitcherClientResponseDescriptor instead')
const GetLogSwitcherClientResponse$json = const {
  '1': 'GetLogSwitcherClientResponse',
  '2': const [
    const {'1': 'switcher', '3': 1, '4': 1, '5': 13, '10': 'switcher'},
    const {'1': 'totalTimeOnOrgin', '3': 2, '4': 1, '5': 13, '10': 'totalTimeOnOrgin'},
    const {'1': 'totalTimeOnYear', '3': 3, '4': 1, '5': 13, '10': 'totalTimeOnYear'},
    const {'1': 'totalTimeOnMonth', '3': 4, '4': 1, '5': 13, '10': 'totalTimeOnMonth'},
    const {'1': 'timeOnLastDate', '3': 5, '4': 1, '5': 13, '10': 'timeOnLastDate'},
    const {'1': 'timeOffLastDate', '3': 6, '4': 1, '5': 13, '10': 'timeOffLastDate'},
    const {'1': 'deviceId', '3': 7, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetLogSwitcherClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLogSwitcherClientResponseDescriptor = $convert.base64Decode('ChxHZXRMb2dTd2l0Y2hlckNsaWVudFJlc3BvbnNlEhoKCHN3aXRjaGVyGAEgASgNUghzd2l0Y2hlchIqChB0b3RhbFRpbWVPbk9yZ2luGAIgASgNUhB0b3RhbFRpbWVPbk9yZ2luEigKD3RvdGFsVGltZU9uWWVhchgDIAEoDVIPdG90YWxUaW1lT25ZZWFyEioKEHRvdGFsVGltZU9uTW9udGgYBCABKA1SEHRvdGFsVGltZU9uTW9udGgSJgoOdGltZU9uTGFzdERhdGUYBSABKA1SDnRpbWVPbkxhc3REYXRlEigKD3RpbWVPZmZMYXN0RGF0ZRgGIAEoDVIPdGltZU9mZkxhc3REYXRlEhoKCGRldmljZUlkGAcgASgJUghkZXZpY2VJZBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use switcherClientRequestDescriptor instead')
const SwitcherClientRequest$json = const {
  '1': 'SwitcherClientRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'switcher', '3': 2, '4': 1, '5': 13, '10': 'switcher'},
    const {'1': 'powerState', '3': 3, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'hardwareId', '3': 4, '4': 1, '5': 9, '10': 'hardwareId'},
  ],
};

/// Descriptor for `SwitcherClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List switcherClientRequestDescriptor = $convert.base64Decode('ChVTd2l0Y2hlckNsaWVudFJlcXVlc3QSGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEhoKCHN3aXRjaGVyGAIgASgNUghzd2l0Y2hlchIrCgpwb3dlclN0YXRlGAMgASgOMgsuUG93ZXJTdGF0ZVIKcG93ZXJTdGF0ZRIeCgpoYXJkd2FyZUlkGAQgASgJUgpoYXJkd2FyZUlk');
@$core.Deprecated('Use switcherClientResponseDescriptor instead')
const SwitcherClientResponse$json = const {
  '1': 'SwitcherClientResponse',
  '2': const [
    const {'1': 'switcher', '3': 1, '4': 1, '5': 13, '10': 'switcher'},
    const {'1': 'powerState', '3': 2, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'deviceId', '3': 3, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SwitcherClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List switcherClientResponseDescriptor = $convert.base64Decode('ChZTd2l0Y2hlckNsaWVudFJlc3BvbnNlEhoKCHN3aXRjaGVyGAEgASgNUghzd2l0Y2hlchIrCgpwb3dlclN0YXRlGAIgASgOMgsuUG93ZXJTdGF0ZVIKcG93ZXJTdGF0ZRIaCghkZXZpY2VJZBgDIAEoCVIIZGV2aWNlSWQSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use addSwitcherScheduleClientRequestDescriptor instead')
const AddSwitcherScheduleClientRequest$json = const {
  '1': 'AddSwitcherScheduleClientRequest',
  '2': const [
    const {'1': 'schedule', '3': 1, '4': 1, '5': 11, '6': '.SwitcherSchedule', '10': 'schedule'},
    const {'1': 'hardwareId', '3': 2, '4': 1, '5': 9, '10': 'hardwareId'},
  ],
};

/// Descriptor for `AddSwitcherScheduleClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addSwitcherScheduleClientRequestDescriptor = $convert.base64Decode('CiBBZGRTd2l0Y2hlclNjaGVkdWxlQ2xpZW50UmVxdWVzdBItCghzY2hlZHVsZRgBIAEoCzIRLlN3aXRjaGVyU2NoZWR1bGVSCHNjaGVkdWxlEh4KCmhhcmR3YXJlSWQYAiABKAlSCmhhcmR3YXJlSWQ=');
@$core.Deprecated('Use addSwitcherScheduleClientResponseDescriptor instead')
const AddSwitcherScheduleClientResponse$json = const {
  '1': 'AddSwitcherScheduleClientResponse',
  '2': const [
    const {'1': 'switcherScheduleId', '3': 1, '4': 1, '5': 9, '10': 'switcherScheduleId'},
    const {'1': 'deviceId', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `AddSwitcherScheduleClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addSwitcherScheduleClientResponseDescriptor = $convert.base64Decode('CiFBZGRTd2l0Y2hlclNjaGVkdWxlQ2xpZW50UmVzcG9uc2USLgoSc3dpdGNoZXJTY2hlZHVsZUlkGAEgASgJUhJzd2l0Y2hlclNjaGVkdWxlSWQSGgoIZGV2aWNlSWQYAiABKAlSCGRldmljZUlkEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use updateSwitcherScheduleClientRequestDescriptor instead')
const UpdateSwitcherScheduleClientRequest$json = const {
  '1': 'UpdateSwitcherScheduleClientRequest',
  '2': const [
    const {'1': 'schedule', '3': 1, '4': 1, '5': 11, '6': '.SwitcherSchedule', '10': 'schedule'},
    const {'1': 'hardwareId', '3': 2, '4': 1, '5': 9, '10': 'hardwareId'},
  ],
};

/// Descriptor for `UpdateSwitcherScheduleClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSwitcherScheduleClientRequestDescriptor = $convert.base64Decode('CiNVcGRhdGVTd2l0Y2hlclNjaGVkdWxlQ2xpZW50UmVxdWVzdBItCghzY2hlZHVsZRgBIAEoCzIRLlN3aXRjaGVyU2NoZWR1bGVSCHNjaGVkdWxlEh4KCmhhcmR3YXJlSWQYAiABKAlSCmhhcmR3YXJlSWQ=');
@$core.Deprecated('Use updateSwitcherScheduleClientResponseDescriptor instead')
const UpdateSwitcherScheduleClientResponse$json = const {
  '1': 'UpdateSwitcherScheduleClientResponse',
  '2': const [
    const {'1': 'switcherScheduleId', '3': 1, '4': 1, '5': 9, '10': 'switcherScheduleId'},
    const {'1': 'deviceId', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateSwitcherScheduleClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSwitcherScheduleClientResponseDescriptor = $convert.base64Decode('CiRVcGRhdGVTd2l0Y2hlclNjaGVkdWxlQ2xpZW50UmVzcG9uc2USLgoSc3dpdGNoZXJTY2hlZHVsZUlkGAEgASgJUhJzd2l0Y2hlclNjaGVkdWxlSWQSGgoIZGV2aWNlSWQYAiABKAlSCGRldmljZUlkEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use deleteSwitcherScheduleClientRequestDescriptor instead')
const DeleteSwitcherScheduleClientRequest$json = const {
  '1': 'DeleteSwitcherScheduleClientRequest',
  '2': const [
    const {'1': 'switcherScheduleId', '3': 1, '4': 1, '5': 9, '10': 'switcherScheduleId'},
    const {'1': 'hardwareId', '3': 2, '4': 1, '5': 9, '10': 'hardwareId'},
  ],
};

/// Descriptor for `DeleteSwitcherScheduleClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSwitcherScheduleClientRequestDescriptor = $convert.base64Decode('CiNEZWxldGVTd2l0Y2hlclNjaGVkdWxlQ2xpZW50UmVxdWVzdBIuChJzd2l0Y2hlclNjaGVkdWxlSWQYASABKAlSEnN3aXRjaGVyU2NoZWR1bGVJZBIeCgpoYXJkd2FyZUlkGAIgASgJUgpoYXJkd2FyZUlk');
@$core.Deprecated('Use deleteSwitcherScheduleClientResponseDescriptor instead')
const DeleteSwitcherScheduleClientResponse$json = const {
  '1': 'DeleteSwitcherScheduleClientResponse',
  '2': const [
    const {'1': 'switcherScheduleId', '3': 1, '4': 1, '5': 9, '10': 'switcherScheduleId'},
    const {'1': 'deviceId', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `DeleteSwitcherScheduleClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSwitcherScheduleClientResponseDescriptor = $convert.base64Decode('CiREZWxldGVTd2l0Y2hlclNjaGVkdWxlQ2xpZW50UmVzcG9uc2USLgoSc3dpdGNoZXJTY2hlZHVsZUlkGAEgASgJUhJzd2l0Y2hlclNjaGVkdWxlSWQSGgoIZGV2aWNlSWQYAiABKAlSCGRldmljZUlkEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use updateSwitcherClientRequestDescriptor instead')
const UpdateSwitcherClientRequest$json = const {
  '1': 'UpdateSwitcherClientRequest',
  '2': const [
    const {'1': 'switcher', '3': 1, '4': 1, '5': 13, '10': 'switcher'},
    const {'1': 'keepState', '3': 2, '4': 1, '5': 13, '10': 'keepState'},
    const {'1': 'hardwareId', '3': 3, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'autoOff', '3': 4, '4': 1, '5': 13, '10': 'autoOff'},
  ],
};

/// Descriptor for `UpdateSwitcherClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSwitcherClientRequestDescriptor = $convert.base64Decode('ChtVcGRhdGVTd2l0Y2hlckNsaWVudFJlcXVlc3QSGgoIc3dpdGNoZXIYASABKA1SCHN3aXRjaGVyEhwKCWtlZXBTdGF0ZRgCIAEoDVIJa2VlcFN0YXRlEh4KCmhhcmR3YXJlSWQYAyABKAlSCmhhcmR3YXJlSWQSGAoHYXV0b09mZhgEIAEoDVIHYXV0b09mZg==');
@$core.Deprecated('Use updateSwitcherClientResponseDescriptor instead')
const UpdateSwitcherClientResponse$json = const {
  '1': 'UpdateSwitcherClientResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'switcher', '3': 2, '4': 1, '5': 13, '10': 'switcher'},
    const {'1': 'keepState', '3': 3, '4': 1, '5': 13, '10': 'keepState'},
    const {'1': 'autoOff', '3': 4, '4': 1, '5': 13, '10': 'autoOff'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateSwitcherClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSwitcherClientResponseDescriptor = $convert.base64Decode('ChxVcGRhdGVTd2l0Y2hlckNsaWVudFJlc3BvbnNlEhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZBIaCghzd2l0Y2hlchgCIAEoDVIIc3dpdGNoZXISHAoJa2VlcFN0YXRlGAMgASgNUglrZWVwU3RhdGUSGAoHYXV0b09mZhgEIAEoDVIHYXV0b09mZhIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use updateSwitcherStateDescriptor instead')
const UpdateSwitcherState$json = const {
  '1': 'UpdateSwitcherState',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'switcher', '3': 2, '4': 1, '5': 13, '10': 'switcher'},
    const {'1': 'keepState', '3': 3, '4': 1, '5': 13, '10': 'keepState'},
    const {'1': 'autoOff', '3': 4, '4': 1, '5': 13, '10': 'autoOff'},
    const {'1': 'powerState', '3': 5, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
  ],
};

/// Descriptor for `UpdateSwitcherState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSwitcherStateDescriptor = $convert.base64Decode('ChNVcGRhdGVTd2l0Y2hlclN0YXRlEhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZBIaCghzd2l0Y2hlchgCIAEoDVIIc3dpdGNoZXISHAoJa2VlcFN0YXRlGAMgASgNUglrZWVwU3RhdGUSGAoHYXV0b09mZhgEIAEoDVIHYXV0b09mZhIrCgpwb3dlclN0YXRlGAUgASgOMgsuUG93ZXJTdGF0ZVIKcG93ZXJTdGF0ZQ==');
@$core.Deprecated('Use curtainSwitcherClientRequestDescriptor instead')
const CurtainSwitcherClientRequest$json = const {
  '1': 'CurtainSwitcherClientRequest',
  '2': const [
    const {'1': 'percentIn', '3': 1, '4': 1, '5': 13, '10': 'percentIn'},
    const {'1': 'percentOut', '3': 2, '4': 1, '5': 13, '10': 'percentOut'},
    const {'1': 'hardwareId', '3': 3, '4': 1, '5': 9, '10': 'hardwareId'},
  ],
};

/// Descriptor for `CurtainSwitcherClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List curtainSwitcherClientRequestDescriptor = $convert.base64Decode('ChxDdXJ0YWluU3dpdGNoZXJDbGllbnRSZXF1ZXN0EhwKCXBlcmNlbnRJbhgBIAEoDVIJcGVyY2VudEluEh4KCnBlcmNlbnRPdXQYAiABKA1SCnBlcmNlbnRPdXQSHgoKaGFyZHdhcmVJZBgDIAEoCVIKaGFyZHdhcmVJZA==');
@$core.Deprecated('Use curtainSwitcherClientResponseDescriptor instead')
const CurtainSwitcherClientResponse$json = const {
  '1': 'CurtainSwitcherClientResponse',
  '2': const [
    const {'1': 'percentIn', '3': 1, '4': 1, '5': 13, '10': 'percentIn'},
    const {'1': 'percentOut', '3': 2, '4': 1, '5': 13, '10': 'percentOut'},
    const {'1': 'deviceId', '3': 3, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `CurtainSwitcherClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List curtainSwitcherClientResponseDescriptor = $convert.base64Decode('Ch1DdXJ0YWluU3dpdGNoZXJDbGllbnRSZXNwb25zZRIcCglwZXJjZW50SW4YASABKA1SCXBlcmNlbnRJbhIeCgpwZXJjZW50T3V0GAIgASgNUgpwZXJjZW50T3V0EhoKCGRldmljZUlkGAMgASgJUghkZXZpY2VJZBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use addCurtainSwitcherScheduleClientRequestDescriptor instead')
const AddCurtainSwitcherScheduleClientRequest$json = const {
  '1': 'AddCurtainSwitcherScheduleClientRequest',
  '2': const [
    const {'1': 'schedule', '3': 1, '4': 1, '5': 11, '6': '.CurtainSwitcherSchedule', '10': 'schedule'},
    const {'1': 'hardwareId', '3': 2, '4': 1, '5': 9, '10': 'hardwareId'},
  ],
};

/// Descriptor for `AddCurtainSwitcherScheduleClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addCurtainSwitcherScheduleClientRequestDescriptor = $convert.base64Decode('CidBZGRDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlcXVlc3QSNAoIc2NoZWR1bGUYASABKAsyGC5DdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVIIc2NoZWR1bGUSHgoKaGFyZHdhcmVJZBgCIAEoCVIKaGFyZHdhcmVJZA==');
@$core.Deprecated('Use addCurtainSwitcherScheduleClientResponseDescriptor instead')
const AddCurtainSwitcherScheduleClientResponse$json = const {
  '1': 'AddCurtainSwitcherScheduleClientResponse',
  '2': const [
    const {'1': 'curtainSwitcherScheduleId', '3': 1, '4': 1, '5': 9, '10': 'curtainSwitcherScheduleId'},
    const {'1': 'deviceId', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `AddCurtainSwitcherScheduleClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addCurtainSwitcherScheduleClientResponseDescriptor = $convert.base64Decode('CihBZGRDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlc3BvbnNlEjwKGWN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlSWQYASABKAlSGWN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlSWQSGgoIZGV2aWNlSWQYAiABKAlSCGRldmljZUlkEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use updateCurtainSwitcherScheduleClientRequestDescriptor instead')
const UpdateCurtainSwitcherScheduleClientRequest$json = const {
  '1': 'UpdateCurtainSwitcherScheduleClientRequest',
  '2': const [
    const {'1': 'schedule', '3': 1, '4': 1, '5': 11, '6': '.CurtainSwitcherSchedule', '10': 'schedule'},
    const {'1': 'hardwareId', '3': 2, '4': 1, '5': 9, '10': 'hardwareId'},
  ],
};

/// Descriptor for `UpdateCurtainSwitcherScheduleClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateCurtainSwitcherScheduleClientRequestDescriptor = $convert.base64Decode('CipVcGRhdGVDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlcXVlc3QSNAoIc2NoZWR1bGUYASABKAsyGC5DdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVIIc2NoZWR1bGUSHgoKaGFyZHdhcmVJZBgCIAEoCVIKaGFyZHdhcmVJZA==');
@$core.Deprecated('Use updateCurtainSwitcherScheduleClientResponseDescriptor instead')
const UpdateCurtainSwitcherScheduleClientResponse$json = const {
  '1': 'UpdateCurtainSwitcherScheduleClientResponse',
  '2': const [
    const {'1': 'curtainSwitcherScheduleId', '3': 1, '4': 1, '5': 9, '10': 'curtainSwitcherScheduleId'},
    const {'1': 'deviceId', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateCurtainSwitcherScheduleClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateCurtainSwitcherScheduleClientResponseDescriptor = $convert.base64Decode('CitVcGRhdGVDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlc3BvbnNlEjwKGWN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlSWQYASABKAlSGWN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlSWQSGgoIZGV2aWNlSWQYAiABKAlSCGRldmljZUlkEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use deleteCurtainSwitcherScheduleClientRequestDescriptor instead')
const DeleteCurtainSwitcherScheduleClientRequest$json = const {
  '1': 'DeleteCurtainSwitcherScheduleClientRequest',
  '2': const [
    const {'1': 'curtainSwitcherScheduleId', '3': 1, '4': 1, '5': 9, '10': 'curtainSwitcherScheduleId'},
    const {'1': 'hardwareId', '3': 2, '4': 1, '5': 9, '10': 'hardwareId'},
  ],
};

/// Descriptor for `DeleteCurtainSwitcherScheduleClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCurtainSwitcherScheduleClientRequestDescriptor = $convert.base64Decode('CipEZWxldGVDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlcXVlc3QSPAoZY3VydGFpblN3aXRjaGVyU2NoZWR1bGVJZBgBIAEoCVIZY3VydGFpblN3aXRjaGVyU2NoZWR1bGVJZBIeCgpoYXJkd2FyZUlkGAIgASgJUgpoYXJkd2FyZUlk');
@$core.Deprecated('Use deleteCurtainSwitcherScheduleClientResponseDescriptor instead')
const DeleteCurtainSwitcherScheduleClientResponse$json = const {
  '1': 'DeleteCurtainSwitcherScheduleClientResponse',
  '2': const [
    const {'1': 'curtainSwitcherScheduleId', '3': 1, '4': 1, '5': 9, '10': 'curtainSwitcherScheduleId'},
    const {'1': 'deviceId', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `DeleteCurtainSwitcherScheduleClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCurtainSwitcherScheduleClientResponseDescriptor = $convert.base64Decode('CitEZWxldGVDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlc3BvbnNlEjwKGWN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlSWQYASABKAlSGWN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlSWQSGgoIZGV2aWNlSWQYAiABKAlSCGRldmljZUlkEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use airConditionerClientRequestDescriptor instead')
const AirConditionerClientRequest$json = const {
  '1': 'AirConditionerClientRequest',
  '2': const [
    const {'1': 'state', '3': 1, '4': 1, '5': 11, '6': '.AirConditionerState', '10': 'state'},
    const {'1': 'hardwareId', '3': 2, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'encode', '3': 3, '4': 1, '5': 9, '10': 'encode'},
  ],
};

/// Descriptor for `AirConditionerClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List airConditionerClientRequestDescriptor = $convert.base64Decode('ChtBaXJDb25kaXRpb25lckNsaWVudFJlcXVlc3QSKgoFc3RhdGUYASABKAsyFC5BaXJDb25kaXRpb25lclN0YXRlUgVzdGF0ZRIeCgpoYXJkd2FyZUlkGAIgASgJUgpoYXJkd2FyZUlkEhYKBmVuY29kZRgDIAEoCVIGZW5jb2Rl');
@$core.Deprecated('Use airConditionerClientResponseDescriptor instead')
const AirConditionerClientResponse$json = const {
  '1': 'AirConditionerClientResponse',
  '2': const [
    const {'1': 'state', '3': 1, '4': 1, '5': 11, '6': '.AirConditionerState', '10': 'state'},
    const {'1': 'deviceId', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `AirConditionerClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List airConditionerClientResponseDescriptor = $convert.base64Decode('ChxBaXJDb25kaXRpb25lckNsaWVudFJlc3BvbnNlEioKBXN0YXRlGAEgASgLMhQuQWlyQ29uZGl0aW9uZXJTdGF0ZVIFc3RhdGUSGgoIZGV2aWNlSWQYAiABKAlSCGRldmljZUlkEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getAirConditionerClientRequestDescriptor instead')
const GetAirConditionerClientRequest$json = const {
  '1': 'GetAirConditionerClientRequest',
  '2': const [
    const {'1': 'hardwareId', '3': 1, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'indoorId', '3': 2, '4': 1, '5': 13, '10': 'indoorId'},
  ],
};

/// Descriptor for `GetAirConditionerClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAirConditionerClientRequestDescriptor = $convert.base64Decode('Ch5HZXRBaXJDb25kaXRpb25lckNsaWVudFJlcXVlc3QSHgoKaGFyZHdhcmVJZBgBIAEoCVIKaGFyZHdhcmVJZBIaCghpbmRvb3JJZBgCIAEoDVIIaW5kb29ySWQ=');
@$core.Deprecated('Use getAirConditionerClientResponseDescriptor instead')
const GetAirConditionerClientResponse$json = const {
  '1': 'GetAirConditionerClientResponse',
  '2': const [
    const {'1': 'state', '3': 1, '4': 1, '5': 11, '6': '.AirConditionerState', '10': 'state'},
    const {'1': 'deviceId', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetAirConditionerClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAirConditionerClientResponseDescriptor = $convert.base64Decode('Ch9HZXRBaXJDb25kaXRpb25lckNsaWVudFJlc3BvbnNlEioKBXN0YXRlGAEgASgLMhQuQWlyQ29uZGl0aW9uZXJTdGF0ZVIFc3RhdGUSGgoIZGV2aWNlSWQYAiABKAlSCGRldmljZUlkEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use airConditionerAddIndoorsRequestDescriptor instead')
const AirConditionerAddIndoorsRequest$json = const {
  '1': 'AirConditionerAddIndoorsRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'indoorId', '3': 2, '4': 3, '5': 13, '10': 'indoorId'},
  ],
};

/// Descriptor for `AirConditionerAddIndoorsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List airConditionerAddIndoorsRequestDescriptor = $convert.base64Decode('Ch9BaXJDb25kaXRpb25lckFkZEluZG9vcnNSZXF1ZXN0EhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZBIaCghpbmRvb3JJZBgCIAMoDVIIaW5kb29ySWQ=');
@$core.Deprecated('Use airConditionerAddIndoorsResponseDescriptor instead')
const AirConditionerAddIndoorsResponse$json = const {
  '1': 'AirConditionerAddIndoorsResponse',
  '2': const [
    const {'1': 'hardwareId', '3': 1, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'indoorId', '3': 2, '4': 3, '5': 13, '10': 'indoorId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `AirConditionerAddIndoorsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List airConditionerAddIndoorsResponseDescriptor = $convert.base64Decode('CiBBaXJDb25kaXRpb25lckFkZEluZG9vcnNSZXNwb25zZRIeCgpoYXJkd2FyZUlkGAEgASgJUgpoYXJkd2FyZUlkEhoKCGluZG9vcklkGAIgAygNUghpbmRvb3JJZBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use airConditionerRemoveIndoorRequestDescriptor instead')
const AirConditionerRemoveIndoorRequest$json = const {
  '1': 'AirConditionerRemoveIndoorRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'indoorId', '3': 2, '4': 1, '5': 13, '10': 'indoorId'},
  ],
};

/// Descriptor for `AirConditionerRemoveIndoorRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List airConditionerRemoveIndoorRequestDescriptor = $convert.base64Decode('CiFBaXJDb25kaXRpb25lclJlbW92ZUluZG9vclJlcXVlc3QSGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEhoKCGluZG9vcklkGAIgASgNUghpbmRvb3JJZA==');
@$core.Deprecated('Use airConditionerRemoveIndoorResponseDescriptor instead')
const AirConditionerRemoveIndoorResponse$json = const {
  '1': 'AirConditionerRemoveIndoorResponse',
  '2': const [
    const {'1': 'hardwareId', '3': 1, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `AirConditionerRemoveIndoorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List airConditionerRemoveIndoorResponseDescriptor = $convert.base64Decode('CiJBaXJDb25kaXRpb25lclJlbW92ZUluZG9vclJlc3BvbnNlEh4KCmhhcmR3YXJlSWQYASABKAlSCmhhcmR3YXJlSWQSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use sendCommandRemoteClientRequestDescriptor instead')
const SendCommandRemoteClientRequest$json = const {
  '1': 'SendCommandRemoteClientRequest',
  '2': const [
    const {
      '1': 'commands',
      '3': 1,
      '4': 3,
      '5': 13,
      '8': const {'2': true},
      '10': 'commands',
    },
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.TypeLearn', '10': 'type'},
    const {'1': 'hardwareId', '3': 3, '4': 1, '5': 9, '10': 'hardwareId'},
  ],
};

/// Descriptor for `SendCommandRemoteClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendCommandRemoteClientRequestDescriptor = $convert.base64Decode('Ch5TZW5kQ29tbWFuZFJlbW90ZUNsaWVudFJlcXVlc3QSHgoIY29tbWFuZHMYASADKA1CAhABUghjb21tYW5kcxIeCgR0eXBlGAIgASgOMgouVHlwZUxlYXJuUgR0eXBlEh4KCmhhcmR3YXJlSWQYAyABKAlSCmhhcmR3YXJlSWQ=');
@$core.Deprecated('Use sendCommandRemoteClientResponseDescriptor instead')
const SendCommandRemoteClientResponse$json = const {
  '1': 'SendCommandRemoteClientResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SendCommandRemoteClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendCommandRemoteClientResponseDescriptor = $convert.base64Decode('Ch9TZW5kQ29tbWFuZFJlbW90ZUNsaWVudFJlc3BvbnNlEhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use learnCommandRemoteClientRequestDescriptor instead')
const LearnCommandRemoteClientRequest$json = const {
  '1': 'LearnCommandRemoteClientRequest',
  '2': const [
    const {'1': 'remoteId', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'remoteLibraryCmdId', '3': 2, '4': 1, '5': 9, '10': 'remoteLibraryCmdId'},
    const {'1': 'remoteMutilLibraryCmdId', '3': 3, '4': 1, '5': 9, '10': 'remoteMutilLibraryCmdId'},
    const {'1': 'timeout', '3': 4, '4': 1, '5': 13, '10': 'timeout'},
    const {'1': 'type', '3': 5, '4': 1, '5': 14, '6': '.TypeLearn', '10': 'type'},
    const {'1': 'hardwareId', '3': 6, '4': 1, '5': 9, '10': 'hardwareId'},
  ],
};

/// Descriptor for `LearnCommandRemoteClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List learnCommandRemoteClientRequestDescriptor = $convert.base64Decode('Ch9MZWFybkNvbW1hbmRSZW1vdGVDbGllbnRSZXF1ZXN0EhoKCHJlbW90ZUlkGAEgASgJUghyZW1vdGVJZBIuChJyZW1vdGVMaWJyYXJ5Q21kSWQYAiABKAlSEnJlbW90ZUxpYnJhcnlDbWRJZBI4ChdyZW1vdGVNdXRpbExpYnJhcnlDbWRJZBgDIAEoCVIXcmVtb3RlTXV0aWxMaWJyYXJ5Q21kSWQSGAoHdGltZW91dBgEIAEoDVIHdGltZW91dBIeCgR0eXBlGAUgASgOMgouVHlwZUxlYXJuUgR0eXBlEh4KCmhhcmR3YXJlSWQYBiABKAlSCmhhcmR3YXJlSWQ=');
@$core.Deprecated('Use learnCommandRemoteClientResponseDescriptor instead')
const LearnCommandRemoteClientResponse$json = const {
  '1': 'LearnCommandRemoteClientResponse',
  '2': const [
    const {'1': 'remoteId', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'remoteLibraryCmdId', '3': 2, '4': 1, '5': 9, '10': 'remoteLibraryCmdId'},
    const {'1': 'remoteMutilLibraryCmdId', '3': 3, '4': 1, '5': 9, '10': 'remoteMutilLibraryCmdId'},
    const {
      '1': 'commands',
      '3': 4,
      '4': 3,
      '5': 13,
      '8': const {'2': true},
      '10': 'commands',
    },
    const {'1': 'type', '3': 5, '4': 1, '5': 14, '6': '.TypeLearn', '10': 'type'},
    const {'1': 'deviceId', '3': 6, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `LearnCommandRemoteClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List learnCommandRemoteClientResponseDescriptor = $convert.base64Decode('CiBMZWFybkNvbW1hbmRSZW1vdGVDbGllbnRSZXNwb25zZRIaCghyZW1vdGVJZBgBIAEoCVIIcmVtb3RlSWQSLgoScmVtb3RlTGlicmFyeUNtZElkGAIgASgJUhJyZW1vdGVMaWJyYXJ5Q21kSWQSOAoXcmVtb3RlTXV0aWxMaWJyYXJ5Q21kSWQYAyABKAlSF3JlbW90ZU11dGlsTGlicmFyeUNtZElkEh4KCGNvbW1hbmRzGAQgAygNQgIQAVIIY29tbWFuZHMSHgoEdHlwZRgFIAEoDjIKLlR5cGVMZWFyblIEdHlwZRIaCghkZXZpY2VJZBgGIAEoCVIIZGV2aWNlSWQSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use controlRemoteACCommandClientRequestDescriptor instead')
const ControlRemoteACCommandClientRequest$json = const {
  '1': 'ControlRemoteACCommandClientRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'model', '3': 2, '4': 1, '5': 9, '10': 'model'},
    const {'1': 'remoteACState', '3': 3, '4': 1, '5': 11, '6': '.RemoteACState', '10': 'remoteACState'},
  ],
};

/// Descriptor for `ControlRemoteACCommandClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List controlRemoteACCommandClientRequestDescriptor = $convert.base64Decode('CiNDb250cm9sUmVtb3RlQUNDb21tYW5kQ2xpZW50UmVxdWVzdBIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSFAoFbW9kZWwYAiABKAlSBW1vZGVsEjQKDXJlbW90ZUFDU3RhdGUYAyABKAsyDi5SZW1vdGVBQ1N0YXRlUg1yZW1vdGVBQ1N0YXRl');
@$core.Deprecated('Use controlRemoteACCommandClientResponseDescriptor instead')
const ControlRemoteACCommandClientResponse$json = const {
  '1': 'ControlRemoteACCommandClientResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `ControlRemoteACCommandClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List controlRemoteACCommandClientResponseDescriptor = $convert.base64Decode('CiRDb250cm9sUmVtb3RlQUNDb21tYW5kQ2xpZW50UmVzcG9uc2USLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use meterOnChangedClientResponseDescriptor instead')
const MeterOnChangedClientResponse$json = const {
  '1': 'MeterOnChangedClientResponse',
  '2': const [
    const {'1': 'indexs', '3': 1, '4': 3, '5': 11, '6': '.MeterIndex', '10': 'indexs'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `MeterOnChangedClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List meterOnChangedClientResponseDescriptor = $convert.base64Decode('ChxNZXRlck9uQ2hhbmdlZENsaWVudFJlc3BvbnNlEiMKBmluZGV4cxgBIAMoCzILLk1ldGVySW5kZXhSBmluZGV4cxIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use switcherOnChangedClientResponseDescriptor instead')
const SwitcherOnChangedClientResponse$json = const {
  '1': 'SwitcherOnChangedClientResponse',
  '2': const [
    const {'1': 'switcher', '3': 1, '4': 1, '5': 13, '10': 'switcher'},
    const {'1': 'powerState', '3': 2, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'deviceId', '3': 3, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'bridge', '3': 4, '4': 1, '5': 11, '6': '.BridgeInfo', '10': 'bridge'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SwitcherOnChangedClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List switcherOnChangedClientResponseDescriptor = $convert.base64Decode('Ch9Td2l0Y2hlck9uQ2hhbmdlZENsaWVudFJlc3BvbnNlEhoKCHN3aXRjaGVyGAEgASgNUghzd2l0Y2hlchIrCgpwb3dlclN0YXRlGAIgASgOMgsuUG93ZXJTdGF0ZVIKcG93ZXJTdGF0ZRIaCghkZXZpY2VJZBgDIAEoCVIIZGV2aWNlSWQSIwoGYnJpZGdlGAQgASgLMgsuQnJpZGdlSW5mb1IGYnJpZGdlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use curtainSwitcherOnChangedClientResponseDescriptor instead')
const CurtainSwitcherOnChangedClientResponse$json = const {
  '1': 'CurtainSwitcherOnChangedClientResponse',
  '2': const [
    const {'1': 'percentIn', '3': 1, '4': 1, '5': 13, '10': 'percentIn'},
    const {'1': 'percentOut', '3': 2, '4': 1, '5': 13, '10': 'percentOut'},
    const {'1': 'deviceId', '3': 3, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `CurtainSwitcherOnChangedClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List curtainSwitcherOnChangedClientResponseDescriptor = $convert.base64Decode('CiZDdXJ0YWluU3dpdGNoZXJPbkNoYW5nZWRDbGllbnRSZXNwb25zZRIcCglwZXJjZW50SW4YASABKA1SCXBlcmNlbnRJbhIeCgpwZXJjZW50T3V0GAIgASgNUgpwZXJjZW50T3V0EhoKCGRldmljZUlkGAMgASgJUghkZXZpY2VJZBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use airConditionerOnChangedClientResponseDescriptor instead')
const AirConditionerOnChangedClientResponse$json = const {
  '1': 'AirConditionerOnChangedClientResponse',
  '2': const [
    const {'1': 'state', '3': 1, '4': 1, '5': 11, '6': '.AirConditionerState', '10': 'state'},
    const {'1': 'deviceId', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `AirConditionerOnChangedClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List airConditionerOnChangedClientResponseDescriptor = $convert.base64Decode('CiVBaXJDb25kaXRpb25lck9uQ2hhbmdlZENsaWVudFJlc3BvbnNlEioKBXN0YXRlGAEgASgLMhQuQWlyQ29uZGl0aW9uZXJTdGF0ZVIFc3RhdGUSGgoIZGV2aWNlSWQYAiABKAlSCGRldmljZUlkEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use progressUpdateFirmwareOnChangedDeviceClientResponseDescriptor instead')
const ProgressUpdateFirmwareOnChangedDeviceClientResponse$json = const {
  '1': 'ProgressUpdateFirmwareOnChangedDeviceClientResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'hardwareId', '3': 2, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'pageSize', '3': 3, '4': 1, '5': 13, '10': 'pageSize'},
    const {'1': 'pageIndex', '3': 4, '4': 1, '5': 13, '10': 'pageIndex'},
    const {'1': 'totalPage', '3': 5, '4': 1, '5': 13, '10': 'totalPage'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `ProgressUpdateFirmwareOnChangedDeviceClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List progressUpdateFirmwareOnChangedDeviceClientResponseDescriptor = $convert.base64Decode('CjNQcm9ncmVzc1VwZGF0ZUZpcm13YXJlT25DaGFuZ2VkRGV2aWNlQ2xpZW50UmVzcG9uc2USGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEh4KCmhhcmR3YXJlSWQYAiABKAlSCmhhcmR3YXJlSWQSGgoIcGFnZVNpemUYAyABKA1SCHBhZ2VTaXplEhwKCXBhZ2VJbmRleBgEIAEoDVIJcGFnZUluZGV4EhwKCXRvdGFsUGFnZRgFIAEoDVIJdG90YWxQYWdlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use deviceOnChangedDeviceClientResponseDescriptor instead')
const DeviceOnChangedDeviceClientResponse$json = const {
  '1': 'DeviceOnChangedDeviceClientResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'connectionState', '3': 2, '4': 1, '5': 14, '6': '.ConnectionState', '10': 'connectionState'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `DeviceOnChangedDeviceClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceOnChangedDeviceClientResponseDescriptor = $convert.base64Decode('CiNEZXZpY2VPbkNoYW5nZWREZXZpY2VDbGllbnRSZXNwb25zZRIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSOgoPY29ubmVjdGlvblN0YXRlGAIgASgOMhAuQ29ubmVjdGlvblN0YXRlUg9jb25uZWN0aW9uU3RhdGUSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use motionOnChangedClientResponseDescriptor instead')
const MotionOnChangedClientResponse$json = const {
  '1': 'MotionOnChangedClientResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'motionState', '3': 2, '4': 1, '5': 14, '6': '.MotionState', '10': 'motionState'},
    const {'1': 'bridge', '3': 3, '4': 1, '5': 11, '6': '.BridgeInfo', '10': 'bridge'},
    const {'1': 'motionSensorType', '3': 4, '4': 1, '5': 14, '6': '.MotionSensorType', '10': 'motionSensorType'},
    const {'1': 'batteryCapacity', '3': 5, '4': 1, '5': 2, '10': 'batteryCapacity'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `MotionOnChangedClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List motionOnChangedClientResponseDescriptor = $convert.base64Decode('Ch1Nb3Rpb25PbkNoYW5nZWRDbGllbnRSZXNwb25zZRIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSLgoLbW90aW9uU3RhdGUYAiABKA4yDC5Nb3Rpb25TdGF0ZVILbW90aW9uU3RhdGUSIwoGYnJpZGdlGAMgASgLMgsuQnJpZGdlSW5mb1IGYnJpZGdlEj0KEG1vdGlvblNlbnNvclR5cGUYBCABKA4yES5Nb3Rpb25TZW5zb3JUeXBlUhBtb3Rpb25TZW5zb3JUeXBlEigKD2JhdHRlcnlDYXBhY2l0eRgFIAEoAlIPYmF0dGVyeUNhcGFjaXR5EiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use homekitOnChangedClientResponseDescriptor instead')
const HomekitOnChangedClientResponse$json = const {
  '1': 'HomekitOnChangedClientResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'homekitMode', '3': 2, '4': 1, '5': 14, '6': '.HomekitMode', '10': 'homekitMode'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `HomekitOnChangedClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List homekitOnChangedClientResponseDescriptor = $convert.base64Decode('Ch5Ib21la2l0T25DaGFuZ2VkQ2xpZW50UmVzcG9uc2USGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEi4KC2hvbWVraXRNb2RlGAIgASgOMgwuSG9tZWtpdE1vZGVSC2hvbWVraXRNb2RlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use buttonOnChangedClientResponseDescriptor instead')
const ButtonOnChangedClientResponse$json = const {
  '1': 'ButtonOnChangedClientResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'buttonState', '3': 2, '4': 1, '5': 14, '6': '.ButtonState', '10': 'buttonState'},
    const {'1': 'button', '3': 3, '4': 1, '5': 13, '10': 'button'},
    const {'1': 'battery', '3': 4, '4': 1, '5': 5, '10': 'battery'},
    const {'1': 'bridge', '3': 5, '4': 1, '5': 11, '6': '.BridgeInfo', '10': 'bridge'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `ButtonOnChangedClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buttonOnChangedClientResponseDescriptor = $convert.base64Decode('Ch1CdXR0b25PbkNoYW5nZWRDbGllbnRSZXNwb25zZRIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSLgoLYnV0dG9uU3RhdGUYAiABKA4yDC5CdXR0b25TdGF0ZVILYnV0dG9uU3RhdGUSFgoGYnV0dG9uGAMgASgNUgZidXR0b24SGAoHYmF0dGVyeRgEIAEoBVIHYmF0dGVyeRIjCgZicmlkZ2UYBSABKAsyCy5CcmlkZ2VJbmZvUgZicmlkZ2USLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use debugLoggingResponseDescriptor instead')
const DebugLoggingResponse$json = const {
  '1': 'DebugLoggingResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'label', '3': 2, '4': 1, '5': 9, '10': 'label'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `DebugLoggingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List debugLoggingResponseDescriptor = $convert.base64Decode('ChREZWJ1Z0xvZ2dpbmdSZXNwb25zZRIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSFAoFbGFiZWwYAiABKAlSBWxhYmVsEhgKB21lc3NhZ2UYAyABKAlSB21lc3NhZ2USLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use ledDriverOnChangedClientResponseDescriptor instead')
const LedDriverOnChangedClientResponse$json = const {
  '1': 'LedDriverOnChangedClientResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'ledIndex', '3': 2, '4': 1, '5': 13, '10': 'ledIndex'},
    const {'1': 'brightnessPercent', '3': 3, '4': 1, '5': 5, '10': 'brightnessPercent'},
    const {'1': 'powerState', '3': 4, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'groupControl', '3': 5, '4': 1, '5': 13, '10': 'groupControl'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `LedDriverOnChangedClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ledDriverOnChangedClientResponseDescriptor = $convert.base64Decode('CiBMZWREcml2ZXJPbkNoYW5nZWRDbGllbnRSZXNwb25zZRIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSGgoIbGVkSW5kZXgYAiABKA1SCGxlZEluZGV4EiwKEWJyaWdodG5lc3NQZXJjZW50GAMgASgFUhFicmlnaHRuZXNzUGVyY2VudBIrCgpwb3dlclN0YXRlGAQgASgOMgsuUG93ZXJTdGF0ZVIKcG93ZXJTdGF0ZRIiCgxncm91cENvbnRyb2wYBSABKA1SDGdyb3VwQ29udHJvbBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use environmentOnchangedClientResponseDescriptor instead')
const EnvironmentOnchangedClientResponse$json = const {
  '1': 'EnvironmentOnchangedClientResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'report', '3': 2, '4': 1, '5': 11, '6': '.EnvironmentSensorReport', '10': 'report'},
    const {'1': 'batteryCapacity', '3': 3, '4': 1, '5': 2, '10': 'batteryCapacity'},
    const {'1': 'bridgeInfo', '3': 4, '4': 1, '5': 11, '6': '.BridgeInfo', '10': 'bridgeInfo'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `EnvironmentOnchangedClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List environmentOnchangedClientResponseDescriptor = $convert.base64Decode('CiJFbnZpcm9ubWVudE9uY2hhbmdlZENsaWVudFJlc3BvbnNlEhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZBIwCgZyZXBvcnQYAiABKAsyGC5FbnZpcm9ubWVudFNlbnNvclJlcG9ydFIGcmVwb3J0EigKD2JhdHRlcnlDYXBhY2l0eRgDIAEoAlIPYmF0dGVyeUNhcGFjaXR5EisKCmJyaWRnZUluZm8YBCABKAsyCy5CcmlkZ2VJbmZvUgpicmlkZ2VJbmZvEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use smartPlugOnchangedClientResponseDescriptor instead')
const SmartPlugOnchangedClientResponse$json = const {
  '1': 'SmartPlugOnchangedClientResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'index', '3': 2, '4': 1, '5': 13, '10': 'index'},
    const {'1': 'amp', '3': 3, '4': 1, '5': 2, '10': 'amp'},
    const {'1': 'power', '3': 4, '4': 1, '5': 2, '10': 'power'},
    const {'1': 'volt', '3': 5, '4': 1, '5': 2, '10': 'volt'},
    const {'1': 'powerState', '3': 6, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SmartPlugOnchangedClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List smartPlugOnchangedClientResponseDescriptor = $convert.base64Decode('CiBTbWFydFBsdWdPbmNoYW5nZWRDbGllbnRSZXNwb25zZRIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSFAoFaW5kZXgYAiABKA1SBWluZGV4EhAKA2FtcBgDIAEoAlIDYW1wEhQKBXBvd2VyGAQgASgCUgVwb3dlchISCgR2b2x0GAUgASgCUgR2b2x0EisKCnBvd2VyU3RhdGUYBiABKA4yCy5Qb3dlclN0YXRlUgpwb3dlclN0YXRlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use curtainOnChangedClientResponseDescriptor instead')
const CurtainOnChangedClientResponse$json = const {
  '1': 'CurtainOnChangedClientResponse',
  '2': const [
    const {'1': 'percent', '3': 1, '4': 1, '5': 13, '10': 'percent'},
    const {'1': 'deviceId', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `CurtainOnChangedClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List curtainOnChangedClientResponseDescriptor = $convert.base64Decode('Ch5DdXJ0YWluT25DaGFuZ2VkQ2xpZW50UmVzcG9uc2USGAoHcGVyY2VudBgBIAEoDVIHcGVyY2VudBIaCghkZXZpY2VJZBgCIAEoCVIIZGV2aWNlSWQSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use touchPanelControlSwitchOnChangedClientResponseDescriptor instead')
const TouchPanelControlSwitchOnChangedClientResponse$json = const {
  '1': 'TouchPanelControlSwitchOnChangedClientResponse',
  '2': const [
    const {'1': 'touchPanelId', '3': 1, '4': 1, '5': 9, '10': 'touchPanelId'},
    const {'1': 'switcherId', '3': 2, '4': 1, '5': 9, '10': 'switcherId'},
    const {'1': 'switcher', '3': 3, '4': 1, '5': 13, '10': 'switcher'},
    const {'1': 'powerState', '3': 4, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `TouchPanelControlSwitchOnChangedClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelControlSwitchOnChangedClientResponseDescriptor = $convert.base64Decode('Ci5Ub3VjaFBhbmVsQ29udHJvbFN3aXRjaE9uQ2hhbmdlZENsaWVudFJlc3BvbnNlEiIKDHRvdWNoUGFuZWxJZBgBIAEoCVIMdG91Y2hQYW5lbElkEh4KCnN3aXRjaGVySWQYAiABKAlSCnN3aXRjaGVySWQSGgoIc3dpdGNoZXIYAyABKA1SCHN3aXRjaGVyEisKCnBvd2VyU3RhdGUYBCABKA4yCy5Qb3dlclN0YXRlUgpwb3dlclN0YXRlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use touchPanelControlCurtainSwitchOnChangedClientResponseDescriptor instead')
const TouchPanelControlCurtainSwitchOnChangedClientResponse$json = const {
  '1': 'TouchPanelControlCurtainSwitchOnChangedClientResponse',
  '2': const [
    const {'1': 'touchPanelId', '3': 1, '4': 1, '5': 9, '10': 'touchPanelId'},
    const {'1': 'curtainSwitcherId', '3': 2, '4': 1, '5': 9, '10': 'curtainSwitcherId'},
    const {'1': 'percentIn', '3': 3, '4': 1, '5': 13, '10': 'percentIn'},
    const {'1': 'percentOut', '3': 4, '4': 1, '5': 13, '10': 'percentOut'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `TouchPanelControlCurtainSwitchOnChangedClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelControlCurtainSwitchOnChangedClientResponseDescriptor = $convert.base64Decode('CjVUb3VjaFBhbmVsQ29udHJvbEN1cnRhaW5Td2l0Y2hPbkNoYW5nZWRDbGllbnRSZXNwb25zZRIiCgx0b3VjaFBhbmVsSWQYASABKAlSDHRvdWNoUGFuZWxJZBIsChFjdXJ0YWluU3dpdGNoZXJJZBgCIAEoCVIRY3VydGFpblN3aXRjaGVySWQSHAoJcGVyY2VudEluGAMgASgNUglwZXJjZW50SW4SHgoKcGVyY2VudE91dBgEIAEoDVIKcGVyY2VudE91dBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use touchPanelControlSceneOnChangedClientResponseDescriptor instead')
const TouchPanelControlSceneOnChangedClientResponse$json = const {
  '1': 'TouchPanelControlSceneOnChangedClientResponse',
  '2': const [
    const {'1': 'touchPanelId', '3': 1, '4': 1, '5': 9, '10': 'touchPanelId'},
    const {'1': 'sceneId', '3': 2, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `TouchPanelControlSceneOnChangedClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelControlSceneOnChangedClientResponseDescriptor = $convert.base64Decode('Ci1Ub3VjaFBhbmVsQ29udHJvbFNjZW5lT25DaGFuZ2VkQ2xpZW50UmVzcG9uc2USIgoMdG91Y2hQYW5lbElkGAEgASgJUgx0b3VjaFBhbmVsSWQSGAoHc2NlbmVJZBgCIAEoCVIHc2NlbmVJZBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use touchPanelControlLedDriverOnChangedClientResponseDescriptor instead')
const TouchPanelControlLedDriverOnChangedClientResponse$json = const {
  '1': 'TouchPanelControlLedDriverOnChangedClientResponse',
  '2': const [
    const {'1': 'touchPanelId', '3': 1, '4': 1, '5': 9, '10': 'touchPanelId'},
    const {'1': 'ledDriverId', '3': 2, '4': 1, '5': 9, '10': 'ledDriverId'},
    const {'1': 'powerState', '3': 3, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'brightnessPercent', '3': 4, '4': 1, '5': 5, '10': 'brightnessPercent'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `TouchPanelControlLedDriverOnChangedClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelControlLedDriverOnChangedClientResponseDescriptor = $convert.base64Decode('CjFUb3VjaFBhbmVsQ29udHJvbExlZERyaXZlck9uQ2hhbmdlZENsaWVudFJlc3BvbnNlEiIKDHRvdWNoUGFuZWxJZBgBIAEoCVIMdG91Y2hQYW5lbElkEiAKC2xlZERyaXZlcklkGAIgASgJUgtsZWREcml2ZXJJZBIrCgpwb3dlclN0YXRlGAMgASgOMgsuUG93ZXJTdGF0ZVIKcG93ZXJTdGF0ZRIsChFicmlnaHRuZXNzUGVyY2VudBgEIAEoBVIRYnJpZ2h0bmVzc1BlcmNlbnQSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use touchPanelRequestComponentStateOnChangedClientResponseDescriptor instead')
const TouchPanelRequestComponentStateOnChangedClientResponse$json = const {
  '1': 'TouchPanelRequestComponentStateOnChangedClientResponse',
  '2': const [
    const {'1': 'touchPanelId', '3': 1, '4': 1, '5': 9, '10': 'touchPanelId'},
    const {'1': 'componentId', '3': 2, '4': 1, '5': 9, '10': 'componentId'},
    const {'1': 'index', '3': 3, '4': 1, '5': 13, '10': 'index'},
    const {'1': 'type', '3': 4, '4': 1, '5': 14, '6': '.TouchPanelComponentType', '10': 'type'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `TouchPanelRequestComponentStateOnChangedClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelRequestComponentStateOnChangedClientResponseDescriptor = $convert.base64Decode('CjZUb3VjaFBhbmVsUmVxdWVzdENvbXBvbmVudFN0YXRlT25DaGFuZ2VkQ2xpZW50UmVzcG9uc2USIgoMdG91Y2hQYW5lbElkGAEgASgJUgx0b3VjaFBhbmVsSWQSIAoLY29tcG9uZW50SWQYAiABKAlSC2NvbXBvbmVudElkEhQKBWluZGV4GAMgASgNUgVpbmRleBIsCgR0eXBlGAQgASgOMhguVG91Y2hQYW5lbENvbXBvbmVudFR5cGVSBHR5cGUSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use motionClientRequestDescriptor instead')
const MotionClientRequest$json = const {
  '1': 'MotionClientRequest',
  '2': const [
    const {'1': 'hardwareId', '3': 1, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'motionState', '3': 2, '4': 1, '5': 14, '6': '.MotionState', '10': 'motionState'},
  ],
};

/// Descriptor for `MotionClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List motionClientRequestDescriptor = $convert.base64Decode('ChNNb3Rpb25DbGllbnRSZXF1ZXN0Eh4KCmhhcmR3YXJlSWQYASABKAlSCmhhcmR3YXJlSWQSLgoLbW90aW9uU3RhdGUYAiABKA4yDC5Nb3Rpb25TdGF0ZVILbW90aW9uU3RhdGU=');
@$core.Deprecated('Use motionClientResponseDescriptor instead')
const MotionClientResponse$json = const {
  '1': 'MotionClientResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'motionState', '3': 2, '4': 1, '5': 14, '6': '.MotionState', '10': 'motionState'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `MotionClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List motionClientResponseDescriptor = $convert.base64Decode('ChRNb3Rpb25DbGllbnRSZXNwb25zZRIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSLgoLbW90aW9uU3RhdGUYAiABKA4yDC5Nb3Rpb25TdGF0ZVILbW90aW9uU3RhdGUSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use updateMotionStateDescriptor instead')
const UpdateMotionState$json = const {
  '1': 'UpdateMotionState',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'motionState', '3': 2, '4': 1, '5': 14, '6': '.MotionState', '10': 'motionState'},
  ],
};

/// Descriptor for `UpdateMotionState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMotionStateDescriptor = $convert.base64Decode('ChFVcGRhdGVNb3Rpb25TdGF0ZRIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSLgoLbW90aW9uU3RhdGUYAiABKA4yDC5Nb3Rpb25TdGF0ZVILbW90aW9uU3RhdGU=');
@$core.Deprecated('Use sceneClientRequestDescriptor instead')
const SceneClientRequest$json = const {
  '1': 'SceneClientRequest',
  '2': const [
    const {'1': 'sceneId', '3': 1, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'source', '3': 2, '4': 1, '5': 11, '6': '.DeviceInScene', '10': 'source'},
    const {'1': 'target', '3': 3, '4': 3, '5': 11, '6': '.DeviceInScene', '10': 'target'},
    const {'1': 'type', '3': 4, '4': 1, '5': 13, '10': 'type'},
    const {'1': 'mode', '3': 5, '4': 1, '5': 13, '10': 'mode'},
    const {'1': 'hardwareId', '3': 6, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'activeTime', '3': 7, '4': 1, '5': 11, '6': '.ActiveTime', '10': 'activeTime'},
  ],
};

/// Descriptor for `SceneClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneClientRequestDescriptor = $convert.base64Decode('ChJTY2VuZUNsaWVudFJlcXVlc3QSGAoHc2NlbmVJZBgBIAEoCVIHc2NlbmVJZBImCgZzb3VyY2UYAiABKAsyDi5EZXZpY2VJblNjZW5lUgZzb3VyY2USJgoGdGFyZ2V0GAMgAygLMg4uRGV2aWNlSW5TY2VuZVIGdGFyZ2V0EhIKBHR5cGUYBCABKA1SBHR5cGUSEgoEbW9kZRgFIAEoDVIEbW9kZRIeCgpoYXJkd2FyZUlkGAYgASgJUgpoYXJkd2FyZUlkEisKCmFjdGl2ZVRpbWUYByABKAsyCy5BY3RpdmVUaW1lUgphY3RpdmVUaW1l');
@$core.Deprecated('Use sceneClientResponseDescriptor instead')
const SceneClientResponse$json = const {
  '1': 'SceneClientResponse',
  '2': const [
    const {'1': 'sceneId', '3': 1, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'switcher', '3': 2, '4': 1, '5': 11, '6': '.Switcher', '10': 'switcher'},
    const {'1': 'mode', '3': 3, '4': 1, '5': 13, '10': 'mode'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SceneClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneClientResponseDescriptor = $convert.base64Decode('ChNTY2VuZUNsaWVudFJlc3BvbnNlEhgKB3NjZW5lSWQYASABKAlSB3NjZW5lSWQSJQoIc3dpdGNoZXIYAiABKAsyCS5Td2l0Y2hlclIIc3dpdGNoZXISEgoEbW9kZRgDIAEoDVIEbW9kZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use ledDriverClientRequestDescriptor instead')
const LedDriverClientRequest$json = const {
  '1': 'LedDriverClientRequest',
  '2': const [
    const {'1': 'hardwareId', '3': 1, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'ledIndex', '3': 2, '4': 1, '5': 13, '10': 'ledIndex'},
    const {'1': 'brightnessPercent', '3': 3, '4': 1, '5': 5, '10': 'brightnessPercent'},
    const {'1': 'powerState', '3': 4, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'groupControl', '3': 5, '4': 1, '5': 13, '10': 'groupControl'},
  ],
};

/// Descriptor for `LedDriverClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ledDriverClientRequestDescriptor = $convert.base64Decode('ChZMZWREcml2ZXJDbGllbnRSZXF1ZXN0Eh4KCmhhcmR3YXJlSWQYASABKAlSCmhhcmR3YXJlSWQSGgoIbGVkSW5kZXgYAiABKA1SCGxlZEluZGV4EiwKEWJyaWdodG5lc3NQZXJjZW50GAMgASgFUhFicmlnaHRuZXNzUGVyY2VudBIrCgpwb3dlclN0YXRlGAQgASgOMgsuUG93ZXJTdGF0ZVIKcG93ZXJTdGF0ZRIiCgxncm91cENvbnRyb2wYBSABKA1SDGdyb3VwQ29udHJvbA==');
@$core.Deprecated('Use ledDriverClientResponseDescriptor instead')
const LedDriverClientResponse$json = const {
  '1': 'LedDriverClientResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'ledIndex', '3': 2, '4': 1, '5': 5, '10': 'ledIndex'},
    const {'1': 'brightnessPercent', '3': 3, '4': 1, '5': 5, '10': 'brightnessPercent'},
    const {'1': 'powerState', '3': 4, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'groupControl', '3': 5, '4': 1, '5': 13, '10': 'groupControl'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `LedDriverClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ledDriverClientResponseDescriptor = $convert.base64Decode('ChdMZWREcml2ZXJDbGllbnRSZXNwb25zZRIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSGgoIbGVkSW5kZXgYAiABKAVSCGxlZEluZGV4EiwKEWJyaWdodG5lc3NQZXJjZW50GAMgASgFUhFicmlnaHRuZXNzUGVyY2VudBIrCgpwb3dlclN0YXRlGAQgASgOMgsuUG93ZXJTdGF0ZVIKcG93ZXJTdGF0ZRIiCgxncm91cENvbnRyb2wYBSABKA1SDGdyb3VwQ29udHJvbBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use sceneGroupClientRequestDescriptor instead')
const SceneGroupClientRequest$json = const {
  '1': 'SceneGroupClientRequest',
  '2': const [
    const {'1': 'switcherClientRequest', '3': 1, '4': 3, '5': 11, '6': '.SwitcherClientRequest', '10': 'switcherClientRequest'},
    const {'1': 'ledDriverClientRequest', '3': 2, '4': 3, '5': 11, '6': '.LedDriverClientRequest', '10': 'ledDriverClientRequest'},
  ],
};

/// Descriptor for `SceneGroupClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneGroupClientRequestDescriptor = $convert.base64Decode('ChdTY2VuZUdyb3VwQ2xpZW50UmVxdWVzdBJMChVzd2l0Y2hlckNsaWVudFJlcXVlc3QYASADKAsyFi5Td2l0Y2hlckNsaWVudFJlcXVlc3RSFXN3aXRjaGVyQ2xpZW50UmVxdWVzdBJPChZsZWREcml2ZXJDbGllbnRSZXF1ZXN0GAIgAygLMhcuTGVkRHJpdmVyQ2xpZW50UmVxdWVzdFIWbGVkRHJpdmVyQ2xpZW50UmVxdWVzdA==');
@$core.Deprecated('Use meterClientRequestDescriptor instead')
const MeterClientRequest$json = const {
  '1': 'MeterClientRequest',
  '2': const [
    const {'1': 'date', '3': 1, '4': 1, '5': 13, '10': 'date'},
  ],
};

/// Descriptor for `MeterClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List meterClientRequestDescriptor = $convert.base64Decode('ChJNZXRlckNsaWVudFJlcXVlc3QSEgoEZGF0ZRgBIAEoDVIEZGF0ZQ==');
@$core.Deprecated('Use meterClientResponseDescriptor instead')
const MeterClientResponse$json = const {
  '1': 'MeterClientResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    const {'1': 'hardwareId', '3': 2, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'indexs', '3': 3, '4': 3, '5': 11, '6': '.MeterIndex', '10': 'indexs'},
    const {'1': 'timestamp', '3': 4, '4': 1, '5': 13, '10': 'timestamp'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `MeterClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List meterClientResponseDescriptor = $convert.base64Decode('ChNNZXRlckNsaWVudFJlc3BvbnNlEg4KAmlkGAEgASgNUgJpZBIeCgpoYXJkd2FyZUlkGAIgASgJUgpoYXJkd2FyZUlkEiMKBmluZGV4cxgDIAMoCzILLk1ldGVySW5kZXhSBmluZGV4cxIcCgl0aW1lc3RhbXAYBCABKA1SCXRpbWVzdGFtcBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use meterClientConfirmDescriptor instead')
const MeterClientConfirm$json = const {
  '1': 'MeterClientConfirm',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `MeterClientConfirm`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List meterClientConfirmDescriptor = $convert.base64Decode('ChJNZXRlckNsaWVudENvbmZpcm0SDgoCaWQYASABKA1SAmlkEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use setHomekitModeClientRequestDescriptor instead')
const SetHomekitModeClientRequest$json = const {
  '1': 'SetHomekitModeClientRequest',
  '2': const [
    const {'1': 'hardwareId', '3': 1, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'homekitMode', '3': 2, '4': 1, '5': 14, '6': '.HomekitMode', '10': 'homekitMode'},
  ],
};

/// Descriptor for `SetHomekitModeClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setHomekitModeClientRequestDescriptor = $convert.base64Decode('ChtTZXRIb21la2l0TW9kZUNsaWVudFJlcXVlc3QSHgoKaGFyZHdhcmVJZBgBIAEoCVIKaGFyZHdhcmVJZBIuCgtob21la2l0TW9kZRgCIAEoDjIMLkhvbWVraXRNb2RlUgtob21la2l0TW9kZQ==');
@$core.Deprecated('Use setHomekitModeClientResponseDescriptor instead')
const SetHomekitModeClientResponse$json = const {
  '1': 'SetHomekitModeClientResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SetHomekitModeClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setHomekitModeClientResponseDescriptor = $convert.base64Decode('ChxTZXRIb21la2l0TW9kZUNsaWVudFJlc3BvbnNlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use sceneTriggerClientRequestDescriptor instead')
const SceneTriggerClientRequest$json = const {
  '1': 'SceneTriggerClientRequest',
  '2': const [
    const {'1': 'sceneId', '3': 1, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'source', '3': 2, '4': 1, '5': 11, '6': '.DeviceInScene', '10': 'source'},
    const {'1': 'target', '3': 3, '4': 3, '5': 11, '6': '.DeviceInScene', '10': 'target'},
    const {'1': 'mode', '3': 4, '4': 1, '5': 13, '10': 'mode'},
  ],
};

/// Descriptor for `SceneTriggerClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneTriggerClientRequestDescriptor = $convert.base64Decode('ChlTY2VuZVRyaWdnZXJDbGllbnRSZXF1ZXN0EhgKB3NjZW5lSWQYASABKAlSB3NjZW5lSWQSJgoGc291cmNlGAIgASgLMg4uRGV2aWNlSW5TY2VuZVIGc291cmNlEiYKBnRhcmdldBgDIAMoCzIOLkRldmljZUluU2NlbmVSBnRhcmdldBISCgRtb2RlGAQgASgNUgRtb2Rl');
@$core.Deprecated('Use sceneTriggerClientResponseDescriptor instead')
const SceneTriggerClientResponse$json = const {
  '1': 'SceneTriggerClientResponse',
  '2': const [
    const {'1': 'sceneId', '3': 1, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SceneTriggerClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneTriggerClientResponseDescriptor = $convert.base64Decode('ChpTY2VuZVRyaWdnZXJDbGllbnRSZXNwb25zZRIYCgdzY2VuZUlkGAEgASgJUgdzY2VuZUlkEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use curtainClientRequestDescriptor instead')
const CurtainClientRequest$json = const {
  '1': 'CurtainClientRequest',
  '2': const [
    const {'1': 'percent', '3': 1, '4': 1, '5': 13, '10': 'percent'},
    const {'1': 'controlState', '3': 2, '4': 1, '5': 14, '6': '.CurtainControlState', '10': 'controlState'},
    const {'1': 'hardwareId', '3': 3, '4': 1, '5': 9, '10': 'hardwareId'},
  ],
};

/// Descriptor for `CurtainClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List curtainClientRequestDescriptor = $convert.base64Decode('ChRDdXJ0YWluQ2xpZW50UmVxdWVzdBIYCgdwZXJjZW50GAEgASgNUgdwZXJjZW50EjgKDGNvbnRyb2xTdGF0ZRgCIAEoDjIULkN1cnRhaW5Db250cm9sU3RhdGVSDGNvbnRyb2xTdGF0ZRIeCgpoYXJkd2FyZUlkGAMgASgJUgpoYXJkd2FyZUlk');
@$core.Deprecated('Use curtainClientResponseDescriptor instead')
const CurtainClientResponse$json = const {
  '1': 'CurtainClientResponse',
  '2': const [
    const {'1': 'percent', '3': 1, '4': 1, '5': 13, '10': 'percent'},
    const {'1': 'deviceId', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `CurtainClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List curtainClientResponseDescriptor = $convert.base64Decode('ChVDdXJ0YWluQ2xpZW50UmVzcG9uc2USGAoHcGVyY2VudBgBIAEoDVIHcGVyY2VudBIaCghkZXZpY2VJZBgCIAEoCVIIZGV2aWNlSWQSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use touchPanelChangeComponentClientRequestDescriptor instead')
const TouchPanelChangeComponentClientRequest$json = const {
  '1': 'TouchPanelChangeComponentClientRequest',
  '2': const [
    const {'1': 'touchPanelId', '3': 1, '4': 1, '5': 9, '10': 'touchPanelId'},
    const {'1': 'componentId', '3': 2, '4': 1, '5': 9, '10': 'componentId'},
    const {'1': 'index', '3': 3, '4': 1, '5': 13, '10': 'index'},
    const {'1': 'type', '3': 4, '4': 1, '5': 14, '6': '.TouchPanelComponentType', '10': 'type'},
    const {'1': 'activeMap', '3': 5, '4': 1, '5': 13, '10': 'activeMap'},
    const {'1': 'name', '3': 6, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'mode', '3': 7, '4': 1, '5': 13, '10': 'mode'},
  ],
};

/// Descriptor for `TouchPanelChangeComponentClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelChangeComponentClientRequestDescriptor = $convert.base64Decode('CiZUb3VjaFBhbmVsQ2hhbmdlQ29tcG9uZW50Q2xpZW50UmVxdWVzdBIiCgx0b3VjaFBhbmVsSWQYASABKAlSDHRvdWNoUGFuZWxJZBIgCgtjb21wb25lbnRJZBgCIAEoCVILY29tcG9uZW50SWQSFAoFaW5kZXgYAyABKA1SBWluZGV4EiwKBHR5cGUYBCABKA4yGC5Ub3VjaFBhbmVsQ29tcG9uZW50VHlwZVIEdHlwZRIcCglhY3RpdmVNYXAYBSABKA1SCWFjdGl2ZU1hcBISCgRuYW1lGAYgASgJUgRuYW1lEhIKBG1vZGUYByABKA1SBG1vZGU=');
@$core.Deprecated('Use touchPanelControlSwitcherClientRequestDescriptor instead')
const TouchPanelControlSwitcherClientRequest$json = const {
  '1': 'TouchPanelControlSwitcherClientRequest',
  '2': const [
    const {'1': 'touchPanelId', '3': 1, '4': 1, '5': 9, '10': 'touchPanelId'},
    const {'1': 'switcherId', '3': 2, '4': 1, '5': 9, '10': 'switcherId'},
    const {'1': 'switcher', '3': 3, '4': 1, '5': 13, '10': 'switcher'},
    const {'1': 'powerState', '3': 4, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
  ],
};

/// Descriptor for `TouchPanelControlSwitcherClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelControlSwitcherClientRequestDescriptor = $convert.base64Decode('CiZUb3VjaFBhbmVsQ29udHJvbFN3aXRjaGVyQ2xpZW50UmVxdWVzdBIiCgx0b3VjaFBhbmVsSWQYASABKAlSDHRvdWNoUGFuZWxJZBIeCgpzd2l0Y2hlcklkGAIgASgJUgpzd2l0Y2hlcklkEhoKCHN3aXRjaGVyGAMgASgNUghzd2l0Y2hlchIrCgpwb3dlclN0YXRlGAQgASgOMgsuUG93ZXJTdGF0ZVIKcG93ZXJTdGF0ZQ==');
@$core.Deprecated('Use touchPanelUpdateSwitcherClientRequestDescriptor instead')
const TouchPanelUpdateSwitcherClientRequest$json = const {
  '1': 'TouchPanelUpdateSwitcherClientRequest',
  '2': const [
    const {'1': 'touchPanelId', '3': 1, '4': 1, '5': 9, '10': 'touchPanelId'},
    const {'1': 'switcherId', '3': 2, '4': 1, '5': 9, '10': 'switcherId'},
    const {'1': 'index', '3': 3, '4': 1, '5': 13, '10': 'index'},
    const {'1': 'activeMap', '3': 4, '4': 1, '5': 13, '10': 'activeMap'},
    const {'1': 'name', '3': 5, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'connectionState', '3': 6, '4': 1, '5': 14, '6': '.ConnectionState', '10': 'connectionState'},
  ],
};

/// Descriptor for `TouchPanelUpdateSwitcherClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelUpdateSwitcherClientRequestDescriptor = $convert.base64Decode('CiVUb3VjaFBhbmVsVXBkYXRlU3dpdGNoZXJDbGllbnRSZXF1ZXN0EiIKDHRvdWNoUGFuZWxJZBgBIAEoCVIMdG91Y2hQYW5lbElkEh4KCnN3aXRjaGVySWQYAiABKAlSCnN3aXRjaGVySWQSFAoFaW5kZXgYAyABKA1SBWluZGV4EhwKCWFjdGl2ZU1hcBgEIAEoDVIJYWN0aXZlTWFwEhIKBG5hbWUYBSABKAlSBG5hbWUSOgoPY29ubmVjdGlvblN0YXRlGAYgASgOMhAuQ29ubmVjdGlvblN0YXRlUg9jb25uZWN0aW9uU3RhdGU=');
@$core.Deprecated('Use touchPanelControlCurtainSwitcherClientRequestDescriptor instead')
const TouchPanelControlCurtainSwitcherClientRequest$json = const {
  '1': 'TouchPanelControlCurtainSwitcherClientRequest',
  '2': const [
    const {'1': 'touchPanelId', '3': 1, '4': 1, '5': 9, '10': 'touchPanelId'},
    const {'1': 'curtainSwitcherId', '3': 2, '4': 1, '5': 9, '10': 'curtainSwitcherId'},
    const {'1': 'percentIn', '3': 3, '4': 1, '5': 13, '10': 'percentIn'},
    const {'1': 'percentOut', '3': 4, '4': 1, '5': 13, '10': 'percentOut'},
  ],
};

/// Descriptor for `TouchPanelControlCurtainSwitcherClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelControlCurtainSwitcherClientRequestDescriptor = $convert.base64Decode('Ci1Ub3VjaFBhbmVsQ29udHJvbEN1cnRhaW5Td2l0Y2hlckNsaWVudFJlcXVlc3QSIgoMdG91Y2hQYW5lbElkGAEgASgJUgx0b3VjaFBhbmVsSWQSLAoRY3VydGFpblN3aXRjaGVySWQYAiABKAlSEWN1cnRhaW5Td2l0Y2hlcklkEhwKCXBlcmNlbnRJbhgDIAEoDVIJcGVyY2VudEluEh4KCnBlcmNlbnRPdXQYBCABKA1SCnBlcmNlbnRPdXQ=');
@$core.Deprecated('Use touchPanelUpdateCurtainSwitcherClientRequestDescriptor instead')
const TouchPanelUpdateCurtainSwitcherClientRequest$json = const {
  '1': 'TouchPanelUpdateCurtainSwitcherClientRequest',
  '2': const [
    const {'1': 'touchPanelId', '3': 1, '4': 1, '5': 9, '10': 'touchPanelId'},
    const {'1': 'curtainSwitcherId', '3': 2, '4': 1, '5': 9, '10': 'curtainSwitcherId'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'connectionState', '3': 4, '4': 1, '5': 14, '6': '.ConnectionState', '10': 'connectionState'},
  ],
};

/// Descriptor for `TouchPanelUpdateCurtainSwitcherClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelUpdateCurtainSwitcherClientRequestDescriptor = $convert.base64Decode('CixUb3VjaFBhbmVsVXBkYXRlQ3VydGFpblN3aXRjaGVyQ2xpZW50UmVxdWVzdBIiCgx0b3VjaFBhbmVsSWQYASABKAlSDHRvdWNoUGFuZWxJZBIsChFjdXJ0YWluU3dpdGNoZXJJZBgCIAEoCVIRY3VydGFpblN3aXRjaGVySWQSEgoEbmFtZRgDIAEoCVIEbmFtZRI6Cg9jb25uZWN0aW9uU3RhdGUYBCABKA4yEC5Db25uZWN0aW9uU3RhdGVSD2Nvbm5lY3Rpb25TdGF0ZQ==');
@$core.Deprecated('Use touchPanelUpdateSceneClientRequestDescriptor instead')
const TouchPanelUpdateSceneClientRequest$json = const {
  '1': 'TouchPanelUpdateSceneClientRequest',
  '2': const [
    const {'1': 'touchPanelId', '3': 1, '4': 1, '5': 9, '10': 'touchPanelId'},
    const {'1': 'sceneId', '3': 2, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `TouchPanelUpdateSceneClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelUpdateSceneClientRequestDescriptor = $convert.base64Decode('CiJUb3VjaFBhbmVsVXBkYXRlU2NlbmVDbGllbnRSZXF1ZXN0EiIKDHRvdWNoUGFuZWxJZBgBIAEoCVIMdG91Y2hQYW5lbElkEhgKB3NjZW5lSWQYAiABKAlSB3NjZW5lSWQSEgoEbmFtZRgDIAEoCVIEbmFtZQ==');
@$core.Deprecated('Use touchPanelControlLedDriverClientRequestDescriptor instead')
const TouchPanelControlLedDriverClientRequest$json = const {
  '1': 'TouchPanelControlLedDriverClientRequest',
  '2': const [
    const {'1': 'touchPanelId', '3': 1, '4': 1, '5': 9, '10': 'touchPanelId'},
    const {'1': 'ledDriverId', '3': 2, '4': 1, '5': 9, '10': 'ledDriverId'},
    const {'1': 'powerState', '3': 3, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'brightnessPercent', '3': 4, '4': 1, '5': 5, '10': 'brightnessPercent'},
  ],
};

/// Descriptor for `TouchPanelControlLedDriverClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelControlLedDriverClientRequestDescriptor = $convert.base64Decode('CidUb3VjaFBhbmVsQ29udHJvbExlZERyaXZlckNsaWVudFJlcXVlc3QSIgoMdG91Y2hQYW5lbElkGAEgASgJUgx0b3VjaFBhbmVsSWQSIAoLbGVkRHJpdmVySWQYAiABKAlSC2xlZERyaXZlcklkEisKCnBvd2VyU3RhdGUYAyABKA4yCy5Qb3dlclN0YXRlUgpwb3dlclN0YXRlEiwKEWJyaWdodG5lc3NQZXJjZW50GAQgASgFUhFicmlnaHRuZXNzUGVyY2VudA==');
@$core.Deprecated('Use touchPanelUpdateLedDriverClientRequestDescriptor instead')
const TouchPanelUpdateLedDriverClientRequest$json = const {
  '1': 'TouchPanelUpdateLedDriverClientRequest',
  '2': const [
    const {'1': 'touchPanelId', '3': 1, '4': 1, '5': 9, '10': 'touchPanelId'},
    const {'1': 'ledDriverId', '3': 2, '4': 1, '5': 9, '10': 'ledDriverId'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'connectionState', '3': 4, '4': 1, '5': 14, '6': '.ConnectionState', '10': 'connectionState'},
  ],
};

/// Descriptor for `TouchPanelUpdateLedDriverClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelUpdateLedDriverClientRequestDescriptor = $convert.base64Decode('CiZUb3VjaFBhbmVsVXBkYXRlTGVkRHJpdmVyQ2xpZW50UmVxdWVzdBIiCgx0b3VjaFBhbmVsSWQYASABKAlSDHRvdWNoUGFuZWxJZBIgCgtsZWREcml2ZXJJZBgCIAEoCVILbGVkRHJpdmVySWQSEgoEbmFtZRgDIAEoCVIEbmFtZRI6Cg9jb25uZWN0aW9uU3RhdGUYBCABKA4yEC5Db25uZWN0aW9uU3RhdGVSD2Nvbm5lY3Rpb25TdGF0ZQ==');
@$core.Deprecated('Use deviceClientMessageDescriptor instead')
const DeviceClientMessage$json = const {
  '1': 'DeviceClientMessage',
  '2': const [
    const {'1': 'forceUpdateFirmwareDeviceClientRequest', '3': 1, '4': 1, '5': 11, '6': '.ForceUpdateFirmwareDeviceClientRequest', '10': 'forceUpdateFirmwareDeviceClientRequest'},
    const {'1': 'forceUpdateFirmwareDeviceClientResponse', '3': 2, '4': 1, '5': 11, '6': '.ForceUpdateFirmwareDeviceClientResponse', '10': 'forceUpdateFirmwareDeviceClientResponse'},
    const {'1': 'updateDeviceClientRequest', '3': 3, '4': 1, '5': 11, '6': '.UpdateDeviceClientRequest', '10': 'updateDeviceClientRequest'},
    const {'1': 'updateDeviceClientResponse', '3': 4, '4': 1, '5': 11, '6': '.UpdateDeviceClientResponse', '10': 'updateDeviceClientResponse'},
    const {'1': 'updateWSEndpointClientRequest', '3': 5, '4': 1, '5': 11, '6': '.UpdateWSEndpointClientRequest', '10': 'updateWSEndpointClientRequest'},
    const {'1': 'updateWSEndpointClientResponse', '3': 6, '4': 1, '5': 11, '6': '.UpdateWSEndpointClientResponse', '10': 'updateWSEndpointClientResponse'},
    const {'1': 'deleteDeviceClientRequest', '3': 7, '4': 1, '5': 11, '6': '.DeleteDeviceClientRequest', '10': 'deleteDeviceClientRequest'},
    const {'1': 'deleteDeviceClientResponse', '3': 8, '4': 1, '5': 11, '6': '.DeleteDeviceClientResponse', '10': 'deleteDeviceClientResponse'},
  ],
};

/// Descriptor for `DeviceClientMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceClientMessageDescriptor = $convert.base64Decode('ChNEZXZpY2VDbGllbnRNZXNzYWdlEn8KJmZvcmNlVXBkYXRlRmlybXdhcmVEZXZpY2VDbGllbnRSZXF1ZXN0GAEgASgLMicuRm9yY2VVcGRhdGVGaXJtd2FyZURldmljZUNsaWVudFJlcXVlc3RSJmZvcmNlVXBkYXRlRmlybXdhcmVEZXZpY2VDbGllbnRSZXF1ZXN0EoIBCidmb3JjZVVwZGF0ZUZpcm13YXJlRGV2aWNlQ2xpZW50UmVzcG9uc2UYAiABKAsyKC5Gb3JjZVVwZGF0ZUZpcm13YXJlRGV2aWNlQ2xpZW50UmVzcG9uc2VSJ2ZvcmNlVXBkYXRlRmlybXdhcmVEZXZpY2VDbGllbnRSZXNwb25zZRJYChl1cGRhdGVEZXZpY2VDbGllbnRSZXF1ZXN0GAMgASgLMhouVXBkYXRlRGV2aWNlQ2xpZW50UmVxdWVzdFIZdXBkYXRlRGV2aWNlQ2xpZW50UmVxdWVzdBJbChp1cGRhdGVEZXZpY2VDbGllbnRSZXNwb25zZRgEIAEoCzIbLlVwZGF0ZURldmljZUNsaWVudFJlc3BvbnNlUhp1cGRhdGVEZXZpY2VDbGllbnRSZXNwb25zZRJkCh11cGRhdGVXU0VuZHBvaW50Q2xpZW50UmVxdWVzdBgFIAEoCzIeLlVwZGF0ZVdTRW5kcG9pbnRDbGllbnRSZXF1ZXN0Uh11cGRhdGVXU0VuZHBvaW50Q2xpZW50UmVxdWVzdBJnCh51cGRhdGVXU0VuZHBvaW50Q2xpZW50UmVzcG9uc2UYBiABKAsyHy5VcGRhdGVXU0VuZHBvaW50Q2xpZW50UmVzcG9uc2VSHnVwZGF0ZVdTRW5kcG9pbnRDbGllbnRSZXNwb25zZRJYChlkZWxldGVEZXZpY2VDbGllbnRSZXF1ZXN0GAcgASgLMhouRGVsZXRlRGV2aWNlQ2xpZW50UmVxdWVzdFIZZGVsZXRlRGV2aWNlQ2xpZW50UmVxdWVzdBJbChpkZWxldGVEZXZpY2VDbGllbnRSZXNwb25zZRgIIAEoCzIbLkRlbGV0ZURldmljZUNsaWVudFJlc3BvbnNlUhpkZWxldGVEZXZpY2VDbGllbnRSZXNwb25zZQ==');
@$core.Deprecated('Use switcherClientMessageDescriptor instead')
const SwitcherClientMessage$json = const {
  '1': 'SwitcherClientMessage',
  '2': const [
    const {'1': 'getSwitchersClientRequest', '3': 1, '4': 1, '5': 11, '6': '.GetSwitchersClientRequest', '10': 'getSwitchersClientRequest'},
    const {'1': 'getSwitchersClientResponse', '3': 2, '4': 1, '5': 11, '6': '.GetSwitchersClientResponse', '10': 'getSwitchersClientResponse'},
    const {'1': 'getSwitcherClientRequest', '3': 3, '4': 1, '5': 11, '6': '.GetSwitcherClientRequest', '10': 'getSwitcherClientRequest'},
    const {'1': 'getSwitcherClientResponse', '3': 4, '4': 1, '5': 11, '6': '.GetSwitcherClientResponse', '10': 'getSwitcherClientResponse'},
    const {'1': 'getLogSwitcherClientRequest', '3': 5, '4': 1, '5': 11, '6': '.GetLogSwitcherClientRequest', '10': 'getLogSwitcherClientRequest'},
    const {'1': 'getLogSwitcherClientResponse', '3': 6, '4': 1, '5': 11, '6': '.GetLogSwitcherClientResponse', '10': 'getLogSwitcherClientResponse'},
    const {'1': 'switcherClientRequest', '3': 7, '4': 1, '5': 11, '6': '.SwitcherClientRequest', '10': 'switcherClientRequest'},
    const {'1': 'switcherClientResponse', '3': 8, '4': 1, '5': 11, '6': '.SwitcherClientResponse', '10': 'switcherClientResponse'},
    const {'1': 'addSwitcherScheduleClientRequest', '3': 9, '4': 1, '5': 11, '6': '.AddSwitcherScheduleClientRequest', '10': 'addSwitcherScheduleClientRequest'},
    const {'1': 'addSwitcherScheduleClientResponse', '3': 10, '4': 1, '5': 11, '6': '.AddSwitcherScheduleClientResponse', '10': 'addSwitcherScheduleClientResponse'},
    const {'1': 'updateSwitcherScheduleClientRequest', '3': 11, '4': 1, '5': 11, '6': '.UpdateSwitcherScheduleClientRequest', '10': 'updateSwitcherScheduleClientRequest'},
    const {'1': 'updateSwitcherScheduleClientResponse', '3': 12, '4': 1, '5': 11, '6': '.UpdateSwitcherScheduleClientResponse', '10': 'updateSwitcherScheduleClientResponse'},
    const {'1': 'deleteSwitcherScheduleClientRequest', '3': 13, '4': 1, '5': 11, '6': '.DeleteSwitcherScheduleClientRequest', '10': 'deleteSwitcherScheduleClientRequest'},
    const {'1': 'deleteSwitcherScheduleClientResponse', '3': 14, '4': 1, '5': 11, '6': '.DeleteSwitcherScheduleClientResponse', '10': 'deleteSwitcherScheduleClientResponse'},
    const {'1': 'updateSwitcherClientRequest', '3': 15, '4': 1, '5': 11, '6': '.UpdateSwitcherClientRequest', '10': 'updateSwitcherClientRequest'},
    const {'1': 'updateSwitcherClientResponse', '3': 16, '4': 1, '5': 11, '6': '.UpdateSwitcherClientResponse', '10': 'updateSwitcherClientResponse'},
    const {'1': 'updateSwitcherState', '3': 17, '4': 1, '5': 11, '6': '.UpdateSwitcherState', '10': 'updateSwitcherState'},
  ],
};

/// Descriptor for `SwitcherClientMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List switcherClientMessageDescriptor = $convert.base64Decode('ChVTd2l0Y2hlckNsaWVudE1lc3NhZ2USWAoZZ2V0U3dpdGNoZXJzQ2xpZW50UmVxdWVzdBgBIAEoCzIaLkdldFN3aXRjaGVyc0NsaWVudFJlcXVlc3RSGWdldFN3aXRjaGVyc0NsaWVudFJlcXVlc3QSWwoaZ2V0U3dpdGNoZXJzQ2xpZW50UmVzcG9uc2UYAiABKAsyGy5HZXRTd2l0Y2hlcnNDbGllbnRSZXNwb25zZVIaZ2V0U3dpdGNoZXJzQ2xpZW50UmVzcG9uc2USVQoYZ2V0U3dpdGNoZXJDbGllbnRSZXF1ZXN0GAMgASgLMhkuR2V0U3dpdGNoZXJDbGllbnRSZXF1ZXN0UhhnZXRTd2l0Y2hlckNsaWVudFJlcXVlc3QSWAoZZ2V0U3dpdGNoZXJDbGllbnRSZXNwb25zZRgEIAEoCzIaLkdldFN3aXRjaGVyQ2xpZW50UmVzcG9uc2VSGWdldFN3aXRjaGVyQ2xpZW50UmVzcG9uc2USXgobZ2V0TG9nU3dpdGNoZXJDbGllbnRSZXF1ZXN0GAUgASgLMhwuR2V0TG9nU3dpdGNoZXJDbGllbnRSZXF1ZXN0UhtnZXRMb2dTd2l0Y2hlckNsaWVudFJlcXVlc3QSYQocZ2V0TG9nU3dpdGNoZXJDbGllbnRSZXNwb25zZRgGIAEoCzIdLkdldExvZ1N3aXRjaGVyQ2xpZW50UmVzcG9uc2VSHGdldExvZ1N3aXRjaGVyQ2xpZW50UmVzcG9uc2USTAoVc3dpdGNoZXJDbGllbnRSZXF1ZXN0GAcgASgLMhYuU3dpdGNoZXJDbGllbnRSZXF1ZXN0UhVzd2l0Y2hlckNsaWVudFJlcXVlc3QSTwoWc3dpdGNoZXJDbGllbnRSZXNwb25zZRgIIAEoCzIXLlN3aXRjaGVyQ2xpZW50UmVzcG9uc2VSFnN3aXRjaGVyQ2xpZW50UmVzcG9uc2USbQogYWRkU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlcXVlc3QYCSABKAsyIS5BZGRTd2l0Y2hlclNjaGVkdWxlQ2xpZW50UmVxdWVzdFIgYWRkU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlcXVlc3QScAohYWRkU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlc3BvbnNlGAogASgLMiIuQWRkU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlc3BvbnNlUiFhZGRTd2l0Y2hlclNjaGVkdWxlQ2xpZW50UmVzcG9uc2USdgojdXBkYXRlU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlcXVlc3QYCyABKAsyJC5VcGRhdGVTd2l0Y2hlclNjaGVkdWxlQ2xpZW50UmVxdWVzdFIjdXBkYXRlU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlcXVlc3QSeQokdXBkYXRlU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlc3BvbnNlGAwgASgLMiUuVXBkYXRlU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlc3BvbnNlUiR1cGRhdGVTd2l0Y2hlclNjaGVkdWxlQ2xpZW50UmVzcG9uc2USdgojZGVsZXRlU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlcXVlc3QYDSABKAsyJC5EZWxldGVTd2l0Y2hlclNjaGVkdWxlQ2xpZW50UmVxdWVzdFIjZGVsZXRlU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlcXVlc3QSeQokZGVsZXRlU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlc3BvbnNlGA4gASgLMiUuRGVsZXRlU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlc3BvbnNlUiRkZWxldGVTd2l0Y2hlclNjaGVkdWxlQ2xpZW50UmVzcG9uc2USXgobdXBkYXRlU3dpdGNoZXJDbGllbnRSZXF1ZXN0GA8gASgLMhwuVXBkYXRlU3dpdGNoZXJDbGllbnRSZXF1ZXN0Uht1cGRhdGVTd2l0Y2hlckNsaWVudFJlcXVlc3QSYQocdXBkYXRlU3dpdGNoZXJDbGllbnRSZXNwb25zZRgQIAEoCzIdLlVwZGF0ZVN3aXRjaGVyQ2xpZW50UmVzcG9uc2VSHHVwZGF0ZVN3aXRjaGVyQ2xpZW50UmVzcG9uc2USRgoTdXBkYXRlU3dpdGNoZXJTdGF0ZRgRIAEoCzIULlVwZGF0ZVN3aXRjaGVyU3RhdGVSE3VwZGF0ZVN3aXRjaGVyU3RhdGU=');
@$core.Deprecated('Use curtainSwitcherClientMessageDescriptor instead')
const CurtainSwitcherClientMessage$json = const {
  '1': 'CurtainSwitcherClientMessage',
  '2': const [
    const {'1': 'curtainSwitcherClientRequest', '3': 1, '4': 1, '5': 11, '6': '.CurtainSwitcherClientRequest', '10': 'curtainSwitcherClientRequest'},
    const {'1': 'curtainSwitcherClientResponse', '3': 2, '4': 1, '5': 11, '6': '.CurtainSwitcherClientResponse', '10': 'curtainSwitcherClientResponse'},
    const {'1': 'addCurtainSwitcherScheduleClientRequest', '3': 3, '4': 1, '5': 11, '6': '.AddCurtainSwitcherScheduleClientRequest', '10': 'addCurtainSwitcherScheduleClientRequest'},
    const {'1': 'addCurtainSwitcherScheduleClientResponse', '3': 4, '4': 1, '5': 11, '6': '.AddCurtainSwitcherScheduleClientResponse', '10': 'addCurtainSwitcherScheduleClientResponse'},
    const {'1': 'updateCurtainSwitcherScheduleClientRequest', '3': 5, '4': 1, '5': 11, '6': '.UpdateCurtainSwitcherScheduleClientRequest', '10': 'updateCurtainSwitcherScheduleClientRequest'},
    const {'1': 'updateCurtainSwitcherScheduleClientResponse', '3': 6, '4': 1, '5': 11, '6': '.UpdateCurtainSwitcherScheduleClientResponse', '10': 'updateCurtainSwitcherScheduleClientResponse'},
    const {'1': 'deleteCurtainSwitcherScheduleClientRequest', '3': 7, '4': 1, '5': 11, '6': '.DeleteCurtainSwitcherScheduleClientRequest', '10': 'deleteCurtainSwitcherScheduleClientRequest'},
    const {'1': 'deleteCurtainSwitcherScheduleClientResponse', '3': 8, '4': 1, '5': 11, '6': '.DeleteCurtainSwitcherScheduleClientResponse', '10': 'deleteCurtainSwitcherScheduleClientResponse'},
  ],
};

/// Descriptor for `CurtainSwitcherClientMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List curtainSwitcherClientMessageDescriptor = $convert.base64Decode('ChxDdXJ0YWluU3dpdGNoZXJDbGllbnRNZXNzYWdlEmEKHGN1cnRhaW5Td2l0Y2hlckNsaWVudFJlcXVlc3QYASABKAsyHS5DdXJ0YWluU3dpdGNoZXJDbGllbnRSZXF1ZXN0UhxjdXJ0YWluU3dpdGNoZXJDbGllbnRSZXF1ZXN0EmQKHWN1cnRhaW5Td2l0Y2hlckNsaWVudFJlc3BvbnNlGAIgASgLMh4uQ3VydGFpblN3aXRjaGVyQ2xpZW50UmVzcG9uc2VSHWN1cnRhaW5Td2l0Y2hlckNsaWVudFJlc3BvbnNlEoIBCidhZGRDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlcXVlc3QYAyABKAsyKC5BZGRDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlcXVlc3RSJ2FkZEN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlQ2xpZW50UmVxdWVzdBKFAQooYWRkQ3VydGFpblN3aXRjaGVyU2NoZWR1bGVDbGllbnRSZXNwb25zZRgEIAEoCzIpLkFkZEN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlQ2xpZW50UmVzcG9uc2VSKGFkZEN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlQ2xpZW50UmVzcG9uc2USiwEKKnVwZGF0ZUN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlQ2xpZW50UmVxdWVzdBgFIAEoCzIrLlVwZGF0ZUN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlQ2xpZW50UmVxdWVzdFIqdXBkYXRlQ3VydGFpblN3aXRjaGVyU2NoZWR1bGVDbGllbnRSZXF1ZXN0Eo4BCit1cGRhdGVDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlc3BvbnNlGAYgASgLMiwuVXBkYXRlQ3VydGFpblN3aXRjaGVyU2NoZWR1bGVDbGllbnRSZXNwb25zZVIrdXBkYXRlQ3VydGFpblN3aXRjaGVyU2NoZWR1bGVDbGllbnRSZXNwb25zZRKLAQoqZGVsZXRlQ3VydGFpblN3aXRjaGVyU2NoZWR1bGVDbGllbnRSZXF1ZXN0GAcgASgLMisuRGVsZXRlQ3VydGFpblN3aXRjaGVyU2NoZWR1bGVDbGllbnRSZXF1ZXN0UipkZWxldGVDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlcXVlc3QSjgEKK2RlbGV0ZUN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlQ2xpZW50UmVzcG9uc2UYCCABKAsyLC5EZWxldGVDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlc3BvbnNlUitkZWxldGVDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZUNsaWVudFJlc3BvbnNl');
@$core.Deprecated('Use airConditionerClientMessageDescriptor instead')
const AirConditionerClientMessage$json = const {
  '1': 'AirConditionerClientMessage',
  '2': const [
    const {'1': 'airConditionerClientRequest', '3': 1, '4': 1, '5': 11, '6': '.AirConditionerClientRequest', '10': 'airConditionerClientRequest'},
    const {'1': 'airConditionerClientResponse', '3': 2, '4': 1, '5': 11, '6': '.AirConditionerClientResponse', '10': 'airConditionerClientResponse'},
    const {'1': 'getAirConditionerClientRequest', '3': 3, '4': 1, '5': 11, '6': '.GetAirConditionerClientRequest', '10': 'getAirConditionerClientRequest'},
    const {'1': 'getAirConditionerClientResponse', '3': 4, '4': 1, '5': 11, '6': '.GetAirConditionerClientResponse', '10': 'getAirConditionerClientResponse'},
    const {'1': 'airConditionerAddIndoorsRequest', '3': 5, '4': 1, '5': 11, '6': '.AirConditionerAddIndoorsRequest', '10': 'airConditionerAddIndoorsRequest'},
    const {'1': 'airConditionerAddIndoorsResponse', '3': 6, '4': 1, '5': 11, '6': '.AirConditionerAddIndoorsResponse', '10': 'airConditionerAddIndoorsResponse'},
    const {'1': 'airConditionerRemoveIndoorRequest', '3': 7, '4': 1, '5': 11, '6': '.AirConditionerRemoveIndoorRequest', '10': 'airConditionerRemoveIndoorRequest'},
    const {'1': 'airConditionerRemoveIndoorResponse', '3': 8, '4': 1, '5': 11, '6': '.AirConditionerRemoveIndoorResponse', '10': 'airConditionerRemoveIndoorResponse'},
  ],
};

/// Descriptor for `AirConditionerClientMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List airConditionerClientMessageDescriptor = $convert.base64Decode('ChtBaXJDb25kaXRpb25lckNsaWVudE1lc3NhZ2USXgobYWlyQ29uZGl0aW9uZXJDbGllbnRSZXF1ZXN0GAEgASgLMhwuQWlyQ29uZGl0aW9uZXJDbGllbnRSZXF1ZXN0UhthaXJDb25kaXRpb25lckNsaWVudFJlcXVlc3QSYQocYWlyQ29uZGl0aW9uZXJDbGllbnRSZXNwb25zZRgCIAEoCzIdLkFpckNvbmRpdGlvbmVyQ2xpZW50UmVzcG9uc2VSHGFpckNvbmRpdGlvbmVyQ2xpZW50UmVzcG9uc2USZwoeZ2V0QWlyQ29uZGl0aW9uZXJDbGllbnRSZXF1ZXN0GAMgASgLMh8uR2V0QWlyQ29uZGl0aW9uZXJDbGllbnRSZXF1ZXN0Uh5nZXRBaXJDb25kaXRpb25lckNsaWVudFJlcXVlc3QSagofZ2V0QWlyQ29uZGl0aW9uZXJDbGllbnRSZXNwb25zZRgEIAEoCzIgLkdldEFpckNvbmRpdGlvbmVyQ2xpZW50UmVzcG9uc2VSH2dldEFpckNvbmRpdGlvbmVyQ2xpZW50UmVzcG9uc2USagofYWlyQ29uZGl0aW9uZXJBZGRJbmRvb3JzUmVxdWVzdBgFIAEoCzIgLkFpckNvbmRpdGlvbmVyQWRkSW5kb29yc1JlcXVlc3RSH2FpckNvbmRpdGlvbmVyQWRkSW5kb29yc1JlcXVlc3QSbQogYWlyQ29uZGl0aW9uZXJBZGRJbmRvb3JzUmVzcG9uc2UYBiABKAsyIS5BaXJDb25kaXRpb25lckFkZEluZG9vcnNSZXNwb25zZVIgYWlyQ29uZGl0aW9uZXJBZGRJbmRvb3JzUmVzcG9uc2UScAohYWlyQ29uZGl0aW9uZXJSZW1vdmVJbmRvb3JSZXF1ZXN0GAcgASgLMiIuQWlyQ29uZGl0aW9uZXJSZW1vdmVJbmRvb3JSZXF1ZXN0UiFhaXJDb25kaXRpb25lclJlbW92ZUluZG9vclJlcXVlc3QScwoiYWlyQ29uZGl0aW9uZXJSZW1vdmVJbmRvb3JSZXNwb25zZRgIIAEoCzIjLkFpckNvbmRpdGlvbmVyUmVtb3ZlSW5kb29yUmVzcG9uc2VSImFpckNvbmRpdGlvbmVyUmVtb3ZlSW5kb29yUmVzcG9uc2U=');
@$core.Deprecated('Use remoteClientMessageDescriptor instead')
const RemoteClientMessage$json = const {
  '1': 'RemoteClientMessage',
  '2': const [
    const {'1': 'sendCommandRemoteClientRequest', '3': 1, '4': 1, '5': 11, '6': '.SendCommandRemoteClientRequest', '10': 'sendCommandRemoteClientRequest'},
    const {'1': 'sendCommandRemoteClientResponse', '3': 2, '4': 1, '5': 11, '6': '.SendCommandRemoteClientResponse', '10': 'sendCommandRemoteClientResponse'},
    const {'1': 'learnCommandRemoteClientRequest', '3': 3, '4': 1, '5': 11, '6': '.LearnCommandRemoteClientRequest', '10': 'learnCommandRemoteClientRequest'},
    const {'1': 'learnCommandRemoteClientResponse', '3': 4, '4': 1, '5': 11, '6': '.LearnCommandRemoteClientResponse', '10': 'learnCommandRemoteClientResponse'},
    const {'1': 'controlRemoteACCommandClientRequest', '3': 5, '4': 1, '5': 11, '6': '.ControlRemoteACCommandClientRequest', '10': 'controlRemoteACCommandClientRequest'},
    const {'1': 'controlRemoteACCommandClientResponse', '3': 6, '4': 1, '5': 11, '6': '.ControlRemoteACCommandClientResponse', '10': 'controlRemoteACCommandClientResponse'},
  ],
};

/// Descriptor for `RemoteClientMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteClientMessageDescriptor = $convert.base64Decode('ChNSZW1vdGVDbGllbnRNZXNzYWdlEmcKHnNlbmRDb21tYW5kUmVtb3RlQ2xpZW50UmVxdWVzdBgBIAEoCzIfLlNlbmRDb21tYW5kUmVtb3RlQ2xpZW50UmVxdWVzdFIec2VuZENvbW1hbmRSZW1vdGVDbGllbnRSZXF1ZXN0EmoKH3NlbmRDb21tYW5kUmVtb3RlQ2xpZW50UmVzcG9uc2UYAiABKAsyIC5TZW5kQ29tbWFuZFJlbW90ZUNsaWVudFJlc3BvbnNlUh9zZW5kQ29tbWFuZFJlbW90ZUNsaWVudFJlc3BvbnNlEmoKH2xlYXJuQ29tbWFuZFJlbW90ZUNsaWVudFJlcXVlc3QYAyABKAsyIC5MZWFybkNvbW1hbmRSZW1vdGVDbGllbnRSZXF1ZXN0Uh9sZWFybkNvbW1hbmRSZW1vdGVDbGllbnRSZXF1ZXN0Em0KIGxlYXJuQ29tbWFuZFJlbW90ZUNsaWVudFJlc3BvbnNlGAQgASgLMiEuTGVhcm5Db21tYW5kUmVtb3RlQ2xpZW50UmVzcG9uc2VSIGxlYXJuQ29tbWFuZFJlbW90ZUNsaWVudFJlc3BvbnNlEnYKI2NvbnRyb2xSZW1vdGVBQ0NvbW1hbmRDbGllbnRSZXF1ZXN0GAUgASgLMiQuQ29udHJvbFJlbW90ZUFDQ29tbWFuZENsaWVudFJlcXVlc3RSI2NvbnRyb2xSZW1vdGVBQ0NvbW1hbmRDbGllbnRSZXF1ZXN0EnkKJGNvbnRyb2xSZW1vdGVBQ0NvbW1hbmRDbGllbnRSZXNwb25zZRgGIAEoCzIlLkNvbnRyb2xSZW1vdGVBQ0NvbW1hbmRDbGllbnRSZXNwb25zZVIkY29udHJvbFJlbW90ZUFDQ29tbWFuZENsaWVudFJlc3BvbnNl');
@$core.Deprecated('Use onChangedClientMessageDescriptor instead')
const OnChangedClientMessage$json = const {
  '1': 'OnChangedClientMessage',
  '2': const [
    const {'1': 'meterOnChangedClientResponse', '3': 1, '4': 1, '5': 11, '6': '.MeterOnChangedClientResponse', '10': 'meterOnChangedClientResponse'},
    const {'1': 'switcherOnChangedClientResponse', '3': 2, '4': 1, '5': 11, '6': '.SwitcherOnChangedClientResponse', '10': 'switcherOnChangedClientResponse'},
    const {'1': 'curtainSwitcherOnChangedClientResponse', '3': 3, '4': 1, '5': 11, '6': '.CurtainSwitcherOnChangedClientResponse', '10': 'curtainSwitcherOnChangedClientResponse'},
    const {'1': 'airConditionerOnChangedClientResponse', '3': 4, '4': 1, '5': 11, '6': '.AirConditionerOnChangedClientResponse', '10': 'airConditionerOnChangedClientResponse'},
    const {'1': 'progressUpdateFirmwareOnChangedDeviceClientResponse', '3': 5, '4': 1, '5': 11, '6': '.ProgressUpdateFirmwareOnChangedDeviceClientResponse', '10': 'progressUpdateFirmwareOnChangedDeviceClientResponse'},
    const {'1': 'deviceOnChangedDeviceClientResponse', '3': 6, '4': 1, '5': 11, '6': '.DeviceOnChangedDeviceClientResponse', '10': 'deviceOnChangedDeviceClientResponse'},
    const {'1': 'motionOnChangedClientResponse', '3': 7, '4': 1, '5': 11, '6': '.MotionOnChangedClientResponse', '10': 'motionOnChangedClientResponse'},
    const {'1': 'homekitOnChangedClientResponse', '3': 8, '4': 1, '5': 11, '6': '.HomekitOnChangedClientResponse', '10': 'homekitOnChangedClientResponse'},
    const {'1': 'buttonOnChangedClientResponse', '3': 9, '4': 1, '5': 11, '6': '.ButtonOnChangedClientResponse', '10': 'buttonOnChangedClientResponse'},
    const {'1': 'debugLoggingResponse', '3': 10, '4': 1, '5': 11, '6': '.DebugLoggingResponse', '10': 'debugLoggingResponse'},
    const {'1': 'ledDriverOnChangedClientResponse', '3': 11, '4': 1, '5': 11, '6': '.LedDriverOnChangedClientResponse', '10': 'ledDriverOnChangedClientResponse'},
    const {'1': 'environmentOnchangedClientResponse', '3': 12, '4': 1, '5': 11, '6': '.EnvironmentOnchangedClientResponse', '10': 'environmentOnchangedClientResponse'},
    const {'1': 'smartPlugOnchangedClientResponse', '3': 13, '4': 1, '5': 11, '6': '.SmartPlugOnchangedClientResponse', '10': 'smartPlugOnchangedClientResponse'},
    const {'1': 'curtainOnChangedClientResponse', '3': 14, '4': 1, '5': 11, '6': '.CurtainOnChangedClientResponse', '10': 'curtainOnChangedClientResponse'},
    const {'1': 'touchPanelControlSwitchOnChangedClientResponse', '3': 15, '4': 1, '5': 11, '6': '.TouchPanelControlSwitchOnChangedClientResponse', '10': 'touchPanelControlSwitchOnChangedClientResponse'},
    const {'1': 'touchPanelControlCurtainSwitchOnChangedClientResponse', '3': 16, '4': 1, '5': 11, '6': '.TouchPanelControlCurtainSwitchOnChangedClientResponse', '10': 'touchPanelControlCurtainSwitchOnChangedClientResponse'},
    const {'1': 'touchPanelControlSceneOnChangedClientResponse', '3': 17, '4': 1, '5': 11, '6': '.TouchPanelControlSceneOnChangedClientResponse', '10': 'touchPanelControlSceneOnChangedClientResponse'},
    const {'1': 'touchPanelControlLedDriverOnChangedClientResponse', '3': 18, '4': 1, '5': 11, '6': '.TouchPanelControlLedDriverOnChangedClientResponse', '10': 'touchPanelControlLedDriverOnChangedClientResponse'},
    const {'1': 'touchPanelRequestComponentStateOnChangedClientResponse', '3': 19, '4': 1, '5': 11, '6': '.TouchPanelRequestComponentStateOnChangedClientResponse', '10': 'touchPanelRequestComponentStateOnChangedClientResponse'},
  ],
};

/// Descriptor for `OnChangedClientMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List onChangedClientMessageDescriptor = $convert.base64Decode('ChZPbkNoYW5nZWRDbGllbnRNZXNzYWdlEmEKHG1ldGVyT25DaGFuZ2VkQ2xpZW50UmVzcG9uc2UYASABKAsyHS5NZXRlck9uQ2hhbmdlZENsaWVudFJlc3BvbnNlUhxtZXRlck9uQ2hhbmdlZENsaWVudFJlc3BvbnNlEmoKH3N3aXRjaGVyT25DaGFuZ2VkQ2xpZW50UmVzcG9uc2UYAiABKAsyIC5Td2l0Y2hlck9uQ2hhbmdlZENsaWVudFJlc3BvbnNlUh9zd2l0Y2hlck9uQ2hhbmdlZENsaWVudFJlc3BvbnNlEn8KJmN1cnRhaW5Td2l0Y2hlck9uQ2hhbmdlZENsaWVudFJlc3BvbnNlGAMgASgLMicuQ3VydGFpblN3aXRjaGVyT25DaGFuZ2VkQ2xpZW50UmVzcG9uc2VSJmN1cnRhaW5Td2l0Y2hlck9uQ2hhbmdlZENsaWVudFJlc3BvbnNlEnwKJWFpckNvbmRpdGlvbmVyT25DaGFuZ2VkQ2xpZW50UmVzcG9uc2UYBCABKAsyJi5BaXJDb25kaXRpb25lck9uQ2hhbmdlZENsaWVudFJlc3BvbnNlUiVhaXJDb25kaXRpb25lck9uQ2hhbmdlZENsaWVudFJlc3BvbnNlEqYBCjNwcm9ncmVzc1VwZGF0ZUZpcm13YXJlT25DaGFuZ2VkRGV2aWNlQ2xpZW50UmVzcG9uc2UYBSABKAsyNC5Qcm9ncmVzc1VwZGF0ZUZpcm13YXJlT25DaGFuZ2VkRGV2aWNlQ2xpZW50UmVzcG9uc2VSM3Byb2dyZXNzVXBkYXRlRmlybXdhcmVPbkNoYW5nZWREZXZpY2VDbGllbnRSZXNwb25zZRJ2CiNkZXZpY2VPbkNoYW5nZWREZXZpY2VDbGllbnRSZXNwb25zZRgGIAEoCzIkLkRldmljZU9uQ2hhbmdlZERldmljZUNsaWVudFJlc3BvbnNlUiNkZXZpY2VPbkNoYW5nZWREZXZpY2VDbGllbnRSZXNwb25zZRJkCh1tb3Rpb25PbkNoYW5nZWRDbGllbnRSZXNwb25zZRgHIAEoCzIeLk1vdGlvbk9uQ2hhbmdlZENsaWVudFJlc3BvbnNlUh1tb3Rpb25PbkNoYW5nZWRDbGllbnRSZXNwb25zZRJnCh5ob21la2l0T25DaGFuZ2VkQ2xpZW50UmVzcG9uc2UYCCABKAsyHy5Ib21la2l0T25DaGFuZ2VkQ2xpZW50UmVzcG9uc2VSHmhvbWVraXRPbkNoYW5nZWRDbGllbnRSZXNwb25zZRJkCh1idXR0b25PbkNoYW5nZWRDbGllbnRSZXNwb25zZRgJIAEoCzIeLkJ1dHRvbk9uQ2hhbmdlZENsaWVudFJlc3BvbnNlUh1idXR0b25PbkNoYW5nZWRDbGllbnRSZXNwb25zZRJJChRkZWJ1Z0xvZ2dpbmdSZXNwb25zZRgKIAEoCzIVLkRlYnVnTG9nZ2luZ1Jlc3BvbnNlUhRkZWJ1Z0xvZ2dpbmdSZXNwb25zZRJtCiBsZWREcml2ZXJPbkNoYW5nZWRDbGllbnRSZXNwb25zZRgLIAEoCzIhLkxlZERyaXZlck9uQ2hhbmdlZENsaWVudFJlc3BvbnNlUiBsZWREcml2ZXJPbkNoYW5nZWRDbGllbnRSZXNwb25zZRJzCiJlbnZpcm9ubWVudE9uY2hhbmdlZENsaWVudFJlc3BvbnNlGAwgASgLMiMuRW52aXJvbm1lbnRPbmNoYW5nZWRDbGllbnRSZXNwb25zZVIiZW52aXJvbm1lbnRPbmNoYW5nZWRDbGllbnRSZXNwb25zZRJtCiBzbWFydFBsdWdPbmNoYW5nZWRDbGllbnRSZXNwb25zZRgNIAEoCzIhLlNtYXJ0UGx1Z09uY2hhbmdlZENsaWVudFJlc3BvbnNlUiBzbWFydFBsdWdPbmNoYW5nZWRDbGllbnRSZXNwb25zZRJnCh5jdXJ0YWluT25DaGFuZ2VkQ2xpZW50UmVzcG9uc2UYDiABKAsyHy5DdXJ0YWluT25DaGFuZ2VkQ2xpZW50UmVzcG9uc2VSHmN1cnRhaW5PbkNoYW5nZWRDbGllbnRSZXNwb25zZRKXAQoudG91Y2hQYW5lbENvbnRyb2xTd2l0Y2hPbkNoYW5nZWRDbGllbnRSZXNwb25zZRgPIAEoCzIvLlRvdWNoUGFuZWxDb250cm9sU3dpdGNoT25DaGFuZ2VkQ2xpZW50UmVzcG9uc2VSLnRvdWNoUGFuZWxDb250cm9sU3dpdGNoT25DaGFuZ2VkQ2xpZW50UmVzcG9uc2USrAEKNXRvdWNoUGFuZWxDb250cm9sQ3VydGFpblN3aXRjaE9uQ2hhbmdlZENsaWVudFJlc3BvbnNlGBAgASgLMjYuVG91Y2hQYW5lbENvbnRyb2xDdXJ0YWluU3dpdGNoT25DaGFuZ2VkQ2xpZW50UmVzcG9uc2VSNXRvdWNoUGFuZWxDb250cm9sQ3VydGFpblN3aXRjaE9uQ2hhbmdlZENsaWVudFJlc3BvbnNlEpQBCi10b3VjaFBhbmVsQ29udHJvbFNjZW5lT25DaGFuZ2VkQ2xpZW50UmVzcG9uc2UYESABKAsyLi5Ub3VjaFBhbmVsQ29udHJvbFNjZW5lT25DaGFuZ2VkQ2xpZW50UmVzcG9uc2VSLXRvdWNoUGFuZWxDb250cm9sU2NlbmVPbkNoYW5nZWRDbGllbnRSZXNwb25zZRKgAQoxdG91Y2hQYW5lbENvbnRyb2xMZWREcml2ZXJPbkNoYW5nZWRDbGllbnRSZXNwb25zZRgSIAEoCzIyLlRvdWNoUGFuZWxDb250cm9sTGVkRHJpdmVyT25DaGFuZ2VkQ2xpZW50UmVzcG9uc2VSMXRvdWNoUGFuZWxDb250cm9sTGVkRHJpdmVyT25DaGFuZ2VkQ2xpZW50UmVzcG9uc2USrwEKNnRvdWNoUGFuZWxSZXF1ZXN0Q29tcG9uZW50U3RhdGVPbkNoYW5nZWRDbGllbnRSZXNwb25zZRgTIAEoCzI3LlRvdWNoUGFuZWxSZXF1ZXN0Q29tcG9uZW50U3RhdGVPbkNoYW5nZWRDbGllbnRSZXNwb25zZVI2dG91Y2hQYW5lbFJlcXVlc3RDb21wb25lbnRTdGF0ZU9uQ2hhbmdlZENsaWVudFJlc3BvbnNl');
@$core.Deprecated('Use motionClientMessageDescriptor instead')
const MotionClientMessage$json = const {
  '1': 'MotionClientMessage',
  '2': const [
    const {'1': 'motionClientRequest', '3': 1, '4': 1, '5': 11, '6': '.MotionClientRequest', '10': 'motionClientRequest'},
    const {'1': 'motionClientResponse', '3': 2, '4': 1, '5': 11, '6': '.MotionClientResponse', '10': 'motionClientResponse'},
    const {'1': 'updateMotionState', '3': 3, '4': 1, '5': 11, '6': '.UpdateMotionState', '10': 'updateMotionState'},
  ],
};

/// Descriptor for `MotionClientMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List motionClientMessageDescriptor = $convert.base64Decode('ChNNb3Rpb25DbGllbnRNZXNzYWdlEkYKE21vdGlvbkNsaWVudFJlcXVlc3QYASABKAsyFC5Nb3Rpb25DbGllbnRSZXF1ZXN0UhNtb3Rpb25DbGllbnRSZXF1ZXN0EkkKFG1vdGlvbkNsaWVudFJlc3BvbnNlGAIgASgLMhUuTW90aW9uQ2xpZW50UmVzcG9uc2VSFG1vdGlvbkNsaWVudFJlc3BvbnNlEkAKEXVwZGF0ZU1vdGlvblN0YXRlGAMgASgLMhIuVXBkYXRlTW90aW9uU3RhdGVSEXVwZGF0ZU1vdGlvblN0YXRl');
@$core.Deprecated('Use sceneClientMessageDescriptor instead')
const SceneClientMessage$json = const {
  '1': 'SceneClientMessage',
  '2': const [
    const {'1': 'sceneClientRequest', '3': 1, '4': 1, '5': 11, '6': '.SceneClientRequest', '10': 'sceneClientRequest'},
    const {'1': 'sceneClientResponse', '3': 2, '4': 1, '5': 11, '6': '.SceneClientResponse', '10': 'sceneClientResponse'},
    const {'1': 'sceneGroupClientRequest', '3': 3, '4': 1, '5': 11, '6': '.SceneGroupClientRequest', '10': 'sceneGroupClientRequest'},
  ],
};

/// Descriptor for `SceneClientMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneClientMessageDescriptor = $convert.base64Decode('ChJTY2VuZUNsaWVudE1lc3NhZ2USQwoSc2NlbmVDbGllbnRSZXF1ZXN0GAEgASgLMhMuU2NlbmVDbGllbnRSZXF1ZXN0UhJzY2VuZUNsaWVudFJlcXVlc3QSRgoTc2NlbmVDbGllbnRSZXNwb25zZRgCIAEoCzIULlNjZW5lQ2xpZW50UmVzcG9uc2VSE3NjZW5lQ2xpZW50UmVzcG9uc2USUgoXc2NlbmVHcm91cENsaWVudFJlcXVlc3QYAyABKAsyGC5TY2VuZUdyb3VwQ2xpZW50UmVxdWVzdFIXc2NlbmVHcm91cENsaWVudFJlcXVlc3Q=');
@$core.Deprecated('Use ledDriverClientMessageDescriptor instead')
const LedDriverClientMessage$json = const {
  '1': 'LedDriverClientMessage',
  '2': const [
    const {'1': 'ledDriverClientRequest', '3': 1, '4': 1, '5': 11, '6': '.LedDriverClientRequest', '10': 'ledDriverClientRequest'},
    const {'1': 'ledDriverClientResponse', '3': 2, '4': 1, '5': 11, '6': '.LedDriverClientResponse', '10': 'ledDriverClientResponse'},
  ],
};

/// Descriptor for `LedDriverClientMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ledDriverClientMessageDescriptor = $convert.base64Decode('ChZMZWREcml2ZXJDbGllbnRNZXNzYWdlEk8KFmxlZERyaXZlckNsaWVudFJlcXVlc3QYASABKAsyFy5MZWREcml2ZXJDbGllbnRSZXF1ZXN0UhZsZWREcml2ZXJDbGllbnRSZXF1ZXN0ElIKF2xlZERyaXZlckNsaWVudFJlc3BvbnNlGAIgASgLMhguTGVkRHJpdmVyQ2xpZW50UmVzcG9uc2VSF2xlZERyaXZlckNsaWVudFJlc3BvbnNl');
@$core.Deprecated('Use meterClientMessageDescriptor instead')
const MeterClientMessage$json = const {
  '1': 'MeterClientMessage',
  '2': const [
    const {'1': 'meterClientRequest', '3': 1, '4': 1, '5': 11, '6': '.MeterClientRequest', '10': 'meterClientRequest'},
    const {'1': 'meterClientResponse', '3': 2, '4': 1, '5': 11, '6': '.MeterClientResponse', '10': 'meterClientResponse'},
    const {'1': 'MeterClientConfirm', '3': 3, '4': 1, '5': 11, '6': '.MeterClientConfirm', '10': 'MeterClientConfirm'},
  ],
};

/// Descriptor for `MeterClientMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List meterClientMessageDescriptor = $convert.base64Decode('ChJNZXRlckNsaWVudE1lc3NhZ2USQwoSbWV0ZXJDbGllbnRSZXF1ZXN0GAEgASgLMhMuTWV0ZXJDbGllbnRSZXF1ZXN0UhJtZXRlckNsaWVudFJlcXVlc3QSRgoTbWV0ZXJDbGllbnRSZXNwb25zZRgCIAEoCzIULk1ldGVyQ2xpZW50UmVzcG9uc2VSE21ldGVyQ2xpZW50UmVzcG9uc2USQwoSTWV0ZXJDbGllbnRDb25maXJtGAMgASgLMhMuTWV0ZXJDbGllbnRDb25maXJtUhJNZXRlckNsaWVudENvbmZpcm0=');
@$core.Deprecated('Use homekitClientMessageDescriptor instead')
const HomekitClientMessage$json = const {
  '1': 'HomekitClientMessage',
  '2': const [
    const {'1': 'setHomekitModeClientRequest', '3': 1, '4': 1, '5': 11, '6': '.SetHomekitModeClientRequest', '10': 'setHomekitModeClientRequest'},
    const {'1': 'setHomekitModeClientResponse', '3': 2, '4': 1, '5': 11, '6': '.SetHomekitModeClientResponse', '10': 'setHomekitModeClientResponse'},
  ],
};

/// Descriptor for `HomekitClientMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List homekitClientMessageDescriptor = $convert.base64Decode('ChRIb21la2l0Q2xpZW50TWVzc2FnZRJeChtzZXRIb21la2l0TW9kZUNsaWVudFJlcXVlc3QYASABKAsyHC5TZXRIb21la2l0TW9kZUNsaWVudFJlcXVlc3RSG3NldEhvbWVraXRNb2RlQ2xpZW50UmVxdWVzdBJhChxzZXRIb21la2l0TW9kZUNsaWVudFJlc3BvbnNlGAIgASgLMh0uU2V0SG9tZWtpdE1vZGVDbGllbnRSZXNwb25zZVIcc2V0SG9tZWtpdE1vZGVDbGllbnRSZXNwb25zZQ==');
@$core.Deprecated('Use sceneTriggerClientMessageDescriptor instead')
const SceneTriggerClientMessage$json = const {
  '1': 'SceneTriggerClientMessage',
  '2': const [
    const {'1': 'sceneTriggerClientRequest', '3': 1, '4': 1, '5': 11, '6': '.SceneTriggerClientRequest', '10': 'sceneTriggerClientRequest'},
    const {'1': 'sceneTriggerClientResponse', '3': 2, '4': 1, '5': 11, '6': '.SceneTriggerClientResponse', '10': 'sceneTriggerClientResponse'},
  ],
};

/// Descriptor for `SceneTriggerClientMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneTriggerClientMessageDescriptor = $convert.base64Decode('ChlTY2VuZVRyaWdnZXJDbGllbnRNZXNzYWdlElgKGXNjZW5lVHJpZ2dlckNsaWVudFJlcXVlc3QYASABKAsyGi5TY2VuZVRyaWdnZXJDbGllbnRSZXF1ZXN0UhlzY2VuZVRyaWdnZXJDbGllbnRSZXF1ZXN0ElsKGnNjZW5lVHJpZ2dlckNsaWVudFJlc3BvbnNlGAIgASgLMhsuU2NlbmVUcmlnZ2VyQ2xpZW50UmVzcG9uc2VSGnNjZW5lVHJpZ2dlckNsaWVudFJlc3BvbnNl');
@$core.Deprecated('Use curtainClientMessageDescriptor instead')
const CurtainClientMessage$json = const {
  '1': 'CurtainClientMessage',
  '2': const [
    const {'1': 'curtainClientRequest', '3': 1, '4': 1, '5': 11, '6': '.CurtainClientRequest', '10': 'curtainClientRequest'},
    const {'1': 'curtainClientResponse', '3': 2, '4': 1, '5': 11, '6': '.CurtainClientResponse', '10': 'curtainClientResponse'},
  ],
};

/// Descriptor for `CurtainClientMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List curtainClientMessageDescriptor = $convert.base64Decode('ChRDdXJ0YWluQ2xpZW50TWVzc2FnZRJJChRjdXJ0YWluQ2xpZW50UmVxdWVzdBgBIAEoCzIVLkN1cnRhaW5DbGllbnRSZXF1ZXN0UhRjdXJ0YWluQ2xpZW50UmVxdWVzdBJMChVjdXJ0YWluQ2xpZW50UmVzcG9uc2UYAiABKAsyFi5DdXJ0YWluQ2xpZW50UmVzcG9uc2VSFWN1cnRhaW5DbGllbnRSZXNwb25zZQ==');
@$core.Deprecated('Use touchPanelClientMessageDescriptor instead')
const TouchPanelClientMessage$json = const {
  '1': 'TouchPanelClientMessage',
  '2': const [
    const {'1': 'touchPanelChangeComponentClientRequest', '3': 1, '4': 1, '5': 11, '6': '.TouchPanelChangeComponentClientRequest', '10': 'touchPanelChangeComponentClientRequest'},
    const {'1': 'touchPanelControlSwitcherClientRequest', '3': 2, '4': 1, '5': 11, '6': '.TouchPanelControlSwitcherClientRequest', '10': 'touchPanelControlSwitcherClientRequest'},
    const {'1': 'touchPanelUpdateSwitcherClientRequest', '3': 3, '4': 1, '5': 11, '6': '.TouchPanelUpdateSwitcherClientRequest', '10': 'touchPanelUpdateSwitcherClientRequest'},
    const {'1': 'touchPanelControlCurtainSwitcherClientRequest', '3': 4, '4': 1, '5': 11, '6': '.TouchPanelControlCurtainSwitcherClientRequest', '10': 'touchPanelControlCurtainSwitcherClientRequest'},
    const {'1': 'touchPanelUpdateCurtainSwitcherClientRequest', '3': 5, '4': 1, '5': 11, '6': '.TouchPanelUpdateCurtainSwitcherClientRequest', '10': 'touchPanelUpdateCurtainSwitcherClientRequest'},
    const {'1': 'touchPanelUpdateSceneClientRequest', '3': 6, '4': 1, '5': 11, '6': '.TouchPanelUpdateSceneClientRequest', '10': 'touchPanelUpdateSceneClientRequest'},
    const {'1': 'touchPanelControlLedDriverClientRequest', '3': 7, '4': 1, '5': 11, '6': '.TouchPanelControlLedDriverClientRequest', '10': 'touchPanelControlLedDriverClientRequest'},
    const {'1': 'touchPanelUpdateLedDriverClientRequest', '3': 8, '4': 1, '5': 11, '6': '.TouchPanelUpdateLedDriverClientRequest', '10': 'touchPanelUpdateLedDriverClientRequest'},
  ],
};

/// Descriptor for `TouchPanelClientMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelClientMessageDescriptor = $convert.base64Decode('ChdUb3VjaFBhbmVsQ2xpZW50TWVzc2FnZRJ/CiZ0b3VjaFBhbmVsQ2hhbmdlQ29tcG9uZW50Q2xpZW50UmVxdWVzdBgBIAEoCzInLlRvdWNoUGFuZWxDaGFuZ2VDb21wb25lbnRDbGllbnRSZXF1ZXN0UiZ0b3VjaFBhbmVsQ2hhbmdlQ29tcG9uZW50Q2xpZW50UmVxdWVzdBJ/CiZ0b3VjaFBhbmVsQ29udHJvbFN3aXRjaGVyQ2xpZW50UmVxdWVzdBgCIAEoCzInLlRvdWNoUGFuZWxDb250cm9sU3dpdGNoZXJDbGllbnRSZXF1ZXN0UiZ0b3VjaFBhbmVsQ29udHJvbFN3aXRjaGVyQ2xpZW50UmVxdWVzdBJ8CiV0b3VjaFBhbmVsVXBkYXRlU3dpdGNoZXJDbGllbnRSZXF1ZXN0GAMgASgLMiYuVG91Y2hQYW5lbFVwZGF0ZVN3aXRjaGVyQ2xpZW50UmVxdWVzdFIldG91Y2hQYW5lbFVwZGF0ZVN3aXRjaGVyQ2xpZW50UmVxdWVzdBKUAQotdG91Y2hQYW5lbENvbnRyb2xDdXJ0YWluU3dpdGNoZXJDbGllbnRSZXF1ZXN0GAQgASgLMi4uVG91Y2hQYW5lbENvbnRyb2xDdXJ0YWluU3dpdGNoZXJDbGllbnRSZXF1ZXN0Ui10b3VjaFBhbmVsQ29udHJvbEN1cnRhaW5Td2l0Y2hlckNsaWVudFJlcXVlc3QSkQEKLHRvdWNoUGFuZWxVcGRhdGVDdXJ0YWluU3dpdGNoZXJDbGllbnRSZXF1ZXN0GAUgASgLMi0uVG91Y2hQYW5lbFVwZGF0ZUN1cnRhaW5Td2l0Y2hlckNsaWVudFJlcXVlc3RSLHRvdWNoUGFuZWxVcGRhdGVDdXJ0YWluU3dpdGNoZXJDbGllbnRSZXF1ZXN0EnMKInRvdWNoUGFuZWxVcGRhdGVTY2VuZUNsaWVudFJlcXVlc3QYBiABKAsyIy5Ub3VjaFBhbmVsVXBkYXRlU2NlbmVDbGllbnRSZXF1ZXN0UiJ0b3VjaFBhbmVsVXBkYXRlU2NlbmVDbGllbnRSZXF1ZXN0EoIBCid0b3VjaFBhbmVsQ29udHJvbExlZERyaXZlckNsaWVudFJlcXVlc3QYByABKAsyKC5Ub3VjaFBhbmVsQ29udHJvbExlZERyaXZlckNsaWVudFJlcXVlc3RSJ3RvdWNoUGFuZWxDb250cm9sTGVkRHJpdmVyQ2xpZW50UmVxdWVzdBJ/CiZ0b3VjaFBhbmVsVXBkYXRlTGVkRHJpdmVyQ2xpZW50UmVxdWVzdBgIIAEoCzInLlRvdWNoUGFuZWxVcGRhdGVMZWREcml2ZXJDbGllbnRSZXF1ZXN0UiZ0b3VjaFBhbmVsVXBkYXRlTGVkRHJpdmVyQ2xpZW50UmVxdWVzdA==');
@$core.Deprecated('Use clientMessageDescriptor instead')
const ClientMessage$json = const {
  '1': 'ClientMessage',
  '2': const [
    const {'1': 'deviceClientMessage', '3': 1, '4': 1, '5': 11, '6': '.DeviceClientMessage', '10': 'deviceClientMessage'},
    const {'1': 'switcherClientMessage', '3': 2, '4': 1, '5': 11, '6': '.SwitcherClientMessage', '10': 'switcherClientMessage'},
    const {'1': 'curtainSwitcherClientMessage', '3': 3, '4': 1, '5': 11, '6': '.CurtainSwitcherClientMessage', '10': 'curtainSwitcherClientMessage'},
    const {'1': 'airConditionerClientMessage', '3': 4, '4': 1, '5': 11, '6': '.AirConditionerClientMessage', '10': 'airConditionerClientMessage'},
    const {'1': 'remoteClientMessage', '3': 5, '4': 1, '5': 11, '6': '.RemoteClientMessage', '10': 'remoteClientMessage'},
    const {'1': 'onChangedClientMessage', '3': 6, '4': 1, '5': 11, '6': '.OnChangedClientMessage', '10': 'onChangedClientMessage'},
    const {'1': 'motionClientMessage', '3': 7, '4': 1, '5': 11, '6': '.MotionClientMessage', '10': 'motionClientMessage'},
    const {'1': 'sceneClientMessage', '3': 8, '4': 1, '5': 11, '6': '.SceneClientMessage', '10': 'sceneClientMessage'},
    const {'1': 'ledDriverClientMessage', '3': 9, '4': 1, '5': 11, '6': '.LedDriverClientMessage', '10': 'ledDriverClientMessage'},
    const {'1': 'meterClientMessage', '3': 10, '4': 1, '5': 11, '6': '.MeterClientMessage', '10': 'meterClientMessage'},
    const {'1': 'homekitClientMessage', '3': 11, '4': 1, '5': 11, '6': '.HomekitClientMessage', '10': 'homekitClientMessage'},
    const {'1': 'sceneTriggerClientMessage', '3': 12, '4': 1, '5': 11, '6': '.SceneTriggerClientMessage', '10': 'sceneTriggerClientMessage'},
    const {'1': 'curtainClientMessage', '3': 13, '4': 1, '5': 11, '6': '.CurtainClientMessage', '10': 'curtainClientMessage'},
    const {'1': 'touchPanelClientMessage', '3': 14, '4': 1, '5': 11, '6': '.TouchPanelClientMessage', '10': 'touchPanelClientMessage'},
  ],
};

/// Descriptor for `ClientMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientMessageDescriptor = $convert.base64Decode('Cg1DbGllbnRNZXNzYWdlEkYKE2RldmljZUNsaWVudE1lc3NhZ2UYASABKAsyFC5EZXZpY2VDbGllbnRNZXNzYWdlUhNkZXZpY2VDbGllbnRNZXNzYWdlEkwKFXN3aXRjaGVyQ2xpZW50TWVzc2FnZRgCIAEoCzIWLlN3aXRjaGVyQ2xpZW50TWVzc2FnZVIVc3dpdGNoZXJDbGllbnRNZXNzYWdlEmEKHGN1cnRhaW5Td2l0Y2hlckNsaWVudE1lc3NhZ2UYAyABKAsyHS5DdXJ0YWluU3dpdGNoZXJDbGllbnRNZXNzYWdlUhxjdXJ0YWluU3dpdGNoZXJDbGllbnRNZXNzYWdlEl4KG2FpckNvbmRpdGlvbmVyQ2xpZW50TWVzc2FnZRgEIAEoCzIcLkFpckNvbmRpdGlvbmVyQ2xpZW50TWVzc2FnZVIbYWlyQ29uZGl0aW9uZXJDbGllbnRNZXNzYWdlEkYKE3JlbW90ZUNsaWVudE1lc3NhZ2UYBSABKAsyFC5SZW1vdGVDbGllbnRNZXNzYWdlUhNyZW1vdGVDbGllbnRNZXNzYWdlEk8KFm9uQ2hhbmdlZENsaWVudE1lc3NhZ2UYBiABKAsyFy5PbkNoYW5nZWRDbGllbnRNZXNzYWdlUhZvbkNoYW5nZWRDbGllbnRNZXNzYWdlEkYKE21vdGlvbkNsaWVudE1lc3NhZ2UYByABKAsyFC5Nb3Rpb25DbGllbnRNZXNzYWdlUhNtb3Rpb25DbGllbnRNZXNzYWdlEkMKEnNjZW5lQ2xpZW50TWVzc2FnZRgIIAEoCzITLlNjZW5lQ2xpZW50TWVzc2FnZVISc2NlbmVDbGllbnRNZXNzYWdlEk8KFmxlZERyaXZlckNsaWVudE1lc3NhZ2UYCSABKAsyFy5MZWREcml2ZXJDbGllbnRNZXNzYWdlUhZsZWREcml2ZXJDbGllbnRNZXNzYWdlEkMKEm1ldGVyQ2xpZW50TWVzc2FnZRgKIAEoCzITLk1ldGVyQ2xpZW50TWVzc2FnZVISbWV0ZXJDbGllbnRNZXNzYWdlEkkKFGhvbWVraXRDbGllbnRNZXNzYWdlGAsgASgLMhUuSG9tZWtpdENsaWVudE1lc3NhZ2VSFGhvbWVraXRDbGllbnRNZXNzYWdlElgKGXNjZW5lVHJpZ2dlckNsaWVudE1lc3NhZ2UYDCABKAsyGi5TY2VuZVRyaWdnZXJDbGllbnRNZXNzYWdlUhlzY2VuZVRyaWdnZXJDbGllbnRNZXNzYWdlEkkKFGN1cnRhaW5DbGllbnRNZXNzYWdlGA0gASgLMhUuQ3VydGFpbkNsaWVudE1lc3NhZ2VSFGN1cnRhaW5DbGllbnRNZXNzYWdlElIKF3RvdWNoUGFuZWxDbGllbnRNZXNzYWdlGA4gASgLMhguVG91Y2hQYW5lbENsaWVudE1lc3NhZ2VSF3RvdWNoUGFuZWxDbGllbnRNZXNzYWdl');
