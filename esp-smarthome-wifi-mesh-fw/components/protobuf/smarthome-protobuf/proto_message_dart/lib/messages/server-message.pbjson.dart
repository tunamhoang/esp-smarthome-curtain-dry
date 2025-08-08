///
//  Generated code. Do not modify.
//  source: server-message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use loginServerRequestDescriptor instead')
const LoginServerRequest$json = const {
  '1': 'LoginServerRequest',
  '2': const [
    const {'1': 'accessToken', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'facebookToken', '3': 2, '4': 1, '5': 9, '10': 'facebookToken'},
    const {'1': 'googleToken', '3': 3, '4': 1, '5': 9, '10': 'googleToken'},
    const {'1': 'accessKey', '3': 4, '4': 1, '5': 9, '10': 'accessKey'},
    const {'1': 'deviceId', '3': 5, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'loggedOS', '3': 6, '4': 1, '5': 9, '10': 'loggedOS'},
    const {'1': 'versionOS', '3': 7, '4': 1, '5': 9, '10': 'versionOS'},
    const {'1': 'loggedIP', '3': 8, '4': 1, '5': 9, '10': 'loggedIP'},
    const {'1': 'mdns', '3': 9, '4': 1, '5': 9, '10': 'mdns'},
    const {'1': 'brandName', '3': 10, '4': 1, '5': 9, '10': 'brandName'},
    const {'1': 'model', '3': 11, '4': 1, '5': 9, '10': 'model'},
    const {'1': 'signal', '3': 12, '4': 1, '5': 5, '10': 'signal'},
    const {'1': 'firmware', '3': 13, '4': 1, '5': 9, '10': 'firmware'},
    const {'1': 'hardware', '3': 14, '4': 1, '5': 9, '10': 'hardware'},
    const {'1': 'group', '3': 15, '4': 1, '5': 14, '6': '.GroupDevice', '10': 'group'},
    const {'1': 'hardwareId', '3': 16, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'deviceToken', '3': 17, '4': 1, '5': 9, '10': 'deviceToken'},
    const {'1': 'gatewayId', '3': 18, '4': 1, '5': 9, '10': 'gatewayId'},
    const {'1': 'updateMode', '3': 19, '4': 1, '5': 13, '10': 'updateMode'},
    const {'1': 'reactivity', '3': 20, '4': 1, '5': 13, '10': 'reactivity'},
    const {'1': 'brightness', '3': 21, '4': 1, '5': 13, '10': 'brightness'},
    const {'1': 'timeDelay', '3': 22, '4': 1, '5': 13, '10': 'timeDelay'},
    const {'1': 'latitude', '3': 23, '4': 1, '5': 2, '10': 'latitude'},
    const {'1': 'longitude', '3': 24, '4': 1, '5': 2, '10': 'longitude'},
    const {'1': 'sceneActiveMap', '3': 25, '4': 1, '5': 13, '10': 'sceneActiveMap'},
    const {'1': 'supportGroupControl', '3': 26, '4': 1, '5': 13, '10': 'supportGroupControl'},
    const {'1': 'gatewayDeviceId', '3': 27, '4': 1, '5': 9, '10': 'gatewayDeviceId'},
  ],
};

/// Descriptor for `LoginServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginServerRequestDescriptor = $convert.base64Decode('ChJMb2dpblNlcnZlclJlcXVlc3QSIAoLYWNjZXNzVG9rZW4YASABKAlSC2FjY2Vzc1Rva2VuEiQKDWZhY2Vib29rVG9rZW4YAiABKAlSDWZhY2Vib29rVG9rZW4SIAoLZ29vZ2xlVG9rZW4YAyABKAlSC2dvb2dsZVRva2VuEhwKCWFjY2Vzc0tleRgEIAEoCVIJYWNjZXNzS2V5EhoKCGRldmljZUlkGAUgASgJUghkZXZpY2VJZBIaCghsb2dnZWRPUxgGIAEoCVIIbG9nZ2VkT1MSHAoJdmVyc2lvbk9TGAcgASgJUgl2ZXJzaW9uT1MSGgoIbG9nZ2VkSVAYCCABKAlSCGxvZ2dlZElQEhIKBG1kbnMYCSABKAlSBG1kbnMSHAoJYnJhbmROYW1lGAogASgJUglicmFuZE5hbWUSFAoFbW9kZWwYCyABKAlSBW1vZGVsEhYKBnNpZ25hbBgMIAEoBVIGc2lnbmFsEhoKCGZpcm13YXJlGA0gASgJUghmaXJtd2FyZRIaCghoYXJkd2FyZRgOIAEoCVIIaGFyZHdhcmUSIgoFZ3JvdXAYDyABKA4yDC5Hcm91cERldmljZVIFZ3JvdXASHgoKaGFyZHdhcmVJZBgQIAEoCVIKaGFyZHdhcmVJZBIgCgtkZXZpY2VUb2tlbhgRIAEoCVILZGV2aWNlVG9rZW4SHAoJZ2F0ZXdheUlkGBIgASgJUglnYXRld2F5SWQSHgoKdXBkYXRlTW9kZRgTIAEoDVIKdXBkYXRlTW9kZRIeCgpyZWFjdGl2aXR5GBQgASgNUgpyZWFjdGl2aXR5Eh4KCmJyaWdodG5lc3MYFSABKA1SCmJyaWdodG5lc3MSHAoJdGltZURlbGF5GBYgASgNUgl0aW1lRGVsYXkSGgoIbGF0aXR1ZGUYFyABKAJSCGxhdGl0dWRlEhwKCWxvbmdpdHVkZRgYIAEoAlIJbG9uZ2l0dWRlEiYKDnNjZW5lQWN0aXZlTWFwGBkgASgNUg5zY2VuZUFjdGl2ZU1hcBIwChNzdXBwb3J0R3JvdXBDb250cm9sGBogASgNUhNzdXBwb3J0R3JvdXBDb250cm9sEigKD2dhdGV3YXlEZXZpY2VJZBgbIAEoCVIPZ2F0ZXdheURldmljZUlk');
@$core.Deprecated('Use loginServerResponseDescriptor instead')
const LoginServerResponse$json = const {
  '1': 'LoginServerResponse',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'deviceId', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'accessToken', '3': 3, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'refreshToken', '3': 4, '4': 1, '5': 9, '10': 'refreshToken'},
    const {'1': 'accessKey', '3': 5, '4': 1, '5': 9, '10': 'accessKey'},
    const {'1': 'serverDomain', '3': 6, '4': 1, '5': 9, '10': 'serverDomain'},
    const {'1': 'home', '3': 7, '4': 1, '5': 11, '6': '.Home', '10': 'home'},
    const {'1': 'keepAlive', '3': 8, '4': 1, '5': 13, '10': 'keepAlive'},
    const {'1': 'serialNumbers', '3': 9, '4': 3, '5': 9, '10': 'serialNumbers'},
    const {'1': 'hardwareId', '3': 10, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'loggedDate', '3': 11, '4': 1, '5': 4, '10': 'loggedDate'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `LoginServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginServerResponseDescriptor = $convert.base64Decode('ChNMb2dpblNlcnZlclJlc3BvbnNlEhYKBnVzZXJJZBgBIAEoCVIGdXNlcklkEhoKCGRldmljZUlkGAIgASgJUghkZXZpY2VJZBIgCgthY2Nlc3NUb2tlbhgDIAEoCVILYWNjZXNzVG9rZW4SIgoMcmVmcmVzaFRva2VuGAQgASgJUgxyZWZyZXNoVG9rZW4SHAoJYWNjZXNzS2V5GAUgASgJUglhY2Nlc3NLZXkSIgoMc2VydmVyRG9tYWluGAYgASgJUgxzZXJ2ZXJEb21haW4SGQoEaG9tZRgHIAEoCzIFLkhvbWVSBGhvbWUSHAoJa2VlcEFsaXZlGAggASgNUglrZWVwQWxpdmUSJAoNc2VyaWFsTnVtYmVycxgJIAMoCVINc2VyaWFsTnVtYmVycxIeCgpoYXJkd2FyZUlkGAogASgJUgpoYXJkd2FyZUlkEh4KCmxvZ2dlZERhdGUYCyABKARSCmxvZ2dlZERhdGUSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use refreshTokenServerRequestDescriptor instead')
const RefreshTokenServerRequest$json = const {
  '1': 'RefreshTokenServerRequest',
  '2': const [
    const {'1': 'accessToken', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'refreshToken', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `RefreshTokenServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenServerRequestDescriptor = $convert.base64Decode('ChlSZWZyZXNoVG9rZW5TZXJ2ZXJSZXF1ZXN0EiAKC2FjY2Vzc1Rva2VuGAEgASgJUgthY2Nlc3NUb2tlbhIiCgxyZWZyZXNoVG9rZW4YAiABKAlSDHJlZnJlc2hUb2tlbg==');
@$core.Deprecated('Use refreshTokenServerResponseDescriptor instead')
const RefreshTokenServerResponse$json = const {
  '1': 'RefreshTokenServerResponse',
  '2': const [
    const {'1': 'accessToken', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'refreshToken', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `RefreshTokenServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenServerResponseDescriptor = $convert.base64Decode('ChpSZWZyZXNoVG9rZW5TZXJ2ZXJSZXNwb25zZRIgCgthY2Nlc3NUb2tlbhgBIAEoCVILYWNjZXNzVG9rZW4SIgoMcmVmcmVzaFRva2VuGAIgASgJUgxyZWZyZXNoVG9rZW4SLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use sendCodeServerRequestDescriptor instead')
const SendCodeServerRequest$json = const {
  '1': 'SendCodeServerRequest',
  '2': const [
    const {'1': 'phoneNumber', '3': 1, '4': 1, '5': 9, '10': 'phoneNumber'},
  ],
};

/// Descriptor for `SendCodeServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendCodeServerRequestDescriptor = $convert.base64Decode('ChVTZW5kQ29kZVNlcnZlclJlcXVlc3QSIAoLcGhvbmVOdW1iZXIYASABKAlSC3Bob25lTnVtYmVy');
@$core.Deprecated('Use sendCodeServerResponseDescriptor instead')
const SendCodeServerResponse$json = const {
  '1': 'SendCodeServerResponse',
  '2': const [
    const {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SendCodeServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendCodeServerResponseDescriptor = $convert.base64Decode('ChZTZW5kQ29kZVNlcnZlclJlc3BvbnNlEhIKBGNvZGUYAiABKAlSBGNvZGUSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use verifyCodeServerRequestDescriptor instead')
const VerifyCodeServerRequest$json = const {
  '1': 'VerifyCodeServerRequest',
  '2': const [
    const {'1': 'phoneNumber', '3': 1, '4': 1, '5': 9, '10': 'phoneNumber'},
    const {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
  ],
};

/// Descriptor for `VerifyCodeServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyCodeServerRequestDescriptor = $convert.base64Decode('ChdWZXJpZnlDb2RlU2VydmVyUmVxdWVzdBIgCgtwaG9uZU51bWJlchgBIAEoCVILcGhvbmVOdW1iZXISEgoEY29kZRgCIAEoCVIEY29kZQ==');
@$core.Deprecated('Use verifyCodeServerResponseDescriptor instead')
const VerifyCodeServerResponse$json = const {
  '1': 'VerifyCodeServerResponse',
  '2': const [
    const {'1': 'accessToken', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `VerifyCodeServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyCodeServerResponseDescriptor = $convert.base64Decode('ChhWZXJpZnlDb2RlU2VydmVyUmVzcG9uc2USIAoLYWNjZXNzVG9rZW4YASABKAlSC2FjY2Vzc1Rva2VuEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getUserInfoServerRequestDescriptor instead')
const GetUserInfoServerRequest$json = const {
  '1': 'GetUserInfoServerRequest',
};

/// Descriptor for `GetUserInfoServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserInfoServerRequestDescriptor = $convert.base64Decode('ChhHZXRVc2VySW5mb1NlcnZlclJlcXVlc3Q=');
@$core.Deprecated('Use getUserInfoServerResponseDescriptor instead')
const GetUserInfoServerResponse$json = const {
  '1': 'GetUserInfoServerResponse',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'avatar', '3': 2, '4': 1, '5': 12, '10': 'avatar'},
    const {'1': 'fullName', '3': 3, '4': 1, '5': 9, '10': 'fullName'},
    const {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'phoneNumber', '3': 5, '4': 1, '5': 9, '10': 'phoneNumber'},
    const {'1': 'language', '3': 6, '4': 1, '5': 9, '10': 'language'},
    const {'1': 'autoSwitchGps', '3': 7, '4': 1, '5': 8, '10': 'autoSwitchGps'},
    const {'1': 'homes', '3': 8, '4': 3, '5': 11, '6': '.Home', '10': 'homes'},
    const {'1': 'userRole', '3': 9, '4': 1, '5': 14, '6': '.UserRole', '10': 'userRole'},
    const {'1': 'userSetting', '3': 10, '4': 1, '5': 11, '6': '.UserSetting', '10': 'userSetting'},
    const {'1': 'appleId', '3': 11, '4': 1, '5': 9, '10': 'appleId'},
    const {'1': 'facebookId', '3': 12, '4': 1, '5': 9, '10': 'facebookId'},
    const {'1': 'googleId', '3': 13, '4': 1, '5': 9, '10': 'googleId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetUserInfoServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserInfoServerResponseDescriptor = $convert.base64Decode('ChlHZXRVc2VySW5mb1NlcnZlclJlc3BvbnNlEhYKBnVzZXJJZBgBIAEoCVIGdXNlcklkEhYKBmF2YXRhchgCIAEoDFIGYXZhdGFyEhoKCGZ1bGxOYW1lGAMgASgJUghmdWxsTmFtZRIUCgVlbWFpbBgEIAEoCVIFZW1haWwSIAoLcGhvbmVOdW1iZXIYBSABKAlSC3Bob25lTnVtYmVyEhoKCGxhbmd1YWdlGAYgASgJUghsYW5ndWFnZRIkCg1hdXRvU3dpdGNoR3BzGAcgASgIUg1hdXRvU3dpdGNoR3BzEhsKBWhvbWVzGAggAygLMgUuSG9tZVIFaG9tZXMSJQoIdXNlclJvbGUYCSABKA4yCS5Vc2VyUm9sZVIIdXNlclJvbGUSLgoLdXNlclNldHRpbmcYCiABKAsyDC5Vc2VyU2V0dGluZ1ILdXNlclNldHRpbmcSGAoHYXBwbGVJZBgLIAEoCVIHYXBwbGVJZBIeCgpmYWNlYm9va0lkGAwgASgJUgpmYWNlYm9va0lkEhoKCGdvb2dsZUlkGA0gASgJUghnb29nbGVJZBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use updateUserInfoServerRequestDescriptor instead')
const UpdateUserInfoServerRequest$json = const {
  '1': 'UpdateUserInfoServerRequest',
  '2': const [
    const {'1': 'avatar', '3': 1, '4': 1, '5': 12, '10': 'avatar'},
    const {'1': 'fullName', '3': 2, '4': 1, '5': 9, '10': 'fullName'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'phoneNumber', '3': 4, '4': 1, '5': 9, '10': 'phoneNumber'},
    const {'1': 'markedDeleteAvatar', '3': 5, '4': 1, '5': 8, '10': 'markedDeleteAvatar'},
    const {'1': 'language', '3': 6, '4': 1, '5': 9, '10': 'language'},
    const {'1': 'autoSwitchGps', '3': 7, '4': 1, '5': 8, '10': 'autoSwitchGps'},
  ],
};

/// Descriptor for `UpdateUserInfoServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserInfoServerRequestDescriptor = $convert.base64Decode('ChtVcGRhdGVVc2VySW5mb1NlcnZlclJlcXVlc3QSFgoGYXZhdGFyGAEgASgMUgZhdmF0YXISGgoIZnVsbE5hbWUYAiABKAlSCGZ1bGxOYW1lEhQKBWVtYWlsGAMgASgJUgVlbWFpbBIgCgtwaG9uZU51bWJlchgEIAEoCVILcGhvbmVOdW1iZXISLgoSbWFya2VkRGVsZXRlQXZhdGFyGAUgASgIUhJtYXJrZWREZWxldGVBdmF0YXISGgoIbGFuZ3VhZ2UYBiABKAlSCGxhbmd1YWdlEiQKDWF1dG9Td2l0Y2hHcHMYByABKAhSDWF1dG9Td2l0Y2hHcHM=');
@$core.Deprecated('Use updateUserInfoServerResponseDescriptor instead')
const UpdateUserInfoServerResponse$json = const {
  '1': 'UpdateUserInfoServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateUserInfoServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserInfoServerResponseDescriptor = $convert.base64Decode('ChxVcGRhdGVVc2VySW5mb1NlcnZlclJlc3BvbnNlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use setOnesignalForUserServerRequestDescriptor instead')
const SetOnesignalForUserServerRequest$json = const {
  '1': 'SetOnesignalForUserServerRequest',
  '2': const [
    const {'1': 'onesignalId', '3': 1, '4': 1, '5': 9, '10': 'onesignalId'},
  ],
};

/// Descriptor for `SetOnesignalForUserServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setOnesignalForUserServerRequestDescriptor = $convert.base64Decode('CiBTZXRPbmVzaWduYWxGb3JVc2VyU2VydmVyUmVxdWVzdBIgCgtvbmVzaWduYWxJZBgBIAEoCVILb25lc2lnbmFsSWQ=');
@$core.Deprecated('Use setOnesignalForUserServerResponseDescriptor instead')
const SetOnesignalForUserServerResponse$json = const {
  '1': 'SetOnesignalForUserServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SetOnesignalForUserServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setOnesignalForUserServerResponseDescriptor = $convert.base64Decode('CiFTZXRPbmVzaWduYWxGb3JVc2VyU2VydmVyUmVzcG9uc2USLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use changedHomeForUserServerRequestDescriptor instead')
const ChangedHomeForUserServerRequest$json = const {
  '1': 'ChangedHomeForUserServerRequest',
  '2': const [
    const {'1': 'homeId', '3': 1, '4': 1, '5': 9, '10': 'homeId'},
  ],
};

/// Descriptor for `ChangedHomeForUserServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changedHomeForUserServerRequestDescriptor = $convert.base64Decode('Ch9DaGFuZ2VkSG9tZUZvclVzZXJTZXJ2ZXJSZXF1ZXN0EhYKBmhvbWVJZBgBIAEoCVIGaG9tZUlk');
@$core.Deprecated('Use changedHomeForUserServerResponseDescriptor instead')
const ChangedHomeForUserServerResponse$json = const {
  '1': 'ChangedHomeForUserServerResponse',
  '2': const [
    const {'1': 'homeId', '3': 1, '4': 1, '5': 9, '10': 'homeId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `ChangedHomeForUserServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changedHomeForUserServerResponseDescriptor = $convert.base64Decode('CiBDaGFuZ2VkSG9tZUZvclVzZXJTZXJ2ZXJSZXNwb25zZRIWCgZob21lSWQYASABKAlSBmhvbWVJZBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use getUsersServerRequestDescriptor instead')
const GetUsersServerRequest$json = const {
  '1': 'GetUsersServerRequest',
  '2': const [
    const {'1': 'search', '3': 1, '4': 1, '5': 9, '10': 'search'},
    const {'1': 'order', '3': 2, '4': 1, '5': 4, '10': 'order'},
    const {'1': 'pageSize', '3': 3, '4': 1, '5': 13, '10': 'pageSize'},
  ],
};

/// Descriptor for `GetUsersServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUsersServerRequestDescriptor = $convert.base64Decode('ChVHZXRVc2Vyc1NlcnZlclJlcXVlc3QSFgoGc2VhcmNoGAEgASgJUgZzZWFyY2gSFAoFb3JkZXIYAiABKARSBW9yZGVyEhoKCHBhZ2VTaXplGAMgASgNUghwYWdlU2l6ZQ==');
@$core.Deprecated('Use getUsersServerResponseDescriptor instead')
const GetUsersServerResponse$json = const {
  '1': 'GetUsersServerResponse',
  '2': const [
    const {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.User', '10': 'users'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetUsersServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUsersServerResponseDescriptor = $convert.base64Decode('ChZHZXRVc2Vyc1NlcnZlclJlc3BvbnNlEhsKBXVzZXJzGAEgAygLMgUuVXNlclIFdXNlcnMSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use searchUserServerRequestDescriptor instead')
const SearchUserServerRequest$json = const {
  '1': 'SearchUserServerRequest',
  '2': const [
    const {'1': 'search', '3': 1, '4': 1, '5': 9, '10': 'search'},
  ],
};

/// Descriptor for `SearchUserServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchUserServerRequestDescriptor = $convert.base64Decode('ChdTZWFyY2hVc2VyU2VydmVyUmVxdWVzdBIWCgZzZWFyY2gYASABKAlSBnNlYXJjaA==');
@$core.Deprecated('Use searchUserServerResponseDescriptor instead')
const SearchUserServerResponse$json = const {
  '1': 'SearchUserServerResponse',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.User', '10': 'user'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SearchUserServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchUserServerResponseDescriptor = $convert.base64Decode('ChhTZWFyY2hVc2VyU2VydmVyUmVzcG9uc2USGQoEdXNlchgBIAEoCzIFLlVzZXJSBHVzZXISLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use avatarUploadServerRequestDescriptor instead')
const AvatarUploadServerRequest$json = const {
  '1': 'AvatarUploadServerRequest',
  '2': const [
    const {'1': 'fileUploadForm', '3': 1, '4': 1, '5': 11, '6': '.FileUploadForm', '10': 'fileUploadForm'},
  ],
};

/// Descriptor for `AvatarUploadServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List avatarUploadServerRequestDescriptor = $convert.base64Decode('ChlBdmF0YXJVcGxvYWRTZXJ2ZXJSZXF1ZXN0EjcKDmZpbGVVcGxvYWRGb3JtGAEgASgLMg8uRmlsZVVwbG9hZEZvcm1SDmZpbGVVcGxvYWRGb3Jt');
@$core.Deprecated('Use avatarUploadServerResponseDescriptor instead')
const AvatarUploadServerResponse$json = const {
  '1': 'AvatarUploadServerResponse',
  '2': const [
    const {'1': 'imageUrl', '3': 1, '4': 1, '5': 9, '10': 'imageUrl'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `AvatarUploadServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List avatarUploadServerResponseDescriptor = $convert.base64Decode('ChpBdmF0YXJVcGxvYWRTZXJ2ZXJSZXNwb25zZRIaCghpbWFnZVVybBgBIAEoCVIIaW1hZ2VVcmwSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use getUserOtpServerRequestDescriptor instead')
const GetUserOtpServerRequest$json = const {
  '1': 'GetUserOtpServerRequest',
  '2': const [
    const {'1': 'phone', '3': 1, '4': 1, '5': 9, '10': 'phone'},
  ],
};

/// Descriptor for `GetUserOtpServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserOtpServerRequestDescriptor = $convert.base64Decode('ChdHZXRVc2VyT3RwU2VydmVyUmVxdWVzdBIUCgVwaG9uZRgBIAEoCVIFcGhvbmU=');
@$core.Deprecated('Use getUserOtpServerResponseDescriptor instead')
const GetUserOtpServerResponse$json = const {
  '1': 'GetUserOtpServerResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'phone', '3': 2, '4': 1, '5': 9, '10': 'phone'},
    const {'1': 'code', '3': 3, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'active', '3': 4, '4': 1, '5': 5, '10': 'active'},
    const {'1': 'sendDate', '3': 5, '4': 1, '5': 13, '10': 'sendDate'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetUserOtpServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserOtpServerResponseDescriptor = $convert.base64Decode('ChhHZXRVc2VyT3RwU2VydmVyUmVzcG9uc2USDgoCaWQYASABKAlSAmlkEhQKBXBob25lGAIgASgJUgVwaG9uZRISCgRjb2RlGAMgASgJUgRjb2RlEhYKBmFjdGl2ZRgEIAEoBVIGYWN0aXZlEhoKCHNlbmREYXRlGAUgASgNUghzZW5kRGF0ZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use getHomesServerRequestDescriptor instead')
const GetHomesServerRequest$json = const {
  '1': 'GetHomesServerRequest',
};

/// Descriptor for `GetHomesServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHomesServerRequestDescriptor = $convert.base64Decode('ChVHZXRIb21lc1NlcnZlclJlcXVlc3Q=');
@$core.Deprecated('Use getHomesServerResponseDescriptor instead')
const GetHomesServerResponse$json = const {
  '1': 'GetHomesServerResponse',
  '2': const [
    const {'1': 'homes', '3': 1, '4': 3, '5': 11, '6': '.Home', '10': 'homes'},
    const {'1': 'defaultHomeId', '3': 2, '4': 1, '5': 9, '10': 'defaultHomeId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetHomesServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHomesServerResponseDescriptor = $convert.base64Decode('ChZHZXRIb21lc1NlcnZlclJlc3BvbnNlEhsKBWhvbWVzGAEgAygLMgUuSG9tZVIFaG9tZXMSJAoNZGVmYXVsdEhvbWVJZBgCIAEoCVINZGVmYXVsdEhvbWVJZBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use addHomeServerRequestDescriptor instead')
const AddHomeServerRequest$json = const {
  '1': 'AddHomeServerRequest',
  '2': const [
    const {'1': 'homeName', '3': 1, '4': 1, '5': 9, '10': 'homeName'},
    const {'1': 'homeNameEn', '3': 2, '4': 1, '5': 9, '10': 'homeNameEn'},
    const {'1': 'backgroundName', '3': 3, '4': 1, '5': 9, '10': 'backgroundName'},
  ],
};

/// Descriptor for `AddHomeServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addHomeServerRequestDescriptor = $convert.base64Decode('ChRBZGRIb21lU2VydmVyUmVxdWVzdBIaCghob21lTmFtZRgBIAEoCVIIaG9tZU5hbWUSHgoKaG9tZU5hbWVFbhgCIAEoCVIKaG9tZU5hbWVFbhImCg5iYWNrZ3JvdW5kTmFtZRgDIAEoCVIOYmFja2dyb3VuZE5hbWU=');
@$core.Deprecated('Use addHomeServerResponseDescriptor instead')
const AddHomeServerResponse$json = const {
  '1': 'AddHomeServerResponse',
  '2': const [
    const {'1': 'home', '3': 1, '4': 1, '5': 11, '6': '.Home', '10': 'home'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `AddHomeServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addHomeServerResponseDescriptor = $convert.base64Decode('ChVBZGRIb21lU2VydmVyUmVzcG9uc2USGQoEaG9tZRgBIAEoCzIFLkhvbWVSBGhvbWUSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use updateHomeServerRequestDescriptor instead')
const UpdateHomeServerRequest$json = const {
  '1': 'UpdateHomeServerRequest',
  '2': const [
    const {'1': 'home', '3': 1, '4': 1, '5': 11, '6': '.Home', '10': 'home'},
  ],
};

/// Descriptor for `UpdateHomeServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateHomeServerRequestDescriptor = $convert.base64Decode('ChdVcGRhdGVIb21lU2VydmVyUmVxdWVzdBIZCgRob21lGAEgASgLMgUuSG9tZVIEaG9tZQ==');
@$core.Deprecated('Use updateHomeServerResponseDescriptor instead')
const UpdateHomeServerResponse$json = const {
  '1': 'UpdateHomeServerResponse',
  '2': const [
    const {'1': 'home', '3': 1, '4': 1, '5': 11, '6': '.Home', '10': 'home'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateHomeServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateHomeServerResponseDescriptor = $convert.base64Decode('ChhVcGRhdGVIb21lU2VydmVyUmVzcG9uc2USGQoEaG9tZRgBIAEoCzIFLkhvbWVSBGhvbWUSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use deleteHomeServerRequestDescriptor instead')
const DeleteHomeServerRequest$json = const {
  '1': 'DeleteHomeServerRequest',
  '2': const [
    const {'1': 'homeId', '3': 1, '4': 1, '5': 9, '10': 'homeId'},
  ],
};

/// Descriptor for `DeleteHomeServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteHomeServerRequestDescriptor = $convert.base64Decode('ChdEZWxldGVIb21lU2VydmVyUmVxdWVzdBIWCgZob21lSWQYASABKAlSBmhvbWVJZA==');
@$core.Deprecated('Use deleteHomeServerResponseDescriptor instead')
const DeleteHomeServerResponse$json = const {
  '1': 'DeleteHomeServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `DeleteHomeServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteHomeServerResponseDescriptor = $convert.base64Decode('ChhEZWxldGVIb21lU2VydmVyUmVzcG9uc2USLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use getCitizenInfoServerRequestDescriptor instead')
const GetCitizenInfoServerRequest$json = const {
  '1': 'GetCitizenInfoServerRequest',
  '2': const [
    const {'1': 'homeId', '3': 1, '4': 1, '5': 9, '10': 'homeId'},
  ],
};

/// Descriptor for `GetCitizenInfoServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCitizenInfoServerRequestDescriptor = $convert.base64Decode('ChtHZXRDaXRpemVuSW5mb1NlcnZlclJlcXVlc3QSFgoGaG9tZUlkGAEgASgJUgZob21lSWQ=');
@$core.Deprecated('Use getCitizenInfoServerResponseDescriptor instead')
const GetCitizenInfoServerResponse$json = const {
  '1': 'GetCitizenInfoServerResponse',
  '2': const [
    const {'1': 'citizen', '3': 1, '4': 1, '5': 11, '6': '.Citizen', '10': 'citizen'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetCitizenInfoServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCitizenInfoServerResponseDescriptor = $convert.base64Decode('ChxHZXRDaXRpemVuSW5mb1NlcnZlclJlc3BvbnNlEiIKB2NpdGl6ZW4YASABKAsyCC5DaXRpemVuUgdjaXRpemVuEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use setCitizenServerRequestDescriptor instead')
const SetCitizenServerRequest$json = const {
  '1': 'SetCitizenServerRequest',
  '2': const [
    const {'1': 'citizen', '3': 1, '4': 1, '5': 11, '6': '.Citizen', '10': 'citizen'},
  ],
};

/// Descriptor for `SetCitizenServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setCitizenServerRequestDescriptor = $convert.base64Decode('ChdTZXRDaXRpemVuU2VydmVyUmVxdWVzdBIiCgdjaXRpemVuGAEgASgLMgguQ2l0aXplblIHY2l0aXplbg==');
@$core.Deprecated('Use setCitizenServerResponseDescriptor instead')
const SetCitizenServerResponse$json = const {
  '1': 'SetCitizenServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SetCitizenServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setCitizenServerResponseDescriptor = $convert.base64Decode('ChhTZXRDaXRpemVuU2VydmVyUmVzcG9uc2USLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use setGpsForHomeServerRequestDescriptor instead')
const SetGpsForHomeServerRequest$json = const {
  '1': 'SetGpsForHomeServerRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'longitude', '3': 2, '4': 1, '5': 2, '10': 'longitude'},
    const {'1': 'latitude', '3': 3, '4': 1, '5': 2, '10': 'latitude'},
  ],
};

/// Descriptor for `SetGpsForHomeServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setGpsForHomeServerRequestDescriptor = $convert.base64Decode('ChpTZXRHcHNGb3JIb21lU2VydmVyUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQSHAoJbG9uZ2l0dWRlGAIgASgCUglsb25naXR1ZGUSGgoIbGF0aXR1ZGUYAyABKAJSCGxhdGl0dWRl');
@$core.Deprecated('Use setGpsForHomeServerResponseDescriptor instead')
const SetGpsForHomeServerResponse$json = const {
  '1': 'SetGpsForHomeServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SetGpsForHomeServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setGpsForHomeServerResponseDescriptor = $convert.base64Decode('ChtTZXRHcHNGb3JIb21lU2VydmVyUmVzcG9uc2USLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use getHomeInfoServerRequestDescriptor instead')
const GetHomeInfoServerRequest$json = const {
  '1': 'GetHomeInfoServerRequest',
  '2': const [
    const {'1': 'homeId', '3': 1, '4': 1, '5': 9, '10': 'homeId'},
  ],
};

/// Descriptor for `GetHomeInfoServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHomeInfoServerRequestDescriptor = $convert.base64Decode('ChhHZXRIb21lSW5mb1NlcnZlclJlcXVlc3QSFgoGaG9tZUlkGAEgASgJUgZob21lSWQ=');
@$core.Deprecated('Use getHomeInfoServerResponseDescriptor instead')
const GetHomeInfoServerResponse$json = const {
  '1': 'GetHomeInfoServerResponse',
  '2': const [
    const {'1': 'home', '3': 1, '4': 1, '5': 11, '6': '.Home', '10': 'home'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetHomeInfoServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHomeInfoServerResponseDescriptor = $convert.base64Decode('ChlHZXRIb21lSW5mb1NlcnZlclJlc3BvbnNlEhkKBGhvbWUYASABKAsyBS5Ib21lUgRob21lEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getHomesByPhoneServerRequestDescriptor instead')
const GetHomesByPhoneServerRequest$json = const {
  '1': 'GetHomesByPhoneServerRequest',
  '2': const [
    const {'1': 'phone', '3': 1, '4': 1, '5': 9, '10': 'phone'},
  ],
};

/// Descriptor for `GetHomesByPhoneServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHomesByPhoneServerRequestDescriptor = $convert.base64Decode('ChxHZXRIb21lc0J5UGhvbmVTZXJ2ZXJSZXF1ZXN0EhQKBXBob25lGAEgASgJUgVwaG9uZQ==');
@$core.Deprecated('Use getHomesByPhoneServerResponseDescriptor instead')
const GetHomesByPhoneServerResponse$json = const {
  '1': 'GetHomesByPhoneServerResponse',
  '2': const [
    const {'1': 'home', '3': 1, '4': 3, '5': 11, '6': '.Home', '10': 'home'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetHomesByPhoneServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHomesByPhoneServerResponseDescriptor = $convert.base64Decode('Ch1HZXRIb21lc0J5UGhvbmVTZXJ2ZXJSZXNwb25zZRIZCgRob21lGAEgAygLMgUuSG9tZVIEaG9tZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use uploadHomeBackgroundServerRequestDescriptor instead')
const UploadHomeBackgroundServerRequest$json = const {
  '1': 'UploadHomeBackgroundServerRequest',
  '2': const [
    const {'1': 'homeId', '3': 1, '4': 1, '5': 9, '10': 'homeId'},
    const {'1': 'fileUploadForm', '3': 2, '4': 1, '5': 11, '6': '.FileUploadForm', '10': 'fileUploadForm'},
  ],
};

/// Descriptor for `UploadHomeBackgroundServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadHomeBackgroundServerRequestDescriptor = $convert.base64Decode('CiFVcGxvYWRIb21lQmFja2dyb3VuZFNlcnZlclJlcXVlc3QSFgoGaG9tZUlkGAEgASgJUgZob21lSWQSNwoOZmlsZVVwbG9hZEZvcm0YAiABKAsyDy5GaWxlVXBsb2FkRm9ybVIOZmlsZVVwbG9hZEZvcm0=');
@$core.Deprecated('Use uploadHomeBackgroundServerResponseDescriptor instead')
const UploadHomeBackgroundServerResponse$json = const {
  '1': 'UploadHomeBackgroundServerResponse',
  '2': const [
    const {'1': 'imageUrl', '3': 1, '4': 1, '5': 9, '10': 'imageUrl'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UploadHomeBackgroundServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadHomeBackgroundServerResponseDescriptor = $convert.base64Decode('CiJVcGxvYWRIb21lQmFja2dyb3VuZFNlcnZlclJlc3BvbnNlEhoKCGltYWdlVXJsGAEgASgJUghpbWFnZVVybBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use getRoomsServerRequestDescriptor instead')
const GetRoomsServerRequest$json = const {
  '1': 'GetRoomsServerRequest',
  '2': const [
    const {'1': 'homeId', '3': 1, '4': 1, '5': 9, '10': 'homeId'},
  ],
};

/// Descriptor for `GetRoomsServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRoomsServerRequestDescriptor = $convert.base64Decode('ChVHZXRSb29tc1NlcnZlclJlcXVlc3QSFgoGaG9tZUlkGAEgASgJUgZob21lSWQ=');
@$core.Deprecated('Use getRoomsServerResponseDescriptor instead')
const GetRoomsServerResponse$json = const {
  '1': 'GetRoomsServerResponse',
  '2': const [
    const {'1': 'rooms', '3': 1, '4': 3, '5': 11, '6': '.Room', '10': 'rooms'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetRoomsServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRoomsServerResponseDescriptor = $convert.base64Decode('ChZHZXRSb29tc1NlcnZlclJlc3BvbnNlEhsKBXJvb21zGAEgAygLMgUuUm9vbVIFcm9vbXMSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use addRoomServerRequestDescriptor instead')
const AddRoomServerRequest$json = const {
  '1': 'AddRoomServerRequest',
  '2': const [
    const {'1': 'homeId', '3': 1, '4': 1, '5': 9, '10': 'homeId'},
    const {'1': 'roomName', '3': 2, '4': 1, '5': 9, '10': 'roomName'},
    const {'1': 'roomNameEn', '3': 3, '4': 1, '5': 9, '10': 'roomNameEn'},
    const {'1': 'backgroundName', '3': 4, '4': 1, '5': 9, '10': 'backgroundName'},
  ],
};

/// Descriptor for `AddRoomServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addRoomServerRequestDescriptor = $convert.base64Decode('ChRBZGRSb29tU2VydmVyUmVxdWVzdBIWCgZob21lSWQYASABKAlSBmhvbWVJZBIaCghyb29tTmFtZRgCIAEoCVIIcm9vbU5hbWUSHgoKcm9vbU5hbWVFbhgDIAEoCVIKcm9vbU5hbWVFbhImCg5iYWNrZ3JvdW5kTmFtZRgEIAEoCVIOYmFja2dyb3VuZE5hbWU=');
@$core.Deprecated('Use addRoomServerResponseDescriptor instead')
const AddRoomServerResponse$json = const {
  '1': 'AddRoomServerResponse',
  '2': const [
    const {'1': 'room', '3': 1, '4': 1, '5': 11, '6': '.Room', '10': 'room'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `AddRoomServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addRoomServerResponseDescriptor = $convert.base64Decode('ChVBZGRSb29tU2VydmVyUmVzcG9uc2USGQoEcm9vbRgBIAEoCzIFLlJvb21SBHJvb20SLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use deleteRoomServerRequestDescriptor instead')
const DeleteRoomServerRequest$json = const {
  '1': 'DeleteRoomServerRequest',
  '2': const [
    const {'1': 'roomId', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
  ],
};

/// Descriptor for `DeleteRoomServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRoomServerRequestDescriptor = $convert.base64Decode('ChdEZWxldGVSb29tU2VydmVyUmVxdWVzdBIWCgZyb29tSWQYASABKAlSBnJvb21JZA==');
@$core.Deprecated('Use deleteRoomServerResponseDescriptor instead')
const DeleteRoomServerResponse$json = const {
  '1': 'DeleteRoomServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `DeleteRoomServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRoomServerResponseDescriptor = $convert.base64Decode('ChhEZWxldGVSb29tU2VydmVyUmVzcG9uc2USLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use updateRoomServerRequestDescriptor instead')
const UpdateRoomServerRequest$json = const {
  '1': 'UpdateRoomServerRequest',
  '2': const [
    const {'1': 'room', '3': 1, '4': 1, '5': 11, '6': '.Room', '10': 'room'},
  ],
};

/// Descriptor for `UpdateRoomServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRoomServerRequestDescriptor = $convert.base64Decode('ChdVcGRhdGVSb29tU2VydmVyUmVxdWVzdBIZCgRyb29tGAEgASgLMgUuUm9vbVIEcm9vbQ==');
@$core.Deprecated('Use updateRoomServerResponseDescriptor instead')
const UpdateRoomServerResponse$json = const {
  '1': 'UpdateRoomServerResponse',
  '2': const [
    const {'1': 'room', '3': 1, '4': 1, '5': 11, '6': '.Room', '10': 'room'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateRoomServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRoomServerResponseDescriptor = $convert.base64Decode('ChhVcGRhdGVSb29tU2VydmVyUmVzcG9uc2USGQoEcm9vbRgBIAEoCzIFLlJvb21SBHJvb20SLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use uploadRoomBackgroundServerRequestDescriptor instead')
const UploadRoomBackgroundServerRequest$json = const {
  '1': 'UploadRoomBackgroundServerRequest',
  '2': const [
    const {'1': 'room', '3': 1, '4': 1, '5': 11, '6': '.Room', '10': 'room'},
    const {'1': 'fileUploadForm', '3': 2, '4': 1, '5': 11, '6': '.FileUploadForm', '10': 'fileUploadForm'},
  ],
};

/// Descriptor for `UploadRoomBackgroundServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadRoomBackgroundServerRequestDescriptor = $convert.base64Decode('CiFVcGxvYWRSb29tQmFja2dyb3VuZFNlcnZlclJlcXVlc3QSGQoEcm9vbRgBIAEoCzIFLlJvb21SBHJvb20SNwoOZmlsZVVwbG9hZEZvcm0YAiABKAsyDy5GaWxlVXBsb2FkRm9ybVIOZmlsZVVwbG9hZEZvcm0=');
@$core.Deprecated('Use uploadRoomBackgroundServerResponseDescriptor instead')
const UploadRoomBackgroundServerResponse$json = const {
  '1': 'UploadRoomBackgroundServerResponse',
  '2': const [
    const {'1': 'imageUrl', '3': 1, '4': 1, '5': 9, '10': 'imageUrl'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UploadRoomBackgroundServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadRoomBackgroundServerResponseDescriptor = $convert.base64Decode('CiJVcGxvYWRSb29tQmFja2dyb3VuZFNlcnZlclJlc3BvbnNlEhoKCGltYWdlVXJsGAEgASgJUghpbWFnZVVybBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use getDevicesServerRequestDescriptor instead')
const GetDevicesServerRequest$json = const {
  '1': 'GetDevicesServerRequest',
  '2': const [
    const {'1': 'homeId', '3': 1, '4': 1, '5': 9, '10': 'homeId'},
    const {'1': 'group', '3': 2, '4': 1, '5': 14, '6': '.GroupDevice', '10': 'group'},
  ],
};

/// Descriptor for `GetDevicesServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDevicesServerRequestDescriptor = $convert.base64Decode('ChdHZXREZXZpY2VzU2VydmVyUmVxdWVzdBIWCgZob21lSWQYASABKAlSBmhvbWVJZBIiCgVncm91cBgCIAEoDjIMLkdyb3VwRGV2aWNlUgVncm91cA==');
@$core.Deprecated('Use getDevicesServerResponseDescriptor instead')
const GetDevicesServerResponse$json = const {
  '1': 'GetDevicesServerResponse',
  '2': const [
    const {'1': 'rooms', '3': 1, '4': 3, '5': 11, '6': '.Room', '10': 'rooms'},
    const {'1': 'devices', '3': 2, '4': 3, '5': 11, '6': '.Device', '10': 'devices'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetDevicesServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDevicesServerResponseDescriptor = $convert.base64Decode('ChhHZXREZXZpY2VzU2VydmVyUmVzcG9uc2USGwoFcm9vbXMYASADKAsyBS5Sb29tUgVyb29tcxIhCgdkZXZpY2VzGAIgAygLMgcuRGV2aWNlUgdkZXZpY2VzEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getDeviceServerRequestDescriptor instead')
const GetDeviceServerRequest$json = const {
  '1': 'GetDeviceServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `GetDeviceServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDeviceServerRequestDescriptor = $convert.base64Decode('ChZHZXREZXZpY2VTZXJ2ZXJSZXF1ZXN0EhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZA==');
@$core.Deprecated('Use getDeviceServerResponseDescriptor instead')
const GetDeviceServerResponse$json = const {
  '1': 'GetDeviceServerResponse',
  '2': const [
    const {'1': 'device', '3': 1, '4': 1, '5': 11, '6': '.Device', '10': 'device'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetDeviceServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDeviceServerResponseDescriptor = $convert.base64Decode('ChdHZXREZXZpY2VTZXJ2ZXJSZXNwb25zZRIfCgZkZXZpY2UYASABKAsyBy5EZXZpY2VSBmRldmljZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use addDevicesServerRequestDescriptor instead')
const AddDevicesServerRequest$json = const {
  '1': 'AddDevicesServerRequest',
  '2': const [
    const {'1': 'devices', '3': 1, '4': 3, '5': 11, '6': '.Device', '10': 'devices'},
  ],
};

/// Descriptor for `AddDevicesServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addDevicesServerRequestDescriptor = $convert.base64Decode('ChdBZGREZXZpY2VzU2VydmVyUmVxdWVzdBIhCgdkZXZpY2VzGAEgAygLMgcuRGV2aWNlUgdkZXZpY2Vz');
@$core.Deprecated('Use addDevicesServerResponseDescriptor instead')
const AddDevicesServerResponse$json = const {
  '1': 'AddDevicesServerResponse',
  '2': const [
    const {'1': 'devices', '3': 1, '4': 3, '5': 11, '6': '.Device', '10': 'devices'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `AddDevicesServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addDevicesServerResponseDescriptor = $convert.base64Decode('ChhBZGREZXZpY2VzU2VydmVyUmVzcG9uc2USIQoHZGV2aWNlcxgBIAMoCzIHLkRldmljZVIHZGV2aWNlcxIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use updateDeviceServerRequestDescriptor instead')
const UpdateDeviceServerRequest$json = const {
  '1': 'UpdateDeviceServerRequest',
  '2': const [
    const {'1': 'device', '3': 1, '4': 1, '5': 11, '6': '.Device', '10': 'device'},
  ],
};

/// Descriptor for `UpdateDeviceServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDeviceServerRequestDescriptor = $convert.base64Decode('ChlVcGRhdGVEZXZpY2VTZXJ2ZXJSZXF1ZXN0Eh8KBmRldmljZRgBIAEoCzIHLkRldmljZVIGZGV2aWNl');
@$core.Deprecated('Use updateDeviceServerResponseDescriptor instead')
const UpdateDeviceServerResponse$json = const {
  '1': 'UpdateDeviceServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateDeviceServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDeviceServerResponseDescriptor = $convert.base64Decode('ChpVcGRhdGVEZXZpY2VTZXJ2ZXJSZXNwb25zZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use deleteDeviceServerRequestDescriptor instead')
const DeleteDeviceServerRequest$json = const {
  '1': 'DeleteDeviceServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'hardwareId', '3': 2, '4': 1, '5': 9, '10': 'hardwareId'},
  ],
};

/// Descriptor for `DeleteDeviceServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteDeviceServerRequestDescriptor = $convert.base64Decode('ChlEZWxldGVEZXZpY2VTZXJ2ZXJSZXF1ZXN0EhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZBIeCgpoYXJkd2FyZUlkGAIgASgJUgpoYXJkd2FyZUlk');
@$core.Deprecated('Use deleteDeviceServerResponseDescriptor instead')
const DeleteDeviceServerResponse$json = const {
  '1': 'DeleteDeviceServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `DeleteDeviceServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteDeviceServerResponseDescriptor = $convert.base64Decode('ChpEZWxldGVEZXZpY2VTZXJ2ZXJSZXNwb25zZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use getFirmwareLatestDeviceServerRequestDescriptor instead')
const GetFirmwareLatestDeviceServerRequest$json = const {
  '1': 'GetFirmwareLatestDeviceServerRequest',
  '2': const [
    const {'1': 'model', '3': 1, '4': 1, '5': 9, '10': 'model'},
    const {'1': 'firmware', '3': 2, '4': 1, '5': 9, '10': 'firmware'},
    const {'1': 'deviceToken', '3': 3, '4': 1, '5': 9, '10': 'deviceToken'},
    const {'1': 'deviceId', '3': 4, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `GetFirmwareLatestDeviceServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFirmwareLatestDeviceServerRequestDescriptor = $convert.base64Decode('CiRHZXRGaXJtd2FyZUxhdGVzdERldmljZVNlcnZlclJlcXVlc3QSFAoFbW9kZWwYASABKAlSBW1vZGVsEhoKCGZpcm13YXJlGAIgASgJUghmaXJtd2FyZRIgCgtkZXZpY2VUb2tlbhgDIAEoCVILZGV2aWNlVG9rZW4SGgoIZGV2aWNlSWQYBCABKAlSCGRldmljZUlk');
@$core.Deprecated('Use getFirmwareLatestDeviceServerResponseDescriptor instead')
const GetFirmwareLatestDeviceServerResponse$json = const {
  '1': 'GetFirmwareLatestDeviceServerResponse',
  '2': const [
    const {'1': 'firmwareVersion', '3': 1, '4': 1, '5': 9, '10': 'firmwareVersion'},
    const {'1': 'firmwareId', '3': 2, '4': 1, '5': 9, '10': 'firmwareId'},
    const {'1': 'isDownloading', '3': 3, '4': 1, '5': 8, '10': 'isDownloading'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetFirmwareLatestDeviceServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFirmwareLatestDeviceServerResponseDescriptor = $convert.base64Decode('CiVHZXRGaXJtd2FyZUxhdGVzdERldmljZVNlcnZlclJlc3BvbnNlEigKD2Zpcm13YXJlVmVyc2lvbhgBIAEoCVIPZmlybXdhcmVWZXJzaW9uEh4KCmZpcm13YXJlSWQYAiABKAlSCmZpcm13YXJlSWQSJAoNaXNEb3dubG9hZGluZxgDIAEoCFINaXNEb3dubG9hZGluZxIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use downloadFirmwareDeviceServerRequestDescriptor instead')
const DownloadFirmwareDeviceServerRequest$json = const {
  '1': 'DownloadFirmwareDeviceServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'model', '3': 2, '4': 1, '5': 9, '10': 'model'},
    const {'1': 'firmwareId', '3': 3, '4': 1, '5': 9, '10': 'firmwareId'},
  ],
};

/// Descriptor for `DownloadFirmwareDeviceServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadFirmwareDeviceServerRequestDescriptor = $convert.base64Decode('CiNEb3dubG9hZEZpcm13YXJlRGV2aWNlU2VydmVyUmVxdWVzdBIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSFAoFbW9kZWwYAiABKAlSBW1vZGVsEh4KCmZpcm13YXJlSWQYAyABKAlSCmZpcm13YXJlSWQ=');
@$core.Deprecated('Use downloadFirmwareDeviceServerResponseDescriptor instead')
const DownloadFirmwareDeviceServerResponse$json = const {
  '1': 'DownloadFirmwareDeviceServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `DownloadFirmwareDeviceServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadFirmwareDeviceServerResponseDescriptor = $convert.base64Decode('CiREb3dubG9hZEZpcm13YXJlRGV2aWNlU2VydmVyUmVzcG9uc2USLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use forceUpdateFirmwareDeviceServerRequestDescriptor instead')
const ForceUpdateFirmwareDeviceServerRequest$json = const {
  '1': 'ForceUpdateFirmwareDeviceServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `ForceUpdateFirmwareDeviceServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forceUpdateFirmwareDeviceServerRequestDescriptor = $convert.base64Decode('CiZGb3JjZVVwZGF0ZUZpcm13YXJlRGV2aWNlU2VydmVyUmVxdWVzdBIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQ=');
@$core.Deprecated('Use forceUpdateFirmwareDeviceServerResponseDescriptor instead')
const ForceUpdateFirmwareDeviceServerResponse$json = const {
  '1': 'ForceUpdateFirmwareDeviceServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `ForceUpdateFirmwareDeviceServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forceUpdateFirmwareDeviceServerResponseDescriptor = $convert.base64Decode('CidGb3JjZVVwZGF0ZUZpcm13YXJlRGV2aWNlU2VydmVyUmVzcG9uc2USLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use registerDeviceServerRequestDescriptor instead')
const RegisterDeviceServerRequest$json = const {
  '1': 'RegisterDeviceServerRequest',
  '2': const [
    const {'1': 'manToken', '3': 1, '4': 1, '5': 9, '10': 'manToken'},
    const {'1': 'hardwareId', '3': 2, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'model', '3': 3, '4': 1, '5': 9, '10': 'model'},
    const {'1': 'firmware', '3': 4, '4': 1, '5': 9, '10': 'firmware'},
  ],
};

/// Descriptor for `RegisterDeviceServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerDeviceServerRequestDescriptor = $convert.base64Decode('ChtSZWdpc3RlckRldmljZVNlcnZlclJlcXVlc3QSGgoIbWFuVG9rZW4YASABKAlSCG1hblRva2VuEh4KCmhhcmR3YXJlSWQYAiABKAlSCmhhcmR3YXJlSWQSFAoFbW9kZWwYAyABKAlSBW1vZGVsEhoKCGZpcm13YXJlGAQgASgJUghmaXJtd2FyZQ==');
@$core.Deprecated('Use registerDeviceServerResponseDescriptor instead')
const RegisterDeviceServerResponse$json = const {
  '1': 'RegisterDeviceServerResponse',
  '2': const [
    const {'1': 'hardwareId', '3': 1, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'deviceToken', '3': 2, '4': 1, '5': 9, '10': 'deviceToken'},
    const {'1': 'wsEnpoint', '3': 3, '4': 1, '5': 9, '10': 'wsEnpoint'},
    const {'1': 'dataType', '3': 4, '4': 1, '5': 14, '6': '.DataType', '10': 'dataType'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `RegisterDeviceServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerDeviceServerResponseDescriptor = $convert.base64Decode('ChxSZWdpc3RlckRldmljZVNlcnZlclJlc3BvbnNlEh4KCmhhcmR3YXJlSWQYASABKAlSCmhhcmR3YXJlSWQSIAoLZGV2aWNlVG9rZW4YAiABKAlSC2RldmljZVRva2VuEhwKCXdzRW5wb2ludBgDIAEoCVIJd3NFbnBvaW50EiUKCGRhdGFUeXBlGAQgASgOMgkuRGF0YVR5cGVSCGRhdGFUeXBlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use updateWSEndpointDeviceServerRequestDescriptor instead')
const UpdateWSEndpointDeviceServerRequest$json = const {
  '1': 'UpdateWSEndpointDeviceServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'wsEnpoint', '3': 2, '4': 1, '5': 9, '10': 'wsEnpoint'},
  ],
};

/// Descriptor for `UpdateWSEndpointDeviceServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateWSEndpointDeviceServerRequestDescriptor = $convert.base64Decode('CiNVcGRhdGVXU0VuZHBvaW50RGV2aWNlU2VydmVyUmVxdWVzdBIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSHAoJd3NFbnBvaW50GAIgASgJUgl3c0VucG9pbnQ=');
@$core.Deprecated('Use updateWSEndpointDeviceServerResponseDescriptor instead')
const UpdateWSEndpointDeviceServerResponse$json = const {
  '1': 'UpdateWSEndpointDeviceServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateWSEndpointDeviceServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateWSEndpointDeviceServerResponseDescriptor = $convert.base64Decode('CiRVcGRhdGVXU0VuZHBvaW50RGV2aWNlU2VydmVyUmVzcG9uc2USLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use forceUpdateFirmwareAllDevicesByPhoneServerRequestDescriptor instead')
const ForceUpdateFirmwareAllDevicesByPhoneServerRequest$json = const {
  '1': 'ForceUpdateFirmwareAllDevicesByPhoneServerRequest',
  '2': const [
    const {'1': 'customerPhone', '3': 1, '4': 1, '5': 9, '10': 'customerPhone'},
    const {'1': 'homeId', '3': 2, '4': 1, '5': 9, '10': 'homeId'},
  ],
};

/// Descriptor for `ForceUpdateFirmwareAllDevicesByPhoneServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forceUpdateFirmwareAllDevicesByPhoneServerRequestDescriptor = $convert.base64Decode('CjFGb3JjZVVwZGF0ZUZpcm13YXJlQWxsRGV2aWNlc0J5UGhvbmVTZXJ2ZXJSZXF1ZXN0EiQKDWN1c3RvbWVyUGhvbmUYASABKAlSDWN1c3RvbWVyUGhvbmUSFgoGaG9tZUlkGAIgASgJUgZob21lSWQ=');
@$core.Deprecated('Use forceUpdateFirmwareAllDevicesByPhoneServerResponseDescriptor instead')
const ForceUpdateFirmwareAllDevicesByPhoneServerResponse$json = const {
  '1': 'ForceUpdateFirmwareAllDevicesByPhoneServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `ForceUpdateFirmwareAllDevicesByPhoneServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forceUpdateFirmwareAllDevicesByPhoneServerResponseDescriptor = $convert.base64Decode('CjJGb3JjZVVwZGF0ZUZpcm13YXJlQWxsRGV2aWNlc0J5UGhvbmVTZXJ2ZXJSZXNwb25zZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use listSceneDeviceServerRequestDescriptor instead')
const ListSceneDeviceServerRequest$json = const {
  '1': 'ListSceneDeviceServerRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'homeId', '3': 2, '4': 1, '5': 9, '10': 'homeId'},
  ],
};

/// Descriptor for `ListSceneDeviceServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSceneDeviceServerRequestDescriptor = $convert.base64Decode('ChxMaXN0U2NlbmVEZXZpY2VTZXJ2ZXJSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZBIWCgZob21lSWQYAiABKAlSBmhvbWVJZA==');
@$core.Deprecated('Use listSceneDeviceServerResponseDescriptor instead')
const ListSceneDeviceServerResponse$json = const {
  '1': 'ListSceneDeviceServerResponse',
  '2': const [
    const {'1': 'scenes', '3': 1, '4': 3, '5': 11, '6': '.Scene', '10': 'scenes'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `ListSceneDeviceServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSceneDeviceServerResponseDescriptor = $convert.base64Decode('Ch1MaXN0U2NlbmVEZXZpY2VTZXJ2ZXJSZXNwb25zZRIeCgZzY2VuZXMYASADKAsyBi5TY2VuZVIGc2NlbmVzEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getSwitchersServerRequestDescriptor instead')
const GetSwitchersServerRequest$json = const {
  '1': 'GetSwitchersServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `GetSwitchersServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSwitchersServerRequestDescriptor = $convert.base64Decode('ChlHZXRTd2l0Y2hlcnNTZXJ2ZXJSZXF1ZXN0EhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZA==');
@$core.Deprecated('Use getSwitchersServerResponseDescriptor instead')
const GetSwitchersServerResponse$json = const {
  '1': 'GetSwitchersServerResponse',
  '2': const [
    const {'1': 'switchers', '3': 1, '4': 3, '5': 11, '6': '.Switcher', '10': 'switchers'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetSwitchersServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSwitchersServerResponseDescriptor = $convert.base64Decode('ChpHZXRTd2l0Y2hlcnNTZXJ2ZXJSZXNwb25zZRInCglzd2l0Y2hlcnMYASADKAsyCS5Td2l0Y2hlclIJc3dpdGNoZXJzEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getSwitcherServerRequestDescriptor instead')
const GetSwitcherServerRequest$json = const {
  '1': 'GetSwitcherServerRequest',
  '2': const [
    const {'1': 'switcherId', '3': 1, '4': 1, '5': 9, '10': 'switcherId'},
  ],
};

/// Descriptor for `GetSwitcherServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSwitcherServerRequestDescriptor = $convert.base64Decode('ChhHZXRTd2l0Y2hlclNlcnZlclJlcXVlc3QSHgoKc3dpdGNoZXJJZBgBIAEoCVIKc3dpdGNoZXJJZA==');
@$core.Deprecated('Use getSwitcherServerResponseDescriptor instead')
const GetSwitcherServerResponse$json = const {
  '1': 'GetSwitcherServerResponse',
  '2': const [
    const {'1': 'switcher', '3': 1, '4': 1, '5': 11, '6': '.Switcher', '10': 'switcher'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetSwitcherServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSwitcherServerResponseDescriptor = $convert.base64Decode('ChlHZXRTd2l0Y2hlclNlcnZlclJlc3BvbnNlEiUKCHN3aXRjaGVyGAEgASgLMgkuU3dpdGNoZXJSCHN3aXRjaGVyEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getLogSwitcherServerRequestDescriptor instead')
const GetLogSwitcherServerRequest$json = const {
  '1': 'GetLogSwitcherServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'switcher', '3': 2, '4': 1, '5': 13, '10': 'switcher'},
  ],
};

/// Descriptor for `GetLogSwitcherServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLogSwitcherServerRequestDescriptor = $convert.base64Decode('ChtHZXRMb2dTd2l0Y2hlclNlcnZlclJlcXVlc3QSGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEhoKCHN3aXRjaGVyGAIgASgNUghzd2l0Y2hlcg==');
@$core.Deprecated('Use getLogSwitcherServerResponseDescriptor instead')
const GetLogSwitcherServerResponse$json = const {
  '1': 'GetLogSwitcherServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetLogSwitcherServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLogSwitcherServerResponseDescriptor = $convert.base64Decode('ChxHZXRMb2dTd2l0Y2hlclNlcnZlclJlc3BvbnNlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getIconSwitchersServerRequestDescriptor instead')
const GetIconSwitchersServerRequest$json = const {
  '1': 'GetIconSwitchersServerRequest',
};

/// Descriptor for `GetIconSwitchersServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getIconSwitchersServerRequestDescriptor = $convert.base64Decode('Ch1HZXRJY29uU3dpdGNoZXJzU2VydmVyUmVxdWVzdA==');
@$core.Deprecated('Use getIconSwitchersServerResponseDescriptor instead')
const GetIconSwitchersServerResponse$json = const {
  '1': 'GetIconSwitchersServerResponse',
  '2': const [
    const {'1': 'icons', '3': 1, '4': 3, '5': 9, '10': 'icons'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetIconSwitchersServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getIconSwitchersServerResponseDescriptor = $convert.base64Decode('Ch5HZXRJY29uU3dpdGNoZXJzU2VydmVyUmVzcG9uc2USFAoFaWNvbnMYASADKAlSBWljb25zEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use updateSwitcherServerRequestDescriptor instead')
const UpdateSwitcherServerRequest$json = const {
  '1': 'UpdateSwitcherServerRequest',
  '2': const [
    const {'1': 'switcher', '3': 1, '4': 1, '5': 11, '6': '.Switcher', '10': 'switcher'},
  ],
};

/// Descriptor for `UpdateSwitcherServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSwitcherServerRequestDescriptor = $convert.base64Decode('ChtVcGRhdGVTd2l0Y2hlclNlcnZlclJlcXVlc3QSJQoIc3dpdGNoZXIYASABKAsyCS5Td2l0Y2hlclIIc3dpdGNoZXI=');
@$core.Deprecated('Use updateSwitcherServerResponseDescriptor instead')
const UpdateSwitcherServerResponse$json = const {
  '1': 'UpdateSwitcherServerResponse',
  '2': const [
    const {'1': 'switcher', '3': 1, '4': 1, '5': 11, '6': '.Switcher', '10': 'switcher'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateSwitcherServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSwitcherServerResponseDescriptor = $convert.base64Decode('ChxVcGRhdGVTd2l0Y2hlclNlcnZlclJlc3BvbnNlEiUKCHN3aXRjaGVyGAEgASgLMgkuU3dpdGNoZXJSCHN3aXRjaGVyEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use switcherServerRequestDescriptor instead')
const SwitcherServerRequest$json = const {
  '1': 'SwitcherServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'switcher', '3': 2, '4': 1, '5': 13, '10': 'switcher'},
    const {'1': 'powerState', '3': 3, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
  ],
};

/// Descriptor for `SwitcherServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List switcherServerRequestDescriptor = $convert.base64Decode('ChVTd2l0Y2hlclNlcnZlclJlcXVlc3QSGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEhoKCHN3aXRjaGVyGAIgASgNUghzd2l0Y2hlchIrCgpwb3dlclN0YXRlGAMgASgOMgsuUG93ZXJTdGF0ZVIKcG93ZXJTdGF0ZQ==');
@$core.Deprecated('Use switcherServerResponseDescriptor instead')
const SwitcherServerResponse$json = const {
  '1': 'SwitcherServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SwitcherServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List switcherServerResponseDescriptor = $convert.base64Decode('ChZTd2l0Y2hlclNlcnZlclJlc3BvbnNlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getSwitcherSchedulesServerRequestDescriptor instead')
const GetSwitcherSchedulesServerRequest$json = const {
  '1': 'GetSwitcherSchedulesServerRequest',
  '2': const [
    const {'1': 'switcherId', '3': 1, '4': 1, '5': 9, '10': 'switcherId'},
  ],
};

/// Descriptor for `GetSwitcherSchedulesServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSwitcherSchedulesServerRequestDescriptor = $convert.base64Decode('CiFHZXRTd2l0Y2hlclNjaGVkdWxlc1NlcnZlclJlcXVlc3QSHgoKc3dpdGNoZXJJZBgBIAEoCVIKc3dpdGNoZXJJZA==');
@$core.Deprecated('Use getSwitcherSchedulesServerResponseDescriptor instead')
const GetSwitcherSchedulesServerResponse$json = const {
  '1': 'GetSwitcherSchedulesServerResponse',
  '2': const [
    const {'1': 'schedules', '3': 1, '4': 3, '5': 11, '6': '.SwitcherSchedule', '10': 'schedules'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetSwitcherSchedulesServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSwitcherSchedulesServerResponseDescriptor = $convert.base64Decode('CiJHZXRTd2l0Y2hlclNjaGVkdWxlc1NlcnZlclJlc3BvbnNlEi8KCXNjaGVkdWxlcxgBIAMoCzIRLlN3aXRjaGVyU2NoZWR1bGVSCXNjaGVkdWxlcxIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use getSwitcherScheduleServerRequestDescriptor instead')
const GetSwitcherScheduleServerRequest$json = const {
  '1': 'GetSwitcherScheduleServerRequest',
  '2': const [
    const {'1': 'switcherScheduleId', '3': 1, '4': 1, '5': 9, '10': 'switcherScheduleId'},
  ],
};

/// Descriptor for `GetSwitcherScheduleServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSwitcherScheduleServerRequestDescriptor = $convert.base64Decode('CiBHZXRTd2l0Y2hlclNjaGVkdWxlU2VydmVyUmVxdWVzdBIuChJzd2l0Y2hlclNjaGVkdWxlSWQYASABKAlSEnN3aXRjaGVyU2NoZWR1bGVJZA==');
@$core.Deprecated('Use getSwitcherScheduleServerResponseDescriptor instead')
const GetSwitcherScheduleServerResponse$json = const {
  '1': 'GetSwitcherScheduleServerResponse',
  '2': const [
    const {'1': 'schedule', '3': 1, '4': 1, '5': 11, '6': '.SwitcherSchedule', '10': 'schedule'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetSwitcherScheduleServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSwitcherScheduleServerResponseDescriptor = $convert.base64Decode('CiFHZXRTd2l0Y2hlclNjaGVkdWxlU2VydmVyUmVzcG9uc2USLQoIc2NoZWR1bGUYASABKAsyES5Td2l0Y2hlclNjaGVkdWxlUghzY2hlZHVsZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use getCountSwitcherScheduleServerRequestDescriptor instead')
const GetCountSwitcherScheduleServerRequest$json = const {
  '1': 'GetCountSwitcherScheduleServerRequest',
  '2': const [
    const {'1': 'switcherId', '3': 1, '4': 1, '5': 9, '10': 'switcherId'},
  ],
};

/// Descriptor for `GetCountSwitcherScheduleServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCountSwitcherScheduleServerRequestDescriptor = $convert.base64Decode('CiVHZXRDb3VudFN3aXRjaGVyU2NoZWR1bGVTZXJ2ZXJSZXF1ZXN0Eh4KCnN3aXRjaGVySWQYASABKAlSCnN3aXRjaGVySWQ=');
@$core.Deprecated('Use getCountSwitcherScheduleServerResponseDescriptor instead')
const GetCountSwitcherScheduleServerResponse$json = const {
  '1': 'GetCountSwitcherScheduleServerResponse',
  '2': const [
    const {'1': 'count', '3': 1, '4': 1, '5': 13, '10': 'count'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetCountSwitcherScheduleServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCountSwitcherScheduleServerResponseDescriptor = $convert.base64Decode('CiZHZXRDb3VudFN3aXRjaGVyU2NoZWR1bGVTZXJ2ZXJSZXNwb25zZRIUCgVjb3VudBgBIAEoDVIFY291bnQSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use addSwitcherScheduleServerRequestDescriptor instead')
const AddSwitcherScheduleServerRequest$json = const {
  '1': 'AddSwitcherScheduleServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'schedule', '3': 2, '4': 1, '5': 11, '6': '.SwitcherSchedule', '10': 'schedule'},
  ],
};

/// Descriptor for `AddSwitcherScheduleServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addSwitcherScheduleServerRequestDescriptor = $convert.base64Decode('CiBBZGRTd2l0Y2hlclNjaGVkdWxlU2VydmVyUmVxdWVzdBIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSLQoIc2NoZWR1bGUYAiABKAsyES5Td2l0Y2hlclNjaGVkdWxlUghzY2hlZHVsZQ==');
@$core.Deprecated('Use addSwitcherScheduleServerResponseDescriptor instead')
const AddSwitcherScheduleServerResponse$json = const {
  '1': 'AddSwitcherScheduleServerResponse',
  '2': const [
    const {'1': 'switcherScheduleId', '3': 1, '4': 1, '5': 9, '10': 'switcherScheduleId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `AddSwitcherScheduleServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addSwitcherScheduleServerResponseDescriptor = $convert.base64Decode('CiFBZGRTd2l0Y2hlclNjaGVkdWxlU2VydmVyUmVzcG9uc2USLgoSc3dpdGNoZXJTY2hlZHVsZUlkGAEgASgJUhJzd2l0Y2hlclNjaGVkdWxlSWQSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use updateSwitcherScheduleServerRequestDescriptor instead')
const UpdateSwitcherScheduleServerRequest$json = const {
  '1': 'UpdateSwitcherScheduleServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'schedule', '3': 2, '4': 1, '5': 11, '6': '.SwitcherSchedule', '10': 'schedule'},
  ],
};

/// Descriptor for `UpdateSwitcherScheduleServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSwitcherScheduleServerRequestDescriptor = $convert.base64Decode('CiNVcGRhdGVTd2l0Y2hlclNjaGVkdWxlU2VydmVyUmVxdWVzdBIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSLQoIc2NoZWR1bGUYAiABKAsyES5Td2l0Y2hlclNjaGVkdWxlUghzY2hlZHVsZQ==');
@$core.Deprecated('Use updateSwitcherScheduleServerResponseDescriptor instead')
const UpdateSwitcherScheduleServerResponse$json = const {
  '1': 'UpdateSwitcherScheduleServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateSwitcherScheduleServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSwitcherScheduleServerResponseDescriptor = $convert.base64Decode('CiRVcGRhdGVTd2l0Y2hlclNjaGVkdWxlU2VydmVyUmVzcG9uc2USLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use deleteSwitcherScheduleServerRequestDescriptor instead')
const DeleteSwitcherScheduleServerRequest$json = const {
  '1': 'DeleteSwitcherScheduleServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'switcherScheduleId', '3': 2, '4': 1, '5': 9, '10': 'switcherScheduleId'},
  ],
};

/// Descriptor for `DeleteSwitcherScheduleServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSwitcherScheduleServerRequestDescriptor = $convert.base64Decode('CiNEZWxldGVTd2l0Y2hlclNjaGVkdWxlU2VydmVyUmVxdWVzdBIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSLgoSc3dpdGNoZXJTY2hlZHVsZUlkGAIgASgJUhJzd2l0Y2hlclNjaGVkdWxlSWQ=');
@$core.Deprecated('Use deleteSwitcherScheduleServerResponseDescriptor instead')
const DeleteSwitcherScheduleServerResponse$json = const {
  '1': 'DeleteSwitcherScheduleServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `DeleteSwitcherScheduleServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSwitcherScheduleServerResponseDescriptor = $convert.base64Decode('CiREZWxldGVTd2l0Y2hlclNjaGVkdWxlU2VydmVyUmVzcG9uc2USLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use setActiveSwitcherScheduleServerRequestDescriptor instead')
const SetActiveSwitcherScheduleServerRequest$json = const {
  '1': 'SetActiveSwitcherScheduleServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'switcherScheduleId', '3': 2, '4': 1, '5': 9, '10': 'switcherScheduleId'},
    const {'1': 'active', '3': 3, '4': 1, '5': 8, '10': 'active'},
  ],
};

/// Descriptor for `SetActiveSwitcherScheduleServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setActiveSwitcherScheduleServerRequestDescriptor = $convert.base64Decode('CiZTZXRBY3RpdmVTd2l0Y2hlclNjaGVkdWxlU2VydmVyUmVxdWVzdBIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSLgoSc3dpdGNoZXJTY2hlZHVsZUlkGAIgASgJUhJzd2l0Y2hlclNjaGVkdWxlSWQSFgoGYWN0aXZlGAMgASgIUgZhY3RpdmU=');
@$core.Deprecated('Use setActiveSwitcherScheduleServerResponseDescriptor instead')
const SetActiveSwitcherScheduleServerResponse$json = const {
  '1': 'SetActiveSwitcherScheduleServerResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'switcherScheduleId', '3': 2, '4': 1, '5': 9, '10': 'switcherScheduleId'},
    const {'1': 'active', '3': 3, '4': 1, '5': 8, '10': 'active'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SetActiveSwitcherScheduleServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setActiveSwitcherScheduleServerResponseDescriptor = $convert.base64Decode('CidTZXRBY3RpdmVTd2l0Y2hlclNjaGVkdWxlU2VydmVyUmVzcG9uc2USGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEi4KEnN3aXRjaGVyU2NoZWR1bGVJZBgCIAEoCVISc3dpdGNoZXJTY2hlZHVsZUlkEhYKBmFjdGl2ZRgDIAEoCFIGYWN0aXZlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getCurtainSwitcherServerRequestDescriptor instead')
const GetCurtainSwitcherServerRequest$json = const {
  '1': 'GetCurtainSwitcherServerRequest',
  '2': const [
    const {'1': 'curtainSwitcherId', '3': 1, '4': 1, '5': 9, '10': 'curtainSwitcherId'},
  ],
};

/// Descriptor for `GetCurtainSwitcherServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCurtainSwitcherServerRequestDescriptor = $convert.base64Decode('Ch9HZXRDdXJ0YWluU3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0EiwKEWN1cnRhaW5Td2l0Y2hlcklkGAEgASgJUhFjdXJ0YWluU3dpdGNoZXJJZA==');
@$core.Deprecated('Use getCurtainSwitcherServerResponseDescriptor instead')
const GetCurtainSwitcherServerResponse$json = const {
  '1': 'GetCurtainSwitcherServerResponse',
  '2': const [
    const {'1': 'curtainSwitcher', '3': 1, '4': 1, '5': 11, '6': '.CurtainSwitcher', '10': 'curtainSwitcher'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetCurtainSwitcherServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCurtainSwitcherServerResponseDescriptor = $convert.base64Decode('CiBHZXRDdXJ0YWluU3dpdGNoZXJTZXJ2ZXJSZXNwb25zZRI6Cg9jdXJ0YWluU3dpdGNoZXIYASABKAsyEC5DdXJ0YWluU3dpdGNoZXJSD2N1cnRhaW5Td2l0Y2hlchIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use updateCurtainSwitcherServerRequestDescriptor instead')
const UpdateCurtainSwitcherServerRequest$json = const {
  '1': 'UpdateCurtainSwitcherServerRequest',
  '2': const [
    const {'1': 'curtainSwitcher', '3': 1, '4': 1, '5': 11, '6': '.CurtainSwitcher', '10': 'curtainSwitcher'},
  ],
};

/// Descriptor for `UpdateCurtainSwitcherServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateCurtainSwitcherServerRequestDescriptor = $convert.base64Decode('CiJVcGRhdGVDdXJ0YWluU3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0EjoKD2N1cnRhaW5Td2l0Y2hlchgBIAEoCzIQLkN1cnRhaW5Td2l0Y2hlclIPY3VydGFpblN3aXRjaGVy');
@$core.Deprecated('Use updateCurtainSwitcherServerResponseDescriptor instead')
const UpdateCurtainSwitcherServerResponse$json = const {
  '1': 'UpdateCurtainSwitcherServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateCurtainSwitcherServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateCurtainSwitcherServerResponseDescriptor = $convert.base64Decode('CiNVcGRhdGVDdXJ0YWluU3dpdGNoZXJTZXJ2ZXJSZXNwb25zZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use getCurtainSwitcherStateServerRequestDescriptor instead')
const GetCurtainSwitcherStateServerRequest$json = const {
  '1': 'GetCurtainSwitcherStateServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `GetCurtainSwitcherStateServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCurtainSwitcherStateServerRequestDescriptor = $convert.base64Decode('CiRHZXRDdXJ0YWluU3dpdGNoZXJTdGF0ZVNlcnZlclJlcXVlc3QSGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlk');
@$core.Deprecated('Use getCurtainSwitcherStateServerResponseDescriptor instead')
const GetCurtainSwitcherStateServerResponse$json = const {
  '1': 'GetCurtainSwitcherStateServerResponse',
  '2': const [
    const {'1': 'percentIn', '3': 1, '4': 1, '5': 13, '10': 'percentIn'},
    const {'1': 'percentOut', '3': 2, '4': 1, '5': 13, '10': 'percentOut'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetCurtainSwitcherStateServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCurtainSwitcherStateServerResponseDescriptor = $convert.base64Decode('CiVHZXRDdXJ0YWluU3dpdGNoZXJTdGF0ZVNlcnZlclJlc3BvbnNlEhwKCXBlcmNlbnRJbhgBIAEoDVIJcGVyY2VudEluEh4KCnBlcmNlbnRPdXQYAiABKA1SCnBlcmNlbnRPdXQSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use curtainSwitcherServerRequestDescriptor instead')
const CurtainSwitcherServerRequest$json = const {
  '1': 'CurtainSwitcherServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'percentIn', '3': 2, '4': 1, '5': 13, '10': 'percentIn'},
    const {'1': 'percentOut', '3': 3, '4': 1, '5': 13, '10': 'percentOut'},
  ],
};

/// Descriptor for `CurtainSwitcherServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List curtainSwitcherServerRequestDescriptor = $convert.base64Decode('ChxDdXJ0YWluU3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0EhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZBIcCglwZXJjZW50SW4YAiABKA1SCXBlcmNlbnRJbhIeCgpwZXJjZW50T3V0GAMgASgNUgpwZXJjZW50T3V0');
@$core.Deprecated('Use curtainSwitcherServerResponseDescriptor instead')
const CurtainSwitcherServerResponse$json = const {
  '1': 'CurtainSwitcherServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `CurtainSwitcherServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List curtainSwitcherServerResponseDescriptor = $convert.base64Decode('Ch1DdXJ0YWluU3dpdGNoZXJTZXJ2ZXJSZXNwb25zZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use getCurtainSwitcherSchedulesServerRequestDescriptor instead')
const GetCurtainSwitcherSchedulesServerRequest$json = const {
  '1': 'GetCurtainSwitcherSchedulesServerRequest',
  '2': const [
    const {'1': 'curtainSwitcherId', '3': 1, '4': 1, '5': 9, '10': 'curtainSwitcherId'},
  ],
};

/// Descriptor for `GetCurtainSwitcherSchedulesServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCurtainSwitcherSchedulesServerRequestDescriptor = $convert.base64Decode('CihHZXRDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZXNTZXJ2ZXJSZXF1ZXN0EiwKEWN1cnRhaW5Td2l0Y2hlcklkGAEgASgJUhFjdXJ0YWluU3dpdGNoZXJJZA==');
@$core.Deprecated('Use getCurtainSwitcherSchedulesServerResponseDescriptor instead')
const GetCurtainSwitcherSchedulesServerResponse$json = const {
  '1': 'GetCurtainSwitcherSchedulesServerResponse',
  '2': const [
    const {'1': 'schedules', '3': 1, '4': 3, '5': 11, '6': '.CurtainSwitcherSchedule', '10': 'schedules'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetCurtainSwitcherSchedulesServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCurtainSwitcherSchedulesServerResponseDescriptor = $convert.base64Decode('CilHZXRDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZXNTZXJ2ZXJSZXNwb25zZRI2CglzY2hlZHVsZXMYASADKAsyGC5DdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVIJc2NoZWR1bGVzEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getCurtainSwitcherScheduleServerRequestDescriptor instead')
const GetCurtainSwitcherScheduleServerRequest$json = const {
  '1': 'GetCurtainSwitcherScheduleServerRequest',
  '2': const [
    const {'1': 'curtainSwitcherScheduleId', '3': 1, '4': 1, '5': 9, '10': 'curtainSwitcherScheduleId'},
  ],
};

/// Descriptor for `GetCurtainSwitcherScheduleServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCurtainSwitcherScheduleServerRequestDescriptor = $convert.base64Decode('CidHZXRDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3QSPAoZY3VydGFpblN3aXRjaGVyU2NoZWR1bGVJZBgBIAEoCVIZY3VydGFpblN3aXRjaGVyU2NoZWR1bGVJZA==');
@$core.Deprecated('Use getCurtainSwitcherScheduleServerResponseDescriptor instead')
const GetCurtainSwitcherScheduleServerResponse$json = const {
  '1': 'GetCurtainSwitcherScheduleServerResponse',
  '2': const [
    const {'1': 'schedule', '3': 1, '4': 1, '5': 11, '6': '.CurtainSwitcherSchedule', '10': 'schedule'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetCurtainSwitcherScheduleServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCurtainSwitcherScheduleServerResponseDescriptor = $convert.base64Decode('CihHZXRDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlc3BvbnNlEjQKCHNjaGVkdWxlGAEgASgLMhguQ3VydGFpblN3aXRjaGVyU2NoZWR1bGVSCHNjaGVkdWxlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getCountCurtainSwitcherScheduleServerRequestDescriptor instead')
const GetCountCurtainSwitcherScheduleServerRequest$json = const {
  '1': 'GetCountCurtainSwitcherScheduleServerRequest',
  '2': const [
    const {'1': 'curtainSwitcherId', '3': 1, '4': 1, '5': 9, '10': 'curtainSwitcherId'},
  ],
};

/// Descriptor for `GetCountCurtainSwitcherScheduleServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCountCurtainSwitcherScheduleServerRequestDescriptor = $convert.base64Decode('CixHZXRDb3VudEN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlU2VydmVyUmVxdWVzdBIsChFjdXJ0YWluU3dpdGNoZXJJZBgBIAEoCVIRY3VydGFpblN3aXRjaGVySWQ=');
@$core.Deprecated('Use getCountCurtainSwitcherScheduleServerResponseDescriptor instead')
const GetCountCurtainSwitcherScheduleServerResponse$json = const {
  '1': 'GetCountCurtainSwitcherScheduleServerResponse',
  '2': const [
    const {'1': 'count', '3': 1, '4': 1, '5': 13, '10': 'count'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetCountCurtainSwitcherScheduleServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCountCurtainSwitcherScheduleServerResponseDescriptor = $convert.base64Decode('Ci1HZXRDb3VudEN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlU2VydmVyUmVzcG9uc2USFAoFY291bnQYASABKA1SBWNvdW50EiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use addCurtainSwitcherScheduleServerRequestDescriptor instead')
const AddCurtainSwitcherScheduleServerRequest$json = const {
  '1': 'AddCurtainSwitcherScheduleServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'schedule', '3': 2, '4': 1, '5': 11, '6': '.CurtainSwitcherSchedule', '10': 'schedule'},
  ],
};

/// Descriptor for `AddCurtainSwitcherScheduleServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addCurtainSwitcherScheduleServerRequestDescriptor = $convert.base64Decode('CidBZGRDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3QSGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEjQKCHNjaGVkdWxlGAIgASgLMhguQ3VydGFpblN3aXRjaGVyU2NoZWR1bGVSCHNjaGVkdWxl');
@$core.Deprecated('Use addCurtainSwitcherScheduleServerResponseDescriptor instead')
const AddCurtainSwitcherScheduleServerResponse$json = const {
  '1': 'AddCurtainSwitcherScheduleServerResponse',
  '2': const [
    const {'1': 'curtainSwitcherScheduleId', '3': 1, '4': 1, '5': 9, '10': 'curtainSwitcherScheduleId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `AddCurtainSwitcherScheduleServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addCurtainSwitcherScheduleServerResponseDescriptor = $convert.base64Decode('CihBZGRDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlc3BvbnNlEjwKGWN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlSWQYASABKAlSGWN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlSWQSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use updateCurtainSwitcherScheduleServerRequestDescriptor instead')
const UpdateCurtainSwitcherScheduleServerRequest$json = const {
  '1': 'UpdateCurtainSwitcherScheduleServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'schedule', '3': 2, '4': 1, '5': 11, '6': '.CurtainSwitcherSchedule', '10': 'schedule'},
  ],
};

/// Descriptor for `UpdateCurtainSwitcherScheduleServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateCurtainSwitcherScheduleServerRequestDescriptor = $convert.base64Decode('CipVcGRhdGVDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3QSGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEjQKCHNjaGVkdWxlGAIgASgLMhguQ3VydGFpblN3aXRjaGVyU2NoZWR1bGVSCHNjaGVkdWxl');
@$core.Deprecated('Use updateCurtainSwitcherScheduleServerResponseDescriptor instead')
const UpdateCurtainSwitcherScheduleServerResponse$json = const {
  '1': 'UpdateCurtainSwitcherScheduleServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateCurtainSwitcherScheduleServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateCurtainSwitcherScheduleServerResponseDescriptor = $convert.base64Decode('CitVcGRhdGVDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlc3BvbnNlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use deleteCurtainSwitcherScheduleServerRequestDescriptor instead')
const DeleteCurtainSwitcherScheduleServerRequest$json = const {
  '1': 'DeleteCurtainSwitcherScheduleServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'curtainSwitcherScheduleId', '3': 2, '4': 1, '5': 9, '10': 'curtainSwitcherScheduleId'},
  ],
};

/// Descriptor for `DeleteCurtainSwitcherScheduleServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCurtainSwitcherScheduleServerRequestDescriptor = $convert.base64Decode('CipEZWxldGVDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3QSGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEjwKGWN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlSWQYAiABKAlSGWN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlSWQ=');
@$core.Deprecated('Use deleteCurtainSwitcherScheduleServerResponseDescriptor instead')
const DeleteCurtainSwitcherScheduleServerResponse$json = const {
  '1': 'DeleteCurtainSwitcherScheduleServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `DeleteCurtainSwitcherScheduleServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCurtainSwitcherScheduleServerResponseDescriptor = $convert.base64Decode('CitEZWxldGVDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlc3BvbnNlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use setActiveCurtainSwitcherScheduleServerRequestDescriptor instead')
const SetActiveCurtainSwitcherScheduleServerRequest$json = const {
  '1': 'SetActiveCurtainSwitcherScheduleServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'curtainSwitcherScheduleId', '3': 2, '4': 1, '5': 9, '10': 'curtainSwitcherScheduleId'},
    const {'1': 'active', '3': 3, '4': 1, '5': 8, '10': 'active'},
  ],
};

/// Descriptor for `SetActiveCurtainSwitcherScheduleServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setActiveCurtainSwitcherScheduleServerRequestDescriptor = $convert.base64Decode('Ci1TZXRBY3RpdmVDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3QSGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEjwKGWN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlSWQYAiABKAlSGWN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlSWQSFgoGYWN0aXZlGAMgASgIUgZhY3RpdmU=');
@$core.Deprecated('Use setActiveCurtainSwitcherScheduleServerResponseDescriptor instead')
const SetActiveCurtainSwitcherScheduleServerResponse$json = const {
  '1': 'SetActiveCurtainSwitcherScheduleServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SetActiveCurtainSwitcherScheduleServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setActiveCurtainSwitcherScheduleServerResponseDescriptor = $convert.base64Decode('Ci5TZXRBY3RpdmVDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlc3BvbnNlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getMeterServerRequestDescriptor instead')
const GetMeterServerRequest$json = const {
  '1': 'GetMeterServerRequest',
  '2': const [
    const {'1': 'meterId', '3': 1, '4': 1, '5': 9, '10': 'meterId'},
    const {'1': 'serialNumber', '3': 2, '4': 1, '5': 9, '10': 'serialNumber'},
    const {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.TypeMeter', '10': 'type'},
    const {'1': 'date', '3': 4, '4': 1, '5': 11, '6': '.DateTime', '10': 'date'},
    const {'1': 'months', '3': 5, '4': 1, '5': 5, '10': 'months'},
  ],
};

/// Descriptor for `GetMeterServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMeterServerRequestDescriptor = $convert.base64Decode('ChVHZXRNZXRlclNlcnZlclJlcXVlc3QSGAoHbWV0ZXJJZBgBIAEoCVIHbWV0ZXJJZBIiCgxzZXJpYWxOdW1iZXIYAiABKAlSDHNlcmlhbE51bWJlchIeCgR0eXBlGAMgASgOMgouVHlwZU1ldGVyUgR0eXBlEh0KBGRhdGUYBCABKAsyCS5EYXRlVGltZVIEZGF0ZRIWCgZtb250aHMYBSABKAVSBm1vbnRocw==');
@$core.Deprecated('Use getMeterServerResponseDescriptor instead')
const GetMeterServerResponse$json = const {
  '1': 'GetMeterServerResponse',
  '2': const [
    const {'1': 'meter', '3': 1, '4': 1, '5': 11, '6': '.Meter', '10': 'meter'},
    const {'1': 'meterEstimate', '3': 2, '4': 3, '5': 11, '6': '.MeterEstimate', '10': 'meterEstimate'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetMeterServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMeterServerResponseDescriptor = $convert.base64Decode('ChZHZXRNZXRlclNlcnZlclJlc3BvbnNlEhwKBW1ldGVyGAEgASgLMgYuTWV0ZXJSBW1ldGVyEjQKDW1ldGVyRXN0aW1hdGUYAiADKAsyDi5NZXRlckVzdGltYXRlUg1tZXRlckVzdGltYXRlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use updateMeterServerRequestDescriptor instead')
const UpdateMeterServerRequest$json = const {
  '1': 'UpdateMeterServerRequest',
  '2': const [
    const {'1': 'meter', '3': 1, '4': 1, '5': 11, '6': '.Meter', '10': 'meter'},
  ],
};

/// Descriptor for `UpdateMeterServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMeterServerRequestDescriptor = $convert.base64Decode('ChhVcGRhdGVNZXRlclNlcnZlclJlcXVlc3QSHAoFbWV0ZXIYASABKAsyBi5NZXRlclIFbWV0ZXI=');
@$core.Deprecated('Use updateMeterServerResponseDescriptor instead')
const UpdateMeterServerResponse$json = const {
  '1': 'UpdateMeterServerResponse',
  '2': const [
    const {'1': 'meter', '3': 1, '4': 1, '5': 11, '6': '.Meter', '10': 'meter'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateMeterServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMeterServerResponseDescriptor = $convert.base64Decode('ChlVcGRhdGVNZXRlclNlcnZlclJlc3BvbnNlEhwKBW1ldGVyGAEgASgLMgYuTWV0ZXJSBW1ldGVyEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getMeterEstimatesDayInMonthServerRequestDescriptor instead')
const GetMeterEstimatesDayInMonthServerRequest$json = const {
  '1': 'GetMeterEstimatesDayInMonthServerRequest',
  '2': const [
    const {'1': 'serialNumber', '3': 1, '4': 1, '5': 9, '10': 'serialNumber'},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.TypeMeter', '10': 'type'},
    const {'1': 'year', '3': 3, '4': 1, '5': 13, '10': 'year'},
    const {'1': 'month', '3': 4, '4': 1, '5': 13, '10': 'month'},
  ],
};

/// Descriptor for `GetMeterEstimatesDayInMonthServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMeterEstimatesDayInMonthServerRequestDescriptor = $convert.base64Decode('CihHZXRNZXRlckVzdGltYXRlc0RheUluTW9udGhTZXJ2ZXJSZXF1ZXN0EiIKDHNlcmlhbE51bWJlchgBIAEoCVIMc2VyaWFsTnVtYmVyEh4KBHR5cGUYAiABKA4yCi5UeXBlTWV0ZXJSBHR5cGUSEgoEeWVhchgDIAEoDVIEeWVhchIUCgVtb250aBgEIAEoDVIFbW9udGg=');
@$core.Deprecated('Use getMeterEstimatesDayInMonthServerResponseDescriptor instead')
const GetMeterEstimatesDayInMonthServerResponse$json = const {
  '1': 'GetMeterEstimatesDayInMonthServerResponse',
  '2': const [
    const {'1': 'estimates', '3': 1, '4': 3, '5': 11, '6': '.MeterEstimate', '10': 'estimates'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetMeterEstimatesDayInMonthServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMeterEstimatesDayInMonthServerResponseDescriptor = $convert.base64Decode('CilHZXRNZXRlckVzdGltYXRlc0RheUluTW9udGhTZXJ2ZXJSZXNwb25zZRIsCgllc3RpbWF0ZXMYASADKAsyDi5NZXRlckVzdGltYXRlUgllc3RpbWF0ZXMSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use getMeterEstimatesHourInDayServerRequestDescriptor instead')
const GetMeterEstimatesHourInDayServerRequest$json = const {
  '1': 'GetMeterEstimatesHourInDayServerRequest',
  '2': const [
    const {'1': 'serialNumber', '3': 1, '4': 1, '5': 9, '10': 'serialNumber'},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.TypeMeter', '10': 'type'},
    const {'1': 'year', '3': 3, '4': 1, '5': 13, '10': 'year'},
    const {'1': 'month', '3': 4, '4': 1, '5': 13, '10': 'month'},
    const {'1': 'day', '3': 5, '4': 1, '5': 13, '10': 'day'},
  ],
};

/// Descriptor for `GetMeterEstimatesHourInDayServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMeterEstimatesHourInDayServerRequestDescriptor = $convert.base64Decode('CidHZXRNZXRlckVzdGltYXRlc0hvdXJJbkRheVNlcnZlclJlcXVlc3QSIgoMc2VyaWFsTnVtYmVyGAEgASgJUgxzZXJpYWxOdW1iZXISHgoEdHlwZRgCIAEoDjIKLlR5cGVNZXRlclIEdHlwZRISCgR5ZWFyGAMgASgNUgR5ZWFyEhQKBW1vbnRoGAQgASgNUgVtb250aBIQCgNkYXkYBSABKA1SA2RheQ==');
@$core.Deprecated('Use getMeterEstimatesHourInDayServerResponseDescriptor instead')
const GetMeterEstimatesHourInDayServerResponse$json = const {
  '1': 'GetMeterEstimatesHourInDayServerResponse',
  '2': const [
    const {'1': 'estimates', '3': 1, '4': 3, '5': 11, '6': '.MeterEstimate', '10': 'estimates'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetMeterEstimatesHourInDayServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMeterEstimatesHourInDayServerResponseDescriptor = $convert.base64Decode('CihHZXRNZXRlckVzdGltYXRlc0hvdXJJbkRheVNlcnZlclJlc3BvbnNlEiwKCWVzdGltYXRlcxgBIAMoCzIOLk1ldGVyRXN0aW1hdGVSCWVzdGltYXRlcxIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use getMetersByHomeIdServerRequestDescriptor instead')
const GetMetersByHomeIdServerRequest$json = const {
  '1': 'GetMetersByHomeIdServerRequest',
  '2': const [
    const {'1': 'homeId', '3': 1, '4': 1, '5': 9, '10': 'homeId'},
  ],
};

/// Descriptor for `GetMetersByHomeIdServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMetersByHomeIdServerRequestDescriptor = $convert.base64Decode('Ch5HZXRNZXRlcnNCeUhvbWVJZFNlcnZlclJlcXVlc3QSFgoGaG9tZUlkGAEgASgJUgZob21lSWQ=');
@$core.Deprecated('Use getMetersByHomeIdServerResponseDescriptor instead')
const GetMetersByHomeIdServerResponse$json = const {
  '1': 'GetMetersByHomeIdServerResponse',
  '2': const [
    const {'1': 'homeId', '3': 1, '4': 1, '5': 9, '10': 'homeId'},
    const {'1': 'meters', '3': 2, '4': 3, '5': 11, '6': '.Meter', '10': 'meters'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetMetersByHomeIdServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMetersByHomeIdServerResponseDescriptor = $convert.base64Decode('Ch9HZXRNZXRlcnNCeUhvbWVJZFNlcnZlclJlc3BvbnNlEhYKBmhvbWVJZBgBIAEoCVIGaG9tZUlkEh4KBm1ldGVycxgCIAMoCzIGLk1ldGVyUgZtZXRlcnMSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use getMeterMissingInDayServerRequestDescriptor instead')
const GetMeterMissingInDayServerRequest$json = const {
  '1': 'GetMeterMissingInDayServerRequest',
  '2': const [
    const {'1': 'hardwareId', '3': 1, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'date', '3': 2, '4': 1, '5': 5, '10': 'date'},
  ],
};

/// Descriptor for `GetMeterMissingInDayServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMeterMissingInDayServerRequestDescriptor = $convert.base64Decode('CiFHZXRNZXRlck1pc3NpbmdJbkRheVNlcnZlclJlcXVlc3QSHgoKaGFyZHdhcmVJZBgBIAEoCVIKaGFyZHdhcmVJZBISCgRkYXRlGAIgASgFUgRkYXRl');
@$core.Deprecated('Use getMeterMissingInDayServerResponseDescriptor instead')
const GetMeterMissingInDayServerResponse$json = const {
  '1': 'GetMeterMissingInDayServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetMeterMissingInDayServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMeterMissingInDayServerResponseDescriptor = $convert.base64Decode('CiJHZXRNZXRlck1pc3NpbmdJbkRheVNlcnZlclJlc3BvbnNlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getAirConditionerStateServerRequestDescriptor instead')
const GetAirConditionerStateServerRequest$json = const {
  '1': 'GetAirConditionerStateServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'indoorId', '3': 2, '4': 1, '5': 13, '10': 'indoorId'},
    const {'1': 'remoteId', '3': 3, '4': 1, '5': 9, '10': 'remoteId'},
  ],
};

/// Descriptor for `GetAirConditionerStateServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAirConditionerStateServerRequestDescriptor = $convert.base64Decode('CiNHZXRBaXJDb25kaXRpb25lclN0YXRlU2VydmVyUmVxdWVzdBIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSGgoIaW5kb29ySWQYAiABKA1SCGluZG9vcklkEhoKCHJlbW90ZUlkGAMgASgJUghyZW1vdGVJZA==');
@$core.Deprecated('Use getAirConditionerStateServerResponseDescriptor instead')
const GetAirConditionerStateServerResponse$json = const {
  '1': 'GetAirConditionerStateServerResponse',
  '2': const [
    const {'1': 'state', '3': 1, '4': 1, '5': 11, '6': '.AirConditionerState', '10': 'state'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetAirConditionerStateServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAirConditionerStateServerResponseDescriptor = $convert.base64Decode('CiRHZXRBaXJDb25kaXRpb25lclN0YXRlU2VydmVyUmVzcG9uc2USKgoFc3RhdGUYASABKAsyFC5BaXJDb25kaXRpb25lclN0YXRlUgVzdGF0ZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use airConditionerServerRequestDescriptor instead')
const AirConditionerServerRequest$json = const {
  '1': 'AirConditionerServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'state', '3': 2, '4': 1, '5': 11, '6': '.AirConditionerState', '10': 'state'},
  ],
};

/// Descriptor for `AirConditionerServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List airConditionerServerRequestDescriptor = $convert.base64Decode('ChtBaXJDb25kaXRpb25lclNlcnZlclJlcXVlc3QSGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEioKBXN0YXRlGAIgASgLMhQuQWlyQ29uZGl0aW9uZXJTdGF0ZVIFc3RhdGU=');
@$core.Deprecated('Use airConditionerServerResponseDescriptor instead')
const AirConditionerServerResponse$json = const {
  '1': 'AirConditionerServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `AirConditionerServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List airConditionerServerResponseDescriptor = $convert.base64Decode('ChxBaXJDb25kaXRpb25lclNlcnZlclJlc3BvbnNlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getRemotesServerRequestDescriptor instead')
const GetRemotesServerRequest$json = const {
  '1': 'GetRemotesServerRequest',
  '2': const [
    const {'1': 'homeId', '3': 1, '4': 1, '5': 9, '10': 'homeId'},
    const {'1': 'group', '3': 2, '4': 1, '5': 14, '6': '.GroupDevice', '10': 'group'},
  ],
};

/// Descriptor for `GetRemotesServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRemotesServerRequestDescriptor = $convert.base64Decode('ChdHZXRSZW1vdGVzU2VydmVyUmVxdWVzdBIWCgZob21lSWQYASABKAlSBmhvbWVJZBIiCgVncm91cBgCIAEoDjIMLkdyb3VwRGV2aWNlUgVncm91cA==');
@$core.Deprecated('Use getRemotesServerResponseDescriptor instead')
const GetRemotesServerResponse$json = const {
  '1': 'GetRemotesServerResponse',
  '2': const [
    const {'1': 'remotes', '3': 1, '4': 3, '5': 11, '6': '.Remote', '10': 'remotes'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetRemotesServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRemotesServerResponseDescriptor = $convert.base64Decode('ChhHZXRSZW1vdGVzU2VydmVyUmVzcG9uc2USIQoHcmVtb3RlcxgBIAMoCzIHLlJlbW90ZVIHcmVtb3RlcxIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use getRemoteServerRequestDescriptor instead')
const GetRemoteServerRequest$json = const {
  '1': 'GetRemoteServerRequest',
  '2': const [
    const {'1': 'remoteId', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'homeId', '3': 2, '4': 1, '5': 9, '10': 'homeId'},
  ],
};

/// Descriptor for `GetRemoteServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRemoteServerRequestDescriptor = $convert.base64Decode('ChZHZXRSZW1vdGVTZXJ2ZXJSZXF1ZXN0EhoKCHJlbW90ZUlkGAEgASgJUghyZW1vdGVJZBIWCgZob21lSWQYAiABKAlSBmhvbWVJZA==');
@$core.Deprecated('Use getRemoteServerResponseDescriptor instead')
const GetRemoteServerResponse$json = const {
  '1': 'GetRemoteServerResponse',
  '2': const [
    const {'1': 'remote', '3': 1, '4': 1, '5': 11, '6': '.Remote', '10': 'remote'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetRemoteServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRemoteServerResponseDescriptor = $convert.base64Decode('ChdHZXRSZW1vdGVTZXJ2ZXJSZXNwb25zZRIfCgZyZW1vdGUYASABKAsyBy5SZW1vdGVSBnJlbW90ZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use getRemoteLibrariesServerRequestDescriptor instead')
const GetRemoteLibrariesServerRequest$json = const {
  '1': 'GetRemoteLibrariesServerRequest',
  '2': const [
    const {'1': 'search', '3': 1, '4': 1, '5': 9, '10': 'search'},
    const {'1': 'last_name', '3': 2, '4': 1, '5': 9, '10': 'lastName'},
    const {'1': 'size', '3': 3, '4': 1, '5': 13, '10': 'size'},
  ],
};

/// Descriptor for `GetRemoteLibrariesServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRemoteLibrariesServerRequestDescriptor = $convert.base64Decode('Ch9HZXRSZW1vdGVMaWJyYXJpZXNTZXJ2ZXJSZXF1ZXN0EhYKBnNlYXJjaBgBIAEoCVIGc2VhcmNoEhsKCWxhc3RfbmFtZRgCIAEoCVIIbGFzdE5hbWUSEgoEc2l6ZRgDIAEoDVIEc2l6ZQ==');
@$core.Deprecated('Use getRemoteLibrariesServerResponseDescriptor instead')
const GetRemoteLibrariesServerResponse$json = const {
  '1': 'GetRemoteLibrariesServerResponse',
  '2': const [
    const {'1': 'libraries', '3': 1, '4': 3, '5': 11, '6': '.RemoteLibrary', '10': 'libraries'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetRemoteLibrariesServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRemoteLibrariesServerResponseDescriptor = $convert.base64Decode('CiBHZXRSZW1vdGVMaWJyYXJpZXNTZXJ2ZXJSZXNwb25zZRIsCglsaWJyYXJpZXMYASADKAsyDi5SZW1vdGVMaWJyYXJ5UglsaWJyYXJpZXMSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use getCommandsRemoteServerRequestDescriptor instead')
const GetCommandsRemoteServerRequest$json = const {
  '1': 'GetCommandsRemoteServerRequest',
  '2': const [
    const {'1': 'remoteId', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'remoteLibraryId', '3': 2, '4': 1, '5': 9, '10': 'remoteLibraryId'},
  ],
};

/// Descriptor for `GetCommandsRemoteServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCommandsRemoteServerRequestDescriptor = $convert.base64Decode('Ch5HZXRDb21tYW5kc1JlbW90ZVNlcnZlclJlcXVlc3QSGgoIcmVtb3RlSWQYASABKAlSCHJlbW90ZUlkEigKD3JlbW90ZUxpYnJhcnlJZBgCIAEoCVIPcmVtb3RlTGlicmFyeUlk');
@$core.Deprecated('Use getCommandsRemoteServerResponseDescriptor instead')
const GetCommandsRemoteServerResponse$json = const {
  '1': 'GetCommandsRemoteServerResponse',
  '2': const [
    const {'1': 'commands', '3': 1, '4': 3, '5': 11, '6': '.RemoteCommand', '10': 'commands'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetCommandsRemoteServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCommandsRemoteServerResponseDescriptor = $convert.base64Decode('Ch9HZXRDb21tYW5kc1JlbW90ZVNlcnZlclJlc3BvbnNlEioKCGNvbW1hbmRzGAEgAygLMg4uUmVtb3RlQ29tbWFuZFIIY29tbWFuZHMSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use sendCommandRemoteServerRequestDescriptor instead')
const SendCommandRemoteServerRequest$json = const {
  '1': 'SendCommandRemoteServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'remoteId', '3': 2, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'remoteLibraryCmdId', '3': 3, '4': 1, '5': 9, '10': 'remoteLibraryCmdId'},
    const {'1': 'remoteMultiLibraryCmdId', '3': 4, '4': 1, '5': 9, '10': 'remoteMultiLibraryCmdId'},
    const {'1': 'type', '3': 5, '4': 1, '5': 14, '6': '.TypeLearn', '10': 'type'},
  ],
};

/// Descriptor for `SendCommandRemoteServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendCommandRemoteServerRequestDescriptor = $convert.base64Decode('Ch5TZW5kQ29tbWFuZFJlbW90ZVNlcnZlclJlcXVlc3QSGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEhoKCHJlbW90ZUlkGAIgASgJUghyZW1vdGVJZBIuChJyZW1vdGVMaWJyYXJ5Q21kSWQYAyABKAlSEnJlbW90ZUxpYnJhcnlDbWRJZBI4ChdyZW1vdGVNdWx0aUxpYnJhcnlDbWRJZBgEIAEoCVIXcmVtb3RlTXVsdGlMaWJyYXJ5Q21kSWQSHgoEdHlwZRgFIAEoDjIKLlR5cGVMZWFyblIEdHlwZQ==');
@$core.Deprecated('Use sendCommandRemoteServerResponseDescriptor instead')
const SendCommandRemoteServerResponse$json = const {
  '1': 'SendCommandRemoteServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SendCommandRemoteServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendCommandRemoteServerResponseDescriptor = $convert.base64Decode('Ch9TZW5kQ29tbWFuZFJlbW90ZVNlcnZlclJlc3BvbnNlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use learnCommandRemoteServerRequestDescriptor instead')
const LearnCommandRemoteServerRequest$json = const {
  '1': 'LearnCommandRemoteServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'remoteId', '3': 2, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'remoteLibraryCmdId', '3': 3, '4': 1, '5': 9, '10': 'remoteLibraryCmdId'},
    const {'1': 'remoteMultiLibraryCmdId', '3': 4, '4': 1, '5': 9, '10': 'remoteMultiLibraryCmdId'},
    const {'1': 'type', '3': 5, '4': 1, '5': 14, '6': '.TypeLearn', '10': 'type'},
  ],
};

/// Descriptor for `LearnCommandRemoteServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List learnCommandRemoteServerRequestDescriptor = $convert.base64Decode('Ch9MZWFybkNvbW1hbmRSZW1vdGVTZXJ2ZXJSZXF1ZXN0EhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZBIaCghyZW1vdGVJZBgCIAEoCVIIcmVtb3RlSWQSLgoScmVtb3RlTGlicmFyeUNtZElkGAMgASgJUhJyZW1vdGVMaWJyYXJ5Q21kSWQSOAoXcmVtb3RlTXVsdGlMaWJyYXJ5Q21kSWQYBCABKAlSF3JlbW90ZU11bHRpTGlicmFyeUNtZElkEh4KBHR5cGUYBSABKA4yCi5UeXBlTGVhcm5SBHR5cGU=');
@$core.Deprecated('Use learnCommandRemoteServerResponseDescriptor instead')
const LearnCommandRemoteServerResponse$json = const {
  '1': 'LearnCommandRemoteServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `LearnCommandRemoteServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List learnCommandRemoteServerResponseDescriptor = $convert.base64Decode('CiBMZWFybkNvbW1hbmRSZW1vdGVTZXJ2ZXJSZXNwb25zZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use restoreCommandRemoteServerRequestDescriptor instead')
const RestoreCommandRemoteServerRequest$json = const {
  '1': 'RestoreCommandRemoteServerRequest',
  '2': const [
    const {'1': 'remoteId', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'remoteLibraryCmdId', '3': 2, '4': 1, '5': 9, '10': 'remoteLibraryCmdId'},
    const {'1': 'remoteMultiLibraryCmdId', '3': 3, '4': 1, '5': 9, '10': 'remoteMultiLibraryCmdId'},
  ],
};

/// Descriptor for `RestoreCommandRemoteServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List restoreCommandRemoteServerRequestDescriptor = $convert.base64Decode('CiFSZXN0b3JlQ29tbWFuZFJlbW90ZVNlcnZlclJlcXVlc3QSGgoIcmVtb3RlSWQYASABKAlSCHJlbW90ZUlkEi4KEnJlbW90ZUxpYnJhcnlDbWRJZBgCIAEoCVIScmVtb3RlTGlicmFyeUNtZElkEjgKF3JlbW90ZU11bHRpTGlicmFyeUNtZElkGAMgASgJUhdyZW1vdGVNdWx0aUxpYnJhcnlDbWRJZA==');
@$core.Deprecated('Use restoreCommandRemoteServerResponseDescriptor instead')
const RestoreCommandRemoteServerResponse$json = const {
  '1': 'RestoreCommandRemoteServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `RestoreCommandRemoteServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List restoreCommandRemoteServerResponseDescriptor = $convert.base64Decode('CiJSZXN0b3JlQ29tbWFuZFJlbW90ZVNlcnZlclJlc3BvbnNlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use addRemoteServerRequestDescriptor instead')
const AddRemoteServerRequest$json = const {
  '1': 'AddRemoteServerRequest',
  '2': const [
    const {'1': 'remote', '3': 1, '4': 1, '5': 11, '6': '.Remote', '10': 'remote'},
  ],
};

/// Descriptor for `AddRemoteServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addRemoteServerRequestDescriptor = $convert.base64Decode('ChZBZGRSZW1vdGVTZXJ2ZXJSZXF1ZXN0Eh8KBnJlbW90ZRgBIAEoCzIHLlJlbW90ZVIGcmVtb3Rl');
@$core.Deprecated('Use addRemoteServerResponseDescriptor instead')
const AddRemoteServerResponse$json = const {
  '1': 'AddRemoteServerResponse',
  '2': const [
    const {'1': 'remote', '3': 1, '4': 1, '5': 11, '6': '.Remote', '10': 'remote'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `AddRemoteServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addRemoteServerResponseDescriptor = $convert.base64Decode('ChdBZGRSZW1vdGVTZXJ2ZXJSZXNwb25zZRIfCgZyZW1vdGUYASABKAsyBy5SZW1vdGVSBnJlbW90ZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use updateRemoteServerRequestDescriptor instead')
const UpdateRemoteServerRequest$json = const {
  '1': 'UpdateRemoteServerRequest',
  '2': const [
    const {'1': 'remote', '3': 1, '4': 1, '5': 11, '6': '.Remote', '10': 'remote'},
  ],
};

/// Descriptor for `UpdateRemoteServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRemoteServerRequestDescriptor = $convert.base64Decode('ChlVcGRhdGVSZW1vdGVTZXJ2ZXJSZXF1ZXN0Eh8KBnJlbW90ZRgBIAEoCzIHLlJlbW90ZVIGcmVtb3Rl');
@$core.Deprecated('Use updateRemoteServerResponseDescriptor instead')
const UpdateRemoteServerResponse$json = const {
  '1': 'UpdateRemoteServerResponse',
  '2': const [
    const {'1': 'remote', '3': 1, '4': 1, '5': 11, '6': '.Remote', '10': 'remote'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateRemoteServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRemoteServerResponseDescriptor = $convert.base64Decode('ChpVcGRhdGVSZW1vdGVTZXJ2ZXJSZXNwb25zZRIfCgZyZW1vdGUYASABKAsyBy5SZW1vdGVSBnJlbW90ZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use deleteRemoteServerRequestDescriptor instead')
const DeleteRemoteServerRequest$json = const {
  '1': 'DeleteRemoteServerRequest',
  '2': const [
    const {'1': 'remoteId', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
  ],
};

/// Descriptor for `DeleteRemoteServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRemoteServerRequestDescriptor = $convert.base64Decode('ChlEZWxldGVSZW1vdGVTZXJ2ZXJSZXF1ZXN0EhoKCHJlbW90ZUlkGAEgASgJUghyZW1vdGVJZA==');
@$core.Deprecated('Use deleteRemoteServerResponseDescriptor instead')
const DeleteRemoteServerResponse$json = const {
  '1': 'DeleteRemoteServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `DeleteRemoteServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRemoteServerResponseDescriptor = $convert.base64Decode('ChpEZWxldGVSZW1vdGVTZXJ2ZXJSZXNwb25zZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use getRemoteSchedulesServerRequestDescriptor instead')
const GetRemoteSchedulesServerRequest$json = const {
  '1': 'GetRemoteSchedulesServerRequest',
  '2': const [
    const {'1': 'remoteId', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
  ],
};

/// Descriptor for `GetRemoteSchedulesServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRemoteSchedulesServerRequestDescriptor = $convert.base64Decode('Ch9HZXRSZW1vdGVTY2hlZHVsZXNTZXJ2ZXJSZXF1ZXN0EhoKCHJlbW90ZUlkGAEgASgJUghyZW1vdGVJZA==');
@$core.Deprecated('Use getRemoteSchedulesServerResponseDescriptor instead')
const GetRemoteSchedulesServerResponse$json = const {
  '1': 'GetRemoteSchedulesServerResponse',
  '2': const [
    const {'1': 'schedules', '3': 1, '4': 3, '5': 11, '6': '.RemoteSchedule', '10': 'schedules'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetRemoteSchedulesServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRemoteSchedulesServerResponseDescriptor = $convert.base64Decode('CiBHZXRSZW1vdGVTY2hlZHVsZXNTZXJ2ZXJSZXNwb25zZRItCglzY2hlZHVsZXMYASADKAsyDy5SZW1vdGVTY2hlZHVsZVIJc2NoZWR1bGVzEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getCountRemoteScheduleServerRequestDescriptor instead')
const GetCountRemoteScheduleServerRequest$json = const {
  '1': 'GetCountRemoteScheduleServerRequest',
  '2': const [
    const {'1': 'remoteId', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
  ],
};

/// Descriptor for `GetCountRemoteScheduleServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCountRemoteScheduleServerRequestDescriptor = $convert.base64Decode('CiNHZXRDb3VudFJlbW90ZVNjaGVkdWxlU2VydmVyUmVxdWVzdBIaCghyZW1vdGVJZBgBIAEoCVIIcmVtb3RlSWQ=');
@$core.Deprecated('Use getCountRemoteScheduleServerResponseDescriptor instead')
const GetCountRemoteScheduleServerResponse$json = const {
  '1': 'GetCountRemoteScheduleServerResponse',
  '2': const [
    const {'1': 'count', '3': 1, '4': 1, '5': 13, '10': 'count'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetCountRemoteScheduleServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCountRemoteScheduleServerResponseDescriptor = $convert.base64Decode('CiRHZXRDb3VudFJlbW90ZVNjaGVkdWxlU2VydmVyUmVzcG9uc2USFAoFY291bnQYASABKA1SBWNvdW50EiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getRemoteScheduleServerRequestDescriptor instead')
const GetRemoteScheduleServerRequest$json = const {
  '1': 'GetRemoteScheduleServerRequest',
  '2': const [
    const {'1': 'remoteScheduleId', '3': 1, '4': 1, '5': 9, '10': 'remoteScheduleId'},
  ],
};

/// Descriptor for `GetRemoteScheduleServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRemoteScheduleServerRequestDescriptor = $convert.base64Decode('Ch5HZXRSZW1vdGVTY2hlZHVsZVNlcnZlclJlcXVlc3QSKgoQcmVtb3RlU2NoZWR1bGVJZBgBIAEoCVIQcmVtb3RlU2NoZWR1bGVJZA==');
@$core.Deprecated('Use getRemoteScheduleServerResponseDescriptor instead')
const GetRemoteScheduleServerResponse$json = const {
  '1': 'GetRemoteScheduleServerResponse',
  '2': const [
    const {'1': 'schedule', '3': 1, '4': 1, '5': 11, '6': '.RemoteSchedule', '10': 'schedule'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetRemoteScheduleServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRemoteScheduleServerResponseDescriptor = $convert.base64Decode('Ch9HZXRSZW1vdGVTY2hlZHVsZVNlcnZlclJlc3BvbnNlEisKCHNjaGVkdWxlGAEgASgLMg8uUmVtb3RlU2NoZWR1bGVSCHNjaGVkdWxlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use addRemoteScheduleServerRequestDescriptor instead')
const AddRemoteScheduleServerRequest$json = const {
  '1': 'AddRemoteScheduleServerRequest',
  '2': const [
    const {'1': 'schedule', '3': 2, '4': 1, '5': 11, '6': '.RemoteSchedule', '10': 'schedule'},
  ],
};

/// Descriptor for `AddRemoteScheduleServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addRemoteScheduleServerRequestDescriptor = $convert.base64Decode('Ch5BZGRSZW1vdGVTY2hlZHVsZVNlcnZlclJlcXVlc3QSKwoIc2NoZWR1bGUYAiABKAsyDy5SZW1vdGVTY2hlZHVsZVIIc2NoZWR1bGU=');
@$core.Deprecated('Use addRemoteScheduleServerResponseDescriptor instead')
const AddRemoteScheduleServerResponse$json = const {
  '1': 'AddRemoteScheduleServerResponse',
  '2': const [
    const {'1': 'schedule', '3': 1, '4': 1, '5': 11, '6': '.RemoteSchedule', '10': 'schedule'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `AddRemoteScheduleServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addRemoteScheduleServerResponseDescriptor = $convert.base64Decode('Ch9BZGRSZW1vdGVTY2hlZHVsZVNlcnZlclJlc3BvbnNlEisKCHNjaGVkdWxlGAEgASgLMg8uUmVtb3RlU2NoZWR1bGVSCHNjaGVkdWxlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use updateRemoteScheduleServerRequestDescriptor instead')
const UpdateRemoteScheduleServerRequest$json = const {
  '1': 'UpdateRemoteScheduleServerRequest',
  '2': const [
    const {'1': 'schedule', '3': 2, '4': 1, '5': 11, '6': '.RemoteSchedule', '10': 'schedule'},
  ],
};

/// Descriptor for `UpdateRemoteScheduleServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRemoteScheduleServerRequestDescriptor = $convert.base64Decode('CiFVcGRhdGVSZW1vdGVTY2hlZHVsZVNlcnZlclJlcXVlc3QSKwoIc2NoZWR1bGUYAiABKAsyDy5SZW1vdGVTY2hlZHVsZVIIc2NoZWR1bGU=');
@$core.Deprecated('Use updateRemoteScheduleServerResponseDescriptor instead')
const UpdateRemoteScheduleServerResponse$json = const {
  '1': 'UpdateRemoteScheduleServerResponse',
  '2': const [
    const {'1': 'schedule', '3': 1, '4': 1, '5': 11, '6': '.RemoteSchedule', '10': 'schedule'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateRemoteScheduleServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRemoteScheduleServerResponseDescriptor = $convert.base64Decode('CiJVcGRhdGVSZW1vdGVTY2hlZHVsZVNlcnZlclJlc3BvbnNlEisKCHNjaGVkdWxlGAEgASgLMg8uUmVtb3RlU2NoZWR1bGVSCHNjaGVkdWxlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use deleteRemoteScheduleServerRequestDescriptor instead')
const DeleteRemoteScheduleServerRequest$json = const {
  '1': 'DeleteRemoteScheduleServerRequest',
  '2': const [
    const {'1': 'remoteScheduleId', '3': 1, '4': 1, '5': 9, '10': 'remoteScheduleId'},
  ],
};

/// Descriptor for `DeleteRemoteScheduleServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRemoteScheduleServerRequestDescriptor = $convert.base64Decode('CiFEZWxldGVSZW1vdGVTY2hlZHVsZVNlcnZlclJlcXVlc3QSKgoQcmVtb3RlU2NoZWR1bGVJZBgBIAEoCVIQcmVtb3RlU2NoZWR1bGVJZA==');
@$core.Deprecated('Use deleteRemoteScheduleServerResponseDescriptor instead')
const DeleteRemoteScheduleServerResponse$json = const {
  '1': 'DeleteRemoteScheduleServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `DeleteRemoteScheduleServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRemoteScheduleServerResponseDescriptor = $convert.base64Decode('CiJEZWxldGVSZW1vdGVTY2hlZHVsZVNlcnZlclJlc3BvbnNlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use setActiveRemoteScheduleServerRequestDescriptor instead')
const SetActiveRemoteScheduleServerRequest$json = const {
  '1': 'SetActiveRemoteScheduleServerRequest',
  '2': const [
    const {'1': 'active', '3': 1, '4': 1, '5': 8, '10': 'active'},
    const {'1': 'remoteScheduleId', '3': 2, '4': 1, '5': 9, '10': 'remoteScheduleId'},
  ],
};

/// Descriptor for `SetActiveRemoteScheduleServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setActiveRemoteScheduleServerRequestDescriptor = $convert.base64Decode('CiRTZXRBY3RpdmVSZW1vdGVTY2hlZHVsZVNlcnZlclJlcXVlc3QSFgoGYWN0aXZlGAEgASgIUgZhY3RpdmUSKgoQcmVtb3RlU2NoZWR1bGVJZBgCIAEoCVIQcmVtb3RlU2NoZWR1bGVJZA==');
@$core.Deprecated('Use setActiveRemoteScheduleServerResponseDescriptor instead')
const SetActiveRemoteScheduleServerResponse$json = const {
  '1': 'SetActiveRemoteScheduleServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SetActiveRemoteScheduleServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setActiveRemoteScheduleServerResponseDescriptor = $convert.base64Decode('CiVTZXRBY3RpdmVSZW1vdGVTY2hlZHVsZVNlcnZlclJlc3BvbnNlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getRemoteMultisServerRequestDescriptor instead')
const GetRemoteMultisServerRequest$json = const {
  '1': 'GetRemoteMultisServerRequest',
  '2': const [
    const {'1': 'remoteId', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
  ],
};

/// Descriptor for `GetRemoteMultisServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRemoteMultisServerRequestDescriptor = $convert.base64Decode('ChxHZXRSZW1vdGVNdWx0aXNTZXJ2ZXJSZXF1ZXN0EhoKCHJlbW90ZUlkGAEgASgJUghyZW1vdGVJZA==');
@$core.Deprecated('Use getRemoteMultisServerResponseDescriptor instead')
const GetRemoteMultisServerResponse$json = const {
  '1': 'GetRemoteMultisServerResponse',
  '2': const [
    const {'1': 'remoteMultis', '3': 1, '4': 3, '5': 11, '6': '.RemoteMulti', '10': 'remoteMultis'},
    const {'1': 'brand', '3': 2, '4': 1, '5': 11, '6': '.RemoteBrand', '10': 'brand'},
    const {'1': 'remoteACState', '3': 3, '4': 1, '5': 11, '6': '.RemoteACState', '10': 'remoteACState'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetRemoteMultisServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRemoteMultisServerResponseDescriptor = $convert.base64Decode('Ch1HZXRSZW1vdGVNdWx0aXNTZXJ2ZXJSZXNwb25zZRIwCgxyZW1vdGVNdWx0aXMYASADKAsyDC5SZW1vdGVNdWx0aVIMcmVtb3RlTXVsdGlzEiIKBWJyYW5kGAIgASgLMgwuUmVtb3RlQnJhbmRSBWJyYW5kEjQKDXJlbW90ZUFDU3RhdGUYAyABKAsyDi5SZW1vdGVBQ1N0YXRlUg1yZW1vdGVBQ1N0YXRlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use addRemoteMultiServerRequestDescriptor instead')
const AddRemoteMultiServerRequest$json = const {
  '1': 'AddRemoteMultiServerRequest',
  '2': const [
    const {'1': 'remoteMulti', '3': 1, '4': 1, '5': 11, '6': '.RemoteMulti', '10': 'remoteMulti'},
  ],
};

/// Descriptor for `AddRemoteMultiServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addRemoteMultiServerRequestDescriptor = $convert.base64Decode('ChtBZGRSZW1vdGVNdWx0aVNlcnZlclJlcXVlc3QSLgoLcmVtb3RlTXVsdGkYASABKAsyDC5SZW1vdGVNdWx0aVILcmVtb3RlTXVsdGk=');
@$core.Deprecated('Use addRemoteMultiServerResponseDescriptor instead')
const AddRemoteMultiServerResponse$json = const {
  '1': 'AddRemoteMultiServerResponse',
  '2': const [
    const {'1': 'remoteMulti', '3': 1, '4': 1, '5': 11, '6': '.RemoteMulti', '10': 'remoteMulti'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `AddRemoteMultiServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addRemoteMultiServerResponseDescriptor = $convert.base64Decode('ChxBZGRSZW1vdGVNdWx0aVNlcnZlclJlc3BvbnNlEi4KC3JlbW90ZU11bHRpGAEgASgLMgwuUmVtb3RlTXVsdGlSC3JlbW90ZU11bHRpEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use deleteRemoteMultiServerRequestDescriptor instead')
const DeleteRemoteMultiServerRequest$json = const {
  '1': 'DeleteRemoteMultiServerRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteRemoteMultiServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRemoteMultiServerRequestDescriptor = $convert.base64Decode('Ch5EZWxldGVSZW1vdGVNdWx0aVNlcnZlclJlcXVlc3QSDgoCaWQYASABKAlSAmlk');
@$core.Deprecated('Use deleteRemoteMultiServerResponseDescriptor instead')
const DeleteRemoteMultiServerResponse$json = const {
  '1': 'DeleteRemoteMultiServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `DeleteRemoteMultiServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRemoteMultiServerResponseDescriptor = $convert.base64Decode('Ch9EZWxldGVSZW1vdGVNdWx0aVNlcnZlclJlc3BvbnNlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use addRemoteMultiLibraryCmdServerRequestDescriptor instead')
const AddRemoteMultiLibraryCmdServerRequest$json = const {
  '1': 'AddRemoteMultiLibraryCmdServerRequest',
  '2': const [
    const {'1': 'remoteMultiLibraryCmd', '3': 1, '4': 1, '5': 11, '6': '.RemoteMultiLibraryCmd', '10': 'remoteMultiLibraryCmd'},
  ],
};

/// Descriptor for `AddRemoteMultiLibraryCmdServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addRemoteMultiLibraryCmdServerRequestDescriptor = $convert.base64Decode('CiVBZGRSZW1vdGVNdWx0aUxpYnJhcnlDbWRTZXJ2ZXJSZXF1ZXN0EkwKFXJlbW90ZU11bHRpTGlicmFyeUNtZBgBIAEoCzIWLlJlbW90ZU11bHRpTGlicmFyeUNtZFIVcmVtb3RlTXVsdGlMaWJyYXJ5Q21k');
@$core.Deprecated('Use addRemoteMultiLibraryCmdServerResponseDescriptor instead')
const AddRemoteMultiLibraryCmdServerResponse$json = const {
  '1': 'AddRemoteMultiLibraryCmdServerResponse',
  '2': const [
    const {'1': 'remoteMultiLibraryCmd', '3': 1, '4': 1, '5': 11, '6': '.RemoteMultiLibraryCmd', '10': 'remoteMultiLibraryCmd'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `AddRemoteMultiLibraryCmdServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addRemoteMultiLibraryCmdServerResponseDescriptor = $convert.base64Decode('CiZBZGRSZW1vdGVNdWx0aUxpYnJhcnlDbWRTZXJ2ZXJSZXNwb25zZRJMChVyZW1vdGVNdWx0aUxpYnJhcnlDbWQYASABKAsyFi5SZW1vdGVNdWx0aUxpYnJhcnlDbWRSFXJlbW90ZU11bHRpTGlicmFyeUNtZBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use deleteRemoteMultiLibraryCmdServerRequestDescriptor instead')
const DeleteRemoteMultiLibraryCmdServerRequest$json = const {
  '1': 'DeleteRemoteMultiLibraryCmdServerRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteRemoteMultiLibraryCmdServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRemoteMultiLibraryCmdServerRequestDescriptor = $convert.base64Decode('CihEZWxldGVSZW1vdGVNdWx0aUxpYnJhcnlDbWRTZXJ2ZXJSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZA==');
@$core.Deprecated('Use deleteRemoteMultiLibraryCmdServerResponseDescriptor instead')
const DeleteRemoteMultiLibraryCmdServerResponse$json = const {
  '1': 'DeleteRemoteMultiLibraryCmdServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `DeleteRemoteMultiLibraryCmdServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRemoteMultiLibraryCmdServerResponseDescriptor = $convert.base64Decode('CilEZWxldGVSZW1vdGVNdWx0aUxpYnJhcnlDbWRTZXJ2ZXJSZXNwb25zZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use updateRemoteMultiLibraryCmdServerRequestDescriptor instead')
const UpdateRemoteMultiLibraryCmdServerRequest$json = const {
  '1': 'UpdateRemoteMultiLibraryCmdServerRequest',
  '2': const [
    const {'1': 'remoteMultiLibraryCmd', '3': 1, '4': 1, '5': 11, '6': '.RemoteMultiLibraryCmd', '10': 'remoteMultiLibraryCmd'},
  ],
};

/// Descriptor for `UpdateRemoteMultiLibraryCmdServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRemoteMultiLibraryCmdServerRequestDescriptor = $convert.base64Decode('CihVcGRhdGVSZW1vdGVNdWx0aUxpYnJhcnlDbWRTZXJ2ZXJSZXF1ZXN0EkwKFXJlbW90ZU11bHRpTGlicmFyeUNtZBgBIAEoCzIWLlJlbW90ZU11bHRpTGlicmFyeUNtZFIVcmVtb3RlTXVsdGlMaWJyYXJ5Q21k');
@$core.Deprecated('Use updateRemoteMultiLibraryCmdServerResponseDescriptor instead')
const UpdateRemoteMultiLibraryCmdServerResponse$json = const {
  '1': 'UpdateRemoteMultiLibraryCmdServerResponse',
  '2': const [
    const {'1': 'remoteMultiLibraryCmd', '3': 1, '4': 1, '5': 11, '6': '.RemoteMultiLibraryCmd', '10': 'remoteMultiLibraryCmd'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateRemoteMultiLibraryCmdServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRemoteMultiLibraryCmdServerResponseDescriptor = $convert.base64Decode('CilVcGRhdGVSZW1vdGVNdWx0aUxpYnJhcnlDbWRTZXJ2ZXJSZXNwb25zZRJMChVyZW1vdGVNdWx0aUxpYnJhcnlDbWQYASABKAsyFi5SZW1vdGVNdWx0aUxpYnJhcnlDbWRSFXJlbW90ZU11bHRpTGlicmFyeUNtZBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use updateGroupRemoteMultiLibraryCmdServerRequestDescriptor instead')
const UpdateGroupRemoteMultiLibraryCmdServerRequest$json = const {
  '1': 'UpdateGroupRemoteMultiLibraryCmdServerRequest',
  '2': const [
    const {'1': 'remoteMultiLibraryCmd', '3': 1, '4': 3, '5': 11, '6': '.RemoteMultiLibraryCmd', '10': 'remoteMultiLibraryCmd'},
  ],
};

/// Descriptor for `UpdateGroupRemoteMultiLibraryCmdServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateGroupRemoteMultiLibraryCmdServerRequestDescriptor = $convert.base64Decode('Ci1VcGRhdGVHcm91cFJlbW90ZU11bHRpTGlicmFyeUNtZFNlcnZlclJlcXVlc3QSTAoVcmVtb3RlTXVsdGlMaWJyYXJ5Q21kGAEgAygLMhYuUmVtb3RlTXVsdGlMaWJyYXJ5Q21kUhVyZW1vdGVNdWx0aUxpYnJhcnlDbWQ=');
@$core.Deprecated('Use updateGroupRemoteMultiLibraryCmdServerResponseDescriptor instead')
const UpdateGroupRemoteMultiLibraryCmdServerResponse$json = const {
  '1': 'UpdateGroupRemoteMultiLibraryCmdServerResponse',
  '2': const [
    const {'1': 'remoteMultiLibraryCmd', '3': 1, '4': 3, '5': 11, '6': '.RemoteMultiLibraryCmd', '10': 'remoteMultiLibraryCmd'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateGroupRemoteMultiLibraryCmdServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateGroupRemoteMultiLibraryCmdServerResponseDescriptor = $convert.base64Decode('Ci5VcGRhdGVHcm91cFJlbW90ZU11bHRpTGlicmFyeUNtZFNlcnZlclJlc3BvbnNlEkwKFXJlbW90ZU11bHRpTGlicmFyeUNtZBgBIAMoCzIWLlJlbW90ZU11bHRpTGlicmFyeUNtZFIVcmVtb3RlTXVsdGlMaWJyYXJ5Q21kEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use changeRemoteBrandRemoteRequestDescriptor instead')
const ChangeRemoteBrandRemoteRequest$json = const {
  '1': 'ChangeRemoteBrandRemoteRequest',
  '2': const [
    const {'1': 'remoteId', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'remoteBrandModelId', '3': 2, '4': 1, '5': 9, '10': 'remoteBrandModelId'},
  ],
};

/// Descriptor for `ChangeRemoteBrandRemoteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changeRemoteBrandRemoteRequestDescriptor = $convert.base64Decode('Ch5DaGFuZ2VSZW1vdGVCcmFuZFJlbW90ZVJlcXVlc3QSGgoIcmVtb3RlSWQYASABKAlSCHJlbW90ZUlkEi4KEnJlbW90ZUJyYW5kTW9kZWxJZBgCIAEoCVIScmVtb3RlQnJhbmRNb2RlbElk');
@$core.Deprecated('Use changeRemoteBrandRemoteResponseDescriptor instead')
const ChangeRemoteBrandRemoteResponse$json = const {
  '1': 'ChangeRemoteBrandRemoteResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `ChangeRemoteBrandRemoteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changeRemoteBrandRemoteResponseDescriptor = $convert.base64Decode('Ch9DaGFuZ2VSZW1vdGVCcmFuZFJlbW90ZVJlc3BvbnNlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use controlRemoteACCommandRequestDescriptor instead')
const ControlRemoteACCommandRequest$json = const {
  '1': 'ControlRemoteACCommandRequest',
  '2': const [
    const {'1': 'remoteId', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'remoteACState', '3': 2, '4': 1, '5': 11, '6': '.RemoteACState', '10': 'remoteACState'},
  ],
};

/// Descriptor for `ControlRemoteACCommandRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List controlRemoteACCommandRequestDescriptor = $convert.base64Decode('Ch1Db250cm9sUmVtb3RlQUNDb21tYW5kUmVxdWVzdBIaCghyZW1vdGVJZBgBIAEoCVIIcmVtb3RlSWQSNAoNcmVtb3RlQUNTdGF0ZRgCIAEoCzIOLlJlbW90ZUFDU3RhdGVSDXJlbW90ZUFDU3RhdGU=');
@$core.Deprecated('Use controlRemoteACCommandResponseDescriptor instead')
const ControlRemoteACCommandResponse$json = const {
  '1': 'ControlRemoteACCommandResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `ControlRemoteACCommandResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List controlRemoteACCommandResponseDescriptor = $convert.base64Decode('Ch5Db250cm9sUmVtb3RlQUNDb21tYW5kUmVzcG9uc2USLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use getScenesServerRequestDescriptor instead')
const GetScenesServerRequest$json = const {
  '1': 'GetScenesServerRequest',
  '2': const [
    const {'1': 'homeId', '3': 1, '4': 1, '5': 9, '10': 'homeId'},
  ],
};

/// Descriptor for `GetScenesServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getScenesServerRequestDescriptor = $convert.base64Decode('ChZHZXRTY2VuZXNTZXJ2ZXJSZXF1ZXN0EhYKBmhvbWVJZBgBIAEoCVIGaG9tZUlk');
@$core.Deprecated('Use getScenesServerResponseDescriptor instead')
const GetScenesServerResponse$json = const {
  '1': 'GetScenesServerResponse',
  '2': const [
    const {'1': 'scenes', '3': 1, '4': 3, '5': 11, '6': '.Scene', '10': 'scenes'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetScenesServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getScenesServerResponseDescriptor = $convert.base64Decode('ChdHZXRTY2VuZXNTZXJ2ZXJSZXNwb25zZRIeCgZzY2VuZXMYASADKAsyBi5TY2VuZVIGc2NlbmVzEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getSceneServerRequestDescriptor instead')
const GetSceneServerRequest$json = const {
  '1': 'GetSceneServerRequest',
  '2': const [
    const {'1': 'sceneId', '3': 1, '4': 1, '5': 9, '10': 'sceneId'},
  ],
};

/// Descriptor for `GetSceneServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSceneServerRequestDescriptor = $convert.base64Decode('ChVHZXRTY2VuZVNlcnZlclJlcXVlc3QSGAoHc2NlbmVJZBgBIAEoCVIHc2NlbmVJZA==');
@$core.Deprecated('Use getSceneServerResponseDescriptor instead')
const GetSceneServerResponse$json = const {
  '1': 'GetSceneServerResponse',
  '2': const [
    const {'1': 'scene', '3': 1, '4': 1, '5': 11, '6': '.Scene', '10': 'scene'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetSceneServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSceneServerResponseDescriptor = $convert.base64Decode('ChZHZXRTY2VuZVNlcnZlclJlc3BvbnNlEhwKBXNjZW5lGAEgASgLMgYuU2NlbmVSBXNjZW5lEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use addSceneServerRequestDescriptor instead')
const AddSceneServerRequest$json = const {
  '1': 'AddSceneServerRequest',
  '2': const [
    const {'1': 'scene', '3': 1, '4': 1, '5': 11, '6': '.Scene', '10': 'scene'},
  ],
};

/// Descriptor for `AddSceneServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addSceneServerRequestDescriptor = $convert.base64Decode('ChVBZGRTY2VuZVNlcnZlclJlcXVlc3QSHAoFc2NlbmUYASABKAsyBi5TY2VuZVIFc2NlbmU=');
@$core.Deprecated('Use addSceneServerResponseDescriptor instead')
const AddSceneServerResponse$json = const {
  '1': 'AddSceneServerResponse',
  '2': const [
    const {'1': 'scene', '3': 1, '4': 1, '5': 11, '6': '.Scene', '10': 'scene'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `AddSceneServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addSceneServerResponseDescriptor = $convert.base64Decode('ChZBZGRTY2VuZVNlcnZlclJlc3BvbnNlEhwKBXNjZW5lGAEgASgLMgYuU2NlbmVSBXNjZW5lEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use updateSceneServerRequestDescriptor instead')
const UpdateSceneServerRequest$json = const {
  '1': 'UpdateSceneServerRequest',
  '2': const [
    const {'1': 'scene', '3': 1, '4': 1, '5': 11, '6': '.Scene', '10': 'scene'},
  ],
};

/// Descriptor for `UpdateSceneServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSceneServerRequestDescriptor = $convert.base64Decode('ChhVcGRhdGVTY2VuZVNlcnZlclJlcXVlc3QSHAoFc2NlbmUYASABKAsyBi5TY2VuZVIFc2NlbmU=');
@$core.Deprecated('Use updateSceneServerResponseDescriptor instead')
const UpdateSceneServerResponse$json = const {
  '1': 'UpdateSceneServerResponse',
  '2': const [
    const {'1': 'scene', '3': 1, '4': 1, '5': 11, '6': '.Scene', '10': 'scene'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateSceneServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSceneServerResponseDescriptor = $convert.base64Decode('ChlVcGRhdGVTY2VuZVNlcnZlclJlc3BvbnNlEhwKBXNjZW5lGAEgASgLMgYuU2NlbmVSBXNjZW5lEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use deleteSceneServerRequestDescriptor instead')
const DeleteSceneServerRequest$json = const {
  '1': 'DeleteSceneServerRequest',
  '2': const [
    const {'1': 'sceneId', '3': 1, '4': 1, '5': 9, '10': 'sceneId'},
  ],
};

/// Descriptor for `DeleteSceneServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSceneServerRequestDescriptor = $convert.base64Decode('ChhEZWxldGVTY2VuZVNlcnZlclJlcXVlc3QSGAoHc2NlbmVJZBgBIAEoCVIHc2NlbmVJZA==');
@$core.Deprecated('Use deleteSceneServerResponseDescriptor instead')
const DeleteSceneServerResponse$json = const {
  '1': 'DeleteSceneServerResponse',
  '2': const [
    const {'1': 'sceneId', '3': 1, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `DeleteSceneServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSceneServerResponseDescriptor = $convert.base64Decode('ChlEZWxldGVTY2VuZVNlcnZlclJlc3BvbnNlEhgKB3NjZW5lSWQYASABKAlSB3NjZW5lSWQSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use deleteSwitcherConditionServerRequestDescriptor instead')
const DeleteSwitcherConditionServerRequest$json = const {
  '1': 'DeleteSwitcherConditionServerRequest',
  '2': const [
    const {'1': 'sceneId', '3': 1, '4': 1, '5': 9, '10': 'sceneId'},
  ],
};

/// Descriptor for `DeleteSwitcherConditionServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSwitcherConditionServerRequestDescriptor = $convert.base64Decode('CiREZWxldGVTd2l0Y2hlckNvbmRpdGlvblNlcnZlclJlcXVlc3QSGAoHc2NlbmVJZBgBIAEoCVIHc2NlbmVJZA==');
@$core.Deprecated('Use deleteSwitcherConditionServerResponseDescriptor instead')
const DeleteSwitcherConditionServerResponse$json = const {
  '1': 'DeleteSwitcherConditionServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `DeleteSwitcherConditionServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSwitcherConditionServerResponseDescriptor = $convert.base64Decode('CiVEZWxldGVTd2l0Y2hlckNvbmRpdGlvblNlcnZlclJlc3BvbnNlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use deleteSceneActionServerRequestDescriptor instead')
const DeleteSceneActionServerRequest$json = const {
  '1': 'DeleteSceneActionServerRequest',
  '2': const [
    const {'1': 'sceneActionId', '3': 1, '4': 1, '5': 9, '10': 'sceneActionId'},
  ],
};

/// Descriptor for `DeleteSceneActionServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSceneActionServerRequestDescriptor = $convert.base64Decode('Ch5EZWxldGVTY2VuZUFjdGlvblNlcnZlclJlcXVlc3QSJAoNc2NlbmVBY3Rpb25JZBgBIAEoCVINc2NlbmVBY3Rpb25JZA==');
@$core.Deprecated('Use deleteSceneActionServerResponseDescriptor instead')
const DeleteSceneActionServerResponse$json = const {
  '1': 'DeleteSceneActionServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `DeleteSceneActionServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSceneActionServerResponseDescriptor = $convert.base64Decode('Ch9EZWxldGVTY2VuZUFjdGlvblNlcnZlclJlc3BvbnNlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use runSceneServerRequestDescriptor instead')
const RunSceneServerRequest$json = const {
  '1': 'RunSceneServerRequest',
  '2': const [
    const {'1': 'sceneId', '3': 1, '4': 1, '5': 9, '10': 'sceneId'},
  ],
};

/// Descriptor for `RunSceneServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List runSceneServerRequestDescriptor = $convert.base64Decode('ChVSdW5TY2VuZVNlcnZlclJlcXVlc3QSGAoHc2NlbmVJZBgBIAEoCVIHc2NlbmVJZA==');
@$core.Deprecated('Use runSceneServerResponseDescriptor instead')
const RunSceneServerResponse$json = const {
  '1': 'RunSceneServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `RunSceneServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List runSceneServerResponseDescriptor = $convert.base64Decode('ChZSdW5TY2VuZVNlcnZlclJlc3BvbnNlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use sceneServerRequestDescriptor instead')
const SceneServerRequest$json = const {
  '1': 'SceneServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'sceneId', '3': 2, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'source', '3': 3, '4': 1, '5': 11, '6': '.DeviceInScene', '10': 'source'},
    const {'1': 'target', '3': 4, '4': 3, '5': 11, '6': '.DeviceInScene', '10': 'target'},
    const {'1': 'type', '3': 5, '4': 1, '5': 13, '10': 'type'},
    const {'1': 'mode', '3': 6, '4': 1, '5': 13, '10': 'mode'},
    const {'1': 'activeTime', '3': 7, '4': 1, '5': 11, '6': '.ActiveTime', '10': 'activeTime'},
  ],
};

/// Descriptor for `SceneServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneServerRequestDescriptor = $convert.base64Decode('ChJTY2VuZVNlcnZlclJlcXVlc3QSGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEhgKB3NjZW5lSWQYAiABKAlSB3NjZW5lSWQSJgoGc291cmNlGAMgASgLMg4uRGV2aWNlSW5TY2VuZVIGc291cmNlEiYKBnRhcmdldBgEIAMoCzIOLkRldmljZUluU2NlbmVSBnRhcmdldBISCgR0eXBlGAUgASgNUgR0eXBlEhIKBG1vZGUYBiABKA1SBG1vZGUSKwoKYWN0aXZlVGltZRgHIAEoCzILLkFjdGl2ZVRpbWVSCmFjdGl2ZVRpbWU=');
@$core.Deprecated('Use sceneServerResponseDescriptor instead')
const SceneServerResponse$json = const {
  '1': 'SceneServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SceneServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneServerResponseDescriptor = $convert.base64Decode('ChNTY2VuZVNlcnZlclJlc3BvbnNlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use sceneRetryConfirmServerRequestDescriptor instead')
const SceneRetryConfirmServerRequest$json = const {
  '1': 'SceneRetryConfirmServerRequest',
  '2': const [
    const {'1': 'sceneId', '3': 1, '4': 1, '5': 9, '10': 'sceneId'},
  ],
};

/// Descriptor for `SceneRetryConfirmServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneRetryConfirmServerRequestDescriptor = $convert.base64Decode('Ch5TY2VuZVJldHJ5Q29uZmlybVNlcnZlclJlcXVlc3QSGAoHc2NlbmVJZBgBIAEoCVIHc2NlbmVJZA==');
@$core.Deprecated('Use sceneRetryConfirmServerResponseDescriptor instead')
const SceneRetryConfirmServerResponse$json = const {
  '1': 'SceneRetryConfirmServerResponse',
  '2': const [
    const {'1': 'sceneId', '3': 1, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SceneRetryConfirmServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneRetryConfirmServerResponseDescriptor = $convert.base64Decode('Ch9TY2VuZVJldHJ5Q29uZmlybVNlcnZlclJlc3BvbnNlEhgKB3NjZW5lSWQYASABKAlSB3NjZW5lSWQSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use setSceneStatusServerRequestDescriptor instead')
const SetSceneStatusServerRequest$json = const {
  '1': 'SetSceneStatusServerRequest',
  '2': const [
    const {'1': 'sceneId', '3': 1, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'isEnable', '3': 2, '4': 1, '5': 8, '10': 'isEnable'},
  ],
};

/// Descriptor for `SetSceneStatusServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setSceneStatusServerRequestDescriptor = $convert.base64Decode('ChtTZXRTY2VuZVN0YXR1c1NlcnZlclJlcXVlc3QSGAoHc2NlbmVJZBgBIAEoCVIHc2NlbmVJZBIaCghpc0VuYWJsZRgCIAEoCFIIaXNFbmFibGU=');
@$core.Deprecated('Use setSceneStatusServerResponseDescriptor instead')
const SetSceneStatusServerResponse$json = const {
  '1': 'SetSceneStatusServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SetSceneStatusServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setSceneStatusServerResponseDescriptor = $convert.base64Decode('ChxTZXRTY2VuZVN0YXR1c1NlcnZlclJlc3BvbnNlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use testSceneServerRequestDescriptor instead')
const TestSceneServerRequest$json = const {
  '1': 'TestSceneServerRequest',
  '2': const [
    const {'1': 'scene', '3': 1, '4': 1, '5': 11, '6': '.Scene', '10': 'scene'},
  ],
};

/// Descriptor for `TestSceneServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testSceneServerRequestDescriptor = $convert.base64Decode('ChZUZXN0U2NlbmVTZXJ2ZXJSZXF1ZXN0EhwKBXNjZW5lGAEgASgLMgYuU2NlbmVSBXNjZW5l');
@$core.Deprecated('Use testSceneServerResponseDescriptor instead')
const TestSceneServerResponse$json = const {
  '1': 'TestSceneServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `TestSceneServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testSceneServerResponseDescriptor = $convert.base64Decode('ChdUZXN0U2NlbmVTZXJ2ZXJSZXNwb25zZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use sceneTriggerServerRequestDescriptor instead')
const SceneTriggerServerRequest$json = const {
  '1': 'SceneTriggerServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'sceneId', '3': 2, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'source', '3': 3, '4': 1, '5': 11, '6': '.DeviceInScene', '10': 'source'},
    const {'1': 'target', '3': 4, '4': 3, '5': 11, '6': '.DeviceInScene', '10': 'target'},
    const {'1': 'mode', '3': 5, '4': 1, '5': 13, '10': 'mode'},
  ],
};

/// Descriptor for `SceneTriggerServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneTriggerServerRequestDescriptor = $convert.base64Decode('ChlTY2VuZVRyaWdnZXJTZXJ2ZXJSZXF1ZXN0EhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZBIYCgdzY2VuZUlkGAIgASgJUgdzY2VuZUlkEiYKBnNvdXJjZRgDIAEoCzIOLkRldmljZUluU2NlbmVSBnNvdXJjZRImCgZ0YXJnZXQYBCADKAsyDi5EZXZpY2VJblNjZW5lUgZ0YXJnZXQSEgoEbW9kZRgFIAEoDVIEbW9kZQ==');
@$core.Deprecated('Use sceneTriggerServerResponseDescriptor instead')
const SceneTriggerServerResponse$json = const {
  '1': 'SceneTriggerServerResponse',
  '2': const [
    const {'1': 'sceneId', '3': 1, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SceneTriggerServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneTriggerServerResponseDescriptor = $convert.base64Decode('ChpTY2VuZVRyaWdnZXJTZXJ2ZXJSZXNwb25zZRIYCgdzY2VuZUlkGAEgASgJUgdzY2VuZUlkEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getHomeTabServerRequestDescriptor instead')
const GetHomeTabServerRequest$json = const {
  '1': 'GetHomeTabServerRequest',
  '2': const [
    const {'1': 'homeId', '3': 1, '4': 1, '5': 9, '10': 'homeId'},
  ],
};

/// Descriptor for `GetHomeTabServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHomeTabServerRequestDescriptor = $convert.base64Decode('ChdHZXRIb21lVGFiU2VydmVyUmVxdWVzdBIWCgZob21lSWQYASABKAlSBmhvbWVJZA==');
@$core.Deprecated('Use getHomeTabServerResponseDescriptor instead')
const GetHomeTabServerResponse$json = const {
  '1': 'GetHomeTabServerResponse',
  '2': const [
    const {'1': 'statusSwitchers', '3': 1, '4': 3, '5': 11, '6': '.Switcher', '10': 'statusSwitchers'},
    const {'1': 'scenes', '3': 2, '4': 3, '5': 11, '6': '.Scene', '10': 'scenes'},
    const {'1': 'favoriteSwitchers', '3': 3, '4': 3, '5': 11, '6': '.Switcher', '10': 'favoriteSwitchers'},
    const {'1': 'favoriteCurtainSwitchers', '3': 4, '4': 3, '5': 11, '6': '.CurtainSwitcher', '10': 'favoriteCurtainSwitchers'},
    const {'1': 'favoriteRemotes', '3': 5, '4': 3, '5': 11, '6': '.Remote', '10': 'favoriteRemotes'},
    const {'1': 'meter', '3': 6, '4': 3, '5': 11, '6': '.Meter', '10': 'meter'},
    const {'1': 'statusRoom', '3': 7, '4': 1, '5': 11, '6': '.AirConditionerState', '10': 'statusRoom'},
    const {'1': 'homeId', '3': 8, '4': 1, '5': 9, '10': 'homeId'},
    const {'1': 'favoriteMotions', '3': 9, '4': 3, '5': 11, '6': '.Motion', '10': 'favoriteMotions'},
    const {'1': 'favoriteHomekits', '3': 10, '4': 3, '5': 11, '6': '.Homekit', '10': 'favoriteHomekits'},
    const {'1': 'favoriteButtons', '3': 11, '4': 3, '5': 11, '6': '.Button', '10': 'favoriteButtons'},
    const {'1': 'favoriteGroupControls', '3': 12, '4': 3, '5': 11, '6': '.GroupControl', '10': 'favoriteGroupControls'},
    const {'1': 'featureCode', '3': 13, '4': 1, '5': 13, '10': 'featureCode'},
    const {'1': 'statusRemotes', '3': 14, '4': 3, '5': 11, '6': '.Remote', '10': 'statusRemotes'},
    const {'1': 'statusCurtainSwitchers', '3': 15, '4': 3, '5': 11, '6': '.CurtainSwitcher', '10': 'statusCurtainSwitchers'},
    const {'1': 'touchPanels', '3': 16, '4': 3, '5': 11, '6': '.TouchPanel', '10': 'touchPanels'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetHomeTabServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHomeTabServerResponseDescriptor = $convert.base64Decode('ChhHZXRIb21lVGFiU2VydmVyUmVzcG9uc2USMwoPc3RhdHVzU3dpdGNoZXJzGAEgAygLMgkuU3dpdGNoZXJSD3N0YXR1c1N3aXRjaGVycxIeCgZzY2VuZXMYAiADKAsyBi5TY2VuZVIGc2NlbmVzEjcKEWZhdm9yaXRlU3dpdGNoZXJzGAMgAygLMgkuU3dpdGNoZXJSEWZhdm9yaXRlU3dpdGNoZXJzEkwKGGZhdm9yaXRlQ3VydGFpblN3aXRjaGVycxgEIAMoCzIQLkN1cnRhaW5Td2l0Y2hlclIYZmF2b3JpdGVDdXJ0YWluU3dpdGNoZXJzEjEKD2Zhdm9yaXRlUmVtb3RlcxgFIAMoCzIHLlJlbW90ZVIPZmF2b3JpdGVSZW1vdGVzEhwKBW1ldGVyGAYgAygLMgYuTWV0ZXJSBW1ldGVyEjQKCnN0YXR1c1Jvb20YByABKAsyFC5BaXJDb25kaXRpb25lclN0YXRlUgpzdGF0dXNSb29tEhYKBmhvbWVJZBgIIAEoCVIGaG9tZUlkEjEKD2Zhdm9yaXRlTW90aW9ucxgJIAMoCzIHLk1vdGlvblIPZmF2b3JpdGVNb3Rpb25zEjQKEGZhdm9yaXRlSG9tZWtpdHMYCiADKAsyCC5Ib21la2l0UhBmYXZvcml0ZUhvbWVraXRzEjEKD2Zhdm9yaXRlQnV0dG9ucxgLIAMoCzIHLkJ1dHRvblIPZmF2b3JpdGVCdXR0b25zEkMKFWZhdm9yaXRlR3JvdXBDb250cm9scxgMIAMoCzINLkdyb3VwQ29udHJvbFIVZmF2b3JpdGVHcm91cENvbnRyb2xzEiAKC2ZlYXR1cmVDb2RlGA0gASgNUgtmZWF0dXJlQ29kZRItCg1zdGF0dXNSZW1vdGVzGA4gAygLMgcuUmVtb3RlUg1zdGF0dXNSZW1vdGVzEkgKFnN0YXR1c0N1cnRhaW5Td2l0Y2hlcnMYDyADKAsyEC5DdXJ0YWluU3dpdGNoZXJSFnN0YXR1c0N1cnRhaW5Td2l0Y2hlcnMSLQoLdG91Y2hQYW5lbHMYECADKAsyCy5Ub3VjaFBhbmVsUgt0b3VjaFBhbmVscxIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use getElectricTabServerRequestDescriptor instead')
const GetElectricTabServerRequest$json = const {
  '1': 'GetElectricTabServerRequest',
  '2': const [
    const {'1': 'homeId', '3': 1, '4': 1, '5': 9, '10': 'homeId'},
  ],
};

/// Descriptor for `GetElectricTabServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getElectricTabServerRequestDescriptor = $convert.base64Decode('ChtHZXRFbGVjdHJpY1RhYlNlcnZlclJlcXVlc3QSFgoGaG9tZUlkGAEgASgJUgZob21lSWQ=');
@$core.Deprecated('Use getElectricTabServerResponseDescriptor instead')
const GetElectricTabServerResponse$json = const {
  '1': 'GetElectricTabServerResponse',
  '2': const [
    const {'1': 'rooms', '3': 1, '4': 3, '5': 11, '6': '.Room', '10': 'rooms'},
    const {'1': 'homeId', '3': 2, '4': 1, '5': 9, '10': 'homeId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetElectricTabServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getElectricTabServerResponseDescriptor = $convert.base64Decode('ChxHZXRFbGVjdHJpY1RhYlNlcnZlclJlc3BvbnNlEhsKBXJvb21zGAEgAygLMgUuUm9vbVIFcm9vbXMSFgoGaG9tZUlkGAIgASgJUgZob21lSWQSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use getSwitcherTabServerRequestDescriptor instead')
const GetSwitcherTabServerRequest$json = const {
  '1': 'GetSwitcherTabServerRequest',
  '2': const [
    const {'1': 'homeId', '3': 1, '4': 1, '5': 9, '10': 'homeId'},
    const {'1': 'group', '3': 2, '4': 1, '5': 14, '6': '.GroupDevice', '10': 'group'},
  ],
};

/// Descriptor for `GetSwitcherTabServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSwitcherTabServerRequestDescriptor = $convert.base64Decode('ChtHZXRTd2l0Y2hlclRhYlNlcnZlclJlcXVlc3QSFgoGaG9tZUlkGAEgASgJUgZob21lSWQSIgoFZ3JvdXAYAiABKA4yDC5Hcm91cERldmljZVIFZ3JvdXA=');
@$core.Deprecated('Use getSwitcherTabServerResponseDescriptor instead')
const GetSwitcherTabServerResponse$json = const {
  '1': 'GetSwitcherTabServerResponse',
  '2': const [
    const {'1': 'rooms', '3': 1, '4': 3, '5': 11, '6': '.Room', '10': 'rooms'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetSwitcherTabServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSwitcherTabServerResponseDescriptor = $convert.base64Decode('ChxHZXRTd2l0Y2hlclRhYlNlcnZlclJlc3BvbnNlEhsKBXJvb21zGAEgAygLMgUuUm9vbVIFcm9vbXMSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use switcherOnChangedServerResponseDescriptor instead')
const SwitcherOnChangedServerResponse$json = const {
  '1': 'SwitcherOnChangedServerResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'switcher', '3': 2, '4': 1, '5': 13, '10': 'switcher'},
    const {'1': 'powerState', '3': 3, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'totalTimeOnOrgin', '3': 4, '4': 1, '5': 13, '10': 'totalTimeOnOrgin'},
    const {'1': 'totalTimeOnYear', '3': 5, '4': 1, '5': 13, '10': 'totalTimeOnYear'},
    const {'1': 'totalTimeOnMonth', '3': 6, '4': 1, '5': 13, '10': 'totalTimeOnMonth'},
    const {'1': 'timeOnLastDate', '3': 7, '4': 1, '5': 13, '10': 'timeOnLastDate'},
    const {'1': 'timeOffLastDate', '3': 8, '4': 1, '5': 13, '10': 'timeOffLastDate'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SwitcherOnChangedServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List switcherOnChangedServerResponseDescriptor = $convert.base64Decode('Ch9Td2l0Y2hlck9uQ2hhbmdlZFNlcnZlclJlc3BvbnNlEhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZBIaCghzd2l0Y2hlchgCIAEoDVIIc3dpdGNoZXISKwoKcG93ZXJTdGF0ZRgDIAEoDjILLlBvd2VyU3RhdGVSCnBvd2VyU3RhdGUSKgoQdG90YWxUaW1lT25PcmdpbhgEIAEoDVIQdG90YWxUaW1lT25PcmdpbhIoCg90b3RhbFRpbWVPblllYXIYBSABKA1SD3RvdGFsVGltZU9uWWVhchIqChB0b3RhbFRpbWVPbk1vbnRoGAYgASgNUhB0b3RhbFRpbWVPbk1vbnRoEiYKDnRpbWVPbkxhc3REYXRlGAcgASgNUg50aW1lT25MYXN0RGF0ZRIoCg90aW1lT2ZmTGFzdERhdGUYCCABKA1SD3RpbWVPZmZMYXN0RGF0ZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use curtainSwitcherOnChangedServerResponseDescriptor instead')
const CurtainSwitcherOnChangedServerResponse$json = const {
  '1': 'CurtainSwitcherOnChangedServerResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'percentIn', '3': 2, '4': 1, '5': 13, '10': 'percentIn'},
    const {'1': 'percentOut', '3': 3, '4': 1, '5': 13, '10': 'percentOut'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `CurtainSwitcherOnChangedServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List curtainSwitcherOnChangedServerResponseDescriptor = $convert.base64Decode('CiZDdXJ0YWluU3dpdGNoZXJPbkNoYW5nZWRTZXJ2ZXJSZXNwb25zZRIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSHAoJcGVyY2VudEluGAIgASgNUglwZXJjZW50SW4SHgoKcGVyY2VudE91dBgDIAEoDVIKcGVyY2VudE91dBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use airConditionerOnChangedServerResponseDescriptor instead')
const AirConditionerOnChangedServerResponse$json = const {
  '1': 'AirConditionerOnChangedServerResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'state', '3': 2, '4': 1, '5': 11, '6': '.AirConditionerState', '10': 'state'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `AirConditionerOnChangedServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List airConditionerOnChangedServerResponseDescriptor = $convert.base64Decode('CiVBaXJDb25kaXRpb25lck9uQ2hhbmdlZFNlcnZlclJlc3BvbnNlEhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZBIqCgVzdGF0ZRgCIAEoCzIULkFpckNvbmRpdGlvbmVyU3RhdGVSBXN0YXRlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use remoteOnChangedServerResponseDescriptor instead')
const RemoteOnChangedServerResponse$json = const {
  '1': 'RemoteOnChangedServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `RemoteOnChangedServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteOnChangedServerResponseDescriptor = $convert.base64Decode('Ch1SZW1vdGVPbkNoYW5nZWRTZXJ2ZXJSZXNwb25zZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use meterOnChangedServerResponseDescriptor instead')
const MeterOnChangedServerResponse$json = const {
  '1': 'MeterOnChangedServerResponse',
  '2': const [
    const {'1': 'meter', '3': 1, '4': 1, '5': 11, '6': '.Meter', '10': 'meter'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `MeterOnChangedServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List meterOnChangedServerResponseDescriptor = $convert.base64Decode('ChxNZXRlck9uQ2hhbmdlZFNlcnZlclJlc3BvbnNlEhwKBW1ldGVyGAEgASgLMgYuTWV0ZXJSBW1ldGVyEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use deviceOnChangedDeviceServerResponseDescriptor instead')
const DeviceOnChangedDeviceServerResponse$json = const {
  '1': 'DeviceOnChangedDeviceServerResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'connectionState', '3': 2, '4': 1, '5': 14, '6': '.ConnectionState', '10': 'connectionState'},
    const {'1': 'totalTimeOnOrgin', '3': 3, '4': 1, '5': 13, '10': 'totalTimeOnOrgin'},
    const {'1': 'totalTimeOnYear', '3': 4, '4': 1, '5': 13, '10': 'totalTimeOnYear'},
    const {'1': 'totalTimeOnMonth', '3': 5, '4': 1, '5': 13, '10': 'totalTimeOnMonth'},
    const {'1': 'timeOnLastDate', '3': 6, '4': 1, '5': 13, '10': 'timeOnLastDate'},
    const {'1': 'timeOffLastDate', '3': 7, '4': 1, '5': 13, '10': 'timeOffLastDate'},
    const {'1': 'name', '3': 8, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'model', '3': 9, '4': 1, '5': 9, '10': 'model'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `DeviceOnChangedDeviceServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceOnChangedDeviceServerResponseDescriptor = $convert.base64Decode('CiNEZXZpY2VPbkNoYW5nZWREZXZpY2VTZXJ2ZXJSZXNwb25zZRIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSOgoPY29ubmVjdGlvblN0YXRlGAIgASgOMhAuQ29ubmVjdGlvblN0YXRlUg9jb25uZWN0aW9uU3RhdGUSKgoQdG90YWxUaW1lT25PcmdpbhgDIAEoDVIQdG90YWxUaW1lT25PcmdpbhIoCg90b3RhbFRpbWVPblllYXIYBCABKA1SD3RvdGFsVGltZU9uWWVhchIqChB0b3RhbFRpbWVPbk1vbnRoGAUgASgNUhB0b3RhbFRpbWVPbk1vbnRoEiYKDnRpbWVPbkxhc3REYXRlGAYgASgNUg50aW1lT25MYXN0RGF0ZRIoCg90aW1lT2ZmTGFzdERhdGUYByABKA1SD3RpbWVPZmZMYXN0RGF0ZRISCgRuYW1lGAggASgJUgRuYW1lEhQKBW1vZGVsGAkgASgJUgVtb2RlbBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use progressUpdateFirmwareOnChangedDeviceServerResponseDescriptor instead')
const ProgressUpdateFirmwareOnChangedDeviceServerResponse$json = const {
  '1': 'ProgressUpdateFirmwareOnChangedDeviceServerResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'percent', '3': 2, '4': 1, '5': 13, '10': 'percent'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `ProgressUpdateFirmwareOnChangedDeviceServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List progressUpdateFirmwareOnChangedDeviceServerResponseDescriptor = $convert.base64Decode('CjNQcm9ncmVzc1VwZGF0ZUZpcm13YXJlT25DaGFuZ2VkRGV2aWNlU2VydmVyUmVzcG9uc2USGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEhgKB3BlcmNlbnQYAiABKA1SB3BlcmNlbnQSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use downloadFirmwareOnChangedDeviceServerResponseDescriptor instead')
const DownloadFirmwareOnChangedDeviceServerResponse$json = const {
  '1': 'DownloadFirmwareOnChangedDeviceServerResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'hardwareId', '3': 2, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'data', '3': 3, '4': 1, '5': 12, '10': 'data'},
    const {'1': 'dataSize', '3': 4, '4': 1, '5': 13, '10': 'dataSize'},
    const {'1': 'pageIndex', '3': 5, '4': 1, '5': 13, '10': 'pageIndex'},
    const {'1': 'totalPage', '3': 6, '4': 1, '5': 13, '10': 'totalPage'},
    const {'1': 'pageSize', '3': 7, '4': 1, '5': 13, '10': 'pageSize'},
    const {'1': 'fileSize', '3': 8, '4': 1, '5': 13, '10': 'fileSize'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `DownloadFirmwareOnChangedDeviceServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadFirmwareOnChangedDeviceServerResponseDescriptor = $convert.base64Decode('Ci1Eb3dubG9hZEZpcm13YXJlT25DaGFuZ2VkRGV2aWNlU2VydmVyUmVzcG9uc2USGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEh4KCmhhcmR3YXJlSWQYAiABKAlSCmhhcmR3YXJlSWQSEgoEZGF0YRgDIAEoDFIEZGF0YRIaCghkYXRhU2l6ZRgEIAEoDVIIZGF0YVNpemUSHAoJcGFnZUluZGV4GAUgASgNUglwYWdlSW5kZXgSHAoJdG90YWxQYWdlGAYgASgNUgl0b3RhbFBhZ2USGgoIcGFnZVNpemUYByABKA1SCHBhZ2VTaXplEhoKCGZpbGVTaXplGAggASgNUghmaWxlU2l6ZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use motionOnChangedServerResponseDescriptor instead')
const MotionOnChangedServerResponse$json = const {
  '1': 'MotionOnChangedServerResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'state', '3': 2, '4': 1, '5': 14, '6': '.MotionState', '10': 'state'},
    const {'1': 'sensorReport', '3': 3, '4': 1, '5': 11, '6': '.EnvironmentSensorReport', '10': 'sensorReport'},
    const {'1': 'batteryCapacity', '3': 4, '4': 1, '5': 2, '10': 'batteryCapacity'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `MotionOnChangedServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List motionOnChangedServerResponseDescriptor = $convert.base64Decode('Ch1Nb3Rpb25PbkNoYW5nZWRTZXJ2ZXJSZXNwb25zZRIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSIgoFc3RhdGUYAiABKA4yDC5Nb3Rpb25TdGF0ZVIFc3RhdGUSPAoMc2Vuc29yUmVwb3J0GAMgASgLMhguRW52aXJvbm1lbnRTZW5zb3JSZXBvcnRSDHNlbnNvclJlcG9ydBIoCg9iYXR0ZXJ5Q2FwYWNpdHkYBCABKAJSD2JhdHRlcnlDYXBhY2l0eRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use sceneOnChangedServerResponseDescriptor instead')
const SceneOnChangedServerResponse$json = const {
  '1': 'SceneOnChangedServerResponse',
  '2': const [
    const {'1': 'sceneId', '3': 1, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'confirmed', '3': 2, '4': 1, '5': 8, '10': 'confirmed'},
    const {'1': 'mode', '3': 3, '4': 1, '5': 13, '10': 'mode'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SceneOnChangedServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneOnChangedServerResponseDescriptor = $convert.base64Decode('ChxTY2VuZU9uQ2hhbmdlZFNlcnZlclJlc3BvbnNlEhgKB3NjZW5lSWQYASABKAlSB3NjZW5lSWQSHAoJY29uZmlybWVkGAIgASgIUgljb25maXJtZWQSEgoEbW9kZRgDIAEoDVIEbW9kZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use homekitOnChangedServerResponseDescriptor instead')
const HomekitOnChangedServerResponse$json = const {
  '1': 'HomekitOnChangedServerResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'homekitMode', '3': 2, '4': 1, '5': 14, '6': '.HomekitMode', '10': 'homekitMode'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `HomekitOnChangedServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List homekitOnChangedServerResponseDescriptor = $convert.base64Decode('Ch5Ib21la2l0T25DaGFuZ2VkU2VydmVyUmVzcG9uc2USGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEi4KC2hvbWVraXRNb2RlGAIgASgOMgwuSG9tZWtpdE1vZGVSC2hvbWVraXRNb2RlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use buttonOnChangedServerResponseDescriptor instead')
const ButtonOnChangedServerResponse$json = const {
  '1': 'ButtonOnChangedServerResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'state', '3': 2, '4': 1, '5': 14, '6': '.ButtonState', '10': 'state'},
    const {'1': 'index', '3': 3, '4': 1, '5': 13, '10': 'index'},
    const {'1': 'batteryCapacity', '3': 4, '4': 1, '5': 2, '10': 'batteryCapacity'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `ButtonOnChangedServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buttonOnChangedServerResponseDescriptor = $convert.base64Decode('Ch1CdXR0b25PbkNoYW5nZWRTZXJ2ZXJSZXNwb25zZRIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSIgoFc3RhdGUYAiABKA4yDC5CdXR0b25TdGF0ZVIFc3RhdGUSFAoFaW5kZXgYAyABKA1SBWluZGV4EigKD2JhdHRlcnlDYXBhY2l0eRgEIAEoAlIPYmF0dGVyeUNhcGFjaXR5EiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use groupControlOnChangedServerResponseDescriptor instead')
const GroupControlOnChangedServerResponse$json = const {
  '1': 'GroupControlOnChangedServerResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'state', '3': 2, '4': 1, '5': 11, '6': '.ControlState', '10': 'state'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GroupControlOnChangedServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupControlOnChangedServerResponseDescriptor = $convert.base64Decode('CiNHcm91cENvbnRyb2xPbkNoYW5nZWRTZXJ2ZXJSZXNwb25zZRIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSIwoFc3RhdGUYAiABKAsyDS5Db250cm9sU3RhdGVSBXN0YXRlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use ledDriverOnChangedServerResponseDescriptor instead')
const LedDriverOnChangedServerResponse$json = const {
  '1': 'LedDriverOnChangedServerResponse',
  '2': const [
    const {'1': 'ledId', '3': 1, '4': 1, '5': 9, '10': 'ledId'},
    const {'1': 'powerState', '3': 2, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'brightnessPercent', '3': 3, '4': 1, '5': 5, '10': 'brightnessPercent'},
    const {'1': 'roomId', '3': 4, '4': 1, '5': 9, '10': 'roomId'},
    const {'1': 'ledItems', '3': 5, '4': 3, '5': 11, '6': '.LedItem', '10': 'ledItems'},
    const {'1': 'ledDriverId', '3': 6, '4': 1, '5': 9, '10': 'ledDriverId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `LedDriverOnChangedServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ledDriverOnChangedServerResponseDescriptor = $convert.base64Decode('CiBMZWREcml2ZXJPbkNoYW5nZWRTZXJ2ZXJSZXNwb25zZRIUCgVsZWRJZBgBIAEoCVIFbGVkSWQSKwoKcG93ZXJTdGF0ZRgCIAEoDjILLlBvd2VyU3RhdGVSCnBvd2VyU3RhdGUSLAoRYnJpZ2h0bmVzc1BlcmNlbnQYAyABKAVSEWJyaWdodG5lc3NQZXJjZW50EhYKBnJvb21JZBgEIAEoCVIGcm9vbUlkEiQKCGxlZEl0ZW1zGAUgAygLMgguTGVkSXRlbVIIbGVkSXRlbXMSIAoLbGVkRHJpdmVySWQYBiABKAlSC2xlZERyaXZlcklkEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use environmentSensorOnChangedServerResponseDescriptor instead')
const EnvironmentSensorOnChangedServerResponse$json = const {
  '1': 'EnvironmentSensorOnChangedServerResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'deviceId', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'environmentSensorReport', '3': 3, '4': 1, '5': 11, '6': '.EnvironmentSensorReport', '10': 'environmentSensorReport'},
    const {'1': 'battery', '3': 4, '4': 1, '5': 5, '10': 'battery'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `EnvironmentSensorOnChangedServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List environmentSensorOnChangedServerResponseDescriptor = $convert.base64Decode('CihFbnZpcm9ubWVudFNlbnNvck9uQ2hhbmdlZFNlcnZlclJlc3BvbnNlEg4KAmlkGAEgASgJUgJpZBIaCghkZXZpY2VJZBgCIAEoCVIIZGV2aWNlSWQSUgoXZW52aXJvbm1lbnRTZW5zb3JSZXBvcnQYAyABKAsyGC5FbnZpcm9ubWVudFNlbnNvclJlcG9ydFIXZW52aXJvbm1lbnRTZW5zb3JSZXBvcnQSGAoHYmF0dGVyeRgEIAEoBVIHYmF0dGVyeRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use smartPlugOnChangedServerResponseDescriptor instead')
const SmartPlugOnChangedServerResponse$json = const {
  '1': 'SmartPlugOnChangedServerResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'deviceId', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'amp', '3': 3, '4': 1, '5': 2, '10': 'amp'},
    const {'1': 'power', '3': 4, '4': 1, '5': 2, '10': 'power'},
    const {'1': 'volt', '3': 5, '4': 1, '5': 2, '10': 'volt'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SmartPlugOnChangedServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List smartPlugOnChangedServerResponseDescriptor = $convert.base64Decode('CiBTbWFydFBsdWdPbkNoYW5nZWRTZXJ2ZXJSZXNwb25zZRIOCgJpZBgBIAEoCVICaWQSGgoIZGV2aWNlSWQYAiABKAlSCGRldmljZUlkEhAKA2FtcBgDIAEoAlIDYW1wEhQKBXBvd2VyGAQgASgCUgVwb3dlchISCgR2b2x0GAUgASgCUgR2b2x0EiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use curtainOnChangedServerResponseDescriptor instead')
const CurtainOnChangedServerResponse$json = const {
  '1': 'CurtainOnChangedServerResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'percent', '3': 2, '4': 1, '5': 13, '10': 'percent'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `CurtainOnChangedServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List curtainOnChangedServerResponseDescriptor = $convert.base64Decode('Ch5DdXJ0YWluT25DaGFuZ2VkU2VydmVyUmVzcG9uc2USGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEhgKB3BlcmNlbnQYAiABKA1SB3BlcmNlbnQSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use echoServerRequestDescriptor instead')
const EchoServerRequest$json = const {
  '1': 'EchoServerRequest',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.TypeEcho', '10': 'type'},
  ],
};

/// Descriptor for `EchoServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List echoServerRequestDescriptor = $convert.base64Decode('ChFFY2hvU2VydmVyUmVxdWVzdBIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdlEh0KBHR5cGUYAiABKA4yCS5UeXBlRWNob1IEdHlwZQ==');
@$core.Deprecated('Use echoServerResponseDescriptor instead')
const EchoServerResponse$json = const {
  '1': 'EchoServerResponse',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.TypeEcho', '10': 'type'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `EchoServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List echoServerResponseDescriptor = $convert.base64Decode('ChJFY2hvU2VydmVyUmVzcG9uc2USGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZRIdCgR0eXBlGAIgASgOMgkuVHlwZUVjaG9SBHR5cGUSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use motionServerRequestDescriptor instead')
const MotionServerRequest$json = const {
  '1': 'MotionServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'motionState', '3': 2, '4': 1, '5': 14, '6': '.MotionState', '10': 'motionState'},
    const {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.MotionSensorType', '10': 'type'},
  ],
};

/// Descriptor for `MotionServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List motionServerRequestDescriptor = $convert.base64Decode('ChNNb3Rpb25TZXJ2ZXJSZXF1ZXN0EhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZBIuCgttb3Rpb25TdGF0ZRgCIAEoDjIMLk1vdGlvblN0YXRlUgttb3Rpb25TdGF0ZRIlCgR0eXBlGAMgASgOMhEuTW90aW9uU2Vuc29yVHlwZVIEdHlwZQ==');
@$core.Deprecated('Use motionServerResponseDescriptor instead')
const MotionServerResponse$json = const {
  '1': 'MotionServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `MotionServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List motionServerResponseDescriptor = $convert.base64Decode('ChRNb3Rpb25TZXJ2ZXJSZXNwb25zZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use getMotionServerRequestDescriptor instead')
const GetMotionServerRequest$json = const {
  '1': 'GetMotionServerRequest',
  '2': const [
    const {'1': 'motionId', '3': 1, '4': 1, '5': 9, '10': 'motionId'},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.MotionSensorType', '10': 'type'},
  ],
};

/// Descriptor for `GetMotionServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMotionServerRequestDescriptor = $convert.base64Decode('ChZHZXRNb3Rpb25TZXJ2ZXJSZXF1ZXN0EhoKCG1vdGlvbklkGAEgASgJUghtb3Rpb25JZBIlCgR0eXBlGAIgASgOMhEuTW90aW9uU2Vuc29yVHlwZVIEdHlwZQ==');
@$core.Deprecated('Use getMotionServerResponseDescriptor instead')
const GetMotionServerResponse$json = const {
  '1': 'GetMotionServerResponse',
  '2': const [
    const {'1': 'motion', '3': 1, '4': 1, '5': 11, '6': '.Motion', '10': 'motion'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetMotionServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMotionServerResponseDescriptor = $convert.base64Decode('ChdHZXRNb3Rpb25TZXJ2ZXJSZXNwb25zZRIfCgZtb3Rpb24YASABKAsyBy5Nb3Rpb25SBm1vdGlvbhIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use updateMotionServerRequestDescriptor instead')
const UpdateMotionServerRequest$json = const {
  '1': 'UpdateMotionServerRequest',
  '2': const [
    const {'1': 'motion', '3': 1, '4': 1, '5': 11, '6': '.Motion', '10': 'motion'},
  ],
};

/// Descriptor for `UpdateMotionServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMotionServerRequestDescriptor = $convert.base64Decode('ChlVcGRhdGVNb3Rpb25TZXJ2ZXJSZXF1ZXN0Eh8KBm1vdGlvbhgBIAEoCzIHLk1vdGlvblIGbW90aW9u');
@$core.Deprecated('Use updateMotionServerResponseDescriptor instead')
const UpdateMotionServerResponse$json = const {
  '1': 'UpdateMotionServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateMotionServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMotionServerResponseDescriptor = $convert.base64Decode('ChpVcGRhdGVNb3Rpb25TZXJ2ZXJSZXNwb25zZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use getHomekitInfoServerRequestDescriptor instead')
const GetHomekitInfoServerRequest$json = const {
  '1': 'GetHomekitInfoServerRequest',
  '2': const [
    const {'1': 'homekitId', '3': 1, '4': 1, '5': 9, '10': 'homekitId'},
  ],
};

/// Descriptor for `GetHomekitInfoServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHomekitInfoServerRequestDescriptor = $convert.base64Decode('ChtHZXRIb21la2l0SW5mb1NlcnZlclJlcXVlc3QSHAoJaG9tZWtpdElkGAEgASgJUglob21la2l0SWQ=');
@$core.Deprecated('Use getHomekitInfoServerResponseDescriptor instead')
const GetHomekitInfoServerResponse$json = const {
  '1': 'GetHomekitInfoServerResponse',
  '2': const [
    const {'1': 'homekit', '3': 1, '4': 1, '5': 11, '6': '.Homekit', '10': 'homekit'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetHomekitInfoServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHomekitInfoServerResponseDescriptor = $convert.base64Decode('ChxHZXRIb21la2l0SW5mb1NlcnZlclJlc3BvbnNlEiIKB2hvbWVraXQYASABKAsyCC5Ib21la2l0Ugdob21la2l0EiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use updateHomekitServerRequestDescriptor instead')
const UpdateHomekitServerRequest$json = const {
  '1': 'UpdateHomekitServerRequest',
  '2': const [
    const {'1': 'homekit', '3': 1, '4': 1, '5': 11, '6': '.Homekit', '10': 'homekit'},
  ],
};

/// Descriptor for `UpdateHomekitServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateHomekitServerRequestDescriptor = $convert.base64Decode('ChpVcGRhdGVIb21la2l0U2VydmVyUmVxdWVzdBIiCgdob21la2l0GAEgASgLMgguSG9tZWtpdFIHaG9tZWtpdA==');
@$core.Deprecated('Use updateHomekitServerResponseDescriptor instead')
const UpdateHomekitServerResponse$json = const {
  '1': 'UpdateHomekitServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateHomekitServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateHomekitServerResponseDescriptor = $convert.base64Decode('ChtVcGRhdGVIb21la2l0U2VydmVyUmVzcG9uc2USLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use setHomekitModeServerRequestDescriptor instead')
const SetHomekitModeServerRequest$json = const {
  '1': 'SetHomekitModeServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'homekitMode', '3': 2, '4': 1, '5': 14, '6': '.HomekitMode', '10': 'homekitMode'},
  ],
};

/// Descriptor for `SetHomekitModeServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setHomekitModeServerRequestDescriptor = $convert.base64Decode('ChtTZXRIb21la2l0TW9kZVNlcnZlclJlcXVlc3QSGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEi4KC2hvbWVraXRNb2RlGAIgASgOMgwuSG9tZWtpdE1vZGVSC2hvbWVraXRNb2Rl');
@$core.Deprecated('Use setHomekitModeServerResponseDescriptor instead')
const SetHomekitModeServerResponse$json = const {
  '1': 'SetHomekitModeServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SetHomekitModeServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setHomekitModeServerResponseDescriptor = $convert.base64Decode('ChxTZXRIb21la2l0TW9kZVNlcnZlclJlc3BvbnNlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getProjectsServerRequestDescriptor instead')
const GetProjectsServerRequest$json = const {
  '1': 'GetProjectsServerRequest',
  '2': const [
    const {'1': 'keySearch', '3': 1, '4': 1, '5': 9, '10': 'keySearch'},
  ],
};

/// Descriptor for `GetProjectsServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProjectsServerRequestDescriptor = $convert.base64Decode('ChhHZXRQcm9qZWN0c1NlcnZlclJlcXVlc3QSHAoJa2V5U2VhcmNoGAEgASgJUglrZXlTZWFyY2g=');
@$core.Deprecated('Use getProjectsServerResponseDescriptor instead')
const GetProjectsServerResponse$json = const {
  '1': 'GetProjectsServerResponse',
  '2': const [
    const {'1': 'projects', '3': 1, '4': 3, '5': 11, '6': '.Project', '10': 'projects'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetProjectsServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProjectsServerResponseDescriptor = $convert.base64Decode('ChlHZXRQcm9qZWN0c1NlcnZlclJlc3BvbnNlEiQKCHByb2plY3RzGAEgAygLMgguUHJvamVjdFIIcHJvamVjdHMSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use getBuildingsServerRequestDescriptor instead')
const GetBuildingsServerRequest$json = const {
  '1': 'GetBuildingsServerRequest',
  '2': const [
    const {'1': 'projectId', '3': 1, '4': 1, '5': 9, '10': 'projectId'},
    const {'1': 'keySearch', '3': 2, '4': 1, '5': 9, '10': 'keySearch'},
  ],
};

/// Descriptor for `GetBuildingsServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBuildingsServerRequestDescriptor = $convert.base64Decode('ChlHZXRCdWlsZGluZ3NTZXJ2ZXJSZXF1ZXN0EhwKCXByb2plY3RJZBgBIAEoCVIJcHJvamVjdElkEhwKCWtleVNlYXJjaBgCIAEoCVIJa2V5U2VhcmNo');
@$core.Deprecated('Use getBuildingsServerResponseDescriptor instead')
const GetBuildingsServerResponse$json = const {
  '1': 'GetBuildingsServerResponse',
  '2': const [
    const {'1': 'buildings', '3': 1, '4': 3, '5': 11, '6': '.Building', '10': 'buildings'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetBuildingsServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBuildingsServerResponseDescriptor = $convert.base64Decode('ChpHZXRCdWlsZGluZ3NTZXJ2ZXJSZXNwb25zZRInCglidWlsZGluZ3MYASADKAsyCS5CdWlsZGluZ1IJYnVpbGRpbmdzEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getFloorsServerRequestDescriptor instead')
const GetFloorsServerRequest$json = const {
  '1': 'GetFloorsServerRequest',
  '2': const [
    const {'1': 'buildingId', '3': 1, '4': 1, '5': 9, '10': 'buildingId'},
    const {'1': 'keySearch', '3': 2, '4': 1, '5': 9, '10': 'keySearch'},
  ],
};

/// Descriptor for `GetFloorsServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFloorsServerRequestDescriptor = $convert.base64Decode('ChZHZXRGbG9vcnNTZXJ2ZXJSZXF1ZXN0Eh4KCmJ1aWxkaW5nSWQYASABKAlSCmJ1aWxkaW5nSWQSHAoJa2V5U2VhcmNoGAIgASgJUglrZXlTZWFyY2g=');
@$core.Deprecated('Use getFloorsServerResponseDescriptor instead')
const GetFloorsServerResponse$json = const {
  '1': 'GetFloorsServerResponse',
  '2': const [
    const {'1': 'floors', '3': 1, '4': 3, '5': 11, '6': '.Floor', '10': 'floors'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetFloorsServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFloorsServerResponseDescriptor = $convert.base64Decode('ChdHZXRGbG9vcnNTZXJ2ZXJSZXNwb25zZRIeCgZmbG9vcnMYASADKAsyBi5GbG9vclIGZmxvb3JzEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getApartmentsServerRequestDescriptor instead')
const GetApartmentsServerRequest$json = const {
  '1': 'GetApartmentsServerRequest',
  '2': const [
    const {'1': 'floorId', '3': 1, '4': 1, '5': 9, '10': 'floorId'},
    const {'1': 'keySearch', '3': 2, '4': 1, '5': 9, '10': 'keySearch'},
  ],
};

/// Descriptor for `GetApartmentsServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getApartmentsServerRequestDescriptor = $convert.base64Decode('ChpHZXRBcGFydG1lbnRzU2VydmVyUmVxdWVzdBIYCgdmbG9vcklkGAEgASgJUgdmbG9vcklkEhwKCWtleVNlYXJjaBgCIAEoCVIJa2V5U2VhcmNo');
@$core.Deprecated('Use getApartmentsServerResponseDescriptor instead')
const GetApartmentsServerResponse$json = const {
  '1': 'GetApartmentsServerResponse',
  '2': const [
    const {'1': 'apartments', '3': 1, '4': 3, '5': 11, '6': '.Apartment', '10': 'apartments'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetApartmentsServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getApartmentsServerResponseDescriptor = $convert.base64Decode('ChtHZXRBcGFydG1lbnRzU2VydmVyUmVzcG9uc2USKgoKYXBhcnRtZW50cxgBIAMoCzIKLkFwYXJ0bWVudFIKYXBhcnRtZW50cxIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use addUserHomeServerRequestDescriptor instead')
const AddUserHomeServerRequest$json = const {
  '1': 'AddUserHomeServerRequest',
  '2': const [
    const {'1': 'userHome', '3': 1, '4': 1, '5': 11, '6': '.UserHome', '10': 'userHome'},
  ],
};

/// Descriptor for `AddUserHomeServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addUserHomeServerRequestDescriptor = $convert.base64Decode('ChhBZGRVc2VySG9tZVNlcnZlclJlcXVlc3QSJQoIdXNlckhvbWUYASABKAsyCS5Vc2VySG9tZVIIdXNlckhvbWU=');
@$core.Deprecated('Use addUserHomeServerResponseDescriptor instead')
const AddUserHomeServerResponse$json = const {
  '1': 'AddUserHomeServerResponse',
  '2': const [
    const {'1': 'userHome', '3': 1, '4': 1, '5': 11, '6': '.UserHome', '10': 'userHome'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `AddUserHomeServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addUserHomeServerResponseDescriptor = $convert.base64Decode('ChlBZGRVc2VySG9tZVNlcnZlclJlc3BvbnNlEiUKCHVzZXJIb21lGAEgASgLMgkuVXNlckhvbWVSCHVzZXJIb21lEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use deleteUserHomeServerRequestDescriptor instead')
const DeleteUserHomeServerRequest$json = const {
  '1': 'DeleteUserHomeServerRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteUserHomeServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserHomeServerRequestDescriptor = $convert.base64Decode('ChtEZWxldGVVc2VySG9tZVNlcnZlclJlcXVlc3QSDgoCaWQYASABKAlSAmlk');
@$core.Deprecated('Use deleteUserHomeServerResponseDescriptor instead')
const DeleteUserHomeServerResponse$json = const {
  '1': 'DeleteUserHomeServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `DeleteUserHomeServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserHomeServerResponseDescriptor = $convert.base64Decode('ChxEZWxldGVVc2VySG9tZVNlcnZlclJlc3BvbnNlEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getUnreadServerRequestDescriptor instead')
const GetUnreadServerRequest$json = const {
  '1': 'GetUnreadServerRequest',
};

/// Descriptor for `GetUnreadServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUnreadServerRequestDescriptor = $convert.base64Decode('ChZHZXRVbnJlYWRTZXJ2ZXJSZXF1ZXN0');
@$core.Deprecated('Use getUnreadServerResponseDescriptor instead')
const GetUnreadServerResponse$json = const {
  '1': 'GetUnreadServerResponse',
  '2': const [
    const {'1': 'unread', '3': 1, '4': 1, '5': 4, '10': 'unread'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetUnreadServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUnreadServerResponseDescriptor = $convert.base64Decode('ChdHZXRVbnJlYWRTZXJ2ZXJSZXNwb25zZRIWCgZ1bnJlYWQYASABKARSBnVucmVhZBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use setReadServerRequestDescriptor instead')
const SetReadServerRequest$json = const {
  '1': 'SetReadServerRequest',
};

/// Descriptor for `SetReadServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setReadServerRequestDescriptor = $convert.base64Decode('ChRTZXRSZWFkU2VydmVyUmVxdWVzdA==');
@$core.Deprecated('Use setReadServerResponseDescriptor instead')
const SetReadServerResponse$json = const {
  '1': 'SetReadServerResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `SetReadServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setReadServerResponseDescriptor = $convert.base64Decode('ChVTZXRSZWFkU2VydmVyUmVzcG9uc2USDgoCaWQYASABKAlSAmlkEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getBackgroundsServerRequestDescriptor instead')
const GetBackgroundsServerRequest$json = const {
  '1': 'GetBackgroundsServerRequest',
};

/// Descriptor for `GetBackgroundsServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBackgroundsServerRequestDescriptor = $convert.base64Decode('ChtHZXRCYWNrZ3JvdW5kc1NlcnZlclJlcXVlc3Q=');
@$core.Deprecated('Use getBackgroundsServerResponseDescriptor instead')
const GetBackgroundsServerResponse$json = const {
  '1': 'GetBackgroundsServerResponse',
  '2': const [
    const {'1': 'backgrounds', '3': 1, '4': 3, '5': 11, '6': '.ImageNetwork', '10': 'backgrounds'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetBackgroundsServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBackgroundsServerResponseDescriptor = $convert.base64Decode('ChxHZXRCYWNrZ3JvdW5kc1NlcnZlclJlc3BvbnNlEi8KC2JhY2tncm91bmRzGAEgAygLMg0uSW1hZ2VOZXR3b3JrUgtiYWNrZ3JvdW5kcxIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use getAutoOffsServerRequestDescriptor instead')
const GetAutoOffsServerRequest$json = const {
  '1': 'GetAutoOffsServerRequest',
};

/// Descriptor for `GetAutoOffsServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAutoOffsServerRequestDescriptor = $convert.base64Decode('ChhHZXRBdXRvT2Zmc1NlcnZlclJlcXVlc3Q=');
@$core.Deprecated('Use getAutoOffsServerResponseDescriptor instead')
const GetAutoOffsServerResponse$json = const {
  '1': 'GetAutoOffsServerResponse',
  '2': const [
    const {'1': 'autoOffs', '3': 1, '4': 3, '5': 13, '10': 'autoOffs'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetAutoOffsServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAutoOffsServerResponseDescriptor = $convert.base64Decode('ChlHZXRBdXRvT2Zmc1NlcnZlclJlc3BvbnNlEhoKCGF1dG9PZmZzGAEgAygNUghhdXRvT2ZmcxIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use getTypeDevicesServerRequestDescriptor instead')
const GetTypeDevicesServerRequest$json = const {
  '1': 'GetTypeDevicesServerRequest',
  '2': const [
    const {'1': 'group', '3': 1, '4': 1, '5': 14, '6': '.GroupDevice', '10': 'group'},
  ],
};

/// Descriptor for `GetTypeDevicesServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTypeDevicesServerRequestDescriptor = $convert.base64Decode('ChtHZXRUeXBlRGV2aWNlc1NlcnZlclJlcXVlc3QSIgoFZ3JvdXAYASABKA4yDC5Hcm91cERldmljZVIFZ3JvdXA=');
@$core.Deprecated('Use getTypeDevicesServerResponseDescriptor instead')
const GetTypeDevicesServerResponse$json = const {
  '1': 'GetTypeDevicesServerResponse',
  '2': const [
    const {'1': 'typeDevices', '3': 1, '4': 3, '5': 14, '6': '.TypeDevice', '10': 'typeDevices'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetTypeDevicesServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTypeDevicesServerResponseDescriptor = $convert.base64Decode('ChxHZXRUeXBlRGV2aWNlc1NlcnZlclJlc3BvbnNlEi0KC3R5cGVEZXZpY2VzGAEgAygOMgsuVHlwZURldmljZVILdHlwZURldmljZXMSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use getButtonInfoServerRequestDescriptor instead')
const GetButtonInfoServerRequest$json = const {
  '1': 'GetButtonInfoServerRequest',
  '2': const [
    const {'1': 'buttonId', '3': 1, '4': 1, '5': 9, '10': 'buttonId'},
  ],
};

/// Descriptor for `GetButtonInfoServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getButtonInfoServerRequestDescriptor = $convert.base64Decode('ChpHZXRCdXR0b25JbmZvU2VydmVyUmVxdWVzdBIaCghidXR0b25JZBgBIAEoCVIIYnV0dG9uSWQ=');
@$core.Deprecated('Use getButtonInfoServerResponseDescriptor instead')
const GetButtonInfoServerResponse$json = const {
  '1': 'GetButtonInfoServerResponse',
  '2': const [
    const {'1': 'button', '3': 1, '4': 1, '5': 11, '6': '.Button', '10': 'button'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetButtonInfoServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getButtonInfoServerResponseDescriptor = $convert.base64Decode('ChtHZXRCdXR0b25JbmZvU2VydmVyUmVzcG9uc2USHwoGYnV0dG9uGAEgASgLMgcuQnV0dG9uUgZidXR0b24SLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use updateButtonServerRequestDescriptor instead')
const UpdateButtonServerRequest$json = const {
  '1': 'UpdateButtonServerRequest',
  '2': const [
    const {'1': 'button', '3': 1, '4': 1, '5': 11, '6': '.Button', '10': 'button'},
  ],
};

/// Descriptor for `UpdateButtonServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateButtonServerRequestDescriptor = $convert.base64Decode('ChlVcGRhdGVCdXR0b25TZXJ2ZXJSZXF1ZXN0Eh8KBmJ1dHRvbhgBIAEoCzIHLkJ1dHRvblIGYnV0dG9u');
@$core.Deprecated('Use updateButtonServerResponseDescriptor instead')
const UpdateButtonServerResponse$json = const {
  '1': 'UpdateButtonServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateButtonServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateButtonServerResponseDescriptor = $convert.base64Decode('ChpVcGRhdGVCdXR0b25TZXJ2ZXJSZXNwb25zZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use groupControlServerRequestDescriptor instead')
const GroupControlServerRequest$json = const {
  '1': 'GroupControlServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'state', '3': 2, '4': 1, '5': 11, '6': '.ControlState', '10': 'state'},
  ],
};

/// Descriptor for `GroupControlServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupControlServerRequestDescriptor = $convert.base64Decode('ChlHcm91cENvbnRyb2xTZXJ2ZXJSZXF1ZXN0EhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZBIjCgVzdGF0ZRgCIAEoCzINLkNvbnRyb2xTdGF0ZVIFc3RhdGU=');
@$core.Deprecated('Use groupControlServerResponseDescriptor instead')
const GroupControlServerResponse$json = const {
  '1': 'GroupControlServerResponse',
  '2': const [
    const {'1': 'state', '3': 1, '4': 1, '5': 11, '6': '.ControlState', '10': 'state'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GroupControlServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupControlServerResponseDescriptor = $convert.base64Decode('ChpHcm91cENvbnRyb2xTZXJ2ZXJSZXNwb25zZRIjCgVzdGF0ZRgBIAEoCzINLkNvbnRyb2xTdGF0ZVIFc3RhdGUSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use getGroupControlInfoServerRequestDescriptor instead')
const GetGroupControlInfoServerRequest$json = const {
  '1': 'GetGroupControlInfoServerRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetGroupControlInfoServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGroupControlInfoServerRequestDescriptor = $convert.base64Decode('CiBHZXRHcm91cENvbnRyb2xJbmZvU2VydmVyUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');
@$core.Deprecated('Use getGroupControlInfoServerResponseDescriptor instead')
const GetGroupControlInfoServerResponse$json = const {
  '1': 'GetGroupControlInfoServerResponse',
  '2': const [
    const {'1': 'groupControl', '3': 1, '4': 1, '5': 11, '6': '.GroupControl', '10': 'groupControl'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetGroupControlInfoServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGroupControlInfoServerResponseDescriptor = $convert.base64Decode('CiFHZXRHcm91cENvbnRyb2xJbmZvU2VydmVyUmVzcG9uc2USMQoMZ3JvdXBDb250cm9sGAEgASgLMg0uR3JvdXBDb250cm9sUgxncm91cENvbnRyb2wSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use getControlsServerRequestDescriptor instead')
const GetControlsServerRequest$json = const {
  '1': 'GetControlsServerRequest',
  '2': const [
    const {'1': 'groupControlId', '3': 1, '4': 1, '5': 9, '10': 'groupControlId'},
  ],
};

/// Descriptor for `GetControlsServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getControlsServerRequestDescriptor = $convert.base64Decode('ChhHZXRDb250cm9sc1NlcnZlclJlcXVlc3QSJgoOZ3JvdXBDb250cm9sSWQYASABKAlSDmdyb3VwQ29udHJvbElk');
@$core.Deprecated('Use getControlsServerResponseDescriptor instead')
const GetControlsServerResponse$json = const {
  '1': 'GetControlsServerResponse',
  '2': const [
    const {'1': 'rooms', '3': 1, '4': 3, '5': 11, '6': '.Room', '10': 'rooms'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetControlsServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getControlsServerResponseDescriptor = $convert.base64Decode('ChlHZXRDb250cm9sc1NlcnZlclJlc3BvbnNlEhsKBXJvb21zGAEgAygLMgUuUm9vbVIFcm9vbXMSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use addGroupControlServerRequestDescriptor instead')
const AddGroupControlServerRequest$json = const {
  '1': 'AddGroupControlServerRequest',
  '2': const [
    const {'1': 'groupControl', '3': 1, '4': 1, '5': 11, '6': '.GroupControl', '10': 'groupControl'},
  ],
};

/// Descriptor for `AddGroupControlServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addGroupControlServerRequestDescriptor = $convert.base64Decode('ChxBZGRHcm91cENvbnRyb2xTZXJ2ZXJSZXF1ZXN0EjEKDGdyb3VwQ29udHJvbBgBIAEoCzINLkdyb3VwQ29udHJvbFIMZ3JvdXBDb250cm9s');
@$core.Deprecated('Use addGroupControlServerResponseDescriptor instead')
const AddGroupControlServerResponse$json = const {
  '1': 'AddGroupControlServerResponse',
  '2': const [
    const {'1': 'groupControl', '3': 2, '4': 1, '5': 11, '6': '.GroupControl', '10': 'groupControl'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `AddGroupControlServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addGroupControlServerResponseDescriptor = $convert.base64Decode('Ch1BZGRHcm91cENvbnRyb2xTZXJ2ZXJSZXNwb25zZRIxCgxncm91cENvbnRyb2wYAiABKAsyDS5Hcm91cENvbnRyb2xSDGdyb3VwQ29udHJvbBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use updateGroupControlServerRequestDescriptor instead')
const UpdateGroupControlServerRequest$json = const {
  '1': 'UpdateGroupControlServerRequest',
  '2': const [
    const {'1': 'groupControl', '3': 1, '4': 1, '5': 11, '6': '.GroupControl', '10': 'groupControl'},
  ],
};

/// Descriptor for `UpdateGroupControlServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateGroupControlServerRequestDescriptor = $convert.base64Decode('Ch9VcGRhdGVHcm91cENvbnRyb2xTZXJ2ZXJSZXF1ZXN0EjEKDGdyb3VwQ29udHJvbBgBIAEoCzINLkdyb3VwQ29udHJvbFIMZ3JvdXBDb250cm9s');
@$core.Deprecated('Use updateGroupControlServerResponseDescriptor instead')
const UpdateGroupControlServerResponse$json = const {
  '1': 'UpdateGroupControlServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateGroupControlServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateGroupControlServerResponseDescriptor = $convert.base64Decode('CiBVcGRhdGVHcm91cENvbnRyb2xTZXJ2ZXJSZXNwb25zZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use deleteGroupControlServerRequestDescriptor instead')
const DeleteGroupControlServerRequest$json = const {
  '1': 'DeleteGroupControlServerRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteGroupControlServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteGroupControlServerRequestDescriptor = $convert.base64Decode('Ch9EZWxldGVHcm91cENvbnRyb2xTZXJ2ZXJSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZA==');
@$core.Deprecated('Use deleteGroupControlServerResponseDescriptor instead')
const DeleteGroupControlServerResponse$json = const {
  '1': 'DeleteGroupControlServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `DeleteGroupControlServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteGroupControlServerResponseDescriptor = $convert.base64Decode('CiBEZWxldGVHcm91cENvbnRyb2xTZXJ2ZXJSZXNwb25zZRIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use ledDriverServerRequestDescriptor instead')
const LedDriverServerRequest$json = const {
  '1': 'LedDriverServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'index', '3': 2, '4': 1, '5': 5, '10': 'index'},
    const {'1': 'roomId', '3': 3, '4': 1, '5': 9, '10': 'roomId'},
    const {'1': 'powerState', '3': 4, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'brightnessPercent', '3': 5, '4': 1, '5': 5, '10': 'brightnessPercent'},
    const {'1': 'ledItems', '3': 6, '4': 3, '5': 11, '6': '.LedItem', '10': 'ledItems'},
    const {'1': 'groupControl', '3': 7, '4': 1, '5': 13, '10': 'groupControl'},
  ],
};

/// Descriptor for `LedDriverServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ledDriverServerRequestDescriptor = $convert.base64Decode('ChZMZWREcml2ZXJTZXJ2ZXJSZXF1ZXN0EhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZBIUCgVpbmRleBgCIAEoBVIFaW5kZXgSFgoGcm9vbUlkGAMgASgJUgZyb29tSWQSKwoKcG93ZXJTdGF0ZRgEIAEoDjILLlBvd2VyU3RhdGVSCnBvd2VyU3RhdGUSLAoRYnJpZ2h0bmVzc1BlcmNlbnQYBSABKAVSEWJyaWdodG5lc3NQZXJjZW50EiQKCGxlZEl0ZW1zGAYgAygLMgguTGVkSXRlbVIIbGVkSXRlbXMSIgoMZ3JvdXBDb250cm9sGAcgASgNUgxncm91cENvbnRyb2w=');
@$core.Deprecated('Use ledDriverServerResponseDescriptor instead')
const LedDriverServerResponse$json = const {
  '1': 'LedDriverServerResponse',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'roomId', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    const {'1': 'powerState', '3': 3, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'brightnessPercess', '3': 4, '4': 1, '5': 5, '10': 'brightnessPercess'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `LedDriverServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ledDriverServerResponseDescriptor = $convert.base64Decode('ChdMZWREcml2ZXJTZXJ2ZXJSZXNwb25zZRIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSFgoGcm9vbUlkGAIgASgJUgZyb29tSWQSKwoKcG93ZXJTdGF0ZRgDIAEoDjILLlBvd2VyU3RhdGVSCnBvd2VyU3RhdGUSLAoRYnJpZ2h0bmVzc1BlcmNlc3MYBCABKAVSEWJyaWdodG5lc3NQZXJjZXNzEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use getLedDriverServerRequestDescriptor instead')
const GetLedDriverServerRequest$json = const {
  '1': 'GetLedDriverServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'roomId', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
  ],
};

/// Descriptor for `GetLedDriverServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLedDriverServerRequestDescriptor = $convert.base64Decode('ChlHZXRMZWREcml2ZXJTZXJ2ZXJSZXF1ZXN0EhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZBIWCgZyb29tSWQYAiABKAlSBnJvb21JZA==');
@$core.Deprecated('Use getLedDriverServerResponseDescriptor instead')
const GetLedDriverServerResponse$json = const {
  '1': 'GetLedDriverServerResponse',
  '2': const [
    const {'1': 'ledDriver', '3': 1, '4': 1, '5': 11, '6': '.LedDriver', '10': 'ledDriver'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetLedDriverServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLedDriverServerResponseDescriptor = $convert.base64Decode('ChpHZXRMZWREcml2ZXJTZXJ2ZXJSZXNwb25zZRIoCglsZWREcml2ZXIYASABKAsyCi5MZWREcml2ZXJSCWxlZERyaXZlchIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use getLedDriverItemServerRequestDescriptor instead')
const GetLedDriverItemServerRequest$json = const {
  '1': 'GetLedDriverItemServerRequest',
  '2': const [
    const {'1': 'ledId', '3': 1, '4': 1, '5': 9, '10': 'ledId'},
    const {'1': 'roomId', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
  ],
};

/// Descriptor for `GetLedDriverItemServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLedDriverItemServerRequestDescriptor = $convert.base64Decode('Ch1HZXRMZWREcml2ZXJJdGVtU2VydmVyUmVxdWVzdBIUCgVsZWRJZBgBIAEoCVIFbGVkSWQSFgoGcm9vbUlkGAIgASgJUgZyb29tSWQ=');
@$core.Deprecated('Use getLedDriverItemServerResponseDescriptor instead')
const GetLedDriverItemServerResponse$json = const {
  '1': 'GetLedDriverItemServerResponse',
  '2': const [
    const {'1': 'ledItem', '3': 1, '4': 1, '5': 11, '6': '.LedItem', '10': 'ledItem'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `GetLedDriverItemServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLedDriverItemServerResponseDescriptor = $convert.base64Decode('Ch5HZXRMZWREcml2ZXJJdGVtU2VydmVyUmVzcG9uc2USIgoHbGVkSXRlbRgBIAEoCzIILkxlZEl0ZW1SB2xlZEl0ZW0SLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use updateLedDriverServerRequestDescriptor instead')
const UpdateLedDriverServerRequest$json = const {
  '1': 'UpdateLedDriverServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'roomId', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    const {'1': 'ledDriver', '3': 3, '4': 1, '5': 11, '6': '.LedDriver', '10': 'ledDriver'},
    const {'1': 'brightnessPercent', '3': 4, '4': 1, '5': 5, '10': 'brightnessPercent'},
    const {'1': 'groupControl', '3': 5, '4': 1, '5': 13, '10': 'groupControl'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateLedDriverServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateLedDriverServerRequestDescriptor = $convert.base64Decode('ChxVcGRhdGVMZWREcml2ZXJTZXJ2ZXJSZXF1ZXN0EhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZBIWCgZyb29tSWQYAiABKAlSBnJvb21JZBIoCglsZWREcml2ZXIYAyABKAsyCi5MZWREcml2ZXJSCWxlZERyaXZlchIsChFicmlnaHRuZXNzUGVyY2VudBgEIAEoBVIRYnJpZ2h0bmVzc1BlcmNlbnQSIgoMZ3JvdXBDb250cm9sGAUgASgNUgxncm91cENvbnRyb2wSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use updateLedDriverServerResponseDescriptor instead')
const UpdateLedDriverServerResponse$json = const {
  '1': 'UpdateLedDriverServerResponse',
  '2': const [
    const {'1': 'ledDriver', '3': 1, '4': 1, '5': 11, '6': '.LedDriver', '10': 'ledDriver'},
    const {'1': 'roomId', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateLedDriverServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateLedDriverServerResponseDescriptor = $convert.base64Decode('Ch1VcGRhdGVMZWREcml2ZXJTZXJ2ZXJSZXNwb25zZRIoCglsZWREcml2ZXIYASABKAsyCi5MZWREcml2ZXJSCWxlZERyaXZlchIWCgZyb29tSWQYAiABKAlSBnJvb21JZBIsCgpzdGF0dXNDb2RlGOgHIAEoCzILLlN0YXR1c0NvZGVSCnN0YXR1c0NvZGU=');
@$core.Deprecated('Use updateLedDriverItemServerRequestDescriptor instead')
const UpdateLedDriverItemServerRequest$json = const {
  '1': 'UpdateLedDriverItemServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'roomId', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    const {'1': 'ledItem', '3': 3, '4': 1, '5': 11, '6': '.LedItem', '10': 'ledItem'},
    const {'1': 'brightnessPercent', '3': 4, '4': 1, '5': 5, '10': 'brightnessPercent'},
    const {'1': 'groupControl', '3': 5, '4': 1, '5': 13, '10': 'groupControl'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateLedDriverItemServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateLedDriverItemServerRequestDescriptor = $convert.base64Decode('CiBVcGRhdGVMZWREcml2ZXJJdGVtU2VydmVyUmVxdWVzdBIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSFgoGcm9vbUlkGAIgASgJUgZyb29tSWQSIgoHbGVkSXRlbRgDIAEoCzIILkxlZEl0ZW1SB2xlZEl0ZW0SLAoRYnJpZ2h0bmVzc1BlcmNlbnQYBCABKAVSEWJyaWdodG5lc3NQZXJjZW50EiIKDGdyb3VwQ29udHJvbBgFIAEoDVIMZ3JvdXBDb250cm9sEiwKCnN0YXR1c0NvZGUY6AcgASgLMgsuU3RhdHVzQ29kZVIKc3RhdHVzQ29kZQ==');
@$core.Deprecated('Use updateLedDriverItemServerResponseDescriptor instead')
const UpdateLedDriverItemServerResponse$json = const {
  '1': 'UpdateLedDriverItemServerResponse',
  '2': const [
    const {'1': 'ledItem', '3': 1, '4': 1, '5': 11, '6': '.LedItem', '10': 'ledItem'},
    const {'1': 'roomId', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `UpdateLedDriverItemServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateLedDriverItemServerResponseDescriptor = $convert.base64Decode('CiFVcGRhdGVMZWREcml2ZXJJdGVtU2VydmVyUmVzcG9uc2USIgoHbGVkSXRlbRgBIAEoCzIILkxlZEl0ZW1SB2xlZEl0ZW0SFgoGcm9vbUlkGAIgASgJUgZyb29tSWQSLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use touchPanelChangeComponentServerRequestDescriptor instead')
const TouchPanelChangeComponentServerRequest$json = const {
  '1': 'TouchPanelChangeComponentServerRequest',
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

/// Descriptor for `TouchPanelChangeComponentServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelChangeComponentServerRequestDescriptor = $convert.base64Decode('CiZUb3VjaFBhbmVsQ2hhbmdlQ29tcG9uZW50U2VydmVyUmVxdWVzdBIiCgx0b3VjaFBhbmVsSWQYASABKAlSDHRvdWNoUGFuZWxJZBIgCgtjb21wb25lbnRJZBgCIAEoCVILY29tcG9uZW50SWQSFAoFaW5kZXgYAyABKA1SBWluZGV4EiwKBHR5cGUYBCABKA4yGC5Ub3VjaFBhbmVsQ29tcG9uZW50VHlwZVIEdHlwZRIcCglhY3RpdmVNYXAYBSABKA1SCWFjdGl2ZU1hcBISCgRuYW1lGAYgASgJUgRuYW1lEhIKBG1vZGUYByABKA1SBG1vZGU=');
@$core.Deprecated('Use touchPanelControlSwitcherServerRequestDescriptor instead')
const TouchPanelControlSwitcherServerRequest$json = const {
  '1': 'TouchPanelControlSwitcherServerRequest',
  '2': const [
    const {'1': 'touchPanelId', '3': 1, '4': 1, '5': 9, '10': 'touchPanelId'},
    const {'1': 'switcherId', '3': 2, '4': 1, '5': 9, '10': 'switcherId'},
    const {'1': 'switcher', '3': 3, '4': 1, '5': 13, '10': 'switcher'},
    const {'1': 'powerState', '3': 4, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
  ],
};

/// Descriptor for `TouchPanelControlSwitcherServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelControlSwitcherServerRequestDescriptor = $convert.base64Decode('CiZUb3VjaFBhbmVsQ29udHJvbFN3aXRjaGVyU2VydmVyUmVxdWVzdBIiCgx0b3VjaFBhbmVsSWQYASABKAlSDHRvdWNoUGFuZWxJZBIeCgpzd2l0Y2hlcklkGAIgASgJUgpzd2l0Y2hlcklkEhoKCHN3aXRjaGVyGAMgASgNUghzd2l0Y2hlchIrCgpwb3dlclN0YXRlGAQgASgOMgsuUG93ZXJTdGF0ZVIKcG93ZXJTdGF0ZQ==');
@$core.Deprecated('Use touchPanelUpdateSwitcherServerRequestDescriptor instead')
const TouchPanelUpdateSwitcherServerRequest$json = const {
  '1': 'TouchPanelUpdateSwitcherServerRequest',
  '2': const [
    const {'1': 'touchPanelId', '3': 1, '4': 1, '5': 9, '10': 'touchPanelId'},
    const {'1': 'switcherId', '3': 2, '4': 1, '5': 9, '10': 'switcherId'},
    const {'1': 'index', '3': 3, '4': 1, '5': 13, '10': 'index'},
    const {'1': 'activeMap', '3': 4, '4': 1, '5': 13, '10': 'activeMap'},
    const {'1': 'name', '3': 5, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'connectionState', '3': 6, '4': 1, '5': 14, '6': '.ConnectionState', '10': 'connectionState'},
  ],
};

/// Descriptor for `TouchPanelUpdateSwitcherServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelUpdateSwitcherServerRequestDescriptor = $convert.base64Decode('CiVUb3VjaFBhbmVsVXBkYXRlU3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0EiIKDHRvdWNoUGFuZWxJZBgBIAEoCVIMdG91Y2hQYW5lbElkEh4KCnN3aXRjaGVySWQYAiABKAlSCnN3aXRjaGVySWQSFAoFaW5kZXgYAyABKA1SBWluZGV4EhwKCWFjdGl2ZU1hcBgEIAEoDVIJYWN0aXZlTWFwEhIKBG5hbWUYBSABKAlSBG5hbWUSOgoPY29ubmVjdGlvblN0YXRlGAYgASgOMhAuQ29ubmVjdGlvblN0YXRlUg9jb25uZWN0aW9uU3RhdGU=');
@$core.Deprecated('Use touchPanelControlCurtainSwitcherServerRequestDescriptor instead')
const TouchPanelControlCurtainSwitcherServerRequest$json = const {
  '1': 'TouchPanelControlCurtainSwitcherServerRequest',
  '2': const [
    const {'1': 'touchPanelId', '3': 1, '4': 1, '5': 9, '10': 'touchPanelId'},
    const {'1': 'curtainSwitcherId', '3': 2, '4': 1, '5': 9, '10': 'curtainSwitcherId'},
    const {'1': 'percentIn', '3': 3, '4': 1, '5': 13, '10': 'percentIn'},
    const {'1': 'percentOut', '3': 4, '4': 1, '5': 13, '10': 'percentOut'},
  ],
};

/// Descriptor for `TouchPanelControlCurtainSwitcherServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelControlCurtainSwitcherServerRequestDescriptor = $convert.base64Decode('Ci1Ub3VjaFBhbmVsQ29udHJvbEN1cnRhaW5Td2l0Y2hlclNlcnZlclJlcXVlc3QSIgoMdG91Y2hQYW5lbElkGAEgASgJUgx0b3VjaFBhbmVsSWQSLAoRY3VydGFpblN3aXRjaGVySWQYAiABKAlSEWN1cnRhaW5Td2l0Y2hlcklkEhwKCXBlcmNlbnRJbhgDIAEoDVIJcGVyY2VudEluEh4KCnBlcmNlbnRPdXQYBCABKA1SCnBlcmNlbnRPdXQ=');
@$core.Deprecated('Use touchPanelUpdateCurtainSwitcherServerRequestDescriptor instead')
const TouchPanelUpdateCurtainSwitcherServerRequest$json = const {
  '1': 'TouchPanelUpdateCurtainSwitcherServerRequest',
  '2': const [
    const {'1': 'touchPanelId', '3': 1, '4': 1, '5': 9, '10': 'touchPanelId'},
    const {'1': 'curtainSwitcherId', '3': 2, '4': 1, '5': 9, '10': 'curtainSwitcherId'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'connectionState', '3': 4, '4': 1, '5': 14, '6': '.ConnectionState', '10': 'connectionState'},
  ],
};

/// Descriptor for `TouchPanelUpdateCurtainSwitcherServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelUpdateCurtainSwitcherServerRequestDescriptor = $convert.base64Decode('CixUb3VjaFBhbmVsVXBkYXRlQ3VydGFpblN3aXRjaGVyU2VydmVyUmVxdWVzdBIiCgx0b3VjaFBhbmVsSWQYASABKAlSDHRvdWNoUGFuZWxJZBIsChFjdXJ0YWluU3dpdGNoZXJJZBgCIAEoCVIRY3VydGFpblN3aXRjaGVySWQSEgoEbmFtZRgDIAEoCVIEbmFtZRI6Cg9jb25uZWN0aW9uU3RhdGUYBCABKA4yEC5Db25uZWN0aW9uU3RhdGVSD2Nvbm5lY3Rpb25TdGF0ZQ==');
@$core.Deprecated('Use touchPanelUpdateSceneServerRequestDescriptor instead')
const TouchPanelUpdateSceneServerRequest$json = const {
  '1': 'TouchPanelUpdateSceneServerRequest',
  '2': const [
    const {'1': 'touchPanelId', '3': 1, '4': 1, '5': 9, '10': 'touchPanelId'},
    const {'1': 'sceneId', '3': 2, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `TouchPanelUpdateSceneServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelUpdateSceneServerRequestDescriptor = $convert.base64Decode('CiJUb3VjaFBhbmVsVXBkYXRlU2NlbmVTZXJ2ZXJSZXF1ZXN0EiIKDHRvdWNoUGFuZWxJZBgBIAEoCVIMdG91Y2hQYW5lbElkEhgKB3NjZW5lSWQYAiABKAlSB3NjZW5lSWQSEgoEbmFtZRgDIAEoCVIEbmFtZQ==');
@$core.Deprecated('Use touchPanelControlLedDriverServerRequestDescriptor instead')
const TouchPanelControlLedDriverServerRequest$json = const {
  '1': 'TouchPanelControlLedDriverServerRequest',
  '2': const [
    const {'1': 'touchPanelId', '3': 1, '4': 1, '5': 9, '10': 'touchPanelId'},
    const {'1': 'ledDriverId', '3': 2, '4': 1, '5': 9, '10': 'ledDriverId'},
    const {'1': 'powerState', '3': 3, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'brightnessPercent', '3': 4, '4': 1, '5': 5, '10': 'brightnessPercent'},
  ],
};

/// Descriptor for `TouchPanelControlLedDriverServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelControlLedDriverServerRequestDescriptor = $convert.base64Decode('CidUb3VjaFBhbmVsQ29udHJvbExlZERyaXZlclNlcnZlclJlcXVlc3QSIgoMdG91Y2hQYW5lbElkGAEgASgJUgx0b3VjaFBhbmVsSWQSIAoLbGVkRHJpdmVySWQYAiABKAlSC2xlZERyaXZlcklkEisKCnBvd2VyU3RhdGUYAyABKA4yCy5Qb3dlclN0YXRlUgpwb3dlclN0YXRlEiwKEWJyaWdodG5lc3NQZXJjZW50GAQgASgFUhFicmlnaHRuZXNzUGVyY2VudA==');
@$core.Deprecated('Use touchPanelUpdateLedDriverServerRequestDescriptor instead')
const TouchPanelUpdateLedDriverServerRequest$json = const {
  '1': 'TouchPanelUpdateLedDriverServerRequest',
  '2': const [
    const {'1': 'touchPanelId', '3': 1, '4': 1, '5': 9, '10': 'touchPanelId'},
    const {'1': 'ledDriverId', '3': 2, '4': 1, '5': 9, '10': 'ledDriverId'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'connectionState', '3': 4, '4': 1, '5': 14, '6': '.ConnectionState', '10': 'connectionState'},
  ],
};

/// Descriptor for `TouchPanelUpdateLedDriverServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelUpdateLedDriverServerRequestDescriptor = $convert.base64Decode('CiZUb3VjaFBhbmVsVXBkYXRlTGVkRHJpdmVyU2VydmVyUmVxdWVzdBIiCgx0b3VjaFBhbmVsSWQYASABKAlSDHRvdWNoUGFuZWxJZBIgCgtsZWREcml2ZXJJZBgCIAEoCVILbGVkRHJpdmVySWQSEgoEbmFtZRgDIAEoCVIEbmFtZRI6Cg9jb25uZWN0aW9uU3RhdGUYBCABKA4yEC5Db25uZWN0aW9uU3RhdGVSD2Nvbm5lY3Rpb25TdGF0ZQ==');
@$core.Deprecated('Use curtainServerRequestDescriptor instead')
const CurtainServerRequest$json = const {
  '1': 'CurtainServerRequest',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'percent', '3': 2, '4': 1, '5': 13, '10': 'percent'},
    const {'1': 'controlState', '3': 3, '4': 1, '5': 14, '6': '.CurtainControlState', '10': 'controlState'},
  ],
};

/// Descriptor for `CurtainServerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List curtainServerRequestDescriptor = $convert.base64Decode('ChRDdXJ0YWluU2VydmVyUmVxdWVzdBIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSGAoHcGVyY2VudBgCIAEoDVIHcGVyY2VudBI4Cgxjb250cm9sU3RhdGUYAyABKA4yFC5DdXJ0YWluQ29udHJvbFN0YXRlUgxjb250cm9sU3RhdGU=');
@$core.Deprecated('Use curtainServerResponseDescriptor instead')
const CurtainServerResponse$json = const {
  '1': 'CurtainServerResponse',
  '2': const [
    const {'1': 'statusCode', '3': 1000, '4': 1, '5': 11, '6': '.StatusCode', '10': 'statusCode'},
  ],
};

/// Descriptor for `CurtainServerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List curtainServerResponseDescriptor = $convert.base64Decode('ChVDdXJ0YWluU2VydmVyUmVzcG9uc2USLAoKc3RhdHVzQ29kZRjoByABKAsyCy5TdGF0dXNDb2RlUgpzdGF0dXNDb2Rl');
@$core.Deprecated('Use authServerMessageDescriptor instead')
const AuthServerMessage$json = const {
  '1': 'AuthServerMessage',
  '2': const [
    const {'1': 'loginServerRequest', '3': 1, '4': 1, '5': 11, '6': '.LoginServerRequest', '10': 'loginServerRequest'},
    const {'1': 'loginServerResponse', '3': 2, '4': 1, '5': 11, '6': '.LoginServerResponse', '10': 'loginServerResponse'},
    const {'1': 'refreshTokenServerRequest', '3': 3, '4': 1, '5': 11, '6': '.RefreshTokenServerRequest', '10': 'refreshTokenServerRequest'},
    const {'1': 'refreshTokenServerResponse', '3': 4, '4': 1, '5': 11, '6': '.RefreshTokenServerResponse', '10': 'refreshTokenServerResponse'},
    const {'1': 'sendCodeServerRequest', '3': 5, '4': 1, '5': 11, '6': '.SendCodeServerRequest', '10': 'sendCodeServerRequest'},
    const {'1': 'sendCodeServerResponse', '3': 6, '4': 1, '5': 11, '6': '.SendCodeServerResponse', '10': 'sendCodeServerResponse'},
    const {'1': 'verifyCodeServerRequest', '3': 7, '4': 1, '5': 11, '6': '.VerifyCodeServerRequest', '10': 'verifyCodeServerRequest'},
    const {'1': 'verifyCodeServerResponse', '3': 8, '4': 1, '5': 11, '6': '.VerifyCodeServerResponse', '10': 'verifyCodeServerResponse'},
  ],
};

/// Descriptor for `AuthServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authServerMessageDescriptor = $convert.base64Decode('ChFBdXRoU2VydmVyTWVzc2FnZRJDChJsb2dpblNlcnZlclJlcXVlc3QYASABKAsyEy5Mb2dpblNlcnZlclJlcXVlc3RSEmxvZ2luU2VydmVyUmVxdWVzdBJGChNsb2dpblNlcnZlclJlc3BvbnNlGAIgASgLMhQuTG9naW5TZXJ2ZXJSZXNwb25zZVITbG9naW5TZXJ2ZXJSZXNwb25zZRJYChlyZWZyZXNoVG9rZW5TZXJ2ZXJSZXF1ZXN0GAMgASgLMhouUmVmcmVzaFRva2VuU2VydmVyUmVxdWVzdFIZcmVmcmVzaFRva2VuU2VydmVyUmVxdWVzdBJbChpyZWZyZXNoVG9rZW5TZXJ2ZXJSZXNwb25zZRgEIAEoCzIbLlJlZnJlc2hUb2tlblNlcnZlclJlc3BvbnNlUhpyZWZyZXNoVG9rZW5TZXJ2ZXJSZXNwb25zZRJMChVzZW5kQ29kZVNlcnZlclJlcXVlc3QYBSABKAsyFi5TZW5kQ29kZVNlcnZlclJlcXVlc3RSFXNlbmRDb2RlU2VydmVyUmVxdWVzdBJPChZzZW5kQ29kZVNlcnZlclJlc3BvbnNlGAYgASgLMhcuU2VuZENvZGVTZXJ2ZXJSZXNwb25zZVIWc2VuZENvZGVTZXJ2ZXJSZXNwb25zZRJSChd2ZXJpZnlDb2RlU2VydmVyUmVxdWVzdBgHIAEoCzIYLlZlcmlmeUNvZGVTZXJ2ZXJSZXF1ZXN0Uhd2ZXJpZnlDb2RlU2VydmVyUmVxdWVzdBJVChh2ZXJpZnlDb2RlU2VydmVyUmVzcG9uc2UYCCABKAsyGS5WZXJpZnlDb2RlU2VydmVyUmVzcG9uc2VSGHZlcmlmeUNvZGVTZXJ2ZXJSZXNwb25zZQ==');
@$core.Deprecated('Use userServerMessageDescriptor instead')
const UserServerMessage$json = const {
  '1': 'UserServerMessage',
  '2': const [
    const {'1': 'getUserInfoServerRequest', '3': 1, '4': 1, '5': 11, '6': '.GetUserInfoServerRequest', '10': 'getUserInfoServerRequest'},
    const {'1': 'getUserInfoServerResponse', '3': 2, '4': 1, '5': 11, '6': '.GetUserInfoServerResponse', '10': 'getUserInfoServerResponse'},
    const {'1': 'updateUserInfoServerRequest', '3': 3, '4': 1, '5': 11, '6': '.UpdateUserInfoServerRequest', '10': 'updateUserInfoServerRequest'},
    const {'1': 'updateUserInfoServerResponse', '3': 4, '4': 1, '5': 11, '6': '.UpdateUserInfoServerResponse', '10': 'updateUserInfoServerResponse'},
    const {'1': 'setOnesignalForUserServerRequest', '3': 5, '4': 1, '5': 11, '6': '.SetOnesignalForUserServerRequest', '10': 'setOnesignalForUserServerRequest'},
    const {'1': 'setOnesignalForUserServerResponse', '3': 6, '4': 1, '5': 11, '6': '.SetOnesignalForUserServerResponse', '10': 'setOnesignalForUserServerResponse'},
    const {'1': 'changedHomeForUserServerRequest', '3': 7, '4': 1, '5': 11, '6': '.ChangedHomeForUserServerRequest', '10': 'changedHomeForUserServerRequest'},
    const {'1': 'changedHomeForUserServerResponse', '3': 8, '4': 1, '5': 11, '6': '.ChangedHomeForUserServerResponse', '10': 'changedHomeForUserServerResponse'},
    const {'1': 'getUsersServerRequest', '3': 9, '4': 1, '5': 11, '6': '.GetUsersServerRequest', '10': 'getUsersServerRequest'},
    const {'1': 'getUsersServerResponse', '3': 10, '4': 1, '5': 11, '6': '.GetUsersServerResponse', '10': 'getUsersServerResponse'},
    const {'1': 'searchUserServerRequest', '3': 11, '4': 1, '5': 11, '6': '.SearchUserServerRequest', '10': 'searchUserServerRequest'},
    const {'1': 'searchUserServerResponse', '3': 12, '4': 1, '5': 11, '6': '.SearchUserServerResponse', '10': 'searchUserServerResponse'},
    const {'1': 'AvatarUploadServerRequest', '3': 13, '4': 1, '5': 11, '6': '.AvatarUploadServerRequest', '10': 'AvatarUploadServerRequest'},
    const {'1': 'AvatarUploadServerResponse', '3': 14, '4': 1, '5': 11, '6': '.AvatarUploadServerResponse', '10': 'AvatarUploadServerResponse'},
    const {'1': 'getUserOtpServerRequest', '3': 15, '4': 1, '5': 11, '6': '.GetUserOtpServerRequest', '10': 'getUserOtpServerRequest'},
    const {'1': 'getUserOtpServerResponse', '3': 16, '4': 1, '5': 11, '6': '.GetUserOtpServerResponse', '10': 'getUserOtpServerResponse'},
  ],
};

/// Descriptor for `UserServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userServerMessageDescriptor = $convert.base64Decode('ChFVc2VyU2VydmVyTWVzc2FnZRJVChhnZXRVc2VySW5mb1NlcnZlclJlcXVlc3QYASABKAsyGS5HZXRVc2VySW5mb1NlcnZlclJlcXVlc3RSGGdldFVzZXJJbmZvU2VydmVyUmVxdWVzdBJYChlnZXRVc2VySW5mb1NlcnZlclJlc3BvbnNlGAIgASgLMhouR2V0VXNlckluZm9TZXJ2ZXJSZXNwb25zZVIZZ2V0VXNlckluZm9TZXJ2ZXJSZXNwb25zZRJeCht1cGRhdGVVc2VySW5mb1NlcnZlclJlcXVlc3QYAyABKAsyHC5VcGRhdGVVc2VySW5mb1NlcnZlclJlcXVlc3RSG3VwZGF0ZVVzZXJJbmZvU2VydmVyUmVxdWVzdBJhChx1cGRhdGVVc2VySW5mb1NlcnZlclJlc3BvbnNlGAQgASgLMh0uVXBkYXRlVXNlckluZm9TZXJ2ZXJSZXNwb25zZVIcdXBkYXRlVXNlckluZm9TZXJ2ZXJSZXNwb25zZRJtCiBzZXRPbmVzaWduYWxGb3JVc2VyU2VydmVyUmVxdWVzdBgFIAEoCzIhLlNldE9uZXNpZ25hbEZvclVzZXJTZXJ2ZXJSZXF1ZXN0UiBzZXRPbmVzaWduYWxGb3JVc2VyU2VydmVyUmVxdWVzdBJwCiFzZXRPbmVzaWduYWxGb3JVc2VyU2VydmVyUmVzcG9uc2UYBiABKAsyIi5TZXRPbmVzaWduYWxGb3JVc2VyU2VydmVyUmVzcG9uc2VSIXNldE9uZXNpZ25hbEZvclVzZXJTZXJ2ZXJSZXNwb25zZRJqCh9jaGFuZ2VkSG9tZUZvclVzZXJTZXJ2ZXJSZXF1ZXN0GAcgASgLMiAuQ2hhbmdlZEhvbWVGb3JVc2VyU2VydmVyUmVxdWVzdFIfY2hhbmdlZEhvbWVGb3JVc2VyU2VydmVyUmVxdWVzdBJtCiBjaGFuZ2VkSG9tZUZvclVzZXJTZXJ2ZXJSZXNwb25zZRgIIAEoCzIhLkNoYW5nZWRIb21lRm9yVXNlclNlcnZlclJlc3BvbnNlUiBjaGFuZ2VkSG9tZUZvclVzZXJTZXJ2ZXJSZXNwb25zZRJMChVnZXRVc2Vyc1NlcnZlclJlcXVlc3QYCSABKAsyFi5HZXRVc2Vyc1NlcnZlclJlcXVlc3RSFWdldFVzZXJzU2VydmVyUmVxdWVzdBJPChZnZXRVc2Vyc1NlcnZlclJlc3BvbnNlGAogASgLMhcuR2V0VXNlcnNTZXJ2ZXJSZXNwb25zZVIWZ2V0VXNlcnNTZXJ2ZXJSZXNwb25zZRJSChdzZWFyY2hVc2VyU2VydmVyUmVxdWVzdBgLIAEoCzIYLlNlYXJjaFVzZXJTZXJ2ZXJSZXF1ZXN0UhdzZWFyY2hVc2VyU2VydmVyUmVxdWVzdBJVChhzZWFyY2hVc2VyU2VydmVyUmVzcG9uc2UYDCABKAsyGS5TZWFyY2hVc2VyU2VydmVyUmVzcG9uc2VSGHNlYXJjaFVzZXJTZXJ2ZXJSZXNwb25zZRJYChlBdmF0YXJVcGxvYWRTZXJ2ZXJSZXF1ZXN0GA0gASgLMhouQXZhdGFyVXBsb2FkU2VydmVyUmVxdWVzdFIZQXZhdGFyVXBsb2FkU2VydmVyUmVxdWVzdBJbChpBdmF0YXJVcGxvYWRTZXJ2ZXJSZXNwb25zZRgOIAEoCzIbLkF2YXRhclVwbG9hZFNlcnZlclJlc3BvbnNlUhpBdmF0YXJVcGxvYWRTZXJ2ZXJSZXNwb25zZRJSChdnZXRVc2VyT3RwU2VydmVyUmVxdWVzdBgPIAEoCzIYLkdldFVzZXJPdHBTZXJ2ZXJSZXF1ZXN0UhdnZXRVc2VyT3RwU2VydmVyUmVxdWVzdBJVChhnZXRVc2VyT3RwU2VydmVyUmVzcG9uc2UYECABKAsyGS5HZXRVc2VyT3RwU2VydmVyUmVzcG9uc2VSGGdldFVzZXJPdHBTZXJ2ZXJSZXNwb25zZQ==');
@$core.Deprecated('Use homeServerMessageDescriptor instead')
const HomeServerMessage$json = const {
  '1': 'HomeServerMessage',
  '2': const [
    const {'1': 'getHomesServerRequest', '3': 1, '4': 1, '5': 11, '6': '.GetHomesServerRequest', '10': 'getHomesServerRequest'},
    const {'1': 'getHomesServerResponse', '3': 2, '4': 1, '5': 11, '6': '.GetHomesServerResponse', '10': 'getHomesServerResponse'},
    const {'1': 'addHomeServerRequest', '3': 3, '4': 1, '5': 11, '6': '.AddHomeServerRequest', '10': 'addHomeServerRequest'},
    const {'1': 'addHomeServerResponse', '3': 4, '4': 1, '5': 11, '6': '.AddHomeServerResponse', '10': 'addHomeServerResponse'},
    const {'1': 'updateHomeServerRequest', '3': 5, '4': 1, '5': 11, '6': '.UpdateHomeServerRequest', '10': 'updateHomeServerRequest'},
    const {'1': 'updateHomeServerResponse', '3': 6, '4': 1, '5': 11, '6': '.UpdateHomeServerResponse', '10': 'updateHomeServerResponse'},
    const {'1': 'deleteHomeServerRequest', '3': 7, '4': 1, '5': 11, '6': '.DeleteHomeServerRequest', '10': 'deleteHomeServerRequest'},
    const {'1': 'deleteHomeServerResponse', '3': 8, '4': 1, '5': 11, '6': '.DeleteHomeServerResponse', '10': 'deleteHomeServerResponse'},
    const {'1': 'getCitizenInfoServerRequest', '3': 9, '4': 1, '5': 11, '6': '.GetCitizenInfoServerRequest', '10': 'getCitizenInfoServerRequest'},
    const {'1': 'getCitizenInfoServerResponse', '3': 10, '4': 1, '5': 11, '6': '.GetCitizenInfoServerResponse', '10': 'getCitizenInfoServerResponse'},
    const {'1': 'setCitizenServerRequest', '3': 11, '4': 1, '5': 11, '6': '.SetCitizenServerRequest', '10': 'setCitizenServerRequest'},
    const {'1': 'setCitizenServerResponse', '3': 12, '4': 1, '5': 11, '6': '.SetCitizenServerResponse', '10': 'setCitizenServerResponse'},
    const {'1': 'setGpsForHomeServerRequest', '3': 13, '4': 1, '5': 11, '6': '.SetGpsForHomeServerRequest', '10': 'setGpsForHomeServerRequest'},
    const {'1': 'setGpsForHomeServerResponse', '3': 14, '4': 1, '5': 11, '6': '.SetGpsForHomeServerResponse', '10': 'setGpsForHomeServerResponse'},
    const {'1': 'getHomeInfoServerRequest', '3': 15, '4': 1, '5': 11, '6': '.GetHomeInfoServerRequest', '10': 'getHomeInfoServerRequest'},
    const {'1': 'getHomeInfoServerResponse', '3': 16, '4': 1, '5': 11, '6': '.GetHomeInfoServerResponse', '10': 'getHomeInfoServerResponse'},
    const {'1': 'getHomesByPhoneServerRequest', '3': 17, '4': 1, '5': 11, '6': '.GetHomesByPhoneServerRequest', '10': 'getHomesByPhoneServerRequest'},
    const {'1': 'getHomesByPhoneServerResponse', '3': 18, '4': 1, '5': 11, '6': '.GetHomesByPhoneServerResponse', '10': 'getHomesByPhoneServerResponse'},
    const {'1': 'uploadhomeBackgroundServerRequest', '3': 19, '4': 1, '5': 11, '6': '.UploadHomeBackgroundServerRequest', '10': 'uploadhomeBackgroundServerRequest'},
    const {'1': 'uploadHomeBackgroundServerResponse', '3': 20, '4': 1, '5': 11, '6': '.UploadHomeBackgroundServerResponse', '10': 'uploadHomeBackgroundServerResponse'},
  ],
};

/// Descriptor for `HomeServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List homeServerMessageDescriptor = $convert.base64Decode('ChFIb21lU2VydmVyTWVzc2FnZRJMChVnZXRIb21lc1NlcnZlclJlcXVlc3QYASABKAsyFi5HZXRIb21lc1NlcnZlclJlcXVlc3RSFWdldEhvbWVzU2VydmVyUmVxdWVzdBJPChZnZXRIb21lc1NlcnZlclJlc3BvbnNlGAIgASgLMhcuR2V0SG9tZXNTZXJ2ZXJSZXNwb25zZVIWZ2V0SG9tZXNTZXJ2ZXJSZXNwb25zZRJJChRhZGRIb21lU2VydmVyUmVxdWVzdBgDIAEoCzIVLkFkZEhvbWVTZXJ2ZXJSZXF1ZXN0UhRhZGRIb21lU2VydmVyUmVxdWVzdBJMChVhZGRIb21lU2VydmVyUmVzcG9uc2UYBCABKAsyFi5BZGRIb21lU2VydmVyUmVzcG9uc2VSFWFkZEhvbWVTZXJ2ZXJSZXNwb25zZRJSChd1cGRhdGVIb21lU2VydmVyUmVxdWVzdBgFIAEoCzIYLlVwZGF0ZUhvbWVTZXJ2ZXJSZXF1ZXN0Uhd1cGRhdGVIb21lU2VydmVyUmVxdWVzdBJVChh1cGRhdGVIb21lU2VydmVyUmVzcG9uc2UYBiABKAsyGS5VcGRhdGVIb21lU2VydmVyUmVzcG9uc2VSGHVwZGF0ZUhvbWVTZXJ2ZXJSZXNwb25zZRJSChdkZWxldGVIb21lU2VydmVyUmVxdWVzdBgHIAEoCzIYLkRlbGV0ZUhvbWVTZXJ2ZXJSZXF1ZXN0UhdkZWxldGVIb21lU2VydmVyUmVxdWVzdBJVChhkZWxldGVIb21lU2VydmVyUmVzcG9uc2UYCCABKAsyGS5EZWxldGVIb21lU2VydmVyUmVzcG9uc2VSGGRlbGV0ZUhvbWVTZXJ2ZXJSZXNwb25zZRJeChtnZXRDaXRpemVuSW5mb1NlcnZlclJlcXVlc3QYCSABKAsyHC5HZXRDaXRpemVuSW5mb1NlcnZlclJlcXVlc3RSG2dldENpdGl6ZW5JbmZvU2VydmVyUmVxdWVzdBJhChxnZXRDaXRpemVuSW5mb1NlcnZlclJlc3BvbnNlGAogASgLMh0uR2V0Q2l0aXplbkluZm9TZXJ2ZXJSZXNwb25zZVIcZ2V0Q2l0aXplbkluZm9TZXJ2ZXJSZXNwb25zZRJSChdzZXRDaXRpemVuU2VydmVyUmVxdWVzdBgLIAEoCzIYLlNldENpdGl6ZW5TZXJ2ZXJSZXF1ZXN0UhdzZXRDaXRpemVuU2VydmVyUmVxdWVzdBJVChhzZXRDaXRpemVuU2VydmVyUmVzcG9uc2UYDCABKAsyGS5TZXRDaXRpemVuU2VydmVyUmVzcG9uc2VSGHNldENpdGl6ZW5TZXJ2ZXJSZXNwb25zZRJbChpzZXRHcHNGb3JIb21lU2VydmVyUmVxdWVzdBgNIAEoCzIbLlNldEdwc0ZvckhvbWVTZXJ2ZXJSZXF1ZXN0UhpzZXRHcHNGb3JIb21lU2VydmVyUmVxdWVzdBJeChtzZXRHcHNGb3JIb21lU2VydmVyUmVzcG9uc2UYDiABKAsyHC5TZXRHcHNGb3JIb21lU2VydmVyUmVzcG9uc2VSG3NldEdwc0ZvckhvbWVTZXJ2ZXJSZXNwb25zZRJVChhnZXRIb21lSW5mb1NlcnZlclJlcXVlc3QYDyABKAsyGS5HZXRIb21lSW5mb1NlcnZlclJlcXVlc3RSGGdldEhvbWVJbmZvU2VydmVyUmVxdWVzdBJYChlnZXRIb21lSW5mb1NlcnZlclJlc3BvbnNlGBAgASgLMhouR2V0SG9tZUluZm9TZXJ2ZXJSZXNwb25zZVIZZ2V0SG9tZUluZm9TZXJ2ZXJSZXNwb25zZRJhChxnZXRIb21lc0J5UGhvbmVTZXJ2ZXJSZXF1ZXN0GBEgASgLMh0uR2V0SG9tZXNCeVBob25lU2VydmVyUmVxdWVzdFIcZ2V0SG9tZXNCeVBob25lU2VydmVyUmVxdWVzdBJkCh1nZXRIb21lc0J5UGhvbmVTZXJ2ZXJSZXNwb25zZRgSIAEoCzIeLkdldEhvbWVzQnlQaG9uZVNlcnZlclJlc3BvbnNlUh1nZXRIb21lc0J5UGhvbmVTZXJ2ZXJSZXNwb25zZRJwCiF1cGxvYWRob21lQmFja2dyb3VuZFNlcnZlclJlcXVlc3QYEyABKAsyIi5VcGxvYWRIb21lQmFja2dyb3VuZFNlcnZlclJlcXVlc3RSIXVwbG9hZGhvbWVCYWNrZ3JvdW5kU2VydmVyUmVxdWVzdBJzCiJ1cGxvYWRIb21lQmFja2dyb3VuZFNlcnZlclJlc3BvbnNlGBQgASgLMiMuVXBsb2FkSG9tZUJhY2tncm91bmRTZXJ2ZXJSZXNwb25zZVIidXBsb2FkSG9tZUJhY2tncm91bmRTZXJ2ZXJSZXNwb25zZQ==');
@$core.Deprecated('Use roomServerMessageDescriptor instead')
const RoomServerMessage$json = const {
  '1': 'RoomServerMessage',
  '2': const [
    const {'1': 'getRoomsServerRequest', '3': 1, '4': 1, '5': 11, '6': '.GetRoomsServerRequest', '10': 'getRoomsServerRequest'},
    const {'1': 'getRoomsServerResponse', '3': 2, '4': 1, '5': 11, '6': '.GetRoomsServerResponse', '10': 'getRoomsServerResponse'},
    const {'1': 'addRoomServerRequest', '3': 3, '4': 1, '5': 11, '6': '.AddRoomServerRequest', '10': 'addRoomServerRequest'},
    const {'1': 'addRoomServerResponse', '3': 4, '4': 1, '5': 11, '6': '.AddRoomServerResponse', '10': 'addRoomServerResponse'},
    const {'1': 'deleteRoomServerRequest', '3': 5, '4': 1, '5': 11, '6': '.DeleteRoomServerRequest', '10': 'deleteRoomServerRequest'},
    const {'1': 'deleteRoomServerResponse', '3': 6, '4': 1, '5': 11, '6': '.DeleteRoomServerResponse', '10': 'deleteRoomServerResponse'},
    const {'1': 'updateRoomServerRequest', '3': 7, '4': 1, '5': 11, '6': '.UpdateRoomServerRequest', '10': 'updateRoomServerRequest'},
    const {'1': 'updateRoomServerResponse', '3': 8, '4': 1, '5': 11, '6': '.UpdateRoomServerResponse', '10': 'updateRoomServerResponse'},
    const {'1': 'uploadRoomBackgroundServerRequest', '3': 9, '4': 1, '5': 11, '6': '.UploadRoomBackgroundServerRequest', '10': 'uploadRoomBackgroundServerRequest'},
    const {'1': 'uploadRoomBackgroundServerResponse', '3': 10, '4': 1, '5': 11, '6': '.UploadRoomBackgroundServerResponse', '10': 'uploadRoomBackgroundServerResponse'},
  ],
};

/// Descriptor for `RoomServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomServerMessageDescriptor = $convert.base64Decode('ChFSb29tU2VydmVyTWVzc2FnZRJMChVnZXRSb29tc1NlcnZlclJlcXVlc3QYASABKAsyFi5HZXRSb29tc1NlcnZlclJlcXVlc3RSFWdldFJvb21zU2VydmVyUmVxdWVzdBJPChZnZXRSb29tc1NlcnZlclJlc3BvbnNlGAIgASgLMhcuR2V0Um9vbXNTZXJ2ZXJSZXNwb25zZVIWZ2V0Um9vbXNTZXJ2ZXJSZXNwb25zZRJJChRhZGRSb29tU2VydmVyUmVxdWVzdBgDIAEoCzIVLkFkZFJvb21TZXJ2ZXJSZXF1ZXN0UhRhZGRSb29tU2VydmVyUmVxdWVzdBJMChVhZGRSb29tU2VydmVyUmVzcG9uc2UYBCABKAsyFi5BZGRSb29tU2VydmVyUmVzcG9uc2VSFWFkZFJvb21TZXJ2ZXJSZXNwb25zZRJSChdkZWxldGVSb29tU2VydmVyUmVxdWVzdBgFIAEoCzIYLkRlbGV0ZVJvb21TZXJ2ZXJSZXF1ZXN0UhdkZWxldGVSb29tU2VydmVyUmVxdWVzdBJVChhkZWxldGVSb29tU2VydmVyUmVzcG9uc2UYBiABKAsyGS5EZWxldGVSb29tU2VydmVyUmVzcG9uc2VSGGRlbGV0ZVJvb21TZXJ2ZXJSZXNwb25zZRJSChd1cGRhdGVSb29tU2VydmVyUmVxdWVzdBgHIAEoCzIYLlVwZGF0ZVJvb21TZXJ2ZXJSZXF1ZXN0Uhd1cGRhdGVSb29tU2VydmVyUmVxdWVzdBJVChh1cGRhdGVSb29tU2VydmVyUmVzcG9uc2UYCCABKAsyGS5VcGRhdGVSb29tU2VydmVyUmVzcG9uc2VSGHVwZGF0ZVJvb21TZXJ2ZXJSZXNwb25zZRJwCiF1cGxvYWRSb29tQmFja2dyb3VuZFNlcnZlclJlcXVlc3QYCSABKAsyIi5VcGxvYWRSb29tQmFja2dyb3VuZFNlcnZlclJlcXVlc3RSIXVwbG9hZFJvb21CYWNrZ3JvdW5kU2VydmVyUmVxdWVzdBJzCiJ1cGxvYWRSb29tQmFja2dyb3VuZFNlcnZlclJlc3BvbnNlGAogASgLMiMuVXBsb2FkUm9vbUJhY2tncm91bmRTZXJ2ZXJSZXNwb25zZVIidXBsb2FkUm9vbUJhY2tncm91bmRTZXJ2ZXJSZXNwb25zZQ==');
@$core.Deprecated('Use deviceServerMessageDescriptor instead')
const DeviceServerMessage$json = const {
  '1': 'DeviceServerMessage',
  '2': const [
    const {'1': 'getDevicesServerRequest', '3': 1, '4': 1, '5': 11, '6': '.GetDevicesServerRequest', '10': 'getDevicesServerRequest'},
    const {'1': 'getDevicesServerResponse', '3': 2, '4': 1, '5': 11, '6': '.GetDevicesServerResponse', '10': 'getDevicesServerResponse'},
    const {'1': 'getDeviceServerRequest', '3': 3, '4': 1, '5': 11, '6': '.GetDeviceServerRequest', '10': 'getDeviceServerRequest'},
    const {'1': 'getDeviceServerResponse', '3': 4, '4': 1, '5': 11, '6': '.GetDeviceServerResponse', '10': 'getDeviceServerResponse'},
    const {'1': 'addDevicesServerRequest', '3': 5, '4': 1, '5': 11, '6': '.AddDevicesServerRequest', '10': 'addDevicesServerRequest'},
    const {'1': 'addDevicesServerResponse', '3': 6, '4': 1, '5': 11, '6': '.AddDevicesServerResponse', '10': 'addDevicesServerResponse'},
    const {'1': 'updateDeviceServerRequest', '3': 7, '4': 1, '5': 11, '6': '.UpdateDeviceServerRequest', '10': 'updateDeviceServerRequest'},
    const {'1': 'updateDeviceServerResponse', '3': 8, '4': 1, '5': 11, '6': '.UpdateDeviceServerResponse', '10': 'updateDeviceServerResponse'},
    const {'1': 'deleteDeviceServerRequest', '3': 9, '4': 1, '5': 11, '6': '.DeleteDeviceServerRequest', '10': 'deleteDeviceServerRequest'},
    const {'1': 'deleteDeviceServerResponse', '3': 10, '4': 1, '5': 11, '6': '.DeleteDeviceServerResponse', '10': 'deleteDeviceServerResponse'},
    const {'1': 'getFirmwareLatestDeviceServerRequest', '3': 11, '4': 1, '5': 11, '6': '.GetFirmwareLatestDeviceServerRequest', '10': 'getFirmwareLatestDeviceServerRequest'},
    const {'1': 'getFirmwareLatestDeviceServerResponse', '3': 12, '4': 1, '5': 11, '6': '.GetFirmwareLatestDeviceServerResponse', '10': 'getFirmwareLatestDeviceServerResponse'},
    const {'1': 'downloadFirmwareDeviceServerRequest', '3': 13, '4': 1, '5': 11, '6': '.DownloadFirmwareDeviceServerRequest', '10': 'downloadFirmwareDeviceServerRequest'},
    const {'1': 'downloadFirmwareDeviceServerResponse', '3': 14, '4': 1, '5': 11, '6': '.DownloadFirmwareDeviceServerResponse', '10': 'downloadFirmwareDeviceServerResponse'},
    const {'1': 'forceUpdateFirmwareDeviceServerRequest', '3': 15, '4': 1, '5': 11, '6': '.ForceUpdateFirmwareDeviceServerRequest', '10': 'forceUpdateFirmwareDeviceServerRequest'},
    const {'1': 'forceUpdateFirmwareDeviceServerResponse', '3': 16, '4': 1, '5': 11, '6': '.ForceUpdateFirmwareDeviceServerResponse', '10': 'forceUpdateFirmwareDeviceServerResponse'},
    const {'1': 'registerDeviceServerRequest', '3': 17, '4': 1, '5': 11, '6': '.RegisterDeviceServerRequest', '10': 'registerDeviceServerRequest'},
    const {'1': 'registerDeviceServerResponse', '3': 18, '4': 1, '5': 11, '6': '.RegisterDeviceServerResponse', '10': 'registerDeviceServerResponse'},
    const {'1': 'updateWSEndpointDeviceServerRequest', '3': 19, '4': 1, '5': 11, '6': '.UpdateWSEndpointDeviceServerRequest', '10': 'updateWSEndpointDeviceServerRequest'},
    const {'1': 'updateWSEndpointDeviceServerResponse', '3': 20, '4': 1, '5': 11, '6': '.UpdateWSEndpointDeviceServerResponse', '10': 'updateWSEndpointDeviceServerResponse'},
    const {'1': 'forceUpdateFirmwareAllDevicesByPhoneServerRequest', '3': 21, '4': 1, '5': 11, '6': '.ForceUpdateFirmwareAllDevicesByPhoneServerRequest', '10': 'forceUpdateFirmwareAllDevicesByPhoneServerRequest'},
    const {'1': 'forceUpdateFirmwareAllDevicesByPhoneServerResponse', '3': 22, '4': 1, '5': 11, '6': '.ForceUpdateFirmwareAllDevicesByPhoneServerResponse', '10': 'forceUpdateFirmwareAllDevicesByPhoneServerResponse'},
    const {'1': 'listSceneDeviceServerRequest', '3': 23, '4': 1, '5': 11, '6': '.ListSceneDeviceServerRequest', '10': 'listSceneDeviceServerRequest'},
    const {'1': 'listSceneDeviceServerResponse', '3': 24, '4': 1, '5': 11, '6': '.ListSceneDeviceServerResponse', '10': 'listSceneDeviceServerResponse'},
  ],
};

/// Descriptor for `DeviceServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceServerMessageDescriptor = $convert.base64Decode('ChNEZXZpY2VTZXJ2ZXJNZXNzYWdlElIKF2dldERldmljZXNTZXJ2ZXJSZXF1ZXN0GAEgASgLMhguR2V0RGV2aWNlc1NlcnZlclJlcXVlc3RSF2dldERldmljZXNTZXJ2ZXJSZXF1ZXN0ElUKGGdldERldmljZXNTZXJ2ZXJSZXNwb25zZRgCIAEoCzIZLkdldERldmljZXNTZXJ2ZXJSZXNwb25zZVIYZ2V0RGV2aWNlc1NlcnZlclJlc3BvbnNlEk8KFmdldERldmljZVNlcnZlclJlcXVlc3QYAyABKAsyFy5HZXREZXZpY2VTZXJ2ZXJSZXF1ZXN0UhZnZXREZXZpY2VTZXJ2ZXJSZXF1ZXN0ElIKF2dldERldmljZVNlcnZlclJlc3BvbnNlGAQgASgLMhguR2V0RGV2aWNlU2VydmVyUmVzcG9uc2VSF2dldERldmljZVNlcnZlclJlc3BvbnNlElIKF2FkZERldmljZXNTZXJ2ZXJSZXF1ZXN0GAUgASgLMhguQWRkRGV2aWNlc1NlcnZlclJlcXVlc3RSF2FkZERldmljZXNTZXJ2ZXJSZXF1ZXN0ElUKGGFkZERldmljZXNTZXJ2ZXJSZXNwb25zZRgGIAEoCzIZLkFkZERldmljZXNTZXJ2ZXJSZXNwb25zZVIYYWRkRGV2aWNlc1NlcnZlclJlc3BvbnNlElgKGXVwZGF0ZURldmljZVNlcnZlclJlcXVlc3QYByABKAsyGi5VcGRhdGVEZXZpY2VTZXJ2ZXJSZXF1ZXN0Uhl1cGRhdGVEZXZpY2VTZXJ2ZXJSZXF1ZXN0ElsKGnVwZGF0ZURldmljZVNlcnZlclJlc3BvbnNlGAggASgLMhsuVXBkYXRlRGV2aWNlU2VydmVyUmVzcG9uc2VSGnVwZGF0ZURldmljZVNlcnZlclJlc3BvbnNlElgKGWRlbGV0ZURldmljZVNlcnZlclJlcXVlc3QYCSABKAsyGi5EZWxldGVEZXZpY2VTZXJ2ZXJSZXF1ZXN0UhlkZWxldGVEZXZpY2VTZXJ2ZXJSZXF1ZXN0ElsKGmRlbGV0ZURldmljZVNlcnZlclJlc3BvbnNlGAogASgLMhsuRGVsZXRlRGV2aWNlU2VydmVyUmVzcG9uc2VSGmRlbGV0ZURldmljZVNlcnZlclJlc3BvbnNlEnkKJGdldEZpcm13YXJlTGF0ZXN0RGV2aWNlU2VydmVyUmVxdWVzdBgLIAEoCzIlLkdldEZpcm13YXJlTGF0ZXN0RGV2aWNlU2VydmVyUmVxdWVzdFIkZ2V0RmlybXdhcmVMYXRlc3REZXZpY2VTZXJ2ZXJSZXF1ZXN0EnwKJWdldEZpcm13YXJlTGF0ZXN0RGV2aWNlU2VydmVyUmVzcG9uc2UYDCABKAsyJi5HZXRGaXJtd2FyZUxhdGVzdERldmljZVNlcnZlclJlc3BvbnNlUiVnZXRGaXJtd2FyZUxhdGVzdERldmljZVNlcnZlclJlc3BvbnNlEnYKI2Rvd25sb2FkRmlybXdhcmVEZXZpY2VTZXJ2ZXJSZXF1ZXN0GA0gASgLMiQuRG93bmxvYWRGaXJtd2FyZURldmljZVNlcnZlclJlcXVlc3RSI2Rvd25sb2FkRmlybXdhcmVEZXZpY2VTZXJ2ZXJSZXF1ZXN0EnkKJGRvd25sb2FkRmlybXdhcmVEZXZpY2VTZXJ2ZXJSZXNwb25zZRgOIAEoCzIlLkRvd25sb2FkRmlybXdhcmVEZXZpY2VTZXJ2ZXJSZXNwb25zZVIkZG93bmxvYWRGaXJtd2FyZURldmljZVNlcnZlclJlc3BvbnNlEn8KJmZvcmNlVXBkYXRlRmlybXdhcmVEZXZpY2VTZXJ2ZXJSZXF1ZXN0GA8gASgLMicuRm9yY2VVcGRhdGVGaXJtd2FyZURldmljZVNlcnZlclJlcXVlc3RSJmZvcmNlVXBkYXRlRmlybXdhcmVEZXZpY2VTZXJ2ZXJSZXF1ZXN0EoIBCidmb3JjZVVwZGF0ZUZpcm13YXJlRGV2aWNlU2VydmVyUmVzcG9uc2UYECABKAsyKC5Gb3JjZVVwZGF0ZUZpcm13YXJlRGV2aWNlU2VydmVyUmVzcG9uc2VSJ2ZvcmNlVXBkYXRlRmlybXdhcmVEZXZpY2VTZXJ2ZXJSZXNwb25zZRJeChtyZWdpc3RlckRldmljZVNlcnZlclJlcXVlc3QYESABKAsyHC5SZWdpc3RlckRldmljZVNlcnZlclJlcXVlc3RSG3JlZ2lzdGVyRGV2aWNlU2VydmVyUmVxdWVzdBJhChxyZWdpc3RlckRldmljZVNlcnZlclJlc3BvbnNlGBIgASgLMh0uUmVnaXN0ZXJEZXZpY2VTZXJ2ZXJSZXNwb25zZVIccmVnaXN0ZXJEZXZpY2VTZXJ2ZXJSZXNwb25zZRJ2CiN1cGRhdGVXU0VuZHBvaW50RGV2aWNlU2VydmVyUmVxdWVzdBgTIAEoCzIkLlVwZGF0ZVdTRW5kcG9pbnREZXZpY2VTZXJ2ZXJSZXF1ZXN0UiN1cGRhdGVXU0VuZHBvaW50RGV2aWNlU2VydmVyUmVxdWVzdBJ5CiR1cGRhdGVXU0VuZHBvaW50RGV2aWNlU2VydmVyUmVzcG9uc2UYFCABKAsyJS5VcGRhdGVXU0VuZHBvaW50RGV2aWNlU2VydmVyUmVzcG9uc2VSJHVwZGF0ZVdTRW5kcG9pbnREZXZpY2VTZXJ2ZXJSZXNwb25zZRKgAQoxZm9yY2VVcGRhdGVGaXJtd2FyZUFsbERldmljZXNCeVBob25lU2VydmVyUmVxdWVzdBgVIAEoCzIyLkZvcmNlVXBkYXRlRmlybXdhcmVBbGxEZXZpY2VzQnlQaG9uZVNlcnZlclJlcXVlc3RSMWZvcmNlVXBkYXRlRmlybXdhcmVBbGxEZXZpY2VzQnlQaG9uZVNlcnZlclJlcXVlc3QSowEKMmZvcmNlVXBkYXRlRmlybXdhcmVBbGxEZXZpY2VzQnlQaG9uZVNlcnZlclJlc3BvbnNlGBYgASgLMjMuRm9yY2VVcGRhdGVGaXJtd2FyZUFsbERldmljZXNCeVBob25lU2VydmVyUmVzcG9uc2VSMmZvcmNlVXBkYXRlRmlybXdhcmVBbGxEZXZpY2VzQnlQaG9uZVNlcnZlclJlc3BvbnNlEmEKHGxpc3RTY2VuZURldmljZVNlcnZlclJlcXVlc3QYFyABKAsyHS5MaXN0U2NlbmVEZXZpY2VTZXJ2ZXJSZXF1ZXN0UhxsaXN0U2NlbmVEZXZpY2VTZXJ2ZXJSZXF1ZXN0EmQKHWxpc3RTY2VuZURldmljZVNlcnZlclJlc3BvbnNlGBggASgLMh4uTGlzdFNjZW5lRGV2aWNlU2VydmVyUmVzcG9uc2VSHWxpc3RTY2VuZURldmljZVNlcnZlclJlc3BvbnNl');
@$core.Deprecated('Use switcherServerMessageDescriptor instead')
const SwitcherServerMessage$json = const {
  '1': 'SwitcherServerMessage',
  '2': const [
    const {'1': 'getSwitchersServerRequest', '3': 1, '4': 1, '5': 11, '6': '.GetSwitchersServerRequest', '10': 'getSwitchersServerRequest'},
    const {'1': 'getSwitchersServerResponse', '3': 2, '4': 1, '5': 11, '6': '.GetSwitchersServerResponse', '10': 'getSwitchersServerResponse'},
    const {'1': 'getSwitcherServerRequest', '3': 3, '4': 1, '5': 11, '6': '.GetSwitcherServerRequest', '10': 'getSwitcherServerRequest'},
    const {'1': 'getSwitcherServerResponse', '3': 4, '4': 1, '5': 11, '6': '.GetSwitcherServerResponse', '10': 'getSwitcherServerResponse'},
    const {'1': 'getLogSwitcherServerRequest', '3': 5, '4': 1, '5': 11, '6': '.GetLogSwitcherServerRequest', '10': 'getLogSwitcherServerRequest'},
    const {'1': 'getLogSwitcherServerResponse', '3': 6, '4': 1, '5': 11, '6': '.GetLogSwitcherServerResponse', '10': 'getLogSwitcherServerResponse'},
    const {'1': 'getIconSwitchersServerRequest', '3': 7, '4': 1, '5': 11, '6': '.GetIconSwitchersServerRequest', '10': 'getIconSwitchersServerRequest'},
    const {'1': 'getIconSwitchersServerResponse', '3': 8, '4': 1, '5': 11, '6': '.GetIconSwitchersServerResponse', '10': 'getIconSwitchersServerResponse'},
    const {'1': 'updateSwitcherServerRequest', '3': 9, '4': 1, '5': 11, '6': '.UpdateSwitcherServerRequest', '10': 'updateSwitcherServerRequest'},
    const {'1': 'updateSwitcherServerResponse', '3': 10, '4': 1, '5': 11, '6': '.UpdateSwitcherServerResponse', '10': 'updateSwitcherServerResponse'},
    const {'1': 'switcherServerRequest', '3': 11, '4': 1, '5': 11, '6': '.SwitcherServerRequest', '10': 'switcherServerRequest'},
    const {'1': 'switcherServerResponse', '3': 12, '4': 1, '5': 11, '6': '.SwitcherServerResponse', '10': 'switcherServerResponse'},
    const {'1': 'getSwitcherSchedulesServerRequest', '3': 13, '4': 1, '5': 11, '6': '.GetSwitcherSchedulesServerRequest', '10': 'getSwitcherSchedulesServerRequest'},
    const {'1': 'getSwitcherSchedulesServerResponse', '3': 14, '4': 1, '5': 11, '6': '.GetSwitcherSchedulesServerResponse', '10': 'getSwitcherSchedulesServerResponse'},
    const {'1': 'getSwitcherScheduleServerRequest', '3': 15, '4': 1, '5': 11, '6': '.GetSwitcherScheduleServerRequest', '10': 'getSwitcherScheduleServerRequest'},
    const {'1': 'getSwitcherScheduleServerResponse', '3': 16, '4': 1, '5': 11, '6': '.GetSwitcherScheduleServerResponse', '10': 'getSwitcherScheduleServerResponse'},
    const {'1': 'getCountSwitcherScheduleServerRequest', '3': 17, '4': 1, '5': 11, '6': '.GetCountSwitcherScheduleServerRequest', '10': 'getCountSwitcherScheduleServerRequest'},
    const {'1': 'getCountSwitcherScheduleServerResponse', '3': 18, '4': 1, '5': 11, '6': '.GetCountSwitcherScheduleServerResponse', '10': 'getCountSwitcherScheduleServerResponse'},
    const {'1': 'addSwitcherScheduleServerRequest', '3': 19, '4': 1, '5': 11, '6': '.AddSwitcherScheduleServerRequest', '10': 'addSwitcherScheduleServerRequest'},
    const {'1': 'addSwitcherScheduleServerResponse', '3': 20, '4': 1, '5': 11, '6': '.AddSwitcherScheduleServerResponse', '10': 'addSwitcherScheduleServerResponse'},
    const {'1': 'updateSwitcherScheduleServerRequest', '3': 21, '4': 1, '5': 11, '6': '.UpdateSwitcherScheduleServerRequest', '10': 'updateSwitcherScheduleServerRequest'},
    const {'1': 'updateSwitcherScheduleServerResponse', '3': 22, '4': 1, '5': 11, '6': '.UpdateSwitcherScheduleServerResponse', '10': 'updateSwitcherScheduleServerResponse'},
    const {'1': 'deleteSwitcherScheduleServerRequest', '3': 23, '4': 1, '5': 11, '6': '.DeleteSwitcherScheduleServerRequest', '10': 'deleteSwitcherScheduleServerRequest'},
    const {'1': 'deleteSwitcherScheduleServerResponse', '3': 24, '4': 1, '5': 11, '6': '.DeleteSwitcherScheduleServerResponse', '10': 'deleteSwitcherScheduleServerResponse'},
    const {'1': 'setActiveSwitcherScheduleServerRequest', '3': 25, '4': 1, '5': 11, '6': '.SetActiveSwitcherScheduleServerRequest', '10': 'setActiveSwitcherScheduleServerRequest'},
    const {'1': 'setActiveSwitcherScheduleServerResponse', '3': 26, '4': 1, '5': 11, '6': '.SetActiveSwitcherScheduleServerResponse', '10': 'setActiveSwitcherScheduleServerResponse'},
  ],
};

/// Descriptor for `SwitcherServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List switcherServerMessageDescriptor = $convert.base64Decode('ChVTd2l0Y2hlclNlcnZlck1lc3NhZ2USWAoZZ2V0U3dpdGNoZXJzU2VydmVyUmVxdWVzdBgBIAEoCzIaLkdldFN3aXRjaGVyc1NlcnZlclJlcXVlc3RSGWdldFN3aXRjaGVyc1NlcnZlclJlcXVlc3QSWwoaZ2V0U3dpdGNoZXJzU2VydmVyUmVzcG9uc2UYAiABKAsyGy5HZXRTd2l0Y2hlcnNTZXJ2ZXJSZXNwb25zZVIaZ2V0U3dpdGNoZXJzU2VydmVyUmVzcG9uc2USVQoYZ2V0U3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0GAMgASgLMhkuR2V0U3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0UhhnZXRTd2l0Y2hlclNlcnZlclJlcXVlc3QSWAoZZ2V0U3dpdGNoZXJTZXJ2ZXJSZXNwb25zZRgEIAEoCzIaLkdldFN3aXRjaGVyU2VydmVyUmVzcG9uc2VSGWdldFN3aXRjaGVyU2VydmVyUmVzcG9uc2USXgobZ2V0TG9nU3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0GAUgASgLMhwuR2V0TG9nU3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0UhtnZXRMb2dTd2l0Y2hlclNlcnZlclJlcXVlc3QSYQocZ2V0TG9nU3dpdGNoZXJTZXJ2ZXJSZXNwb25zZRgGIAEoCzIdLkdldExvZ1N3aXRjaGVyU2VydmVyUmVzcG9uc2VSHGdldExvZ1N3aXRjaGVyU2VydmVyUmVzcG9uc2USZAodZ2V0SWNvblN3aXRjaGVyc1NlcnZlclJlcXVlc3QYByABKAsyHi5HZXRJY29uU3dpdGNoZXJzU2VydmVyUmVxdWVzdFIdZ2V0SWNvblN3aXRjaGVyc1NlcnZlclJlcXVlc3QSZwoeZ2V0SWNvblN3aXRjaGVyc1NlcnZlclJlc3BvbnNlGAggASgLMh8uR2V0SWNvblN3aXRjaGVyc1NlcnZlclJlc3BvbnNlUh5nZXRJY29uU3dpdGNoZXJzU2VydmVyUmVzcG9uc2USXgobdXBkYXRlU3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0GAkgASgLMhwuVXBkYXRlU3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0Uht1cGRhdGVTd2l0Y2hlclNlcnZlclJlcXVlc3QSYQocdXBkYXRlU3dpdGNoZXJTZXJ2ZXJSZXNwb25zZRgKIAEoCzIdLlVwZGF0ZVN3aXRjaGVyU2VydmVyUmVzcG9uc2VSHHVwZGF0ZVN3aXRjaGVyU2VydmVyUmVzcG9uc2USTAoVc3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0GAsgASgLMhYuU3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0UhVzd2l0Y2hlclNlcnZlclJlcXVlc3QSTwoWc3dpdGNoZXJTZXJ2ZXJSZXNwb25zZRgMIAEoCzIXLlN3aXRjaGVyU2VydmVyUmVzcG9uc2VSFnN3aXRjaGVyU2VydmVyUmVzcG9uc2UScAohZ2V0U3dpdGNoZXJTY2hlZHVsZXNTZXJ2ZXJSZXF1ZXN0GA0gASgLMiIuR2V0U3dpdGNoZXJTY2hlZHVsZXNTZXJ2ZXJSZXF1ZXN0UiFnZXRTd2l0Y2hlclNjaGVkdWxlc1NlcnZlclJlcXVlc3QScwoiZ2V0U3dpdGNoZXJTY2hlZHVsZXNTZXJ2ZXJSZXNwb25zZRgOIAEoCzIjLkdldFN3aXRjaGVyU2NoZWR1bGVzU2VydmVyUmVzcG9uc2VSImdldFN3aXRjaGVyU2NoZWR1bGVzU2VydmVyUmVzcG9uc2USbQogZ2V0U3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3QYDyABKAsyIS5HZXRTd2l0Y2hlclNjaGVkdWxlU2VydmVyUmVxdWVzdFIgZ2V0U3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3QScAohZ2V0U3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlc3BvbnNlGBAgASgLMiIuR2V0U3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlc3BvbnNlUiFnZXRTd2l0Y2hlclNjaGVkdWxlU2VydmVyUmVzcG9uc2USfAolZ2V0Q291bnRTd2l0Y2hlclNjaGVkdWxlU2VydmVyUmVxdWVzdBgRIAEoCzImLkdldENvdW50U3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3RSJWdldENvdW50U3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3QSfwomZ2V0Q291bnRTd2l0Y2hlclNjaGVkdWxlU2VydmVyUmVzcG9uc2UYEiABKAsyJy5HZXRDb3VudFN3aXRjaGVyU2NoZWR1bGVTZXJ2ZXJSZXNwb25zZVImZ2V0Q291bnRTd2l0Y2hlclNjaGVkdWxlU2VydmVyUmVzcG9uc2USbQogYWRkU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3QYEyABKAsyIS5BZGRTd2l0Y2hlclNjaGVkdWxlU2VydmVyUmVxdWVzdFIgYWRkU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3QScAohYWRkU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlc3BvbnNlGBQgASgLMiIuQWRkU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlc3BvbnNlUiFhZGRTd2l0Y2hlclNjaGVkdWxlU2VydmVyUmVzcG9uc2USdgojdXBkYXRlU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3QYFSABKAsyJC5VcGRhdGVTd2l0Y2hlclNjaGVkdWxlU2VydmVyUmVxdWVzdFIjdXBkYXRlU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3QSeQokdXBkYXRlU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlc3BvbnNlGBYgASgLMiUuVXBkYXRlU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlc3BvbnNlUiR1cGRhdGVTd2l0Y2hlclNjaGVkdWxlU2VydmVyUmVzcG9uc2USdgojZGVsZXRlU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3QYFyABKAsyJC5EZWxldGVTd2l0Y2hlclNjaGVkdWxlU2VydmVyUmVxdWVzdFIjZGVsZXRlU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3QSeQokZGVsZXRlU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlc3BvbnNlGBggASgLMiUuRGVsZXRlU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlc3BvbnNlUiRkZWxldGVTd2l0Y2hlclNjaGVkdWxlU2VydmVyUmVzcG9uc2USfwomc2V0QWN0aXZlU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3QYGSABKAsyJy5TZXRBY3RpdmVTd2l0Y2hlclNjaGVkdWxlU2VydmVyUmVxdWVzdFImc2V0QWN0aXZlU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3QSggEKJ3NldEFjdGl2ZVN3aXRjaGVyU2NoZWR1bGVTZXJ2ZXJSZXNwb25zZRgaIAEoCzIoLlNldEFjdGl2ZVN3aXRjaGVyU2NoZWR1bGVTZXJ2ZXJSZXNwb25zZVInc2V0QWN0aXZlU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlc3BvbnNl');
@$core.Deprecated('Use curtainSwitcherServerMessageDescriptor instead')
const CurtainSwitcherServerMessage$json = const {
  '1': 'CurtainSwitcherServerMessage',
  '2': const [
    const {'1': 'getCurtainSwitcherServerRequest', '3': 1, '4': 1, '5': 11, '6': '.GetCurtainSwitcherServerRequest', '10': 'getCurtainSwitcherServerRequest'},
    const {'1': 'getCurtainSwitcherServerResponse', '3': 2, '4': 1, '5': 11, '6': '.GetCurtainSwitcherServerResponse', '10': 'getCurtainSwitcherServerResponse'},
    const {'1': 'updateCurtainSwitcherServerRequest', '3': 3, '4': 1, '5': 11, '6': '.UpdateCurtainSwitcherServerRequest', '10': 'updateCurtainSwitcherServerRequest'},
    const {'1': 'updateCurtainSwitcherServerResponse', '3': 4, '4': 1, '5': 11, '6': '.UpdateCurtainSwitcherServerResponse', '10': 'updateCurtainSwitcherServerResponse'},
    const {'1': 'getCurtainSwitcherStateServerRequest', '3': 5, '4': 1, '5': 11, '6': '.GetCurtainSwitcherStateServerRequest', '10': 'getCurtainSwitcherStateServerRequest'},
    const {'1': 'getCurtainSwitcherStateServerResponse', '3': 6, '4': 1, '5': 11, '6': '.GetCurtainSwitcherStateServerResponse', '10': 'getCurtainSwitcherStateServerResponse'},
    const {'1': 'curtainSwitcherServerRequest', '3': 7, '4': 1, '5': 11, '6': '.CurtainSwitcherServerRequest', '10': 'curtainSwitcherServerRequest'},
    const {'1': 'curtainSwitcherServerResponse', '3': 8, '4': 1, '5': 11, '6': '.CurtainSwitcherServerResponse', '10': 'curtainSwitcherServerResponse'},
    const {'1': 'getCurtainSwitcherSchedulesServerRequest', '3': 9, '4': 1, '5': 11, '6': '.GetCurtainSwitcherSchedulesServerRequest', '10': 'getCurtainSwitcherSchedulesServerRequest'},
    const {'1': 'getCurtainSwitcherSchedulesServerResponse', '3': 10, '4': 1, '5': 11, '6': '.GetCurtainSwitcherSchedulesServerResponse', '10': 'getCurtainSwitcherSchedulesServerResponse'},
    const {'1': 'getCurtainSwitcherScheduleServerRequest', '3': 11, '4': 1, '5': 11, '6': '.GetCurtainSwitcherScheduleServerRequest', '10': 'getCurtainSwitcherScheduleServerRequest'},
    const {'1': 'getCurtainSwitcherScheduleServerResponse', '3': 12, '4': 1, '5': 11, '6': '.GetCurtainSwitcherScheduleServerResponse', '10': 'getCurtainSwitcherScheduleServerResponse'},
    const {'1': 'getCountCurtainSwitcherScheduleServerRequest', '3': 13, '4': 1, '5': 11, '6': '.GetCountCurtainSwitcherScheduleServerRequest', '10': 'getCountCurtainSwitcherScheduleServerRequest'},
    const {'1': 'getCountCurtainSwitcherScheduleServerResponse', '3': 14, '4': 1, '5': 11, '6': '.GetCountCurtainSwitcherScheduleServerResponse', '10': 'getCountCurtainSwitcherScheduleServerResponse'},
    const {'1': 'addCurtainSwitcherScheduleServerRequest', '3': 15, '4': 1, '5': 11, '6': '.AddCurtainSwitcherScheduleServerRequest', '10': 'addCurtainSwitcherScheduleServerRequest'},
    const {'1': 'addCurtainSwitcherScheduleServerResponse', '3': 16, '4': 1, '5': 11, '6': '.AddCurtainSwitcherScheduleServerResponse', '10': 'addCurtainSwitcherScheduleServerResponse'},
    const {'1': 'updateCurtainSwitcherScheduleServerRequest', '3': 17, '4': 1, '5': 11, '6': '.UpdateCurtainSwitcherScheduleServerRequest', '10': 'updateCurtainSwitcherScheduleServerRequest'},
    const {'1': 'updateCurtainSwitcherScheduleServerResponse', '3': 18, '4': 1, '5': 11, '6': '.UpdateCurtainSwitcherScheduleServerResponse', '10': 'updateCurtainSwitcherScheduleServerResponse'},
    const {'1': 'deleteCurtainSwitcherScheduleServerRequest', '3': 19, '4': 1, '5': 11, '6': '.DeleteCurtainSwitcherScheduleServerRequest', '10': 'deleteCurtainSwitcherScheduleServerRequest'},
    const {'1': 'deleteCurtainSwitcherScheduleServerResponse', '3': 20, '4': 1, '5': 11, '6': '.DeleteCurtainSwitcherScheduleServerResponse', '10': 'deleteCurtainSwitcherScheduleServerResponse'},
    const {'1': 'setActiveCurtainSwitcherScheduleServerRequest', '3': 21, '4': 1, '5': 11, '6': '.SetActiveCurtainSwitcherScheduleServerRequest', '10': 'setActiveCurtainSwitcherScheduleServerRequest'},
    const {'1': 'setActiveCurtainSwitcherScheduleServerResponse', '3': 22, '4': 1, '5': 11, '6': '.SetActiveCurtainSwitcherScheduleServerResponse', '10': 'setActiveCurtainSwitcherScheduleServerResponse'},
  ],
};

/// Descriptor for `CurtainSwitcherServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List curtainSwitcherServerMessageDescriptor = $convert.base64Decode('ChxDdXJ0YWluU3dpdGNoZXJTZXJ2ZXJNZXNzYWdlEmoKH2dldEN1cnRhaW5Td2l0Y2hlclNlcnZlclJlcXVlc3QYASABKAsyIC5HZXRDdXJ0YWluU3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0Uh9nZXRDdXJ0YWluU3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0Em0KIGdldEN1cnRhaW5Td2l0Y2hlclNlcnZlclJlc3BvbnNlGAIgASgLMiEuR2V0Q3VydGFpblN3aXRjaGVyU2VydmVyUmVzcG9uc2VSIGdldEN1cnRhaW5Td2l0Y2hlclNlcnZlclJlc3BvbnNlEnMKInVwZGF0ZUN1cnRhaW5Td2l0Y2hlclNlcnZlclJlcXVlc3QYAyABKAsyIy5VcGRhdGVDdXJ0YWluU3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0UiJ1cGRhdGVDdXJ0YWluU3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0EnYKI3VwZGF0ZUN1cnRhaW5Td2l0Y2hlclNlcnZlclJlc3BvbnNlGAQgASgLMiQuVXBkYXRlQ3VydGFpblN3aXRjaGVyU2VydmVyUmVzcG9uc2VSI3VwZGF0ZUN1cnRhaW5Td2l0Y2hlclNlcnZlclJlc3BvbnNlEnkKJGdldEN1cnRhaW5Td2l0Y2hlclN0YXRlU2VydmVyUmVxdWVzdBgFIAEoCzIlLkdldEN1cnRhaW5Td2l0Y2hlclN0YXRlU2VydmVyUmVxdWVzdFIkZ2V0Q3VydGFpblN3aXRjaGVyU3RhdGVTZXJ2ZXJSZXF1ZXN0EnwKJWdldEN1cnRhaW5Td2l0Y2hlclN0YXRlU2VydmVyUmVzcG9uc2UYBiABKAsyJi5HZXRDdXJ0YWluU3dpdGNoZXJTdGF0ZVNlcnZlclJlc3BvbnNlUiVnZXRDdXJ0YWluU3dpdGNoZXJTdGF0ZVNlcnZlclJlc3BvbnNlEmEKHGN1cnRhaW5Td2l0Y2hlclNlcnZlclJlcXVlc3QYByABKAsyHS5DdXJ0YWluU3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0UhxjdXJ0YWluU3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0EmQKHWN1cnRhaW5Td2l0Y2hlclNlcnZlclJlc3BvbnNlGAggASgLMh4uQ3VydGFpblN3aXRjaGVyU2VydmVyUmVzcG9uc2VSHWN1cnRhaW5Td2l0Y2hlclNlcnZlclJlc3BvbnNlEoUBCihnZXRDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZXNTZXJ2ZXJSZXF1ZXN0GAkgASgLMikuR2V0Q3VydGFpblN3aXRjaGVyU2NoZWR1bGVzU2VydmVyUmVxdWVzdFIoZ2V0Q3VydGFpblN3aXRjaGVyU2NoZWR1bGVzU2VydmVyUmVxdWVzdBKIAQopZ2V0Q3VydGFpblN3aXRjaGVyU2NoZWR1bGVzU2VydmVyUmVzcG9uc2UYCiABKAsyKi5HZXRDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZXNTZXJ2ZXJSZXNwb25zZVIpZ2V0Q3VydGFpblN3aXRjaGVyU2NoZWR1bGVzU2VydmVyUmVzcG9uc2USggEKJ2dldEN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlU2VydmVyUmVxdWVzdBgLIAEoCzIoLkdldEN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlU2VydmVyUmVxdWVzdFInZ2V0Q3VydGFpblN3aXRjaGVyU2NoZWR1bGVTZXJ2ZXJSZXF1ZXN0EoUBCihnZXRDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlc3BvbnNlGAwgASgLMikuR2V0Q3VydGFpblN3aXRjaGVyU2NoZWR1bGVTZXJ2ZXJSZXNwb25zZVIoZ2V0Q3VydGFpblN3aXRjaGVyU2NoZWR1bGVTZXJ2ZXJSZXNwb25zZRKRAQosZ2V0Q291bnRDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3QYDSABKAsyLS5HZXRDb3VudEN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlU2VydmVyUmVxdWVzdFIsZ2V0Q291bnRDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3QSlAEKLWdldENvdW50Q3VydGFpblN3aXRjaGVyU2NoZWR1bGVTZXJ2ZXJSZXNwb25zZRgOIAEoCzIuLkdldENvdW50Q3VydGFpblN3aXRjaGVyU2NoZWR1bGVTZXJ2ZXJSZXNwb25zZVItZ2V0Q291bnRDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlc3BvbnNlEoIBCidhZGRDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3QYDyABKAsyKC5BZGRDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3RSJ2FkZEN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlU2VydmVyUmVxdWVzdBKFAQooYWRkQ3VydGFpblN3aXRjaGVyU2NoZWR1bGVTZXJ2ZXJSZXNwb25zZRgQIAEoCzIpLkFkZEN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlU2VydmVyUmVzcG9uc2VSKGFkZEN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlU2VydmVyUmVzcG9uc2USiwEKKnVwZGF0ZUN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlU2VydmVyUmVxdWVzdBgRIAEoCzIrLlVwZGF0ZUN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlU2VydmVyUmVxdWVzdFIqdXBkYXRlQ3VydGFpblN3aXRjaGVyU2NoZWR1bGVTZXJ2ZXJSZXF1ZXN0Eo4BCit1cGRhdGVDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlc3BvbnNlGBIgASgLMiwuVXBkYXRlQ3VydGFpblN3aXRjaGVyU2NoZWR1bGVTZXJ2ZXJSZXNwb25zZVIrdXBkYXRlQ3VydGFpblN3aXRjaGVyU2NoZWR1bGVTZXJ2ZXJSZXNwb25zZRKLAQoqZGVsZXRlQ3VydGFpblN3aXRjaGVyU2NoZWR1bGVTZXJ2ZXJSZXF1ZXN0GBMgASgLMisuRGVsZXRlQ3VydGFpblN3aXRjaGVyU2NoZWR1bGVTZXJ2ZXJSZXF1ZXN0UipkZWxldGVDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3QSjgEKK2RlbGV0ZUN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlU2VydmVyUmVzcG9uc2UYFCABKAsyLC5EZWxldGVDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlc3BvbnNlUitkZWxldGVDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlc3BvbnNlEpQBCi1zZXRBY3RpdmVDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3QYFSABKAsyLi5TZXRBY3RpdmVDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZVNlcnZlclJlcXVlc3RSLXNldEFjdGl2ZUN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlU2VydmVyUmVxdWVzdBKXAQouc2V0QWN0aXZlQ3VydGFpblN3aXRjaGVyU2NoZWR1bGVTZXJ2ZXJSZXNwb25zZRgWIAEoCzIvLlNldEFjdGl2ZUN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlU2VydmVyUmVzcG9uc2VSLnNldEFjdGl2ZUN1cnRhaW5Td2l0Y2hlclNjaGVkdWxlU2VydmVyUmVzcG9uc2U=');
@$core.Deprecated('Use meterServerMessageDescriptor instead')
const MeterServerMessage$json = const {
  '1': 'MeterServerMessage',
  '2': const [
    const {'1': 'getMeterServerRequest', '3': 1, '4': 1, '5': 11, '6': '.GetMeterServerRequest', '10': 'getMeterServerRequest'},
    const {'1': 'getMeterServerResponse', '3': 2, '4': 1, '5': 11, '6': '.GetMeterServerResponse', '10': 'getMeterServerResponse'},
    const {'1': 'updateMeterServerRequest', '3': 3, '4': 1, '5': 11, '6': '.UpdateMeterServerRequest', '10': 'updateMeterServerRequest'},
    const {'1': 'updateMeterServerResponse', '3': 4, '4': 1, '5': 11, '6': '.UpdateMeterServerResponse', '10': 'updateMeterServerResponse'},
    const {'1': 'getMeterEstimatesDayInMonthServerRequest', '3': 5, '4': 1, '5': 11, '6': '.GetMeterEstimatesDayInMonthServerRequest', '10': 'getMeterEstimatesDayInMonthServerRequest'},
    const {'1': 'getMeterEstimatesDayInMonthServerResponse', '3': 6, '4': 1, '5': 11, '6': '.GetMeterEstimatesDayInMonthServerResponse', '10': 'getMeterEstimatesDayInMonthServerResponse'},
    const {'1': 'getMeterEstimatesHourInDayServerRequest', '3': 7, '4': 1, '5': 11, '6': '.GetMeterEstimatesHourInDayServerRequest', '10': 'getMeterEstimatesHourInDayServerRequest'},
    const {'1': 'getMeterEstimatesHourInDayServerResponse', '3': 8, '4': 1, '5': 11, '6': '.GetMeterEstimatesHourInDayServerResponse', '10': 'getMeterEstimatesHourInDayServerResponse'},
    const {'1': 'getMetersByHomeIdServerRequest', '3': 9, '4': 1, '5': 11, '6': '.GetMetersByHomeIdServerRequest', '10': 'getMetersByHomeIdServerRequest'},
    const {'1': 'getMetersByHomeIdServerResponse', '3': 10, '4': 1, '5': 11, '6': '.GetMetersByHomeIdServerResponse', '10': 'getMetersByHomeIdServerResponse'},
    const {'1': 'getMeterMissingInDayServerRequest', '3': 11, '4': 1, '5': 11, '6': '.GetMeterMissingInDayServerRequest', '10': 'getMeterMissingInDayServerRequest'},
    const {'1': 'getMeterMissingInDayServerResponse', '3': 12, '4': 1, '5': 11, '6': '.GetMeterMissingInDayServerResponse', '10': 'getMeterMissingInDayServerResponse'},
  ],
};

/// Descriptor for `MeterServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List meterServerMessageDescriptor = $convert.base64Decode('ChJNZXRlclNlcnZlck1lc3NhZ2USTAoVZ2V0TWV0ZXJTZXJ2ZXJSZXF1ZXN0GAEgASgLMhYuR2V0TWV0ZXJTZXJ2ZXJSZXF1ZXN0UhVnZXRNZXRlclNlcnZlclJlcXVlc3QSTwoWZ2V0TWV0ZXJTZXJ2ZXJSZXNwb25zZRgCIAEoCzIXLkdldE1ldGVyU2VydmVyUmVzcG9uc2VSFmdldE1ldGVyU2VydmVyUmVzcG9uc2USVQoYdXBkYXRlTWV0ZXJTZXJ2ZXJSZXF1ZXN0GAMgASgLMhkuVXBkYXRlTWV0ZXJTZXJ2ZXJSZXF1ZXN0Uhh1cGRhdGVNZXRlclNlcnZlclJlcXVlc3QSWAoZdXBkYXRlTWV0ZXJTZXJ2ZXJSZXNwb25zZRgEIAEoCzIaLlVwZGF0ZU1ldGVyU2VydmVyUmVzcG9uc2VSGXVwZGF0ZU1ldGVyU2VydmVyUmVzcG9uc2UShQEKKGdldE1ldGVyRXN0aW1hdGVzRGF5SW5Nb250aFNlcnZlclJlcXVlc3QYBSABKAsyKS5HZXRNZXRlckVzdGltYXRlc0RheUluTW9udGhTZXJ2ZXJSZXF1ZXN0UihnZXRNZXRlckVzdGltYXRlc0RheUluTW9udGhTZXJ2ZXJSZXF1ZXN0EogBCilnZXRNZXRlckVzdGltYXRlc0RheUluTW9udGhTZXJ2ZXJSZXNwb25zZRgGIAEoCzIqLkdldE1ldGVyRXN0aW1hdGVzRGF5SW5Nb250aFNlcnZlclJlc3BvbnNlUilnZXRNZXRlckVzdGltYXRlc0RheUluTW9udGhTZXJ2ZXJSZXNwb25zZRKCAQonZ2V0TWV0ZXJFc3RpbWF0ZXNIb3VySW5EYXlTZXJ2ZXJSZXF1ZXN0GAcgASgLMiguR2V0TWV0ZXJFc3RpbWF0ZXNIb3VySW5EYXlTZXJ2ZXJSZXF1ZXN0UidnZXRNZXRlckVzdGltYXRlc0hvdXJJbkRheVNlcnZlclJlcXVlc3QShQEKKGdldE1ldGVyRXN0aW1hdGVzSG91ckluRGF5U2VydmVyUmVzcG9uc2UYCCABKAsyKS5HZXRNZXRlckVzdGltYXRlc0hvdXJJbkRheVNlcnZlclJlc3BvbnNlUihnZXRNZXRlckVzdGltYXRlc0hvdXJJbkRheVNlcnZlclJlc3BvbnNlEmcKHmdldE1ldGVyc0J5SG9tZUlkU2VydmVyUmVxdWVzdBgJIAEoCzIfLkdldE1ldGVyc0J5SG9tZUlkU2VydmVyUmVxdWVzdFIeZ2V0TWV0ZXJzQnlIb21lSWRTZXJ2ZXJSZXF1ZXN0EmoKH2dldE1ldGVyc0J5SG9tZUlkU2VydmVyUmVzcG9uc2UYCiABKAsyIC5HZXRNZXRlcnNCeUhvbWVJZFNlcnZlclJlc3BvbnNlUh9nZXRNZXRlcnNCeUhvbWVJZFNlcnZlclJlc3BvbnNlEnAKIWdldE1ldGVyTWlzc2luZ0luRGF5U2VydmVyUmVxdWVzdBgLIAEoCzIiLkdldE1ldGVyTWlzc2luZ0luRGF5U2VydmVyUmVxdWVzdFIhZ2V0TWV0ZXJNaXNzaW5nSW5EYXlTZXJ2ZXJSZXF1ZXN0EnMKImdldE1ldGVyTWlzc2luZ0luRGF5U2VydmVyUmVzcG9uc2UYDCABKAsyIy5HZXRNZXRlck1pc3NpbmdJbkRheVNlcnZlclJlc3BvbnNlUiJnZXRNZXRlck1pc3NpbmdJbkRheVNlcnZlclJlc3BvbnNl');
@$core.Deprecated('Use airConditionerServerMessageDescriptor instead')
const AirConditionerServerMessage$json = const {
  '1': 'AirConditionerServerMessage',
  '2': const [
    const {'1': 'getAirConditionerStateServerRequest', '3': 1, '4': 1, '5': 11, '6': '.GetAirConditionerStateServerRequest', '10': 'getAirConditionerStateServerRequest'},
    const {'1': 'getAirConditionerStateServerResponse', '3': 2, '4': 1, '5': 11, '6': '.GetAirConditionerStateServerResponse', '10': 'getAirConditionerStateServerResponse'},
    const {'1': 'airConditionerServerRequest', '3': 3, '4': 1, '5': 11, '6': '.AirConditionerServerRequest', '10': 'airConditionerServerRequest'},
    const {'1': 'airConditionerServerResponse', '3': 4, '4': 1, '5': 11, '6': '.AirConditionerServerResponse', '10': 'airConditionerServerResponse'},
  ],
};

/// Descriptor for `AirConditionerServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List airConditionerServerMessageDescriptor = $convert.base64Decode('ChtBaXJDb25kaXRpb25lclNlcnZlck1lc3NhZ2USdgojZ2V0QWlyQ29uZGl0aW9uZXJTdGF0ZVNlcnZlclJlcXVlc3QYASABKAsyJC5HZXRBaXJDb25kaXRpb25lclN0YXRlU2VydmVyUmVxdWVzdFIjZ2V0QWlyQ29uZGl0aW9uZXJTdGF0ZVNlcnZlclJlcXVlc3QSeQokZ2V0QWlyQ29uZGl0aW9uZXJTdGF0ZVNlcnZlclJlc3BvbnNlGAIgASgLMiUuR2V0QWlyQ29uZGl0aW9uZXJTdGF0ZVNlcnZlclJlc3BvbnNlUiRnZXRBaXJDb25kaXRpb25lclN0YXRlU2VydmVyUmVzcG9uc2USXgobYWlyQ29uZGl0aW9uZXJTZXJ2ZXJSZXF1ZXN0GAMgASgLMhwuQWlyQ29uZGl0aW9uZXJTZXJ2ZXJSZXF1ZXN0UhthaXJDb25kaXRpb25lclNlcnZlclJlcXVlc3QSYQocYWlyQ29uZGl0aW9uZXJTZXJ2ZXJSZXNwb25zZRgEIAEoCzIdLkFpckNvbmRpdGlvbmVyU2VydmVyUmVzcG9uc2VSHGFpckNvbmRpdGlvbmVyU2VydmVyUmVzcG9uc2U=');
@$core.Deprecated('Use remoteServerMessageDescriptor instead')
const RemoteServerMessage$json = const {
  '1': 'RemoteServerMessage',
  '2': const [
    const {'1': 'getRemotesServerRequest', '3': 1, '4': 1, '5': 11, '6': '.GetRemotesServerRequest', '10': 'getRemotesServerRequest'},
    const {'1': 'getRemotesServerResponse', '3': 2, '4': 1, '5': 11, '6': '.GetRemotesServerResponse', '10': 'getRemotesServerResponse'},
    const {'1': 'getRemoteServerRequest', '3': 3, '4': 1, '5': 11, '6': '.GetRemoteServerRequest', '10': 'getRemoteServerRequest'},
    const {'1': 'getRemoteServerResponse', '3': 4, '4': 1, '5': 11, '6': '.GetRemoteServerResponse', '10': 'getRemoteServerResponse'},
    const {'1': 'getRemoteLibrariesServerRequest', '3': 5, '4': 1, '5': 11, '6': '.GetRemoteLibrariesServerRequest', '10': 'getRemoteLibrariesServerRequest'},
    const {'1': 'getRemoteLibrariesServerResponse', '3': 6, '4': 1, '5': 11, '6': '.GetRemoteLibrariesServerResponse', '10': 'getRemoteLibrariesServerResponse'},
    const {'1': 'getCommandsRemoteServerRequest', '3': 7, '4': 1, '5': 11, '6': '.GetCommandsRemoteServerRequest', '10': 'getCommandsRemoteServerRequest'},
    const {'1': 'getCommandsRemoteServerResponse', '3': 8, '4': 1, '5': 11, '6': '.GetCommandsRemoteServerResponse', '10': 'getCommandsRemoteServerResponse'},
    const {'1': 'sendCommandRemoteServerRequest', '3': 9, '4': 1, '5': 11, '6': '.SendCommandRemoteServerRequest', '10': 'sendCommandRemoteServerRequest'},
    const {'1': 'sendCommandRemoteServerResponse', '3': 10, '4': 1, '5': 11, '6': '.SendCommandRemoteServerResponse', '10': 'sendCommandRemoteServerResponse'},
    const {'1': 'learnCommandRemoteServerRequest', '3': 11, '4': 1, '5': 11, '6': '.LearnCommandRemoteServerRequest', '10': 'learnCommandRemoteServerRequest'},
    const {'1': 'learnCommandRemoteServerResponse', '3': 12, '4': 1, '5': 11, '6': '.LearnCommandRemoteServerResponse', '10': 'learnCommandRemoteServerResponse'},
    const {'1': 'restoreCommandRemoteServerRequest', '3': 13, '4': 1, '5': 11, '6': '.RestoreCommandRemoteServerRequest', '10': 'restoreCommandRemoteServerRequest'},
    const {'1': 'restoreCommandRemoteServerResponse', '3': 14, '4': 1, '5': 11, '6': '.RestoreCommandRemoteServerResponse', '10': 'restoreCommandRemoteServerResponse'},
    const {'1': 'addRemoteServerRequest', '3': 15, '4': 1, '5': 11, '6': '.AddRemoteServerRequest', '10': 'addRemoteServerRequest'},
    const {'1': 'addRemoteServerResponse', '3': 16, '4': 1, '5': 11, '6': '.AddRemoteServerResponse', '10': 'addRemoteServerResponse'},
    const {'1': 'updateRemoteServerRequest', '3': 17, '4': 1, '5': 11, '6': '.UpdateRemoteServerRequest', '10': 'updateRemoteServerRequest'},
    const {'1': 'updateRemoteServerResponse', '3': 18, '4': 1, '5': 11, '6': '.UpdateRemoteServerResponse', '10': 'updateRemoteServerResponse'},
    const {'1': 'deleteRemoteServerRequest', '3': 19, '4': 1, '5': 11, '6': '.DeleteRemoteServerRequest', '10': 'deleteRemoteServerRequest'},
    const {'1': 'deleteRemoteServerResponse', '3': 20, '4': 1, '5': 11, '6': '.DeleteRemoteServerResponse', '10': 'deleteRemoteServerResponse'},
    const {'1': 'getRemoteSchedulesServerRequest', '3': 21, '4': 1, '5': 11, '6': '.GetRemoteSchedulesServerRequest', '10': 'getRemoteSchedulesServerRequest'},
    const {'1': 'getRemoteSchedulesServerResponse', '3': 22, '4': 1, '5': 11, '6': '.GetRemoteSchedulesServerResponse', '10': 'getRemoteSchedulesServerResponse'},
    const {'1': 'getCountRemoteScheduleServerRequest', '3': 23, '4': 1, '5': 11, '6': '.GetCountRemoteScheduleServerRequest', '10': 'getCountRemoteScheduleServerRequest'},
    const {'1': 'getCountRemoteScheduleServerResponse', '3': 24, '4': 1, '5': 11, '6': '.GetCountRemoteScheduleServerResponse', '10': 'getCountRemoteScheduleServerResponse'},
    const {'1': 'getRemoteScheduleServerRequest', '3': 25, '4': 1, '5': 11, '6': '.GetRemoteScheduleServerRequest', '10': 'getRemoteScheduleServerRequest'},
    const {'1': 'getRemoteScheduleServerResponse', '3': 26, '4': 1, '5': 11, '6': '.GetRemoteScheduleServerResponse', '10': 'getRemoteScheduleServerResponse'},
    const {'1': 'addRemoteScheduleServerRequest', '3': 27, '4': 1, '5': 11, '6': '.AddRemoteScheduleServerRequest', '10': 'addRemoteScheduleServerRequest'},
    const {'1': 'addRemoteScheduleServerResponse', '3': 28, '4': 1, '5': 11, '6': '.AddRemoteScheduleServerResponse', '10': 'addRemoteScheduleServerResponse'},
    const {'1': 'updateRemoteScheduleServerRequest', '3': 29, '4': 1, '5': 11, '6': '.UpdateRemoteScheduleServerRequest', '10': 'updateRemoteScheduleServerRequest'},
    const {'1': 'updateRemoteScheduleServerResponse', '3': 30, '4': 1, '5': 11, '6': '.UpdateRemoteScheduleServerResponse', '10': 'updateRemoteScheduleServerResponse'},
    const {'1': 'deleteRemoteScheduleServerRequest', '3': 31, '4': 1, '5': 11, '6': '.DeleteRemoteScheduleServerRequest', '10': 'deleteRemoteScheduleServerRequest'},
    const {'1': 'deleteRemoteScheduleServerResponse', '3': 32, '4': 1, '5': 11, '6': '.DeleteRemoteScheduleServerResponse', '10': 'deleteRemoteScheduleServerResponse'},
    const {'1': 'setActiveRemoteScheduleServerRequest', '3': 33, '4': 1, '5': 11, '6': '.SetActiveRemoteScheduleServerRequest', '10': 'setActiveRemoteScheduleServerRequest'},
    const {'1': 'setActiveRemoteScheduleServerResponse', '3': 34, '4': 1, '5': 11, '6': '.SetActiveRemoteScheduleServerResponse', '10': 'setActiveRemoteScheduleServerResponse'},
    const {'1': 'getRemoteMultisServerRequest', '3': 35, '4': 1, '5': 11, '6': '.GetRemoteMultisServerRequest', '10': 'getRemoteMultisServerRequest'},
    const {'1': 'getRemoteMultisServerResponse', '3': 36, '4': 1, '5': 11, '6': '.GetRemoteMultisServerResponse', '10': 'getRemoteMultisServerResponse'},
    const {'1': 'addRemoteMultiServerRequest', '3': 37, '4': 1, '5': 11, '6': '.AddRemoteMultiServerRequest', '10': 'addRemoteMultiServerRequest'},
    const {'1': 'addRemoteMultiServerResponse', '3': 38, '4': 1, '5': 11, '6': '.AddRemoteMultiServerResponse', '10': 'addRemoteMultiServerResponse'},
    const {'1': 'deleteRemoteMultiServerRequest', '3': 39, '4': 1, '5': 11, '6': '.DeleteRemoteMultiServerRequest', '10': 'deleteRemoteMultiServerRequest'},
    const {'1': 'deleteRemoteMultiServerResponse', '3': 40, '4': 1, '5': 11, '6': '.DeleteRemoteMultiServerResponse', '10': 'deleteRemoteMultiServerResponse'},
    const {'1': 'addRemoteMultiLibraryCmdServerRequest', '3': 41, '4': 1, '5': 11, '6': '.AddRemoteMultiLibraryCmdServerRequest', '10': 'addRemoteMultiLibraryCmdServerRequest'},
    const {'1': 'addRemoteMultiLibraryCmdServerResponse', '3': 42, '4': 1, '5': 11, '6': '.AddRemoteMultiLibraryCmdServerResponse', '10': 'addRemoteMultiLibraryCmdServerResponse'},
    const {'1': 'deleteRemoteMultiLibraryCmdServerRequest', '3': 43, '4': 1, '5': 11, '6': '.DeleteRemoteMultiLibraryCmdServerRequest', '10': 'deleteRemoteMultiLibraryCmdServerRequest'},
    const {'1': 'deleteRemoteMultiLibraryCmdServerResponse', '3': 44, '4': 1, '5': 11, '6': '.DeleteRemoteMultiLibraryCmdServerResponse', '10': 'deleteRemoteMultiLibraryCmdServerResponse'},
    const {'1': 'updateRemoteMultiLibraryCmdServerRequest', '3': 45, '4': 1, '5': 11, '6': '.UpdateRemoteMultiLibraryCmdServerRequest', '10': 'updateRemoteMultiLibraryCmdServerRequest'},
    const {'1': 'updateRemoteMultiLibraryCmdServerResponse', '3': 46, '4': 1, '5': 11, '6': '.UpdateRemoteMultiLibraryCmdServerResponse', '10': 'updateRemoteMultiLibraryCmdServerResponse'},
    const {'1': 'updateGroupRemoteMultiLibraryCmdServerRequest', '3': 47, '4': 1, '5': 11, '6': '.UpdateGroupRemoteMultiLibraryCmdServerRequest', '10': 'updateGroupRemoteMultiLibraryCmdServerRequest'},
    const {'1': 'updateGroupRemoteMultiLibraryCmdServerResponse', '3': 48, '4': 1, '5': 11, '6': '.UpdateGroupRemoteMultiLibraryCmdServerResponse', '10': 'updateGroupRemoteMultiLibraryCmdServerResponse'},
    const {'1': 'changeRemoteBrandRemoteRequest', '3': 49, '4': 1, '5': 11, '6': '.ChangeRemoteBrandRemoteRequest', '10': 'changeRemoteBrandRemoteRequest'},
    const {'1': 'changeRemoteBrandRemoteResponse', '3': 50, '4': 1, '5': 11, '6': '.ChangeRemoteBrandRemoteResponse', '10': 'changeRemoteBrandRemoteResponse'},
    const {'1': 'controlRemoteACCommandRequest', '3': 51, '4': 1, '5': 11, '6': '.ControlRemoteACCommandRequest', '10': 'controlRemoteACCommandRequest'},
    const {'1': 'controlRemoteACCommandResponse', '3': 52, '4': 1, '5': 11, '6': '.ControlRemoteACCommandResponse', '10': 'controlRemoteACCommandResponse'},
  ],
};

/// Descriptor for `RemoteServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteServerMessageDescriptor = $convert.base64Decode('ChNSZW1vdGVTZXJ2ZXJNZXNzYWdlElIKF2dldFJlbW90ZXNTZXJ2ZXJSZXF1ZXN0GAEgASgLMhguR2V0UmVtb3Rlc1NlcnZlclJlcXVlc3RSF2dldFJlbW90ZXNTZXJ2ZXJSZXF1ZXN0ElUKGGdldFJlbW90ZXNTZXJ2ZXJSZXNwb25zZRgCIAEoCzIZLkdldFJlbW90ZXNTZXJ2ZXJSZXNwb25zZVIYZ2V0UmVtb3Rlc1NlcnZlclJlc3BvbnNlEk8KFmdldFJlbW90ZVNlcnZlclJlcXVlc3QYAyABKAsyFy5HZXRSZW1vdGVTZXJ2ZXJSZXF1ZXN0UhZnZXRSZW1vdGVTZXJ2ZXJSZXF1ZXN0ElIKF2dldFJlbW90ZVNlcnZlclJlc3BvbnNlGAQgASgLMhguR2V0UmVtb3RlU2VydmVyUmVzcG9uc2VSF2dldFJlbW90ZVNlcnZlclJlc3BvbnNlEmoKH2dldFJlbW90ZUxpYnJhcmllc1NlcnZlclJlcXVlc3QYBSABKAsyIC5HZXRSZW1vdGVMaWJyYXJpZXNTZXJ2ZXJSZXF1ZXN0Uh9nZXRSZW1vdGVMaWJyYXJpZXNTZXJ2ZXJSZXF1ZXN0Em0KIGdldFJlbW90ZUxpYnJhcmllc1NlcnZlclJlc3BvbnNlGAYgASgLMiEuR2V0UmVtb3RlTGlicmFyaWVzU2VydmVyUmVzcG9uc2VSIGdldFJlbW90ZUxpYnJhcmllc1NlcnZlclJlc3BvbnNlEmcKHmdldENvbW1hbmRzUmVtb3RlU2VydmVyUmVxdWVzdBgHIAEoCzIfLkdldENvbW1hbmRzUmVtb3RlU2VydmVyUmVxdWVzdFIeZ2V0Q29tbWFuZHNSZW1vdGVTZXJ2ZXJSZXF1ZXN0EmoKH2dldENvbW1hbmRzUmVtb3RlU2VydmVyUmVzcG9uc2UYCCABKAsyIC5HZXRDb21tYW5kc1JlbW90ZVNlcnZlclJlc3BvbnNlUh9nZXRDb21tYW5kc1JlbW90ZVNlcnZlclJlc3BvbnNlEmcKHnNlbmRDb21tYW5kUmVtb3RlU2VydmVyUmVxdWVzdBgJIAEoCzIfLlNlbmRDb21tYW5kUmVtb3RlU2VydmVyUmVxdWVzdFIec2VuZENvbW1hbmRSZW1vdGVTZXJ2ZXJSZXF1ZXN0EmoKH3NlbmRDb21tYW5kUmVtb3RlU2VydmVyUmVzcG9uc2UYCiABKAsyIC5TZW5kQ29tbWFuZFJlbW90ZVNlcnZlclJlc3BvbnNlUh9zZW5kQ29tbWFuZFJlbW90ZVNlcnZlclJlc3BvbnNlEmoKH2xlYXJuQ29tbWFuZFJlbW90ZVNlcnZlclJlcXVlc3QYCyABKAsyIC5MZWFybkNvbW1hbmRSZW1vdGVTZXJ2ZXJSZXF1ZXN0Uh9sZWFybkNvbW1hbmRSZW1vdGVTZXJ2ZXJSZXF1ZXN0Em0KIGxlYXJuQ29tbWFuZFJlbW90ZVNlcnZlclJlc3BvbnNlGAwgASgLMiEuTGVhcm5Db21tYW5kUmVtb3RlU2VydmVyUmVzcG9uc2VSIGxlYXJuQ29tbWFuZFJlbW90ZVNlcnZlclJlc3BvbnNlEnAKIXJlc3RvcmVDb21tYW5kUmVtb3RlU2VydmVyUmVxdWVzdBgNIAEoCzIiLlJlc3RvcmVDb21tYW5kUmVtb3RlU2VydmVyUmVxdWVzdFIhcmVzdG9yZUNvbW1hbmRSZW1vdGVTZXJ2ZXJSZXF1ZXN0EnMKInJlc3RvcmVDb21tYW5kUmVtb3RlU2VydmVyUmVzcG9uc2UYDiABKAsyIy5SZXN0b3JlQ29tbWFuZFJlbW90ZVNlcnZlclJlc3BvbnNlUiJyZXN0b3JlQ29tbWFuZFJlbW90ZVNlcnZlclJlc3BvbnNlEk8KFmFkZFJlbW90ZVNlcnZlclJlcXVlc3QYDyABKAsyFy5BZGRSZW1vdGVTZXJ2ZXJSZXF1ZXN0UhZhZGRSZW1vdGVTZXJ2ZXJSZXF1ZXN0ElIKF2FkZFJlbW90ZVNlcnZlclJlc3BvbnNlGBAgASgLMhguQWRkUmVtb3RlU2VydmVyUmVzcG9uc2VSF2FkZFJlbW90ZVNlcnZlclJlc3BvbnNlElgKGXVwZGF0ZVJlbW90ZVNlcnZlclJlcXVlc3QYESABKAsyGi5VcGRhdGVSZW1vdGVTZXJ2ZXJSZXF1ZXN0Uhl1cGRhdGVSZW1vdGVTZXJ2ZXJSZXF1ZXN0ElsKGnVwZGF0ZVJlbW90ZVNlcnZlclJlc3BvbnNlGBIgASgLMhsuVXBkYXRlUmVtb3RlU2VydmVyUmVzcG9uc2VSGnVwZGF0ZVJlbW90ZVNlcnZlclJlc3BvbnNlElgKGWRlbGV0ZVJlbW90ZVNlcnZlclJlcXVlc3QYEyABKAsyGi5EZWxldGVSZW1vdGVTZXJ2ZXJSZXF1ZXN0UhlkZWxldGVSZW1vdGVTZXJ2ZXJSZXF1ZXN0ElsKGmRlbGV0ZVJlbW90ZVNlcnZlclJlc3BvbnNlGBQgASgLMhsuRGVsZXRlUmVtb3RlU2VydmVyUmVzcG9uc2VSGmRlbGV0ZVJlbW90ZVNlcnZlclJlc3BvbnNlEmoKH2dldFJlbW90ZVNjaGVkdWxlc1NlcnZlclJlcXVlc3QYFSABKAsyIC5HZXRSZW1vdGVTY2hlZHVsZXNTZXJ2ZXJSZXF1ZXN0Uh9nZXRSZW1vdGVTY2hlZHVsZXNTZXJ2ZXJSZXF1ZXN0Em0KIGdldFJlbW90ZVNjaGVkdWxlc1NlcnZlclJlc3BvbnNlGBYgASgLMiEuR2V0UmVtb3RlU2NoZWR1bGVzU2VydmVyUmVzcG9uc2VSIGdldFJlbW90ZVNjaGVkdWxlc1NlcnZlclJlc3BvbnNlEnYKI2dldENvdW50UmVtb3RlU2NoZWR1bGVTZXJ2ZXJSZXF1ZXN0GBcgASgLMiQuR2V0Q291bnRSZW1vdGVTY2hlZHVsZVNlcnZlclJlcXVlc3RSI2dldENvdW50UmVtb3RlU2NoZWR1bGVTZXJ2ZXJSZXF1ZXN0EnkKJGdldENvdW50UmVtb3RlU2NoZWR1bGVTZXJ2ZXJSZXNwb25zZRgYIAEoCzIlLkdldENvdW50UmVtb3RlU2NoZWR1bGVTZXJ2ZXJSZXNwb25zZVIkZ2V0Q291bnRSZW1vdGVTY2hlZHVsZVNlcnZlclJlc3BvbnNlEmcKHmdldFJlbW90ZVNjaGVkdWxlU2VydmVyUmVxdWVzdBgZIAEoCzIfLkdldFJlbW90ZVNjaGVkdWxlU2VydmVyUmVxdWVzdFIeZ2V0UmVtb3RlU2NoZWR1bGVTZXJ2ZXJSZXF1ZXN0EmoKH2dldFJlbW90ZVNjaGVkdWxlU2VydmVyUmVzcG9uc2UYGiABKAsyIC5HZXRSZW1vdGVTY2hlZHVsZVNlcnZlclJlc3BvbnNlUh9nZXRSZW1vdGVTY2hlZHVsZVNlcnZlclJlc3BvbnNlEmcKHmFkZFJlbW90ZVNjaGVkdWxlU2VydmVyUmVxdWVzdBgbIAEoCzIfLkFkZFJlbW90ZVNjaGVkdWxlU2VydmVyUmVxdWVzdFIeYWRkUmVtb3RlU2NoZWR1bGVTZXJ2ZXJSZXF1ZXN0EmoKH2FkZFJlbW90ZVNjaGVkdWxlU2VydmVyUmVzcG9uc2UYHCABKAsyIC5BZGRSZW1vdGVTY2hlZHVsZVNlcnZlclJlc3BvbnNlUh9hZGRSZW1vdGVTY2hlZHVsZVNlcnZlclJlc3BvbnNlEnAKIXVwZGF0ZVJlbW90ZVNjaGVkdWxlU2VydmVyUmVxdWVzdBgdIAEoCzIiLlVwZGF0ZVJlbW90ZVNjaGVkdWxlU2VydmVyUmVxdWVzdFIhdXBkYXRlUmVtb3RlU2NoZWR1bGVTZXJ2ZXJSZXF1ZXN0EnMKInVwZGF0ZVJlbW90ZVNjaGVkdWxlU2VydmVyUmVzcG9uc2UYHiABKAsyIy5VcGRhdGVSZW1vdGVTY2hlZHVsZVNlcnZlclJlc3BvbnNlUiJ1cGRhdGVSZW1vdGVTY2hlZHVsZVNlcnZlclJlc3BvbnNlEnAKIWRlbGV0ZVJlbW90ZVNjaGVkdWxlU2VydmVyUmVxdWVzdBgfIAEoCzIiLkRlbGV0ZVJlbW90ZVNjaGVkdWxlU2VydmVyUmVxdWVzdFIhZGVsZXRlUmVtb3RlU2NoZWR1bGVTZXJ2ZXJSZXF1ZXN0EnMKImRlbGV0ZVJlbW90ZVNjaGVkdWxlU2VydmVyUmVzcG9uc2UYICABKAsyIy5EZWxldGVSZW1vdGVTY2hlZHVsZVNlcnZlclJlc3BvbnNlUiJkZWxldGVSZW1vdGVTY2hlZHVsZVNlcnZlclJlc3BvbnNlEnkKJHNldEFjdGl2ZVJlbW90ZVNjaGVkdWxlU2VydmVyUmVxdWVzdBghIAEoCzIlLlNldEFjdGl2ZVJlbW90ZVNjaGVkdWxlU2VydmVyUmVxdWVzdFIkc2V0QWN0aXZlUmVtb3RlU2NoZWR1bGVTZXJ2ZXJSZXF1ZXN0EnwKJXNldEFjdGl2ZVJlbW90ZVNjaGVkdWxlU2VydmVyUmVzcG9uc2UYIiABKAsyJi5TZXRBY3RpdmVSZW1vdGVTY2hlZHVsZVNlcnZlclJlc3BvbnNlUiVzZXRBY3RpdmVSZW1vdGVTY2hlZHVsZVNlcnZlclJlc3BvbnNlEmEKHGdldFJlbW90ZU11bHRpc1NlcnZlclJlcXVlc3QYIyABKAsyHS5HZXRSZW1vdGVNdWx0aXNTZXJ2ZXJSZXF1ZXN0UhxnZXRSZW1vdGVNdWx0aXNTZXJ2ZXJSZXF1ZXN0EmQKHWdldFJlbW90ZU11bHRpc1NlcnZlclJlc3BvbnNlGCQgASgLMh4uR2V0UmVtb3RlTXVsdGlzU2VydmVyUmVzcG9uc2VSHWdldFJlbW90ZU11bHRpc1NlcnZlclJlc3BvbnNlEl4KG2FkZFJlbW90ZU11bHRpU2VydmVyUmVxdWVzdBglIAEoCzIcLkFkZFJlbW90ZU11bHRpU2VydmVyUmVxdWVzdFIbYWRkUmVtb3RlTXVsdGlTZXJ2ZXJSZXF1ZXN0EmEKHGFkZFJlbW90ZU11bHRpU2VydmVyUmVzcG9uc2UYJiABKAsyHS5BZGRSZW1vdGVNdWx0aVNlcnZlclJlc3BvbnNlUhxhZGRSZW1vdGVNdWx0aVNlcnZlclJlc3BvbnNlEmcKHmRlbGV0ZVJlbW90ZU11bHRpU2VydmVyUmVxdWVzdBgnIAEoCzIfLkRlbGV0ZVJlbW90ZU11bHRpU2VydmVyUmVxdWVzdFIeZGVsZXRlUmVtb3RlTXVsdGlTZXJ2ZXJSZXF1ZXN0EmoKH2RlbGV0ZVJlbW90ZU11bHRpU2VydmVyUmVzcG9uc2UYKCABKAsyIC5EZWxldGVSZW1vdGVNdWx0aVNlcnZlclJlc3BvbnNlUh9kZWxldGVSZW1vdGVNdWx0aVNlcnZlclJlc3BvbnNlEnwKJWFkZFJlbW90ZU11bHRpTGlicmFyeUNtZFNlcnZlclJlcXVlc3QYKSABKAsyJi5BZGRSZW1vdGVNdWx0aUxpYnJhcnlDbWRTZXJ2ZXJSZXF1ZXN0UiVhZGRSZW1vdGVNdWx0aUxpYnJhcnlDbWRTZXJ2ZXJSZXF1ZXN0En8KJmFkZFJlbW90ZU11bHRpTGlicmFyeUNtZFNlcnZlclJlc3BvbnNlGCogASgLMicuQWRkUmVtb3RlTXVsdGlMaWJyYXJ5Q21kU2VydmVyUmVzcG9uc2VSJmFkZFJlbW90ZU11bHRpTGlicmFyeUNtZFNlcnZlclJlc3BvbnNlEoUBCihkZWxldGVSZW1vdGVNdWx0aUxpYnJhcnlDbWRTZXJ2ZXJSZXF1ZXN0GCsgASgLMikuRGVsZXRlUmVtb3RlTXVsdGlMaWJyYXJ5Q21kU2VydmVyUmVxdWVzdFIoZGVsZXRlUmVtb3RlTXVsdGlMaWJyYXJ5Q21kU2VydmVyUmVxdWVzdBKIAQopZGVsZXRlUmVtb3RlTXVsdGlMaWJyYXJ5Q21kU2VydmVyUmVzcG9uc2UYLCABKAsyKi5EZWxldGVSZW1vdGVNdWx0aUxpYnJhcnlDbWRTZXJ2ZXJSZXNwb25zZVIpZGVsZXRlUmVtb3RlTXVsdGlMaWJyYXJ5Q21kU2VydmVyUmVzcG9uc2UShQEKKHVwZGF0ZVJlbW90ZU11bHRpTGlicmFyeUNtZFNlcnZlclJlcXVlc3QYLSABKAsyKS5VcGRhdGVSZW1vdGVNdWx0aUxpYnJhcnlDbWRTZXJ2ZXJSZXF1ZXN0Uih1cGRhdGVSZW1vdGVNdWx0aUxpYnJhcnlDbWRTZXJ2ZXJSZXF1ZXN0EogBCil1cGRhdGVSZW1vdGVNdWx0aUxpYnJhcnlDbWRTZXJ2ZXJSZXNwb25zZRguIAEoCzIqLlVwZGF0ZVJlbW90ZU11bHRpTGlicmFyeUNtZFNlcnZlclJlc3BvbnNlUil1cGRhdGVSZW1vdGVNdWx0aUxpYnJhcnlDbWRTZXJ2ZXJSZXNwb25zZRKUAQotdXBkYXRlR3JvdXBSZW1vdGVNdWx0aUxpYnJhcnlDbWRTZXJ2ZXJSZXF1ZXN0GC8gASgLMi4uVXBkYXRlR3JvdXBSZW1vdGVNdWx0aUxpYnJhcnlDbWRTZXJ2ZXJSZXF1ZXN0Ui11cGRhdGVHcm91cFJlbW90ZU11bHRpTGlicmFyeUNtZFNlcnZlclJlcXVlc3QSlwEKLnVwZGF0ZUdyb3VwUmVtb3RlTXVsdGlMaWJyYXJ5Q21kU2VydmVyUmVzcG9uc2UYMCABKAsyLy5VcGRhdGVHcm91cFJlbW90ZU11bHRpTGlicmFyeUNtZFNlcnZlclJlc3BvbnNlUi51cGRhdGVHcm91cFJlbW90ZU11bHRpTGlicmFyeUNtZFNlcnZlclJlc3BvbnNlEmcKHmNoYW5nZVJlbW90ZUJyYW5kUmVtb3RlUmVxdWVzdBgxIAEoCzIfLkNoYW5nZVJlbW90ZUJyYW5kUmVtb3RlUmVxdWVzdFIeY2hhbmdlUmVtb3RlQnJhbmRSZW1vdGVSZXF1ZXN0EmoKH2NoYW5nZVJlbW90ZUJyYW5kUmVtb3RlUmVzcG9uc2UYMiABKAsyIC5DaGFuZ2VSZW1vdGVCcmFuZFJlbW90ZVJlc3BvbnNlUh9jaGFuZ2VSZW1vdGVCcmFuZFJlbW90ZVJlc3BvbnNlEmQKHWNvbnRyb2xSZW1vdGVBQ0NvbW1hbmRSZXF1ZXN0GDMgASgLMh4uQ29udHJvbFJlbW90ZUFDQ29tbWFuZFJlcXVlc3RSHWNvbnRyb2xSZW1vdGVBQ0NvbW1hbmRSZXF1ZXN0EmcKHmNvbnRyb2xSZW1vdGVBQ0NvbW1hbmRSZXNwb25zZRg0IAEoCzIfLkNvbnRyb2xSZW1vdGVBQ0NvbW1hbmRSZXNwb25zZVIeY29udHJvbFJlbW90ZUFDQ29tbWFuZFJlc3BvbnNl');
@$core.Deprecated('Use sceneServerMessageDescriptor instead')
const SceneServerMessage$json = const {
  '1': 'SceneServerMessage',
  '2': const [
    const {'1': 'getScenesServerRequest', '3': 1, '4': 1, '5': 11, '6': '.GetScenesServerRequest', '10': 'getScenesServerRequest'},
    const {'1': 'getScenesServerResponse', '3': 2, '4': 1, '5': 11, '6': '.GetScenesServerResponse', '10': 'getScenesServerResponse'},
    const {'1': 'getSceneServerRequest', '3': 3, '4': 1, '5': 11, '6': '.GetSceneServerRequest', '10': 'getSceneServerRequest'},
    const {'1': 'getSceneServerResponse', '3': 4, '4': 1, '5': 11, '6': '.GetSceneServerResponse', '10': 'getSceneServerResponse'},
    const {'1': 'addSceneServerRequest', '3': 5, '4': 1, '5': 11, '6': '.AddSceneServerRequest', '10': 'addSceneServerRequest'},
    const {'1': 'addSceneServerResponse', '3': 6, '4': 1, '5': 11, '6': '.AddSceneServerResponse', '10': 'addSceneServerResponse'},
    const {'1': 'updateSceneServerRequest', '3': 7, '4': 1, '5': 11, '6': '.UpdateSceneServerRequest', '10': 'updateSceneServerRequest'},
    const {'1': 'updateSceneServerResponse', '3': 8, '4': 1, '5': 11, '6': '.UpdateSceneServerResponse', '10': 'updateSceneServerResponse'},
    const {'1': 'deleteSceneServerRequest', '3': 9, '4': 1, '5': 11, '6': '.DeleteSceneServerRequest', '10': 'deleteSceneServerRequest'},
    const {'1': 'deleteSceneServerResponse', '3': 10, '4': 1, '5': 11, '6': '.DeleteSceneServerResponse', '10': 'deleteSceneServerResponse'},
    const {'1': 'deleteSwitcherConditionServerRequest', '3': 11, '4': 1, '5': 11, '6': '.DeleteSwitcherConditionServerRequest', '10': 'deleteSwitcherConditionServerRequest'},
    const {'1': 'deleteSwitcherConditionServerResponse', '3': 12, '4': 1, '5': 11, '6': '.DeleteSwitcherConditionServerResponse', '10': 'deleteSwitcherConditionServerResponse'},
    const {'1': 'deleteSceneActionServerRequest', '3': 13, '4': 1, '5': 11, '6': '.DeleteSceneActionServerRequest', '10': 'deleteSceneActionServerRequest'},
    const {'1': 'deleteSceneActionServerResponse', '3': 14, '4': 1, '5': 11, '6': '.DeleteSceneActionServerResponse', '10': 'deleteSceneActionServerResponse'},
    const {'1': 'runSceneServerRequest', '3': 15, '4': 1, '5': 11, '6': '.RunSceneServerRequest', '10': 'runSceneServerRequest'},
    const {'1': 'runSceneServerResponse', '3': 16, '4': 1, '5': 11, '6': '.RunSceneServerResponse', '10': 'runSceneServerResponse'},
    const {'1': 'sceneServerRequest', '3': 17, '4': 1, '5': 11, '6': '.SceneServerRequest', '10': 'sceneServerRequest'},
    const {'1': 'sceneServerResponse', '3': 18, '4': 1, '5': 11, '6': '.SceneServerResponse', '10': 'sceneServerResponse'},
    const {'1': 'sceneRetryConfirmServerRequest', '3': 19, '4': 1, '5': 11, '6': '.SceneRetryConfirmServerRequest', '10': 'sceneRetryConfirmServerRequest'},
    const {'1': 'sceneRetryConfirmServerResponse', '3': 20, '4': 1, '5': 11, '6': '.SceneRetryConfirmServerResponse', '10': 'sceneRetryConfirmServerResponse'},
    const {'1': 'setSceneStatusServerRequest', '3': 21, '4': 1, '5': 11, '6': '.SetSceneStatusServerRequest', '10': 'setSceneStatusServerRequest'},
    const {'1': 'setSceneStatusServerResponse', '3': 22, '4': 1, '5': 11, '6': '.SetSceneStatusServerResponse', '10': 'setSceneStatusServerResponse'},
    const {'1': 'testSceneServerRequest', '3': 23, '4': 1, '5': 11, '6': '.TestSceneServerRequest', '10': 'testSceneServerRequest'},
    const {'1': 'testSceneServerResponse', '3': 24, '4': 1, '5': 11, '6': '.TestSceneServerResponse', '10': 'testSceneServerResponse'},
    const {'1': 'sceneTriggerRequest', '3': 25, '4': 1, '5': 11, '6': '.SceneTriggerClientRequest', '10': 'sceneTriggerRequest'},
    const {'1': 'sceneTriggerResponse', '3': 26, '4': 1, '5': 11, '6': '.SceneTriggerClientResponse', '10': 'sceneTriggerResponse'},
    const {'1': 'sceneTriggerServerRequest', '3': 27, '4': 1, '5': 11, '6': '.SceneTriggerServerRequest', '10': 'sceneTriggerServerRequest'},
    const {'1': 'sceneTriggerServerResponse', '3': 28, '4': 1, '5': 11, '6': '.SceneTriggerServerResponse', '10': 'sceneTriggerServerResponse'},
  ],
};

/// Descriptor for `SceneServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneServerMessageDescriptor = $convert.base64Decode('ChJTY2VuZVNlcnZlck1lc3NhZ2USTwoWZ2V0U2NlbmVzU2VydmVyUmVxdWVzdBgBIAEoCzIXLkdldFNjZW5lc1NlcnZlclJlcXVlc3RSFmdldFNjZW5lc1NlcnZlclJlcXVlc3QSUgoXZ2V0U2NlbmVzU2VydmVyUmVzcG9uc2UYAiABKAsyGC5HZXRTY2VuZXNTZXJ2ZXJSZXNwb25zZVIXZ2V0U2NlbmVzU2VydmVyUmVzcG9uc2USTAoVZ2V0U2NlbmVTZXJ2ZXJSZXF1ZXN0GAMgASgLMhYuR2V0U2NlbmVTZXJ2ZXJSZXF1ZXN0UhVnZXRTY2VuZVNlcnZlclJlcXVlc3QSTwoWZ2V0U2NlbmVTZXJ2ZXJSZXNwb25zZRgEIAEoCzIXLkdldFNjZW5lU2VydmVyUmVzcG9uc2VSFmdldFNjZW5lU2VydmVyUmVzcG9uc2USTAoVYWRkU2NlbmVTZXJ2ZXJSZXF1ZXN0GAUgASgLMhYuQWRkU2NlbmVTZXJ2ZXJSZXF1ZXN0UhVhZGRTY2VuZVNlcnZlclJlcXVlc3QSTwoWYWRkU2NlbmVTZXJ2ZXJSZXNwb25zZRgGIAEoCzIXLkFkZFNjZW5lU2VydmVyUmVzcG9uc2VSFmFkZFNjZW5lU2VydmVyUmVzcG9uc2USVQoYdXBkYXRlU2NlbmVTZXJ2ZXJSZXF1ZXN0GAcgASgLMhkuVXBkYXRlU2NlbmVTZXJ2ZXJSZXF1ZXN0Uhh1cGRhdGVTY2VuZVNlcnZlclJlcXVlc3QSWAoZdXBkYXRlU2NlbmVTZXJ2ZXJSZXNwb25zZRgIIAEoCzIaLlVwZGF0ZVNjZW5lU2VydmVyUmVzcG9uc2VSGXVwZGF0ZVNjZW5lU2VydmVyUmVzcG9uc2USVQoYZGVsZXRlU2NlbmVTZXJ2ZXJSZXF1ZXN0GAkgASgLMhkuRGVsZXRlU2NlbmVTZXJ2ZXJSZXF1ZXN0UhhkZWxldGVTY2VuZVNlcnZlclJlcXVlc3QSWAoZZGVsZXRlU2NlbmVTZXJ2ZXJSZXNwb25zZRgKIAEoCzIaLkRlbGV0ZVNjZW5lU2VydmVyUmVzcG9uc2VSGWRlbGV0ZVNjZW5lU2VydmVyUmVzcG9uc2USeQokZGVsZXRlU3dpdGNoZXJDb25kaXRpb25TZXJ2ZXJSZXF1ZXN0GAsgASgLMiUuRGVsZXRlU3dpdGNoZXJDb25kaXRpb25TZXJ2ZXJSZXF1ZXN0UiRkZWxldGVTd2l0Y2hlckNvbmRpdGlvblNlcnZlclJlcXVlc3QSfAolZGVsZXRlU3dpdGNoZXJDb25kaXRpb25TZXJ2ZXJSZXNwb25zZRgMIAEoCzImLkRlbGV0ZVN3aXRjaGVyQ29uZGl0aW9uU2VydmVyUmVzcG9uc2VSJWRlbGV0ZVN3aXRjaGVyQ29uZGl0aW9uU2VydmVyUmVzcG9uc2USZwoeZGVsZXRlU2NlbmVBY3Rpb25TZXJ2ZXJSZXF1ZXN0GA0gASgLMh8uRGVsZXRlU2NlbmVBY3Rpb25TZXJ2ZXJSZXF1ZXN0Uh5kZWxldGVTY2VuZUFjdGlvblNlcnZlclJlcXVlc3QSagofZGVsZXRlU2NlbmVBY3Rpb25TZXJ2ZXJSZXNwb25zZRgOIAEoCzIgLkRlbGV0ZVNjZW5lQWN0aW9uU2VydmVyUmVzcG9uc2VSH2RlbGV0ZVNjZW5lQWN0aW9uU2VydmVyUmVzcG9uc2USTAoVcnVuU2NlbmVTZXJ2ZXJSZXF1ZXN0GA8gASgLMhYuUnVuU2NlbmVTZXJ2ZXJSZXF1ZXN0UhVydW5TY2VuZVNlcnZlclJlcXVlc3QSTwoWcnVuU2NlbmVTZXJ2ZXJSZXNwb25zZRgQIAEoCzIXLlJ1blNjZW5lU2VydmVyUmVzcG9uc2VSFnJ1blNjZW5lU2VydmVyUmVzcG9uc2USQwoSc2NlbmVTZXJ2ZXJSZXF1ZXN0GBEgASgLMhMuU2NlbmVTZXJ2ZXJSZXF1ZXN0UhJzY2VuZVNlcnZlclJlcXVlc3QSRgoTc2NlbmVTZXJ2ZXJSZXNwb25zZRgSIAEoCzIULlNjZW5lU2VydmVyUmVzcG9uc2VSE3NjZW5lU2VydmVyUmVzcG9uc2USZwoec2NlbmVSZXRyeUNvbmZpcm1TZXJ2ZXJSZXF1ZXN0GBMgASgLMh8uU2NlbmVSZXRyeUNvbmZpcm1TZXJ2ZXJSZXF1ZXN0Uh5zY2VuZVJldHJ5Q29uZmlybVNlcnZlclJlcXVlc3QSagofc2NlbmVSZXRyeUNvbmZpcm1TZXJ2ZXJSZXNwb25zZRgUIAEoCzIgLlNjZW5lUmV0cnlDb25maXJtU2VydmVyUmVzcG9uc2VSH3NjZW5lUmV0cnlDb25maXJtU2VydmVyUmVzcG9uc2USXgobc2V0U2NlbmVTdGF0dXNTZXJ2ZXJSZXF1ZXN0GBUgASgLMhwuU2V0U2NlbmVTdGF0dXNTZXJ2ZXJSZXF1ZXN0UhtzZXRTY2VuZVN0YXR1c1NlcnZlclJlcXVlc3QSYQocc2V0U2NlbmVTdGF0dXNTZXJ2ZXJSZXNwb25zZRgWIAEoCzIdLlNldFNjZW5lU3RhdHVzU2VydmVyUmVzcG9uc2VSHHNldFNjZW5lU3RhdHVzU2VydmVyUmVzcG9uc2USTwoWdGVzdFNjZW5lU2VydmVyUmVxdWVzdBgXIAEoCzIXLlRlc3RTY2VuZVNlcnZlclJlcXVlc3RSFnRlc3RTY2VuZVNlcnZlclJlcXVlc3QSUgoXdGVzdFNjZW5lU2VydmVyUmVzcG9uc2UYGCABKAsyGC5UZXN0U2NlbmVTZXJ2ZXJSZXNwb25zZVIXdGVzdFNjZW5lU2VydmVyUmVzcG9uc2USTAoTc2NlbmVUcmlnZ2VyUmVxdWVzdBgZIAEoCzIaLlNjZW5lVHJpZ2dlckNsaWVudFJlcXVlc3RSE3NjZW5lVHJpZ2dlclJlcXVlc3QSTwoUc2NlbmVUcmlnZ2VyUmVzcG9uc2UYGiABKAsyGy5TY2VuZVRyaWdnZXJDbGllbnRSZXNwb25zZVIUc2NlbmVUcmlnZ2VyUmVzcG9uc2USWAoZc2NlbmVUcmlnZ2VyU2VydmVyUmVxdWVzdBgbIAEoCzIaLlNjZW5lVHJpZ2dlclNlcnZlclJlcXVlc3RSGXNjZW5lVHJpZ2dlclNlcnZlclJlcXVlc3QSWwoac2NlbmVUcmlnZ2VyU2VydmVyUmVzcG9uc2UYHCABKAsyGy5TY2VuZVRyaWdnZXJTZXJ2ZXJSZXNwb25zZVIac2NlbmVUcmlnZ2VyU2VydmVyUmVzcG9uc2U=');
@$core.Deprecated('Use generalTabServerMessageDescriptor instead')
const GeneralTabServerMessage$json = const {
  '1': 'GeneralTabServerMessage',
  '2': const [
    const {'1': 'getHomeTabServerRequest', '3': 1, '4': 1, '5': 11, '6': '.GetHomeTabServerRequest', '10': 'getHomeTabServerRequest'},
    const {'1': 'getHomeTabServerResponse', '3': 2, '4': 1, '5': 11, '6': '.GetHomeTabServerResponse', '10': 'getHomeTabServerResponse'},
    const {'1': 'getElectricTabServerRequest', '3': 3, '4': 1, '5': 11, '6': '.GetElectricTabServerRequest', '10': 'getElectricTabServerRequest'},
    const {'1': 'getElectricTabServerResponse', '3': 4, '4': 1, '5': 11, '6': '.GetElectricTabServerResponse', '10': 'getElectricTabServerResponse'},
    const {'1': 'getSwitcherTabServerRequest', '3': 5, '4': 1, '5': 11, '6': '.GetSwitcherTabServerRequest', '10': 'getSwitcherTabServerRequest'},
    const {'1': 'getSwitcherTabServerResponse', '3': 6, '4': 1, '5': 11, '6': '.GetSwitcherTabServerResponse', '10': 'getSwitcherTabServerResponse'},
  ],
};

/// Descriptor for `GeneralTabServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generalTabServerMessageDescriptor = $convert.base64Decode('ChdHZW5lcmFsVGFiU2VydmVyTWVzc2FnZRJSChdnZXRIb21lVGFiU2VydmVyUmVxdWVzdBgBIAEoCzIYLkdldEhvbWVUYWJTZXJ2ZXJSZXF1ZXN0UhdnZXRIb21lVGFiU2VydmVyUmVxdWVzdBJVChhnZXRIb21lVGFiU2VydmVyUmVzcG9uc2UYAiABKAsyGS5HZXRIb21lVGFiU2VydmVyUmVzcG9uc2VSGGdldEhvbWVUYWJTZXJ2ZXJSZXNwb25zZRJeChtnZXRFbGVjdHJpY1RhYlNlcnZlclJlcXVlc3QYAyABKAsyHC5HZXRFbGVjdHJpY1RhYlNlcnZlclJlcXVlc3RSG2dldEVsZWN0cmljVGFiU2VydmVyUmVxdWVzdBJhChxnZXRFbGVjdHJpY1RhYlNlcnZlclJlc3BvbnNlGAQgASgLMh0uR2V0RWxlY3RyaWNUYWJTZXJ2ZXJSZXNwb25zZVIcZ2V0RWxlY3RyaWNUYWJTZXJ2ZXJSZXNwb25zZRJeChtnZXRTd2l0Y2hlclRhYlNlcnZlclJlcXVlc3QYBSABKAsyHC5HZXRTd2l0Y2hlclRhYlNlcnZlclJlcXVlc3RSG2dldFN3aXRjaGVyVGFiU2VydmVyUmVxdWVzdBJhChxnZXRTd2l0Y2hlclRhYlNlcnZlclJlc3BvbnNlGAYgASgLMh0uR2V0U3dpdGNoZXJUYWJTZXJ2ZXJSZXNwb25zZVIcZ2V0U3dpdGNoZXJUYWJTZXJ2ZXJSZXNwb25zZQ==');
@$core.Deprecated('Use onChangedServerMessageDescriptor instead')
const OnChangedServerMessage$json = const {
  '1': 'OnChangedServerMessage',
  '2': const [
    const {'1': 'switcherOnChangedServerResponse', '3': 1, '4': 1, '5': 11, '6': '.SwitcherOnChangedServerResponse', '10': 'switcherOnChangedServerResponse'},
    const {'1': 'curtainSwitcherOnChangedServerResponse', '3': 2, '4': 1, '5': 11, '6': '.CurtainSwitcherOnChangedServerResponse', '10': 'curtainSwitcherOnChangedServerResponse'},
    const {'1': 'airConditionerOnChangedServerResponse', '3': 3, '4': 1, '5': 11, '6': '.AirConditionerOnChangedServerResponse', '10': 'airConditionerOnChangedServerResponse'},
    const {'1': 'remoteOnChangedServerResponse', '3': 4, '4': 1, '5': 11, '6': '.RemoteOnChangedServerResponse', '10': 'remoteOnChangedServerResponse'},
    const {'1': 'meterOnChangedServerResponse', '3': 5, '4': 1, '5': 11, '6': '.MeterOnChangedServerResponse', '10': 'meterOnChangedServerResponse'},
    const {'1': 'deviceOnChangedDeviceServerResponse', '3': 6, '4': 1, '5': 11, '6': '.DeviceOnChangedDeviceServerResponse', '10': 'deviceOnChangedDeviceServerResponse'},
    const {'1': 'progressUpdateFirmwareOnChangedDeviceServerResponse', '3': 7, '4': 1, '5': 11, '6': '.ProgressUpdateFirmwareOnChangedDeviceServerResponse', '10': 'progressUpdateFirmwareOnChangedDeviceServerResponse'},
    const {'1': 'downloadFirmwareOnChangedDeviceServerResponse', '3': 8, '4': 1, '5': 11, '6': '.DownloadFirmwareOnChangedDeviceServerResponse', '10': 'downloadFirmwareOnChangedDeviceServerResponse'},
    const {'1': 'motionOnChangedServerResponse', '3': 9, '4': 1, '5': 11, '6': '.MotionOnChangedServerResponse', '10': 'motionOnChangedServerResponse'},
    const {'1': 'sceneOnChangedServerResponse', '3': 10, '4': 1, '5': 11, '6': '.SceneOnChangedServerResponse', '10': 'sceneOnChangedServerResponse'},
    const {'1': 'homekitOnChangedServerResponse', '3': 11, '4': 1, '5': 11, '6': '.HomekitOnChangedServerResponse', '10': 'homekitOnChangedServerResponse'},
    const {'1': 'buttonOnChangedServerResponse', '3': 12, '4': 1, '5': 11, '6': '.ButtonOnChangedServerResponse', '10': 'buttonOnChangedServerResponse'},
    const {'1': 'groupControlOnChangedServerResponse', '3': 13, '4': 1, '5': 11, '6': '.GroupControlOnChangedServerResponse', '10': 'groupControlOnChangedServerResponse'},
    const {'1': 'ledDriverOnChangedServerResponse', '3': 14, '4': 1, '5': 11, '6': '.LedDriverOnChangedServerResponse', '10': 'ledDriverOnChangedServerResponse'},
    const {'1': 'environmentSensorOnChangedServerResponse', '3': 15, '4': 1, '5': 11, '6': '.EnvironmentSensorOnChangedServerResponse', '10': 'environmentSensorOnChangedServerResponse'},
    const {'1': 'smartPlugOnChangedServerResponse', '3': 16, '4': 1, '5': 11, '6': '.SmartPlugOnChangedServerResponse', '10': 'smartPlugOnChangedServerResponse'},
    const {'1': 'curtainOnChangedServerResponse', '3': 17, '4': 1, '5': 11, '6': '.CurtainOnChangedServerResponse', '10': 'curtainOnChangedServerResponse'},
  ],
};

/// Descriptor for `OnChangedServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List onChangedServerMessageDescriptor = $convert.base64Decode('ChZPbkNoYW5nZWRTZXJ2ZXJNZXNzYWdlEmoKH3N3aXRjaGVyT25DaGFuZ2VkU2VydmVyUmVzcG9uc2UYASABKAsyIC5Td2l0Y2hlck9uQ2hhbmdlZFNlcnZlclJlc3BvbnNlUh9zd2l0Y2hlck9uQ2hhbmdlZFNlcnZlclJlc3BvbnNlEn8KJmN1cnRhaW5Td2l0Y2hlck9uQ2hhbmdlZFNlcnZlclJlc3BvbnNlGAIgASgLMicuQ3VydGFpblN3aXRjaGVyT25DaGFuZ2VkU2VydmVyUmVzcG9uc2VSJmN1cnRhaW5Td2l0Y2hlck9uQ2hhbmdlZFNlcnZlclJlc3BvbnNlEnwKJWFpckNvbmRpdGlvbmVyT25DaGFuZ2VkU2VydmVyUmVzcG9uc2UYAyABKAsyJi5BaXJDb25kaXRpb25lck9uQ2hhbmdlZFNlcnZlclJlc3BvbnNlUiVhaXJDb25kaXRpb25lck9uQ2hhbmdlZFNlcnZlclJlc3BvbnNlEmQKHXJlbW90ZU9uQ2hhbmdlZFNlcnZlclJlc3BvbnNlGAQgASgLMh4uUmVtb3RlT25DaGFuZ2VkU2VydmVyUmVzcG9uc2VSHXJlbW90ZU9uQ2hhbmdlZFNlcnZlclJlc3BvbnNlEmEKHG1ldGVyT25DaGFuZ2VkU2VydmVyUmVzcG9uc2UYBSABKAsyHS5NZXRlck9uQ2hhbmdlZFNlcnZlclJlc3BvbnNlUhxtZXRlck9uQ2hhbmdlZFNlcnZlclJlc3BvbnNlEnYKI2RldmljZU9uQ2hhbmdlZERldmljZVNlcnZlclJlc3BvbnNlGAYgASgLMiQuRGV2aWNlT25DaGFuZ2VkRGV2aWNlU2VydmVyUmVzcG9uc2VSI2RldmljZU9uQ2hhbmdlZERldmljZVNlcnZlclJlc3BvbnNlEqYBCjNwcm9ncmVzc1VwZGF0ZUZpcm13YXJlT25DaGFuZ2VkRGV2aWNlU2VydmVyUmVzcG9uc2UYByABKAsyNC5Qcm9ncmVzc1VwZGF0ZUZpcm13YXJlT25DaGFuZ2VkRGV2aWNlU2VydmVyUmVzcG9uc2VSM3Byb2dyZXNzVXBkYXRlRmlybXdhcmVPbkNoYW5nZWREZXZpY2VTZXJ2ZXJSZXNwb25zZRKUAQotZG93bmxvYWRGaXJtd2FyZU9uQ2hhbmdlZERldmljZVNlcnZlclJlc3BvbnNlGAggASgLMi4uRG93bmxvYWRGaXJtd2FyZU9uQ2hhbmdlZERldmljZVNlcnZlclJlc3BvbnNlUi1kb3dubG9hZEZpcm13YXJlT25DaGFuZ2VkRGV2aWNlU2VydmVyUmVzcG9uc2USZAodbW90aW9uT25DaGFuZ2VkU2VydmVyUmVzcG9uc2UYCSABKAsyHi5Nb3Rpb25PbkNoYW5nZWRTZXJ2ZXJSZXNwb25zZVIdbW90aW9uT25DaGFuZ2VkU2VydmVyUmVzcG9uc2USYQocc2NlbmVPbkNoYW5nZWRTZXJ2ZXJSZXNwb25zZRgKIAEoCzIdLlNjZW5lT25DaGFuZ2VkU2VydmVyUmVzcG9uc2VSHHNjZW5lT25DaGFuZ2VkU2VydmVyUmVzcG9uc2USZwoeaG9tZWtpdE9uQ2hhbmdlZFNlcnZlclJlc3BvbnNlGAsgASgLMh8uSG9tZWtpdE9uQ2hhbmdlZFNlcnZlclJlc3BvbnNlUh5ob21la2l0T25DaGFuZ2VkU2VydmVyUmVzcG9uc2USZAodYnV0dG9uT25DaGFuZ2VkU2VydmVyUmVzcG9uc2UYDCABKAsyHi5CdXR0b25PbkNoYW5nZWRTZXJ2ZXJSZXNwb25zZVIdYnV0dG9uT25DaGFuZ2VkU2VydmVyUmVzcG9uc2USdgojZ3JvdXBDb250cm9sT25DaGFuZ2VkU2VydmVyUmVzcG9uc2UYDSABKAsyJC5Hcm91cENvbnRyb2xPbkNoYW5nZWRTZXJ2ZXJSZXNwb25zZVIjZ3JvdXBDb250cm9sT25DaGFuZ2VkU2VydmVyUmVzcG9uc2USbQogbGVkRHJpdmVyT25DaGFuZ2VkU2VydmVyUmVzcG9uc2UYDiABKAsyIS5MZWREcml2ZXJPbkNoYW5nZWRTZXJ2ZXJSZXNwb25zZVIgbGVkRHJpdmVyT25DaGFuZ2VkU2VydmVyUmVzcG9uc2UShQEKKGVudmlyb25tZW50U2Vuc29yT25DaGFuZ2VkU2VydmVyUmVzcG9uc2UYDyABKAsyKS5FbnZpcm9ubWVudFNlbnNvck9uQ2hhbmdlZFNlcnZlclJlc3BvbnNlUihlbnZpcm9ubWVudFNlbnNvck9uQ2hhbmdlZFNlcnZlclJlc3BvbnNlEm0KIHNtYXJ0UGx1Z09uQ2hhbmdlZFNlcnZlclJlc3BvbnNlGBAgASgLMiEuU21hcnRQbHVnT25DaGFuZ2VkU2VydmVyUmVzcG9uc2VSIHNtYXJ0UGx1Z09uQ2hhbmdlZFNlcnZlclJlc3BvbnNlEmcKHmN1cnRhaW5PbkNoYW5nZWRTZXJ2ZXJSZXNwb25zZRgRIAEoCzIfLkN1cnRhaW5PbkNoYW5nZWRTZXJ2ZXJSZXNwb25zZVIeY3VydGFpbk9uQ2hhbmdlZFNlcnZlclJlc3BvbnNl');
@$core.Deprecated('Use simulatorServerMessageDescriptor instead')
const SimulatorServerMessage$json = const {
  '1': 'SimulatorServerMessage',
  '2': const [
    const {'1': 'echoServerRequest', '3': 1, '4': 1, '5': 11, '6': '.EchoServerRequest', '10': 'echoServerRequest'},
    const {'1': 'echoServerResponse', '3': 2, '4': 1, '5': 11, '6': '.EchoServerResponse', '10': 'echoServerResponse'},
  ],
};

/// Descriptor for `SimulatorServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List simulatorServerMessageDescriptor = $convert.base64Decode('ChZTaW11bGF0b3JTZXJ2ZXJNZXNzYWdlEkAKEWVjaG9TZXJ2ZXJSZXF1ZXN0GAEgASgLMhIuRWNob1NlcnZlclJlcXVlc3RSEWVjaG9TZXJ2ZXJSZXF1ZXN0EkMKEmVjaG9TZXJ2ZXJSZXNwb25zZRgCIAEoCzITLkVjaG9TZXJ2ZXJSZXNwb25zZVISZWNob1NlcnZlclJlc3BvbnNl');
@$core.Deprecated('Use motionServerMessageDescriptor instead')
const MotionServerMessage$json = const {
  '1': 'MotionServerMessage',
  '2': const [
    const {'1': 'motionServerRequest', '3': 1, '4': 1, '5': 11, '6': '.MotionServerRequest', '10': 'motionServerRequest'},
    const {'1': 'motionServerResponse', '3': 2, '4': 1, '5': 11, '6': '.MotionServerResponse', '10': 'motionServerResponse'},
    const {'1': 'getMotionServerRequest', '3': 3, '4': 1, '5': 11, '6': '.GetMotionServerRequest', '10': 'getMotionServerRequest'},
    const {'1': 'getMotionServerResponse', '3': 4, '4': 1, '5': 11, '6': '.GetMotionServerResponse', '10': 'getMotionServerResponse'},
    const {'1': 'updateMotionServerRequest', '3': 5, '4': 1, '5': 11, '6': '.UpdateMotionServerRequest', '10': 'updateMotionServerRequest'},
    const {'1': 'updateMotionServerResponse', '3': 6, '4': 1, '5': 11, '6': '.UpdateMotionServerResponse', '10': 'updateMotionServerResponse'},
  ],
};

/// Descriptor for `MotionServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List motionServerMessageDescriptor = $convert.base64Decode('ChNNb3Rpb25TZXJ2ZXJNZXNzYWdlEkYKE21vdGlvblNlcnZlclJlcXVlc3QYASABKAsyFC5Nb3Rpb25TZXJ2ZXJSZXF1ZXN0UhNtb3Rpb25TZXJ2ZXJSZXF1ZXN0EkkKFG1vdGlvblNlcnZlclJlc3BvbnNlGAIgASgLMhUuTW90aW9uU2VydmVyUmVzcG9uc2VSFG1vdGlvblNlcnZlclJlc3BvbnNlEk8KFmdldE1vdGlvblNlcnZlclJlcXVlc3QYAyABKAsyFy5HZXRNb3Rpb25TZXJ2ZXJSZXF1ZXN0UhZnZXRNb3Rpb25TZXJ2ZXJSZXF1ZXN0ElIKF2dldE1vdGlvblNlcnZlclJlc3BvbnNlGAQgASgLMhguR2V0TW90aW9uU2VydmVyUmVzcG9uc2VSF2dldE1vdGlvblNlcnZlclJlc3BvbnNlElgKGXVwZGF0ZU1vdGlvblNlcnZlclJlcXVlc3QYBSABKAsyGi5VcGRhdGVNb3Rpb25TZXJ2ZXJSZXF1ZXN0Uhl1cGRhdGVNb3Rpb25TZXJ2ZXJSZXF1ZXN0ElsKGnVwZGF0ZU1vdGlvblNlcnZlclJlc3BvbnNlGAYgASgLMhsuVXBkYXRlTW90aW9uU2VydmVyUmVzcG9uc2VSGnVwZGF0ZU1vdGlvblNlcnZlclJlc3BvbnNl');
@$core.Deprecated('Use homekitServerMessageDescriptor instead')
const HomekitServerMessage$json = const {
  '1': 'HomekitServerMessage',
  '2': const [
    const {'1': 'getHomekitInfoServerRequest', '3': 1, '4': 1, '5': 11, '6': '.GetHomekitInfoServerRequest', '10': 'getHomekitInfoServerRequest'},
    const {'1': 'getHomekitInfoServerResponse', '3': 2, '4': 1, '5': 11, '6': '.GetHomekitInfoServerResponse', '10': 'getHomekitInfoServerResponse'},
    const {'1': 'updateHomekitServerRequest', '3': 3, '4': 1, '5': 11, '6': '.UpdateHomekitServerRequest', '10': 'updateHomekitServerRequest'},
    const {'1': 'updateHomekitServerResponse', '3': 4, '4': 1, '5': 11, '6': '.UpdateHomekitServerResponse', '10': 'updateHomekitServerResponse'},
    const {'1': 'setHomekitModeServerRequest', '3': 5, '4': 1, '5': 11, '6': '.SetHomekitModeServerRequest', '10': 'setHomekitModeServerRequest'},
    const {'1': 'setHomekitModeServerResponse', '3': 6, '4': 1, '5': 11, '6': '.SetHomekitModeServerResponse', '10': 'setHomekitModeServerResponse'},
  ],
};

/// Descriptor for `HomekitServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List homekitServerMessageDescriptor = $convert.base64Decode('ChRIb21la2l0U2VydmVyTWVzc2FnZRJeChtnZXRIb21la2l0SW5mb1NlcnZlclJlcXVlc3QYASABKAsyHC5HZXRIb21la2l0SW5mb1NlcnZlclJlcXVlc3RSG2dldEhvbWVraXRJbmZvU2VydmVyUmVxdWVzdBJhChxnZXRIb21la2l0SW5mb1NlcnZlclJlc3BvbnNlGAIgASgLMh0uR2V0SG9tZWtpdEluZm9TZXJ2ZXJSZXNwb25zZVIcZ2V0SG9tZWtpdEluZm9TZXJ2ZXJSZXNwb25zZRJbChp1cGRhdGVIb21la2l0U2VydmVyUmVxdWVzdBgDIAEoCzIbLlVwZGF0ZUhvbWVraXRTZXJ2ZXJSZXF1ZXN0Uhp1cGRhdGVIb21la2l0U2VydmVyUmVxdWVzdBJeCht1cGRhdGVIb21la2l0U2VydmVyUmVzcG9uc2UYBCABKAsyHC5VcGRhdGVIb21la2l0U2VydmVyUmVzcG9uc2VSG3VwZGF0ZUhvbWVraXRTZXJ2ZXJSZXNwb25zZRJeChtzZXRIb21la2l0TW9kZVNlcnZlclJlcXVlc3QYBSABKAsyHC5TZXRIb21la2l0TW9kZVNlcnZlclJlcXVlc3RSG3NldEhvbWVraXRNb2RlU2VydmVyUmVxdWVzdBJhChxzZXRIb21la2l0TW9kZVNlcnZlclJlc3BvbnNlGAYgASgLMh0uU2V0SG9tZWtpdE1vZGVTZXJ2ZXJSZXNwb25zZVIcc2V0SG9tZWtpdE1vZGVTZXJ2ZXJSZXNwb25zZQ==');
@$core.Deprecated('Use projectServerMessageDescriptor instead')
const ProjectServerMessage$json = const {
  '1': 'ProjectServerMessage',
  '2': const [
    const {'1': 'getProjectsServerRequest', '3': 1, '4': 1, '5': 11, '6': '.GetProjectsServerRequest', '10': 'getProjectsServerRequest'},
    const {'1': 'getProjectsServerResponse', '3': 2, '4': 1, '5': 11, '6': '.GetProjectsServerResponse', '10': 'getProjectsServerResponse'},
  ],
};

/// Descriptor for `ProjectServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectServerMessageDescriptor = $convert.base64Decode('ChRQcm9qZWN0U2VydmVyTWVzc2FnZRJVChhnZXRQcm9qZWN0c1NlcnZlclJlcXVlc3QYASABKAsyGS5HZXRQcm9qZWN0c1NlcnZlclJlcXVlc3RSGGdldFByb2plY3RzU2VydmVyUmVxdWVzdBJYChlnZXRQcm9qZWN0c1NlcnZlclJlc3BvbnNlGAIgASgLMhouR2V0UHJvamVjdHNTZXJ2ZXJSZXNwb25zZVIZZ2V0UHJvamVjdHNTZXJ2ZXJSZXNwb25zZQ==');
@$core.Deprecated('Use buildingServerMessageDescriptor instead')
const BuildingServerMessage$json = const {
  '1': 'BuildingServerMessage',
  '2': const [
    const {'1': 'getBuildingsServerRequest', '3': 1, '4': 1, '5': 11, '6': '.GetBuildingsServerRequest', '10': 'getBuildingsServerRequest'},
    const {'1': 'getBuildingsServerResponse', '3': 2, '4': 1, '5': 11, '6': '.GetBuildingsServerResponse', '10': 'getBuildingsServerResponse'},
  ],
};

/// Descriptor for `BuildingServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buildingServerMessageDescriptor = $convert.base64Decode('ChVCdWlsZGluZ1NlcnZlck1lc3NhZ2USWAoZZ2V0QnVpbGRpbmdzU2VydmVyUmVxdWVzdBgBIAEoCzIaLkdldEJ1aWxkaW5nc1NlcnZlclJlcXVlc3RSGWdldEJ1aWxkaW5nc1NlcnZlclJlcXVlc3QSWwoaZ2V0QnVpbGRpbmdzU2VydmVyUmVzcG9uc2UYAiABKAsyGy5HZXRCdWlsZGluZ3NTZXJ2ZXJSZXNwb25zZVIaZ2V0QnVpbGRpbmdzU2VydmVyUmVzcG9uc2U=');
@$core.Deprecated('Use floorServerMessageDescriptor instead')
const FloorServerMessage$json = const {
  '1': 'FloorServerMessage',
  '2': const [
    const {'1': 'getFloorsServerRequest', '3': 1, '4': 1, '5': 11, '6': '.GetFloorsServerRequest', '10': 'getFloorsServerRequest'},
    const {'1': 'getFloorsServerResponse', '3': 2, '4': 1, '5': 11, '6': '.GetFloorsServerResponse', '10': 'getFloorsServerResponse'},
  ],
};

/// Descriptor for `FloorServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List floorServerMessageDescriptor = $convert.base64Decode('ChJGbG9vclNlcnZlck1lc3NhZ2USTwoWZ2V0Rmxvb3JzU2VydmVyUmVxdWVzdBgBIAEoCzIXLkdldEZsb29yc1NlcnZlclJlcXVlc3RSFmdldEZsb29yc1NlcnZlclJlcXVlc3QSUgoXZ2V0Rmxvb3JzU2VydmVyUmVzcG9uc2UYAiABKAsyGC5HZXRGbG9vcnNTZXJ2ZXJSZXNwb25zZVIXZ2V0Rmxvb3JzU2VydmVyUmVzcG9uc2U=');
@$core.Deprecated('Use apartmentServerMessageDescriptor instead')
const ApartmentServerMessage$json = const {
  '1': 'ApartmentServerMessage',
  '2': const [
    const {'1': 'getApartmentsServerRequest', '3': 1, '4': 1, '5': 11, '6': '.GetApartmentsServerRequest', '10': 'getApartmentsServerRequest'},
    const {'1': 'getApartmentsServerResponse', '3': 2, '4': 1, '5': 11, '6': '.GetApartmentsServerResponse', '10': 'getApartmentsServerResponse'},
  ],
};

/// Descriptor for `ApartmentServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List apartmentServerMessageDescriptor = $convert.base64Decode('ChZBcGFydG1lbnRTZXJ2ZXJNZXNzYWdlElsKGmdldEFwYXJ0bWVudHNTZXJ2ZXJSZXF1ZXN0GAEgASgLMhsuR2V0QXBhcnRtZW50c1NlcnZlclJlcXVlc3RSGmdldEFwYXJ0bWVudHNTZXJ2ZXJSZXF1ZXN0El4KG2dldEFwYXJ0bWVudHNTZXJ2ZXJSZXNwb25zZRgCIAEoCzIcLkdldEFwYXJ0bWVudHNTZXJ2ZXJSZXNwb25zZVIbZ2V0QXBhcnRtZW50c1NlcnZlclJlc3BvbnNl');
@$core.Deprecated('Use userHomeServerMessageDescriptor instead')
const UserHomeServerMessage$json = const {
  '1': 'UserHomeServerMessage',
  '2': const [
    const {'1': 'addUserHomeServerRequest', '3': 1, '4': 1, '5': 11, '6': '.AddUserHomeServerRequest', '10': 'addUserHomeServerRequest'},
    const {'1': 'addUserHomeServerResponse', '3': 2, '4': 1, '5': 11, '6': '.AddUserHomeServerResponse', '10': 'addUserHomeServerResponse'},
    const {'1': 'deleteUserHomeServerRequest', '3': 3, '4': 1, '5': 11, '6': '.DeleteUserHomeServerRequest', '10': 'deleteUserHomeServerRequest'},
    const {'1': 'deleteUserHomeServerResponse', '3': 4, '4': 1, '5': 11, '6': '.DeleteUserHomeServerResponse', '10': 'deleteUserHomeServerResponse'},
  ],
};

/// Descriptor for `UserHomeServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userHomeServerMessageDescriptor = $convert.base64Decode('ChVVc2VySG9tZVNlcnZlck1lc3NhZ2USVQoYYWRkVXNlckhvbWVTZXJ2ZXJSZXF1ZXN0GAEgASgLMhkuQWRkVXNlckhvbWVTZXJ2ZXJSZXF1ZXN0UhhhZGRVc2VySG9tZVNlcnZlclJlcXVlc3QSWAoZYWRkVXNlckhvbWVTZXJ2ZXJSZXNwb25zZRgCIAEoCzIaLkFkZFVzZXJIb21lU2VydmVyUmVzcG9uc2VSGWFkZFVzZXJIb21lU2VydmVyUmVzcG9uc2USXgobZGVsZXRlVXNlckhvbWVTZXJ2ZXJSZXF1ZXN0GAMgASgLMhwuRGVsZXRlVXNlckhvbWVTZXJ2ZXJSZXF1ZXN0UhtkZWxldGVVc2VySG9tZVNlcnZlclJlcXVlc3QSYQocZGVsZXRlVXNlckhvbWVTZXJ2ZXJSZXNwb25zZRgEIAEoCzIdLkRlbGV0ZVVzZXJIb21lU2VydmVyUmVzcG9uc2VSHGRlbGV0ZVVzZXJIb21lU2VydmVyUmVzcG9uc2U=');
@$core.Deprecated('Use inboxServerMessageDescriptor instead')
const InboxServerMessage$json = const {
  '1': 'InboxServerMessage',
  '2': const [
    const {'1': 'getUnreadServerRequest', '3': 1, '4': 1, '5': 11, '6': '.GetUnreadServerRequest', '10': 'getUnreadServerRequest'},
    const {'1': 'getUnreadServerResponse', '3': 2, '4': 1, '5': 11, '6': '.GetUnreadServerResponse', '10': 'getUnreadServerResponse'},
    const {'1': 'setReadServerRequest', '3': 3, '4': 1, '5': 11, '6': '.SetReadServerRequest', '10': 'setReadServerRequest'},
    const {'1': 'setReadServerResponse', '3': 4, '4': 1, '5': 11, '6': '.SetReadServerResponse', '10': 'setReadServerResponse'},
  ],
};

/// Descriptor for `InboxServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inboxServerMessageDescriptor = $convert.base64Decode('ChJJbmJveFNlcnZlck1lc3NhZ2USTwoWZ2V0VW5yZWFkU2VydmVyUmVxdWVzdBgBIAEoCzIXLkdldFVucmVhZFNlcnZlclJlcXVlc3RSFmdldFVucmVhZFNlcnZlclJlcXVlc3QSUgoXZ2V0VW5yZWFkU2VydmVyUmVzcG9uc2UYAiABKAsyGC5HZXRVbnJlYWRTZXJ2ZXJSZXNwb25zZVIXZ2V0VW5yZWFkU2VydmVyUmVzcG9uc2USSQoUc2V0UmVhZFNlcnZlclJlcXVlc3QYAyABKAsyFS5TZXRSZWFkU2VydmVyUmVxdWVzdFIUc2V0UmVhZFNlcnZlclJlcXVlc3QSTAoVc2V0UmVhZFNlcnZlclJlc3BvbnNlGAQgASgLMhYuU2V0UmVhZFNlcnZlclJlc3BvbnNlUhVzZXRSZWFkU2VydmVyUmVzcG9uc2U=');
@$core.Deprecated('Use settingServerMessageDescriptor instead')
const SettingServerMessage$json = const {
  '1': 'SettingServerMessage',
  '2': const [
    const {'1': 'getBackgroundsServerRequest', '3': 1, '4': 1, '5': 11, '6': '.GetBackgroundsServerRequest', '10': 'getBackgroundsServerRequest'},
    const {'1': 'getBackgroundsServerResponse', '3': 2, '4': 1, '5': 11, '6': '.GetBackgroundsServerResponse', '10': 'getBackgroundsServerResponse'},
    const {'1': 'getAutoOffsServerRequest', '3': 3, '4': 1, '5': 11, '6': '.GetAutoOffsServerRequest', '10': 'getAutoOffsServerRequest'},
    const {'1': 'getAutoOffsServerResponse', '3': 4, '4': 1, '5': 11, '6': '.GetAutoOffsServerResponse', '10': 'getAutoOffsServerResponse'},
    const {'1': 'getTypeDevicesServerRequest', '3': 5, '4': 1, '5': 11, '6': '.GetTypeDevicesServerRequest', '10': 'getTypeDevicesServerRequest'},
    const {'1': 'getTypeDevicesServerResponse', '3': 6, '4': 1, '5': 11, '6': '.GetTypeDevicesServerResponse', '10': 'getTypeDevicesServerResponse'},
  ],
};

/// Descriptor for `SettingServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List settingServerMessageDescriptor = $convert.base64Decode('ChRTZXR0aW5nU2VydmVyTWVzc2FnZRJeChtnZXRCYWNrZ3JvdW5kc1NlcnZlclJlcXVlc3QYASABKAsyHC5HZXRCYWNrZ3JvdW5kc1NlcnZlclJlcXVlc3RSG2dldEJhY2tncm91bmRzU2VydmVyUmVxdWVzdBJhChxnZXRCYWNrZ3JvdW5kc1NlcnZlclJlc3BvbnNlGAIgASgLMh0uR2V0QmFja2dyb3VuZHNTZXJ2ZXJSZXNwb25zZVIcZ2V0QmFja2dyb3VuZHNTZXJ2ZXJSZXNwb25zZRJVChhnZXRBdXRvT2Zmc1NlcnZlclJlcXVlc3QYAyABKAsyGS5HZXRBdXRvT2Zmc1NlcnZlclJlcXVlc3RSGGdldEF1dG9PZmZzU2VydmVyUmVxdWVzdBJYChlnZXRBdXRvT2Zmc1NlcnZlclJlc3BvbnNlGAQgASgLMhouR2V0QXV0b09mZnNTZXJ2ZXJSZXNwb25zZVIZZ2V0QXV0b09mZnNTZXJ2ZXJSZXNwb25zZRJeChtnZXRUeXBlRGV2aWNlc1NlcnZlclJlcXVlc3QYBSABKAsyHC5HZXRUeXBlRGV2aWNlc1NlcnZlclJlcXVlc3RSG2dldFR5cGVEZXZpY2VzU2VydmVyUmVxdWVzdBJhChxnZXRUeXBlRGV2aWNlc1NlcnZlclJlc3BvbnNlGAYgASgLMh0uR2V0VHlwZURldmljZXNTZXJ2ZXJSZXNwb25zZVIcZ2V0VHlwZURldmljZXNTZXJ2ZXJSZXNwb25zZQ==');
@$core.Deprecated('Use buttonServerMessageDescriptor instead')
const ButtonServerMessage$json = const {
  '1': 'ButtonServerMessage',
  '2': const [
    const {'1': 'getButtonInfoServerRequest', '3': 1, '4': 1, '5': 11, '6': '.GetButtonInfoServerRequest', '10': 'getButtonInfoServerRequest'},
    const {'1': 'getButtonInfoServerResponse', '3': 2, '4': 1, '5': 11, '6': '.GetButtonInfoServerResponse', '10': 'getButtonInfoServerResponse'},
    const {'1': 'updateButtonServerRequest', '3': 3, '4': 1, '5': 11, '6': '.UpdateButtonServerRequest', '10': 'updateButtonServerRequest'},
    const {'1': 'updateButtonServerResponse', '3': 4, '4': 1, '5': 11, '6': '.UpdateButtonServerResponse', '10': 'updateButtonServerResponse'},
  ],
};

/// Descriptor for `ButtonServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buttonServerMessageDescriptor = $convert.base64Decode('ChNCdXR0b25TZXJ2ZXJNZXNzYWdlElsKGmdldEJ1dHRvbkluZm9TZXJ2ZXJSZXF1ZXN0GAEgASgLMhsuR2V0QnV0dG9uSW5mb1NlcnZlclJlcXVlc3RSGmdldEJ1dHRvbkluZm9TZXJ2ZXJSZXF1ZXN0El4KG2dldEJ1dHRvbkluZm9TZXJ2ZXJSZXNwb25zZRgCIAEoCzIcLkdldEJ1dHRvbkluZm9TZXJ2ZXJSZXNwb25zZVIbZ2V0QnV0dG9uSW5mb1NlcnZlclJlc3BvbnNlElgKGXVwZGF0ZUJ1dHRvblNlcnZlclJlcXVlc3QYAyABKAsyGi5VcGRhdGVCdXR0b25TZXJ2ZXJSZXF1ZXN0Uhl1cGRhdGVCdXR0b25TZXJ2ZXJSZXF1ZXN0ElsKGnVwZGF0ZUJ1dHRvblNlcnZlclJlc3BvbnNlGAQgASgLMhsuVXBkYXRlQnV0dG9uU2VydmVyUmVzcG9uc2VSGnVwZGF0ZUJ1dHRvblNlcnZlclJlc3BvbnNl');
@$core.Deprecated('Use groupControlServerMessageDescriptor instead')
const GroupControlServerMessage$json = const {
  '1': 'GroupControlServerMessage',
  '2': const [
    const {'1': 'groupControlServerRequest', '3': 1, '4': 1, '5': 11, '6': '.GroupControlServerRequest', '10': 'groupControlServerRequest'},
    const {'1': 'groupControlServerResponse', '3': 2, '4': 1, '5': 11, '6': '.GroupControlServerResponse', '10': 'groupControlServerResponse'},
    const {'1': 'getGroupControlInfoServerRequest', '3': 3, '4': 1, '5': 11, '6': '.GetGroupControlInfoServerRequest', '10': 'getGroupControlInfoServerRequest'},
    const {'1': 'getGroupControlInfoServerResponse', '3': 4, '4': 1, '5': 11, '6': '.GetGroupControlInfoServerResponse', '10': 'getGroupControlInfoServerResponse'},
    const {'1': 'getControlsServerRequest', '3': 5, '4': 1, '5': 11, '6': '.GetControlsServerRequest', '10': 'getControlsServerRequest'},
    const {'1': 'getControlsServerResponse', '3': 6, '4': 1, '5': 11, '6': '.GetControlsServerResponse', '10': 'getControlsServerResponse'},
    const {'1': 'addGroupControlServerRequest', '3': 7, '4': 1, '5': 11, '6': '.AddGroupControlServerRequest', '10': 'addGroupControlServerRequest'},
    const {'1': 'addGroupControlServerResponse', '3': 8, '4': 1, '5': 11, '6': '.AddGroupControlServerResponse', '10': 'addGroupControlServerResponse'},
    const {'1': 'updateGroupControlServerRequest', '3': 9, '4': 1, '5': 11, '6': '.UpdateGroupControlServerRequest', '10': 'updateGroupControlServerRequest'},
    const {'1': 'updateGroupControlServerResponse', '3': 10, '4': 1, '5': 11, '6': '.UpdateGroupControlServerResponse', '10': 'updateGroupControlServerResponse'},
    const {'1': 'deleteGroupControlServerRequest', '3': 11, '4': 1, '5': 11, '6': '.DeleteGroupControlServerRequest', '10': 'deleteGroupControlServerRequest'},
    const {'1': 'deleteGroupControlServerResponse', '3': 12, '4': 1, '5': 11, '6': '.DeleteGroupControlServerResponse', '10': 'deleteGroupControlServerResponse'},
  ],
};

/// Descriptor for `GroupControlServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupControlServerMessageDescriptor = $convert.base64Decode('ChlHcm91cENvbnRyb2xTZXJ2ZXJNZXNzYWdlElgKGWdyb3VwQ29udHJvbFNlcnZlclJlcXVlc3QYASABKAsyGi5Hcm91cENvbnRyb2xTZXJ2ZXJSZXF1ZXN0Uhlncm91cENvbnRyb2xTZXJ2ZXJSZXF1ZXN0ElsKGmdyb3VwQ29udHJvbFNlcnZlclJlc3BvbnNlGAIgASgLMhsuR3JvdXBDb250cm9sU2VydmVyUmVzcG9uc2VSGmdyb3VwQ29udHJvbFNlcnZlclJlc3BvbnNlEm0KIGdldEdyb3VwQ29udHJvbEluZm9TZXJ2ZXJSZXF1ZXN0GAMgASgLMiEuR2V0R3JvdXBDb250cm9sSW5mb1NlcnZlclJlcXVlc3RSIGdldEdyb3VwQ29udHJvbEluZm9TZXJ2ZXJSZXF1ZXN0EnAKIWdldEdyb3VwQ29udHJvbEluZm9TZXJ2ZXJSZXNwb25zZRgEIAEoCzIiLkdldEdyb3VwQ29udHJvbEluZm9TZXJ2ZXJSZXNwb25zZVIhZ2V0R3JvdXBDb250cm9sSW5mb1NlcnZlclJlc3BvbnNlElUKGGdldENvbnRyb2xzU2VydmVyUmVxdWVzdBgFIAEoCzIZLkdldENvbnRyb2xzU2VydmVyUmVxdWVzdFIYZ2V0Q29udHJvbHNTZXJ2ZXJSZXF1ZXN0ElgKGWdldENvbnRyb2xzU2VydmVyUmVzcG9uc2UYBiABKAsyGi5HZXRDb250cm9sc1NlcnZlclJlc3BvbnNlUhlnZXRDb250cm9sc1NlcnZlclJlc3BvbnNlEmEKHGFkZEdyb3VwQ29udHJvbFNlcnZlclJlcXVlc3QYByABKAsyHS5BZGRHcm91cENvbnRyb2xTZXJ2ZXJSZXF1ZXN0UhxhZGRHcm91cENvbnRyb2xTZXJ2ZXJSZXF1ZXN0EmQKHWFkZEdyb3VwQ29udHJvbFNlcnZlclJlc3BvbnNlGAggASgLMh4uQWRkR3JvdXBDb250cm9sU2VydmVyUmVzcG9uc2VSHWFkZEdyb3VwQ29udHJvbFNlcnZlclJlc3BvbnNlEmoKH3VwZGF0ZUdyb3VwQ29udHJvbFNlcnZlclJlcXVlc3QYCSABKAsyIC5VcGRhdGVHcm91cENvbnRyb2xTZXJ2ZXJSZXF1ZXN0Uh91cGRhdGVHcm91cENvbnRyb2xTZXJ2ZXJSZXF1ZXN0Em0KIHVwZGF0ZUdyb3VwQ29udHJvbFNlcnZlclJlc3BvbnNlGAogASgLMiEuVXBkYXRlR3JvdXBDb250cm9sU2VydmVyUmVzcG9uc2VSIHVwZGF0ZUdyb3VwQ29udHJvbFNlcnZlclJlc3BvbnNlEmoKH2RlbGV0ZUdyb3VwQ29udHJvbFNlcnZlclJlcXVlc3QYCyABKAsyIC5EZWxldGVHcm91cENvbnRyb2xTZXJ2ZXJSZXF1ZXN0Uh9kZWxldGVHcm91cENvbnRyb2xTZXJ2ZXJSZXF1ZXN0Em0KIGRlbGV0ZUdyb3VwQ29udHJvbFNlcnZlclJlc3BvbnNlGAwgASgLMiEuRGVsZXRlR3JvdXBDb250cm9sU2VydmVyUmVzcG9uc2VSIGRlbGV0ZUdyb3VwQ29udHJvbFNlcnZlclJlc3BvbnNl');
@$core.Deprecated('Use ledDriverServerMessageDescriptor instead')
const LedDriverServerMessage$json = const {
  '1': 'LedDriverServerMessage',
  '2': const [
    const {'1': 'ledDriverServerRequest', '3': 1, '4': 1, '5': 11, '6': '.LedDriverServerRequest', '10': 'ledDriverServerRequest'},
    const {'1': 'ledDriverServerResponse', '3': 2, '4': 1, '5': 11, '6': '.LedDriverServerResponse', '10': 'ledDriverServerResponse'},
    const {'1': 'getLedDriverServerRequest', '3': 3, '4': 1, '5': 11, '6': '.GetLedDriverServerRequest', '10': 'getLedDriverServerRequest'},
    const {'1': 'getLedDriverServerResponse', '3': 4, '4': 1, '5': 11, '6': '.GetLedDriverServerResponse', '10': 'getLedDriverServerResponse'},
    const {'1': 'getLedDriverItemServerRequest', '3': 5, '4': 1, '5': 11, '6': '.GetLedDriverItemServerRequest', '10': 'getLedDriverItemServerRequest'},
    const {'1': 'getLedDriverItemServerResponse', '3': 6, '4': 1, '5': 11, '6': '.GetLedDriverItemServerResponse', '10': 'getLedDriverItemServerResponse'},
    const {'1': 'updateLedDriverServerRequest', '3': 7, '4': 1, '5': 11, '6': '.UpdateLedDriverServerRequest', '10': 'updateLedDriverServerRequest'},
    const {'1': 'updateLedDriverServerResponse', '3': 8, '4': 1, '5': 11, '6': '.UpdateLedDriverServerResponse', '10': 'updateLedDriverServerResponse'},
    const {'1': 'updateLedDriverItemServerRequest', '3': 9, '4': 1, '5': 11, '6': '.UpdateLedDriverItemServerRequest', '10': 'updateLedDriverItemServerRequest'},
    const {'1': 'updateLedDriverItemServerResponse', '3': 10, '4': 1, '5': 11, '6': '.UpdateLedDriverItemServerResponse', '10': 'updateLedDriverItemServerResponse'},
  ],
};

/// Descriptor for `LedDriverServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ledDriverServerMessageDescriptor = $convert.base64Decode('ChZMZWREcml2ZXJTZXJ2ZXJNZXNzYWdlEk8KFmxlZERyaXZlclNlcnZlclJlcXVlc3QYASABKAsyFy5MZWREcml2ZXJTZXJ2ZXJSZXF1ZXN0UhZsZWREcml2ZXJTZXJ2ZXJSZXF1ZXN0ElIKF2xlZERyaXZlclNlcnZlclJlc3BvbnNlGAIgASgLMhguTGVkRHJpdmVyU2VydmVyUmVzcG9uc2VSF2xlZERyaXZlclNlcnZlclJlc3BvbnNlElgKGWdldExlZERyaXZlclNlcnZlclJlcXVlc3QYAyABKAsyGi5HZXRMZWREcml2ZXJTZXJ2ZXJSZXF1ZXN0UhlnZXRMZWREcml2ZXJTZXJ2ZXJSZXF1ZXN0ElsKGmdldExlZERyaXZlclNlcnZlclJlc3BvbnNlGAQgASgLMhsuR2V0TGVkRHJpdmVyU2VydmVyUmVzcG9uc2VSGmdldExlZERyaXZlclNlcnZlclJlc3BvbnNlEmQKHWdldExlZERyaXZlckl0ZW1TZXJ2ZXJSZXF1ZXN0GAUgASgLMh4uR2V0TGVkRHJpdmVySXRlbVNlcnZlclJlcXVlc3RSHWdldExlZERyaXZlckl0ZW1TZXJ2ZXJSZXF1ZXN0EmcKHmdldExlZERyaXZlckl0ZW1TZXJ2ZXJSZXNwb25zZRgGIAEoCzIfLkdldExlZERyaXZlckl0ZW1TZXJ2ZXJSZXNwb25zZVIeZ2V0TGVkRHJpdmVySXRlbVNlcnZlclJlc3BvbnNlEmEKHHVwZGF0ZUxlZERyaXZlclNlcnZlclJlcXVlc3QYByABKAsyHS5VcGRhdGVMZWREcml2ZXJTZXJ2ZXJSZXF1ZXN0Uhx1cGRhdGVMZWREcml2ZXJTZXJ2ZXJSZXF1ZXN0EmQKHXVwZGF0ZUxlZERyaXZlclNlcnZlclJlc3BvbnNlGAggASgLMh4uVXBkYXRlTGVkRHJpdmVyU2VydmVyUmVzcG9uc2VSHXVwZGF0ZUxlZERyaXZlclNlcnZlclJlc3BvbnNlEm0KIHVwZGF0ZUxlZERyaXZlckl0ZW1TZXJ2ZXJSZXF1ZXN0GAkgASgLMiEuVXBkYXRlTGVkRHJpdmVySXRlbVNlcnZlclJlcXVlc3RSIHVwZGF0ZUxlZERyaXZlckl0ZW1TZXJ2ZXJSZXF1ZXN0EnAKIXVwZGF0ZUxlZERyaXZlckl0ZW1TZXJ2ZXJSZXNwb25zZRgKIAEoCzIiLlVwZGF0ZUxlZERyaXZlckl0ZW1TZXJ2ZXJSZXNwb25zZVIhdXBkYXRlTGVkRHJpdmVySXRlbVNlcnZlclJlc3BvbnNl');
@$core.Deprecated('Use touchPanelServerMessageDescriptor instead')
const TouchPanelServerMessage$json = const {
  '1': 'TouchPanelServerMessage',
  '2': const [
    const {'1': 'touchPanelChangeComponentServerRequest', '3': 1, '4': 1, '5': 11, '6': '.TouchPanelChangeComponentServerRequest', '10': 'touchPanelChangeComponentServerRequest'},
    const {'1': 'touchPanelControlSwitcherServerRequest', '3': 2, '4': 1, '5': 11, '6': '.TouchPanelControlSwitcherServerRequest', '10': 'touchPanelControlSwitcherServerRequest'},
    const {'1': 'touchPanelUpdateSwitcherServerRequest', '3': 3, '4': 1, '5': 11, '6': '.TouchPanelUpdateSwitcherServerRequest', '10': 'touchPanelUpdateSwitcherServerRequest'},
    const {'1': 'touchPanelControlCurtainSwitcherServerRequest', '3': 4, '4': 1, '5': 11, '6': '.TouchPanelControlCurtainSwitcherServerRequest', '10': 'touchPanelControlCurtainSwitcherServerRequest'},
    const {'1': 'touchPanelUpdateCurtainSwitcherServerRequest', '3': 5, '4': 1, '5': 11, '6': '.TouchPanelUpdateCurtainSwitcherServerRequest', '10': 'touchPanelUpdateCurtainSwitcherServerRequest'},
    const {'1': 'touchPanelUpdateSceneServerRequest', '3': 6, '4': 1, '5': 11, '6': '.TouchPanelUpdateSceneServerRequest', '10': 'touchPanelUpdateSceneServerRequest'},
    const {'1': 'touchPanelControlLedDriverServerRequest', '3': 7, '4': 1, '5': 11, '6': '.TouchPanelControlLedDriverServerRequest', '10': 'touchPanelControlLedDriverServerRequest'},
    const {'1': 'touchPanelUpdateLedDriverServerRequest', '3': 8, '4': 1, '5': 11, '6': '.TouchPanelUpdateLedDriverServerRequest', '10': 'touchPanelUpdateLedDriverServerRequest'},
  ],
};

/// Descriptor for `TouchPanelServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelServerMessageDescriptor = $convert.base64Decode('ChdUb3VjaFBhbmVsU2VydmVyTWVzc2FnZRJ/CiZ0b3VjaFBhbmVsQ2hhbmdlQ29tcG9uZW50U2VydmVyUmVxdWVzdBgBIAEoCzInLlRvdWNoUGFuZWxDaGFuZ2VDb21wb25lbnRTZXJ2ZXJSZXF1ZXN0UiZ0b3VjaFBhbmVsQ2hhbmdlQ29tcG9uZW50U2VydmVyUmVxdWVzdBJ/CiZ0b3VjaFBhbmVsQ29udHJvbFN3aXRjaGVyU2VydmVyUmVxdWVzdBgCIAEoCzInLlRvdWNoUGFuZWxDb250cm9sU3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0UiZ0b3VjaFBhbmVsQ29udHJvbFN3aXRjaGVyU2VydmVyUmVxdWVzdBJ8CiV0b3VjaFBhbmVsVXBkYXRlU3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0GAMgASgLMiYuVG91Y2hQYW5lbFVwZGF0ZVN3aXRjaGVyU2VydmVyUmVxdWVzdFIldG91Y2hQYW5lbFVwZGF0ZVN3aXRjaGVyU2VydmVyUmVxdWVzdBKUAQotdG91Y2hQYW5lbENvbnRyb2xDdXJ0YWluU3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0GAQgASgLMi4uVG91Y2hQYW5lbENvbnRyb2xDdXJ0YWluU3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0Ui10b3VjaFBhbmVsQ29udHJvbEN1cnRhaW5Td2l0Y2hlclNlcnZlclJlcXVlc3QSkQEKLHRvdWNoUGFuZWxVcGRhdGVDdXJ0YWluU3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0GAUgASgLMi0uVG91Y2hQYW5lbFVwZGF0ZUN1cnRhaW5Td2l0Y2hlclNlcnZlclJlcXVlc3RSLHRvdWNoUGFuZWxVcGRhdGVDdXJ0YWluU3dpdGNoZXJTZXJ2ZXJSZXF1ZXN0EnMKInRvdWNoUGFuZWxVcGRhdGVTY2VuZVNlcnZlclJlcXVlc3QYBiABKAsyIy5Ub3VjaFBhbmVsVXBkYXRlU2NlbmVTZXJ2ZXJSZXF1ZXN0UiJ0b3VjaFBhbmVsVXBkYXRlU2NlbmVTZXJ2ZXJSZXF1ZXN0EoIBCid0b3VjaFBhbmVsQ29udHJvbExlZERyaXZlclNlcnZlclJlcXVlc3QYByABKAsyKC5Ub3VjaFBhbmVsQ29udHJvbExlZERyaXZlclNlcnZlclJlcXVlc3RSJ3RvdWNoUGFuZWxDb250cm9sTGVkRHJpdmVyU2VydmVyUmVxdWVzdBJ/CiZ0b3VjaFBhbmVsVXBkYXRlTGVkRHJpdmVyU2VydmVyUmVxdWVzdBgIIAEoCzInLlRvdWNoUGFuZWxVcGRhdGVMZWREcml2ZXJTZXJ2ZXJSZXF1ZXN0UiZ0b3VjaFBhbmVsVXBkYXRlTGVkRHJpdmVyU2VydmVyUmVxdWVzdA==');
@$core.Deprecated('Use curtainServerMessageDescriptor instead')
const CurtainServerMessage$json = const {
  '1': 'CurtainServerMessage',
  '2': const [
    const {'1': 'curtainServerRequest', '3': 1, '4': 1, '5': 11, '6': '.CurtainServerRequest', '10': 'curtainServerRequest'},
    const {'1': 'curtainServerResponse', '3': 2, '4': 1, '5': 11, '6': '.CurtainServerResponse', '10': 'curtainServerResponse'},
  ],
};

/// Descriptor for `CurtainServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List curtainServerMessageDescriptor = $convert.base64Decode('ChRDdXJ0YWluU2VydmVyTWVzc2FnZRJJChRjdXJ0YWluU2VydmVyUmVxdWVzdBgBIAEoCzIVLkN1cnRhaW5TZXJ2ZXJSZXF1ZXN0UhRjdXJ0YWluU2VydmVyUmVxdWVzdBJMChVjdXJ0YWluU2VydmVyUmVzcG9uc2UYAiABKAsyFi5DdXJ0YWluU2VydmVyUmVzcG9uc2VSFWN1cnRhaW5TZXJ2ZXJSZXNwb25zZQ==');
@$core.Deprecated('Use serverMessageDescriptor instead')
const ServerMessage$json = const {
  '1': 'ServerMessage',
  '2': const [
    const {'1': 'authServerMessage', '3': 1, '4': 1, '5': 11, '6': '.AuthServerMessage', '10': 'authServerMessage'},
    const {'1': 'userServerMessage', '3': 2, '4': 1, '5': 11, '6': '.UserServerMessage', '10': 'userServerMessage'},
    const {'1': 'homeServerMessage', '3': 3, '4': 1, '5': 11, '6': '.HomeServerMessage', '10': 'homeServerMessage'},
    const {'1': 'roomServerMessage', '3': 4, '4': 1, '5': 11, '6': '.RoomServerMessage', '10': 'roomServerMessage'},
    const {'1': 'deviceServerMessage', '3': 5, '4': 1, '5': 11, '6': '.DeviceServerMessage', '10': 'deviceServerMessage'},
    const {'1': 'switcherServerMessage', '3': 6, '4': 1, '5': 11, '6': '.SwitcherServerMessage', '10': 'switcherServerMessage'},
    const {'1': 'curtainSwitcherServerMessage', '3': 7, '4': 1, '5': 11, '6': '.CurtainSwitcherServerMessage', '10': 'curtainSwitcherServerMessage'},
    const {'1': 'meterServerMessage', '3': 8, '4': 1, '5': 11, '6': '.MeterServerMessage', '10': 'meterServerMessage'},
    const {'1': 'airConditionerServerMessage', '3': 9, '4': 1, '5': 11, '6': '.AirConditionerServerMessage', '10': 'airConditionerServerMessage'},
    const {'1': 'remoteServerMessage', '3': 10, '4': 1, '5': 11, '6': '.RemoteServerMessage', '10': 'remoteServerMessage'},
    const {'1': 'sceneServerMessage', '3': 11, '4': 1, '5': 11, '6': '.SceneServerMessage', '10': 'sceneServerMessage'},
    const {'1': 'generalTabServerMessage', '3': 12, '4': 1, '5': 11, '6': '.GeneralTabServerMessage', '10': 'generalTabServerMessage'},
    const {'1': 'onChangedServerMessage', '3': 13, '4': 1, '5': 11, '6': '.OnChangedServerMessage', '10': 'onChangedServerMessage'},
    const {'1': 'simulatorServerMessage', '3': 14, '4': 1, '5': 11, '6': '.SimulatorServerMessage', '10': 'simulatorServerMessage'},
    const {'1': 'motionServerMessage', '3': 15, '4': 1, '5': 11, '6': '.MotionServerMessage', '10': 'motionServerMessage'},
    const {'1': 'homekitServerMessage', '3': 16, '4': 1, '5': 11, '6': '.HomekitServerMessage', '10': 'homekitServerMessage'},
    const {'1': 'projectServerMessage', '3': 17, '4': 1, '5': 11, '6': '.ProjectServerMessage', '10': 'projectServerMessage'},
    const {'1': 'buildingServerMessage', '3': 18, '4': 1, '5': 11, '6': '.BuildingServerMessage', '10': 'buildingServerMessage'},
    const {'1': 'floorServerMessage', '3': 19, '4': 1, '5': 11, '6': '.FloorServerMessage', '10': 'floorServerMessage'},
    const {'1': 'apartmentServerMessage', '3': 20, '4': 1, '5': 11, '6': '.ApartmentServerMessage', '10': 'apartmentServerMessage'},
    const {'1': 'userHomeServerMessage', '3': 21, '4': 1, '5': 11, '6': '.UserHomeServerMessage', '10': 'userHomeServerMessage'},
    const {'1': 'inboxServerMessage', '3': 22, '4': 1, '5': 11, '6': '.InboxServerMessage', '10': 'inboxServerMessage'},
    const {'1': 'settingServerMessage', '3': 23, '4': 1, '5': 11, '6': '.SettingServerMessage', '10': 'settingServerMessage'},
    const {'1': 'buttonServerMessage', '3': 24, '4': 1, '5': 11, '6': '.ButtonServerMessage', '10': 'buttonServerMessage'},
    const {'1': 'groupControlServerMessage', '3': 25, '4': 1, '5': 11, '6': '.GroupControlServerMessage', '10': 'groupControlServerMessage'},
    const {'1': 'ledDriverServerMessage', '3': 26, '4': 1, '5': 11, '6': '.LedDriverServerMessage', '10': 'ledDriverServerMessage'},
    const {'1': 'touchPanelServerMessage', '3': 27, '4': 1, '5': 11, '6': '.TouchPanelServerMessage', '10': 'touchPanelServerMessage'},
    const {'1': 'curtainServerMessage', '3': 28, '4': 1, '5': 11, '6': '.CurtainServerMessage', '10': 'curtainServerMessage'},
  ],
};

/// Descriptor for `ServerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverMessageDescriptor = $convert.base64Decode('Cg1TZXJ2ZXJNZXNzYWdlEkAKEWF1dGhTZXJ2ZXJNZXNzYWdlGAEgASgLMhIuQXV0aFNlcnZlck1lc3NhZ2VSEWF1dGhTZXJ2ZXJNZXNzYWdlEkAKEXVzZXJTZXJ2ZXJNZXNzYWdlGAIgASgLMhIuVXNlclNlcnZlck1lc3NhZ2VSEXVzZXJTZXJ2ZXJNZXNzYWdlEkAKEWhvbWVTZXJ2ZXJNZXNzYWdlGAMgASgLMhIuSG9tZVNlcnZlck1lc3NhZ2VSEWhvbWVTZXJ2ZXJNZXNzYWdlEkAKEXJvb21TZXJ2ZXJNZXNzYWdlGAQgASgLMhIuUm9vbVNlcnZlck1lc3NhZ2VSEXJvb21TZXJ2ZXJNZXNzYWdlEkYKE2RldmljZVNlcnZlck1lc3NhZ2UYBSABKAsyFC5EZXZpY2VTZXJ2ZXJNZXNzYWdlUhNkZXZpY2VTZXJ2ZXJNZXNzYWdlEkwKFXN3aXRjaGVyU2VydmVyTWVzc2FnZRgGIAEoCzIWLlN3aXRjaGVyU2VydmVyTWVzc2FnZVIVc3dpdGNoZXJTZXJ2ZXJNZXNzYWdlEmEKHGN1cnRhaW5Td2l0Y2hlclNlcnZlck1lc3NhZ2UYByABKAsyHS5DdXJ0YWluU3dpdGNoZXJTZXJ2ZXJNZXNzYWdlUhxjdXJ0YWluU3dpdGNoZXJTZXJ2ZXJNZXNzYWdlEkMKEm1ldGVyU2VydmVyTWVzc2FnZRgIIAEoCzITLk1ldGVyU2VydmVyTWVzc2FnZVISbWV0ZXJTZXJ2ZXJNZXNzYWdlEl4KG2FpckNvbmRpdGlvbmVyU2VydmVyTWVzc2FnZRgJIAEoCzIcLkFpckNvbmRpdGlvbmVyU2VydmVyTWVzc2FnZVIbYWlyQ29uZGl0aW9uZXJTZXJ2ZXJNZXNzYWdlEkYKE3JlbW90ZVNlcnZlck1lc3NhZ2UYCiABKAsyFC5SZW1vdGVTZXJ2ZXJNZXNzYWdlUhNyZW1vdGVTZXJ2ZXJNZXNzYWdlEkMKEnNjZW5lU2VydmVyTWVzc2FnZRgLIAEoCzITLlNjZW5lU2VydmVyTWVzc2FnZVISc2NlbmVTZXJ2ZXJNZXNzYWdlElIKF2dlbmVyYWxUYWJTZXJ2ZXJNZXNzYWdlGAwgASgLMhguR2VuZXJhbFRhYlNlcnZlck1lc3NhZ2VSF2dlbmVyYWxUYWJTZXJ2ZXJNZXNzYWdlEk8KFm9uQ2hhbmdlZFNlcnZlck1lc3NhZ2UYDSABKAsyFy5PbkNoYW5nZWRTZXJ2ZXJNZXNzYWdlUhZvbkNoYW5nZWRTZXJ2ZXJNZXNzYWdlEk8KFnNpbXVsYXRvclNlcnZlck1lc3NhZ2UYDiABKAsyFy5TaW11bGF0b3JTZXJ2ZXJNZXNzYWdlUhZzaW11bGF0b3JTZXJ2ZXJNZXNzYWdlEkYKE21vdGlvblNlcnZlck1lc3NhZ2UYDyABKAsyFC5Nb3Rpb25TZXJ2ZXJNZXNzYWdlUhNtb3Rpb25TZXJ2ZXJNZXNzYWdlEkkKFGhvbWVraXRTZXJ2ZXJNZXNzYWdlGBAgASgLMhUuSG9tZWtpdFNlcnZlck1lc3NhZ2VSFGhvbWVraXRTZXJ2ZXJNZXNzYWdlEkkKFHByb2plY3RTZXJ2ZXJNZXNzYWdlGBEgASgLMhUuUHJvamVjdFNlcnZlck1lc3NhZ2VSFHByb2plY3RTZXJ2ZXJNZXNzYWdlEkwKFWJ1aWxkaW5nU2VydmVyTWVzc2FnZRgSIAEoCzIWLkJ1aWxkaW5nU2VydmVyTWVzc2FnZVIVYnVpbGRpbmdTZXJ2ZXJNZXNzYWdlEkMKEmZsb29yU2VydmVyTWVzc2FnZRgTIAEoCzITLkZsb29yU2VydmVyTWVzc2FnZVISZmxvb3JTZXJ2ZXJNZXNzYWdlEk8KFmFwYXJ0bWVudFNlcnZlck1lc3NhZ2UYFCABKAsyFy5BcGFydG1lbnRTZXJ2ZXJNZXNzYWdlUhZhcGFydG1lbnRTZXJ2ZXJNZXNzYWdlEkwKFXVzZXJIb21lU2VydmVyTWVzc2FnZRgVIAEoCzIWLlVzZXJIb21lU2VydmVyTWVzc2FnZVIVdXNlckhvbWVTZXJ2ZXJNZXNzYWdlEkMKEmluYm94U2VydmVyTWVzc2FnZRgWIAEoCzITLkluYm94U2VydmVyTWVzc2FnZVISaW5ib3hTZXJ2ZXJNZXNzYWdlEkkKFHNldHRpbmdTZXJ2ZXJNZXNzYWdlGBcgASgLMhUuU2V0dGluZ1NlcnZlck1lc3NhZ2VSFHNldHRpbmdTZXJ2ZXJNZXNzYWdlEkYKE2J1dHRvblNlcnZlck1lc3NhZ2UYGCABKAsyFC5CdXR0b25TZXJ2ZXJNZXNzYWdlUhNidXR0b25TZXJ2ZXJNZXNzYWdlElgKGWdyb3VwQ29udHJvbFNlcnZlck1lc3NhZ2UYGSABKAsyGi5Hcm91cENvbnRyb2xTZXJ2ZXJNZXNzYWdlUhlncm91cENvbnRyb2xTZXJ2ZXJNZXNzYWdlEk8KFmxlZERyaXZlclNlcnZlck1lc3NhZ2UYGiABKAsyFy5MZWREcml2ZXJTZXJ2ZXJNZXNzYWdlUhZsZWREcml2ZXJTZXJ2ZXJNZXNzYWdlElIKF3RvdWNoUGFuZWxTZXJ2ZXJNZXNzYWdlGBsgASgLMhguVG91Y2hQYW5lbFNlcnZlck1lc3NhZ2VSF3RvdWNoUGFuZWxTZXJ2ZXJNZXNzYWdlEkkKFGN1cnRhaW5TZXJ2ZXJNZXNzYWdlGBwgASgLMhUuQ3VydGFpblNlcnZlck1lc3NhZ2VSFGN1cnRhaW5TZXJ2ZXJNZXNzYWdl');
