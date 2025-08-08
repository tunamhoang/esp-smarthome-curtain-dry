///
//  Generated code. Do not modify.
//  source: common-message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use groupRemoteDescriptor instead')
const GroupRemote$json = const {
  '1': 'GroupRemote',
  '2': const [
    const {'1': 'AirConditioner', '2': 0},
    const {'1': 'Fan', '2': 1},
    const {'1': 'Multi', '2': 2},
  ],
};

/// Descriptor for `GroupRemote`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List groupRemoteDescriptor = $convert.base64Decode('CgtHcm91cFJlbW90ZRISCg5BaXJDb25kaXRpb25lchAAEgcKA0ZhbhABEgkKBU11bHRpEAI=');
@$core.Deprecated('Use remoteCategoryDescriptor instead')
const RemoteCategory$json = const {
  '1': 'RemoteCategory',
  '2': const [
    const {'1': 'CategoryAuto', '2': 0},
    const {'1': 'CategoryAC', '2': 1},
    const {'1': 'CategoryTV', '2': 2},
  ],
};

/// Descriptor for `RemoteCategory`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List remoteCategoryDescriptor = $convert.base64Decode('Cg5SZW1vdGVDYXRlZ29yeRIQCgxDYXRlZ29yeUF1dG8QABIOCgpDYXRlZ29yeUFDEAESDgoKQ2F0ZWdvcnlUVhAC');
@$core.Deprecated('Use groupDeviceDescriptor instead')
const GroupDevice$json = const {
  '1': 'GroupDevice',
  '2': const [
    const {'1': 'SwitcherGroup', '2': 0},
    const {'1': 'CurtainSwitcherGroup', '2': 1},
    const {'1': 'CurtainGroup', '2': 2},
    const {'1': 'IrRfGroup', '2': 3},
    const {'1': 'MeterGroup', '2': 4},
    const {'1': 'MotionGroup', '2': 5},
    const {'1': 'HomekitGroup', '2': 6},
    const {'1': 'ButtonGroup', '2': 7},
    const {'1': 'ACGroup', '2': 8},
    const {'1': 'LedDriverGroup', '2': 9},
    const {'1': 'EnvironmentSensorGroup', '2': 10},
    const {'1': 'TouchPanelGroup', '2': 11},
    const {'1': 'UnknowGroup', '2': 1000},
  ],
};

/// Descriptor for `GroupDevice`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List groupDeviceDescriptor = $convert.base64Decode('CgtHcm91cERldmljZRIRCg1Td2l0Y2hlckdyb3VwEAASGAoUQ3VydGFpblN3aXRjaGVyR3JvdXAQARIQCgxDdXJ0YWluR3JvdXAQAhINCglJclJmR3JvdXAQAxIOCgpNZXRlckdyb3VwEAQSDwoLTW90aW9uR3JvdXAQBRIQCgxIb21la2l0R3JvdXAQBhIPCgtCdXR0b25Hcm91cBAHEgsKB0FDR3JvdXAQCBISCg5MZWREcml2ZXJHcm91cBAJEhoKFkVudmlyb25tZW50U2Vuc29yR3JvdXAQChITCg9Ub3VjaFBhbmVsR3JvdXAQCxIQCgtVbmtub3dHcm91cBDoBw==');
@$core.Deprecated('Use conditionSceneDescriptor instead')
const ConditionScene$json = const {
  '1': 'ConditionScene',
  '2': const [
    const {'1': 'AutoCondition', '2': 0},
    const {'1': 'ManualCondition', '2': 1},
  ],
};

/// Descriptor for `ConditionScene`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List conditionSceneDescriptor = $convert.base64Decode('Cg5Db25kaXRpb25TY2VuZRIRCg1BdXRvQ29uZGl0aW9uEAASEwoPTWFudWFsQ29uZGl0aW9uEAE=');
@$core.Deprecated('Use powerStateDescriptor instead')
const PowerState$json = const {
  '1': 'PowerState',
  '2': const [
    const {'1': 'Off', '2': 0},
    const {'1': 'On', '2': 1},
    const {'1': 'DoubleTap', '2': 2},
    const {'1': 'SceneTrigger', '2': 3},
    const {'1': 'None', '2': 4},
  ],
};

/// Descriptor for `PowerState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List powerStateDescriptor = $convert.base64Decode('CgpQb3dlclN0YXRlEgcKA09mZhAAEgYKAk9uEAESDQoJRG91YmxlVGFwEAISEAoMU2NlbmVUcmlnZ2VyEAMSCAoETm9uZRAE');
@$core.Deprecated('Use curtainControlStateDescriptor instead')
const CurtainControlState$json = const {
  '1': 'CurtainControlState',
  '2': const [
    const {'1': 'CurtainControlUnknown', '2': 0},
    const {'1': 'CurtainControlClose', '2': 1},
    const {'1': 'CurtainControlStop', '2': 2},
    const {'1': 'CurtainControlOpen', '2': 3},
  ],
};

/// Descriptor for `CurtainControlState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List curtainControlStateDescriptor = $convert.base64Decode('ChNDdXJ0YWluQ29udHJvbFN0YXRlEhkKFUN1cnRhaW5Db250cm9sVW5rbm93bhAAEhcKE0N1cnRhaW5Db250cm9sQ2xvc2UQARIWChJDdXJ0YWluQ29udHJvbFN0b3AQAhIWChJDdXJ0YWluQ29udHJvbE9wZW4QAw==');
@$core.Deprecated('Use buttonStateDescriptor instead')
const ButtonState$json = const {
  '1': 'ButtonState',
  '2': const [
    const {'1': 'Nothing', '2': 0},
    const {'1': 'OneClick', '2': 1},
    const {'1': 'DoubleClick', '2': 2},
    const {'1': 'LongClick', '2': 3},
  ],
};

/// Descriptor for `ButtonState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List buttonStateDescriptor = $convert.base64Decode('CgtCdXR0b25TdGF0ZRILCgdOb3RoaW5nEAASDAoIT25lQ2xpY2sQARIPCgtEb3VibGVDbGljaxACEg0KCUxvbmdDbGljaxAD');
@$core.Deprecated('Use connectionStateDescriptor instead')
const ConnectionState$json = const {
  '1': 'ConnectionState',
  '2': const [
    const {'1': 'Offline', '2': 0},
    const {'1': 'Online', '2': 1},
    const {'1': 'Disconnect', '2': 2},
    const {'1': 'AddNew', '2': 3},
    const {'1': 'Delete', '2': 4},
  ],
};

/// Descriptor for `ConnectionState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List connectionStateDescriptor = $convert.base64Decode('Cg9Db25uZWN0aW9uU3RhdGUSCwoHT2ZmbGluZRAAEgoKBk9ubGluZRABEg4KCkRpc2Nvbm5lY3QQAhIKCgZBZGROZXcQAxIKCgZEZWxldGUQBA==');
@$core.Deprecated('Use modeAcDescriptor instead')
const ModeAc$json = const {
  '1': 'ModeAc',
  '2': const [
    const {'1': 'AutoMode', '2': 0},
    const {'1': 'CoolMode', '2': 1},
    const {'1': 'HeatMode', '2': 2},
    const {'1': 'DryMode', '2': 3},
    const {'1': 'FanMode', '2': 4},
  ],
};

/// Descriptor for `ModeAc`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List modeAcDescriptor = $convert.base64Decode('CgZNb2RlQWMSDAoIQXV0b01vZGUQABIMCghDb29sTW9kZRABEgwKCEhlYXRNb2RlEAISCwoHRHJ5TW9kZRADEgsKB0Zhbk1vZGUQBA==');
@$core.Deprecated('Use swingAcDescriptor instead')
const SwingAc$json = const {
  '1': 'SwingAc',
  '2': const [
    const {'1': 'AutoSwing', '2': 0},
    const {'1': 'LowSwing', '2': 1},
    const {'1': 'MediumSwing', '2': 2},
    const {'1': 'HighSwing', '2': 3},
  ],
};

/// Descriptor for `SwingAc`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List swingAcDescriptor = $convert.base64Decode('CgdTd2luZ0FjEg0KCUF1dG9Td2luZxAAEgwKCExvd1N3aW5nEAESDwoLTWVkaXVtU3dpbmcQAhINCglIaWdoU3dpbmcQAw==');
@$core.Deprecated('Use fanAcDescriptor instead')
const FanAc$json = const {
  '1': 'FanAc',
  '2': const [
    const {'1': 'AutoFan', '2': 0},
    const {'1': 'LowFan', '2': 1},
    const {'1': 'MediumFan', '2': 2},
    const {'1': 'HighFan', '2': 3},
  ],
};

/// Descriptor for `FanAc`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List fanAcDescriptor = $convert.base64Decode('CgVGYW5BYxILCgdBdXRvRmFuEAASCgoGTG93RmFuEAESDQoJTWVkaXVtRmFuEAISCwoHSGlnaEZhbhAD');
@$core.Deprecated('Use typeMeterDescriptor instead')
const TypeMeter$json = const {
  '1': 'TypeMeter',
  '2': const [
    const {'1': 'ElectricMeter', '2': 0},
    const {'1': 'WaterMeter', '2': 1},
  ],
};

/// Descriptor for `TypeMeter`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List typeMeterDescriptor = $convert.base64Decode('CglUeXBlTWV0ZXISEQoNRWxlY3RyaWNNZXRlchAAEg4KCldhdGVyTWV0ZXIQAQ==');
@$core.Deprecated('Use typeLearnDescriptor instead')
const TypeLearn$json = const {
  '1': 'TypeLearn',
  '2': const [
    const {'1': 'IR', '2': 0},
    const {'1': 'RF', '2': 1},
  ],
};

/// Descriptor for `TypeLearn`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List typeLearnDescriptor = $convert.base64Decode('CglUeXBlTGVhcm4SBgoCSVIQABIGCgJSRhAB');
@$core.Deprecated('Use typeDeviceDescriptor instead')
const TypeDevice$json = const {
  '1': 'TypeDevice',
  '2': const [
    const {'1': 'SwitchLight', '2': 0},
    const {'1': 'SwitchSwitcher', '2': 1},
    const {'1': 'SwitchOutlet', '2': 2},
  ],
};

/// Descriptor for `TypeDevice`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List typeDeviceDescriptor = $convert.base64Decode('CgpUeXBlRGV2aWNlEg8KC1N3aXRjaExpZ2h0EAASEgoOU3dpdGNoU3dpdGNoZXIQARIQCgxTd2l0Y2hPdXRsZXQQAg==');
@$core.Deprecated('Use motionStateDescriptor instead')
const MotionState$json = const {
  '1': 'MotionState',
  '2': const [
    const {'1': 'MotionNone', '2': 0},
    const {'1': 'MotionDetected', '2': 1},
  ],
};

/// Descriptor for `MotionState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List motionStateDescriptor = $convert.base64Decode('CgtNb3Rpb25TdGF0ZRIOCgpNb3Rpb25Ob25lEAASEgoOTW90aW9uRGV0ZWN0ZWQQAQ==');
@$core.Deprecated('Use touchPanelComponentTypeDescriptor instead')
const TouchPanelComponentType$json = const {
  '1': 'TouchPanelComponentType',
  '2': const [
    const {'1': 'TouchPanelComponentUnknown', '2': 0},
    const {'1': 'TouchPanelComponentSwitcher', '2': 1},
    const {'1': 'TouchPanelComponentCurtainSwitcher', '2': 2},
    const {'1': 'TouchPanelComponentCurtain', '2': 3},
    const {'1': 'TouchPanelComponentAirConditioner', '2': 4},
    const {'1': 'TouchPanelComponentLedDriver', '2': 5},
    const {'1': 'TouchPanelComponentScene', '2': 6},
  ],
};

/// Descriptor for `TouchPanelComponentType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List touchPanelComponentTypeDescriptor = $convert.base64Decode('ChdUb3VjaFBhbmVsQ29tcG9uZW50VHlwZRIeChpUb3VjaFBhbmVsQ29tcG9uZW50VW5rbm93bhAAEh8KG1RvdWNoUGFuZWxDb21wb25lbnRTd2l0Y2hlchABEiYKIlRvdWNoUGFuZWxDb21wb25lbnRDdXJ0YWluU3dpdGNoZXIQAhIeChpUb3VjaFBhbmVsQ29tcG9uZW50Q3VydGFpbhADEiUKIVRvdWNoUGFuZWxDb21wb25lbnRBaXJDb25kaXRpb25lchAEEiAKHFRvdWNoUGFuZWxDb21wb25lbnRMZWREcml2ZXIQBRIcChhUb3VjaFBhbmVsQ29tcG9uZW50U2NlbmUQBg==');
@$core.Deprecated('Use homekitModeDescriptor instead')
const HomekitMode$json = const {
  '1': 'HomekitMode',
  '2': const [
    const {'1': 'HomekitNormalMode', '2': 0},
    const {'1': 'HomekitProvisioningMode', '2': 1},
  ],
};

/// Descriptor for `HomekitMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List homekitModeDescriptor = $convert.base64Decode('CgtIb21la2l0TW9kZRIVChFIb21la2l0Tm9ybWFsTW9kZRAAEhsKF0hvbWVraXRQcm92aXNpb25pbmdNb2RlEAE=');
@$core.Deprecated('Use typeEchoDescriptor instead')
const TypeEcho$json = const {
  '1': 'TypeEcho',
  '2': const [
    const {'1': 'Echo', '2': 0},
    const {'1': 'DeviceLogin', '2': 1},
  ],
};

/// Descriptor for `TypeEcho`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List typeEchoDescriptor = $convert.base64Decode('CghUeXBlRWNobxIICgRFY2hvEAASDwoLRGV2aWNlTG9naW4QAQ==');
@$core.Deprecated('Use dataTypeDescriptor instead')
const DataType$json = const {
  '1': 'DataType',
  '2': const [
    const {'1': 'BINARIES', '2': 0},
    const {'1': 'BASE64', '2': 1},
  ],
};

/// Descriptor for `DataType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List dataTypeDescriptor = $convert.base64Decode('CghEYXRhVHlwZRIMCghCSU5BUklFUxAAEgoKBkJBU0U2NBAB');
@$core.Deprecated('Use userRoleDescriptor instead')
const UserRole$json = const {
  '1': 'UserRole',
  '2': const [
    const {'1': 'NormalUser', '2': 0},
    const {'1': 'OperationalUser', '2': 1},
    const {'1': 'UserRoleMax', '2': 2},
  ],
};

/// Descriptor for `UserRole`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List userRoleDescriptor = $convert.base64Decode('CghVc2VyUm9sZRIOCgpOb3JtYWxVc2VyEAASEwoPT3BlcmF0aW9uYWxVc2VyEAESDwoLVXNlclJvbGVNYXgQAg==');
@$core.Deprecated('Use motionSensorTypeDescriptor instead')
const MotionSensorType$json = const {
  '1': 'MotionSensorType',
  '2': const [
    const {'1': 'MotionSensor', '2': 0},
    const {'1': 'DoorSensor', '2': 1},
    const {'1': 'LeakSensor', '2': 2},
    const {'1': 'SmokeSensor', '2': 3},
    const {'1': 'GasSensor', '2': 4},
    const {'1': 'Temperature_Humidity_Pressure', '2': 5},
    const {'1': 'Motion_Light', '2': 6},
    const {'1': 'Motion_Vibrate', '2': 7},
  ],
};

/// Descriptor for `MotionSensorType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List motionSensorTypeDescriptor = $convert.base64Decode('ChBNb3Rpb25TZW5zb3JUeXBlEhAKDE1vdGlvblNlbnNvchAAEg4KCkRvb3JTZW5zb3IQARIOCgpMZWFrU2Vuc29yEAISDwoLU21va2VTZW5zb3IQAxINCglHYXNTZW5zb3IQBBIhCh1UZW1wZXJhdHVyZV9IdW1pZGl0eV9QcmVzc3VyZRAFEhAKDE1vdGlvbl9MaWdodBAGEhIKDk1vdGlvbl9WaWJyYXRlEAc=');
@$core.Deprecated('Use environmentSensorTypeDescriptor instead')
const EnvironmentSensorType$json = const {
  '1': 'EnvironmentSensorType',
  '2': const [
    const {'1': 'Unknow', '2': 0},
    const {'1': 'Temperature', '2': 1},
    const {'1': 'Humidity', '2': 2},
    const {'1': 'Pressure', '2': 3},
    const {'1': 'Light', '2': 4},
    const {'1': 'Vibrate', '2': 5},
  ],
};

/// Descriptor for `EnvironmentSensorType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List environmentSensorTypeDescriptor = $convert.base64Decode('ChVFbnZpcm9ubWVudFNlbnNvclR5cGUSCgoGVW5rbm93EAASDwoLVGVtcGVyYXR1cmUQARIMCghIdW1pZGl0eRACEgwKCFByZXNzdXJlEAMSCQoFTGlnaHQQBBILCgdWaWJyYXRlEAU=');
@$core.Deprecated('Use dateTimeDescriptor instead')
const DateTime$json = const {
  '1': 'DateTime',
  '2': const [
    const {'1': 'day', '3': 1, '4': 1, '5': 13, '10': 'day'},
    const {'1': 'month', '3': 2, '4': 1, '5': 13, '10': 'month'},
    const {'1': 'year', '3': 3, '4': 1, '5': 13, '10': 'year'},
    const {'1': 'hour', '3': 4, '4': 1, '5': 13, '10': 'hour'},
    const {'1': 'minute', '3': 5, '4': 1, '5': 13, '10': 'minute'},
    const {'1': 'second', '3': 6, '4': 1, '5': 13, '10': 'second'},
  ],
};

/// Descriptor for `DateTime`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dateTimeDescriptor = $convert.base64Decode('CghEYXRlVGltZRIQCgNkYXkYASABKA1SA2RheRIUCgVtb250aBgCIAEoDVIFbW9udGgSEgoEeWVhchgDIAEoDVIEeWVhchISCgRob3VyGAQgASgNUgRob3VyEhYKBm1pbnV0ZRgFIAEoDVIGbWludXRlEhYKBnNlY29uZBgGIAEoDVIGc2Vjb25k');
@$core.Deprecated('Use projectDescriptor instead')
const Project$json = const {
  '1': 'Project',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Project`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectDescriptor = $convert.base64Decode('CgdQcm9qZWN0Eg4KAmlkGAEgASgJUgJpZBISCgRjb2RlGAIgASgJUgRjb2RlEhIKBG5hbWUYAyABKAlSBG5hbWU=');
@$core.Deprecated('Use buildingDescriptor instead')
const Building$json = const {
  '1': 'Building',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Building`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buildingDescriptor = $convert.base64Decode('CghCdWlsZGluZxIOCgJpZBgBIAEoCVICaWQSEgoEY29kZRgCIAEoCVIEY29kZRISCgRuYW1lGAMgASgJUgRuYW1l');
@$core.Deprecated('Use floorDescriptor instead')
const Floor$json = const {
  '1': 'Floor',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Floor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List floorDescriptor = $convert.base64Decode('CgVGbG9vchIOCgJpZBgBIAEoCVICaWQSEgoEY29kZRgCIAEoCVIEY29kZRISCgRuYW1lGAMgASgJUgRuYW1l');
@$core.Deprecated('Use apartmentDescriptor instead')
const Apartment$json = const {
  '1': 'Apartment',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Apartment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List apartmentDescriptor = $convert.base64Decode('CglBcGFydG1lbnQSDgoCaWQYASABKAlSAmlkEhIKBGNvZGUYAiABKAlSBGNvZGUSEgoEbmFtZRgDIAEoCVIEbmFtZQ==');
@$core.Deprecated('Use imageNetworkDescriptor instead')
const ImageNetwork$json = const {
  '1': 'ImageNetwork',
  '2': const [
    const {'1': 'thumb', '3': 1, '4': 1, '5': 9, '10': 'thumb'},
    const {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `ImageNetwork`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageNetworkDescriptor = $convert.base64Decode('CgxJbWFnZU5ldHdvcmsSFAoFdGh1bWIYASABKAlSBXRodW1iEhAKA3VybBgCIAEoCVIDdXJs');
@$core.Deprecated('Use groupControlDescriptor instead')
const GroupControl$json = const {
  '1': 'GroupControl',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'nameEn', '3': 3, '4': 1, '5': 9, '10': 'nameEn'},
    const {'1': 'icon', '3': 4, '4': 1, '5': 9, '10': 'icon'},
    const {'1': 'group', '3': 5, '4': 1, '5': 14, '6': '.GroupDevice', '10': 'group'},
    const {'1': 'room', '3': 6, '4': 1, '5': 11, '6': '.Room', '10': 'room'},
    const {'1': 'count', '3': 7, '4': 1, '5': 13, '10': 'count'},
    const {'1': 'favorite', '3': 8, '4': 1, '5': 8, '10': 'favorite'},
    const {'1': 'showHome', '3': 9, '4': 1, '5': 8, '10': 'showHome'},
    const {'1': 'autoOff', '3': 10, '4': 1, '5': 13, '10': 'autoOff'},
    const {'1': 'device', '3': 11, '4': 1, '5': 11, '6': '.Device', '10': 'device'},
    const {'1': 'state', '3': 12, '4': 1, '5': 11, '6': '.ControlState', '10': 'state'},
    const {'1': 'switchers', '3': 13, '4': 3, '5': 11, '6': '.Switcher', '10': 'switchers'},
    const {'1': 'curtainSwitchers', '3': 14, '4': 3, '5': 11, '6': '.CurtainSwitcher', '10': 'curtainSwitchers'},
    const {'1': 'remotes', '3': 15, '4': 3, '5': 11, '6': '.Remote', '10': 'remotes'},
    const {'1': 'curtains', '3': 16, '4': 3, '5': 11, '6': '.Curtain', '10': 'curtains'},
  ],
};

/// Descriptor for `GroupControl`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupControlDescriptor = $convert.base64Decode('CgxHcm91cENvbnRyb2wSDgoCaWQYASABKAlSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSFgoGbmFtZUVuGAMgASgJUgZuYW1lRW4SEgoEaWNvbhgEIAEoCVIEaWNvbhIiCgVncm91cBgFIAEoDjIMLkdyb3VwRGV2aWNlUgVncm91cBIZCgRyb29tGAYgASgLMgUuUm9vbVIEcm9vbRIUCgVjb3VudBgHIAEoDVIFY291bnQSGgoIZmF2b3JpdGUYCCABKAhSCGZhdm9yaXRlEhoKCHNob3dIb21lGAkgASgIUghzaG93SG9tZRIYCgdhdXRvT2ZmGAogASgNUgdhdXRvT2ZmEh8KBmRldmljZRgLIAEoCzIHLkRldmljZVIGZGV2aWNlEiMKBXN0YXRlGAwgASgLMg0uQ29udHJvbFN0YXRlUgVzdGF0ZRInCglzd2l0Y2hlcnMYDSADKAsyCS5Td2l0Y2hlclIJc3dpdGNoZXJzEjwKEGN1cnRhaW5Td2l0Y2hlcnMYDiADKAsyEC5DdXJ0YWluU3dpdGNoZXJSEGN1cnRhaW5Td2l0Y2hlcnMSIQoHcmVtb3RlcxgPIAMoCzIHLlJlbW90ZVIHcmVtb3RlcxIkCghjdXJ0YWlucxgQIAMoCzIILkN1cnRhaW5SCGN1cnRhaW5z');
@$core.Deprecated('Use deviceDescriptor instead')
const Device$json = const {
  '1': 'Device',
  '2': const [
    const {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'roomId', '3': 2, '4': 1, '5': 9, '10': 'roomId'},
    const {'1': 'deviceToken', '3': 3, '4': 1, '5': 9, '10': 'deviceToken'},
    const {'1': 'deviceName', '3': 4, '4': 1, '5': 9, '10': 'deviceName'},
    const {'1': 'brandName', '3': 5, '4': 1, '5': 9, '10': 'brandName'},
    const {'1': 'roomName', '3': 6, '4': 1, '5': 9, '10': 'roomName'},
    const {'1': 'icon', '3': 7, '4': 1, '5': 9, '10': 'icon'},
    const {'1': 'ip', '3': 8, '4': 1, '5': 9, '10': 'ip'},
    const {'1': 'mdns', '3': 9, '4': 1, '5': 9, '10': 'mdns'},
    const {'1': 'model', '3': 10, '4': 1, '5': 9, '10': 'model'},
    const {'1': 'signal', '3': 11, '4': 1, '5': 5, '10': 'signal'},
    const {'1': 'firmwareVersion', '3': 12, '4': 1, '5': 9, '10': 'firmwareVersion'},
    const {'1': 'hardwareVersion', '3': 13, '4': 1, '5': 9, '10': 'hardwareVersion'},
    const {'1': 'hardwareId', '3': 14, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'accessKey', '3': 15, '4': 1, '5': 9, '10': 'accessKey'},
    const {'1': 'connectionState', '3': 16, '4': 1, '5': 14, '6': '.ConnectionState', '10': 'connectionState'},
    const {'1': 'group', '3': 17, '4': 1, '5': 14, '6': '.GroupDevice', '10': 'group'},
    const {'1': 'updateMode', '3': 18, '4': 1, '5': 13, '10': 'updateMode'},
    const {'1': 'gatewayId', '3': 19, '4': 1, '5': 9, '10': 'gatewayId'},
    const {'1': 'reactivity', '3': 20, '4': 1, '5': 13, '10': 'reactivity'},
    const {'1': 'brightness', '3': 21, '4': 1, '5': 13, '10': 'brightness'},
    const {'1': 'timeDelay', '3': 22, '4': 1, '5': 13, '10': 'timeDelay'},
    const {'1': 'sceneActiveMap', '3': 23, '4': 1, '5': 13, '10': 'sceneActiveMap'},
    const {'1': 'notification', '3': 24, '4': 1, '5': 8, '10': 'notification'},
  ],
};

/// Descriptor for `Device`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceDescriptor = $convert.base64Decode('CgZEZXZpY2USGgoIZGV2aWNlSWQYASABKAlSCGRldmljZUlkEhYKBnJvb21JZBgCIAEoCVIGcm9vbUlkEiAKC2RldmljZVRva2VuGAMgASgJUgtkZXZpY2VUb2tlbhIeCgpkZXZpY2VOYW1lGAQgASgJUgpkZXZpY2VOYW1lEhwKCWJyYW5kTmFtZRgFIAEoCVIJYnJhbmROYW1lEhoKCHJvb21OYW1lGAYgASgJUghyb29tTmFtZRISCgRpY29uGAcgASgJUgRpY29uEg4KAmlwGAggASgJUgJpcBISCgRtZG5zGAkgASgJUgRtZG5zEhQKBW1vZGVsGAogASgJUgVtb2RlbBIWCgZzaWduYWwYCyABKAVSBnNpZ25hbBIoCg9maXJtd2FyZVZlcnNpb24YDCABKAlSD2Zpcm13YXJlVmVyc2lvbhIoCg9oYXJkd2FyZVZlcnNpb24YDSABKAlSD2hhcmR3YXJlVmVyc2lvbhIeCgpoYXJkd2FyZUlkGA4gASgJUgpoYXJkd2FyZUlkEhwKCWFjY2Vzc0tleRgPIAEoCVIJYWNjZXNzS2V5EjoKD2Nvbm5lY3Rpb25TdGF0ZRgQIAEoDjIQLkNvbm5lY3Rpb25TdGF0ZVIPY29ubmVjdGlvblN0YXRlEiIKBWdyb3VwGBEgASgOMgwuR3JvdXBEZXZpY2VSBWdyb3VwEh4KCnVwZGF0ZU1vZGUYEiABKA1SCnVwZGF0ZU1vZGUSHAoJZ2F0ZXdheUlkGBMgASgJUglnYXRld2F5SWQSHgoKcmVhY3Rpdml0eRgUIAEoDVIKcmVhY3Rpdml0eRIeCgpicmlnaHRuZXNzGBUgASgNUgpicmlnaHRuZXNzEhwKCXRpbWVEZWxheRgWIAEoDVIJdGltZURlbGF5EiYKDnNjZW5lQWN0aXZlTWFwGBcgASgNUg5zY2VuZUFjdGl2ZU1hcBIiCgxub3RpZmljYXRpb24YGCABKAhSDG5vdGlmaWNhdGlvbg==');
@$core.Deprecated('Use switcherDescriptor instead')
const Switcher$json = const {
  '1': 'Switcher',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'nameEn', '3': 3, '4': 1, '5': 9, '10': 'nameEn'},
    const {'1': 'icon', '3': 4, '4': 1, '5': 9, '10': 'icon'},
    const {'1': 'switcher', '3': 5, '4': 1, '5': 13, '10': 'switcher'},
    const {'1': 'powerState', '3': 6, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'keepState', '3': 7, '4': 1, '5': 13, '10': 'keepState'},
    const {'1': 'favorite', '3': 8, '4': 1, '5': 8, '10': 'favorite'},
    const {'1': 'order', '3': 9, '4': 1, '5': 13, '10': 'order'},
    const {'1': 'device', '3': 10, '4': 1, '5': 11, '6': '.Device', '10': 'device'},
    const {'1': 'room', '3': 11, '4': 1, '5': 11, '6': '.Room', '10': 'room'},
    const {'1': 'type', '3': 12, '4': 1, '5': 14, '6': '.TypeDevice', '10': 'type'},
    const {'1': 'showHome', '3': 13, '4': 1, '5': 8, '10': 'showHome'},
    const {'1': 'autoOff', '3': 14, '4': 1, '5': 13, '10': 'autoOff'},
    const {'1': 'groupControl', '3': 15, '4': 1, '5': 11, '6': '.GroupControl', '10': 'groupControl'},
  ],
};

/// Descriptor for `Switcher`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List switcherDescriptor = $convert.base64Decode('CghTd2l0Y2hlchIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIWCgZuYW1lRW4YAyABKAlSBm5hbWVFbhISCgRpY29uGAQgASgJUgRpY29uEhoKCHN3aXRjaGVyGAUgASgNUghzd2l0Y2hlchIrCgpwb3dlclN0YXRlGAYgASgOMgsuUG93ZXJTdGF0ZVIKcG93ZXJTdGF0ZRIcCglrZWVwU3RhdGUYByABKA1SCWtlZXBTdGF0ZRIaCghmYXZvcml0ZRgIIAEoCFIIZmF2b3JpdGUSFAoFb3JkZXIYCSABKA1SBW9yZGVyEh8KBmRldmljZRgKIAEoCzIHLkRldmljZVIGZGV2aWNlEhkKBHJvb20YCyABKAsyBS5Sb29tUgRyb29tEh8KBHR5cGUYDCABKA4yCy5UeXBlRGV2aWNlUgR0eXBlEhoKCHNob3dIb21lGA0gASgIUghzaG93SG9tZRIYCgdhdXRvT2ZmGA4gASgNUgdhdXRvT2ZmEjEKDGdyb3VwQ29udHJvbBgPIAEoCzINLkdyb3VwQ29udHJvbFIMZ3JvdXBDb250cm9s');
@$core.Deprecated('Use ledItemDescriptor instead')
const LedItem$json = const {
  '1': 'LedItem',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'nameEn', '3': 3, '4': 1, '5': 9, '10': 'nameEn'},
    const {'1': 'icon', '3': 4, '4': 1, '5': 9, '10': 'icon'},
    const {'1': 'index', '3': 5, '4': 1, '5': 13, '10': 'index'},
    const {'1': 'brightnessPercent', '3': 6, '4': 1, '5': 5, '10': 'brightnessPercent'},
    const {'1': 'powerState', '3': 7, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'keepState', '3': 8, '4': 1, '5': 13, '10': 'keepState'},
    const {'1': 'favorite', '3': 9, '4': 1, '5': 8, '10': 'favorite'},
    const {'1': 'order', '3': 10, '4': 1, '5': 13, '10': 'order'},
    const {'1': 'device', '3': 11, '4': 1, '5': 11, '6': '.Device', '10': 'device'},
    const {'1': 'room', '3': 12, '4': 1, '5': 11, '6': '.Room', '10': 'room'},
    const {'1': 'showHome', '3': 13, '4': 1, '5': 8, '10': 'showHome'},
    const {'1': 'autoOff', '3': 14, '4': 1, '5': 13, '10': 'autoOff'},
    const {'1': 'groupControl', '3': 15, '4': 1, '5': 11, '6': '.GroupControl', '10': 'groupControl'},
  ],
};

/// Descriptor for `LedItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ledItemDescriptor = $convert.base64Decode('CgdMZWRJdGVtEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhYKBm5hbWVFbhgDIAEoCVIGbmFtZUVuEhIKBGljb24YBCABKAlSBGljb24SFAoFaW5kZXgYBSABKA1SBWluZGV4EiwKEWJyaWdodG5lc3NQZXJjZW50GAYgASgFUhFicmlnaHRuZXNzUGVyY2VudBIrCgpwb3dlclN0YXRlGAcgASgOMgsuUG93ZXJTdGF0ZVIKcG93ZXJTdGF0ZRIcCglrZWVwU3RhdGUYCCABKA1SCWtlZXBTdGF0ZRIaCghmYXZvcml0ZRgJIAEoCFIIZmF2b3JpdGUSFAoFb3JkZXIYCiABKA1SBW9yZGVyEh8KBmRldmljZRgLIAEoCzIHLkRldmljZVIGZGV2aWNlEhkKBHJvb20YDCABKAsyBS5Sb29tUgRyb29tEhoKCHNob3dIb21lGA0gASgIUghzaG93SG9tZRIYCgdhdXRvT2ZmGA4gASgNUgdhdXRvT2ZmEjEKDGdyb3VwQ29udHJvbBgPIAEoCzINLkdyb3VwQ29udHJvbFIMZ3JvdXBDb250cm9s');
@$core.Deprecated('Use ledDriverDescriptor instead')
const LedDriver$json = const {
  '1': 'LedDriver',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'nameEn', '3': 3, '4': 1, '5': 9, '10': 'nameEn'},
    const {'1': 'icon', '3': 4, '4': 1, '5': 9, '10': 'icon'},
    const {'1': 'ledItems', '3': 5, '4': 3, '5': 11, '6': '.LedItem', '10': 'ledItems'},
    const {'1': 'device', '3': 6, '4': 1, '5': 11, '6': '.Device', '10': 'device'},
    const {'1': 'room', '3': 7, '4': 1, '5': 11, '6': '.Room', '10': 'room'},
    const {'1': 'powerState', '3': 8, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'brightnessPercent', '3': 9, '4': 1, '5': 5, '10': 'brightnessPercent'},
    const {'1': 'groupControl', '3': 10, '4': 1, '5': 11, '6': '.GroupControl', '10': 'groupControl'},
  ],
};

/// Descriptor for `LedDriver`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ledDriverDescriptor = $convert.base64Decode('CglMZWREcml2ZXISDgoCaWQYASABKAlSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSFgoGbmFtZUVuGAMgASgJUgZuYW1lRW4SEgoEaWNvbhgEIAEoCVIEaWNvbhIkCghsZWRJdGVtcxgFIAMoCzIILkxlZEl0ZW1SCGxlZEl0ZW1zEh8KBmRldmljZRgGIAEoCzIHLkRldmljZVIGZGV2aWNlEhkKBHJvb20YByABKAsyBS5Sb29tUgRyb29tEisKCnBvd2VyU3RhdGUYCCABKA4yCy5Qb3dlclN0YXRlUgpwb3dlclN0YXRlEiwKEWJyaWdodG5lc3NQZXJjZW50GAkgASgFUhFicmlnaHRuZXNzUGVyY2VudBIxCgxncm91cENvbnRyb2wYCiABKAsyDS5Hcm91cENvbnRyb2xSDGdyb3VwQ29udHJvbA==');
@$core.Deprecated('Use bridgeInfoDescriptor instead')
const BridgeInfo$json = const {
  '1': 'BridgeInfo',
  '2': const [
    const {'1': 'targetSwitcher', '3': 1, '4': 1, '5': 13, '10': 'targetSwitcher'},
    const {'1': 'targetHardwareId', '3': 2, '4': 1, '5': 9, '10': 'targetHardwareId'},
    const {'1': 'bridgeType', '3': 3, '4': 1, '5': 13, '10': 'bridgeType'},
    const {'1': 'deviceType', '3': 4, '4': 1, '5': 14, '6': '.GroupDevice', '10': 'deviceType'},
    const {'1': 'executed', '3': 5, '4': 1, '5': 8, '10': 'executed'},
  ],
};

/// Descriptor for `BridgeInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bridgeInfoDescriptor = $convert.base64Decode('CgpCcmlkZ2VJbmZvEiYKDnRhcmdldFN3aXRjaGVyGAEgASgNUg50YXJnZXRTd2l0Y2hlchIqChB0YXJnZXRIYXJkd2FyZUlkGAIgASgJUhB0YXJnZXRIYXJkd2FyZUlkEh4KCmJyaWRnZVR5cGUYAyABKA1SCmJyaWRnZVR5cGUSLAoKZGV2aWNlVHlwZRgEIAEoDjIMLkdyb3VwRGV2aWNlUgpkZXZpY2VUeXBlEhoKCGV4ZWN1dGVkGAUgASgIUghleGVjdXRlZA==');
@$core.Deprecated('Use curtainSwitcherDescriptor instead')
const CurtainSwitcher$json = const {
  '1': 'CurtainSwitcher',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'icon', '3': 3, '4': 1, '5': 9, '10': 'icon'},
    const {'1': 'favorite', '3': 4, '4': 1, '5': 8, '10': 'favorite'},
    const {'1': 'order', '3': 5, '4': 1, '5': 13, '10': 'order'},
    const {'1': 'device', '3': 6, '4': 1, '5': 11, '6': '.Device', '10': 'device'},
    const {'1': 'percentIn', '3': 7, '4': 1, '5': 13, '10': 'percentIn'},
    const {'1': 'percentOut', '3': 8, '4': 1, '5': 13, '10': 'percentOut'},
    const {'1': 'nameEn', '3': 9, '4': 1, '5': 9, '10': 'nameEn'},
    const {'1': 'room', '3': 10, '4': 1, '5': 11, '6': '.Room', '10': 'room'},
    const {'1': 'showHome', '3': 11, '4': 1, '5': 8, '10': 'showHome'},
    const {'1': 'autoOff', '3': 12, '4': 1, '5': 13, '10': 'autoOff'},
    const {'1': 'groupControl', '3': 13, '4': 1, '5': 11, '6': '.GroupControl', '10': 'groupControl'},
  ],
};

/// Descriptor for `CurtainSwitcher`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List curtainSwitcherDescriptor = $convert.base64Decode('Cg9DdXJ0YWluU3dpdGNoZXISDgoCaWQYASABKAlSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSEgoEaWNvbhgDIAEoCVIEaWNvbhIaCghmYXZvcml0ZRgEIAEoCFIIZmF2b3JpdGUSFAoFb3JkZXIYBSABKA1SBW9yZGVyEh8KBmRldmljZRgGIAEoCzIHLkRldmljZVIGZGV2aWNlEhwKCXBlcmNlbnRJbhgHIAEoDVIJcGVyY2VudEluEh4KCnBlcmNlbnRPdXQYCCABKA1SCnBlcmNlbnRPdXQSFgoGbmFtZUVuGAkgASgJUgZuYW1lRW4SGQoEcm9vbRgKIAEoCzIFLlJvb21SBHJvb20SGgoIc2hvd0hvbWUYCyABKAhSCHNob3dIb21lEhgKB2F1dG9PZmYYDCABKA1SB2F1dG9PZmYSMQoMZ3JvdXBDb250cm9sGA0gASgLMg0uR3JvdXBDb250cm9sUgxncm91cENvbnRyb2w=');
@$core.Deprecated('Use curtainDescriptor instead')
const Curtain$json = const {
  '1': 'Curtain',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'icon', '3': 3, '4': 1, '5': 9, '10': 'icon'},
    const {'1': 'favorite', '3': 4, '4': 1, '5': 8, '10': 'favorite'},
    const {'1': 'order', '3': 5, '4': 1, '5': 13, '10': 'order'},
    const {'1': 'device', '3': 6, '4': 1, '5': 11, '6': '.Device', '10': 'device'},
    const {'1': 'percent', '3': 7, '4': 1, '5': 13, '10': 'percent'},
    const {'1': 'nameEn', '3': 8, '4': 1, '5': 9, '10': 'nameEn'},
    const {'1': 'room', '3': 9, '4': 1, '5': 11, '6': '.Room', '10': 'room'},
    const {'1': 'showHome', '3': 10, '4': 1, '5': 8, '10': 'showHome'},
    const {'1': 'groupControl', '3': 11, '4': 1, '5': 11, '6': '.GroupControl', '10': 'groupControl'},
  ],
};

/// Descriptor for `Curtain`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List curtainDescriptor = $convert.base64Decode('CgdDdXJ0YWluEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhIKBGljb24YAyABKAlSBGljb24SGgoIZmF2b3JpdGUYBCABKAhSCGZhdm9yaXRlEhQKBW9yZGVyGAUgASgNUgVvcmRlchIfCgZkZXZpY2UYBiABKAsyBy5EZXZpY2VSBmRldmljZRIYCgdwZXJjZW50GAcgASgNUgdwZXJjZW50EhYKBm5hbWVFbhgIIAEoCVIGbmFtZUVuEhkKBHJvb20YCSABKAsyBS5Sb29tUgRyb29tEhoKCHNob3dIb21lGAogASgIUghzaG93SG9tZRIxCgxncm91cENvbnRyb2wYCyABKAsyDS5Hcm91cENvbnRyb2xSDGdyb3VwQ29udHJvbA==');
@$core.Deprecated('Use motionDescriptor instead')
const Motion$json = const {
  '1': 'Motion',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'icon', '3': 3, '4': 1, '5': 9, '10': 'icon'},
    const {'1': 'state', '3': 4, '4': 1, '5': 14, '6': '.MotionState', '10': 'state'},
    const {'1': 'favorite', '3': 5, '4': 1, '5': 8, '10': 'favorite'},
    const {'1': 'order', '3': 6, '4': 1, '5': 13, '10': 'order'},
    const {'1': 'device', '3': 7, '4': 1, '5': 11, '6': '.Device', '10': 'device'},
    const {'1': 'nameEn', '3': 8, '4': 1, '5': 9, '10': 'nameEn'},
    const {'1': 'type', '3': 9, '4': 1, '5': 14, '6': '.MotionSensorType', '10': 'type'},
    const {'1': 'battery', '3': 10, '4': 1, '5': 13, '10': 'battery'},
    const {'1': 'notification', '3': 11, '4': 1, '5': 8, '10': 'notification'},
  ],
};

/// Descriptor for `Motion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List motionDescriptor = $convert.base64Decode('CgZNb3Rpb24SDgoCaWQYASABKAlSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSEgoEaWNvbhgDIAEoCVIEaWNvbhIiCgVzdGF0ZRgEIAEoDjIMLk1vdGlvblN0YXRlUgVzdGF0ZRIaCghmYXZvcml0ZRgFIAEoCFIIZmF2b3JpdGUSFAoFb3JkZXIYBiABKA1SBW9yZGVyEh8KBmRldmljZRgHIAEoCzIHLkRldmljZVIGZGV2aWNlEhYKBm5hbWVFbhgIIAEoCVIGbmFtZUVuEiUKBHR5cGUYCSABKA4yES5Nb3Rpb25TZW5zb3JUeXBlUgR0eXBlEhgKB2JhdHRlcnkYCiABKA1SB2JhdHRlcnkSIgoMbm90aWZpY2F0aW9uGAsgASgIUgxub3RpZmljYXRpb24=');
@$core.Deprecated('Use homekitDescriptor instead')
const Homekit$json = const {
  '1': 'Homekit',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'icon', '3': 2, '4': 1, '5': 9, '10': 'icon'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'nameEn', '3': 4, '4': 1, '5': 9, '10': 'nameEn'},
    const {'1': 'mode', '3': 5, '4': 1, '5': 14, '6': '.HomekitMode', '10': 'mode'},
    const {'1': 'favorite', '3': 6, '4': 1, '5': 8, '10': 'favorite'},
    const {'1': 'order', '3': 7, '4': 1, '5': 13, '10': 'order'},
    const {'1': 'device', '3': 8, '4': 1, '5': 11, '6': '.Device', '10': 'device'},
  ],
};

/// Descriptor for `Homekit`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List homekitDescriptor = $convert.base64Decode('CgdIb21la2l0Eg4KAmlkGAEgASgJUgJpZBISCgRpY29uGAIgASgJUgRpY29uEhIKBG5hbWUYAyABKAlSBG5hbWUSFgoGbmFtZUVuGAQgASgJUgZuYW1lRW4SIAoEbW9kZRgFIAEoDjIMLkhvbWVraXRNb2RlUgRtb2RlEhoKCGZhdm9yaXRlGAYgASgIUghmYXZvcml0ZRIUCgVvcmRlchgHIAEoDVIFb3JkZXISHwoGZGV2aWNlGAggASgLMgcuRGV2aWNlUgZkZXZpY2U=');
@$core.Deprecated('Use remoteDescriptor instead')
const Remote$json = const {
  '1': 'Remote',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'remoteLibraryId', '3': 2, '4': 1, '5': 9, '10': 'remoteLibraryId'},
    const {'1': 'deviceId', '3': 3, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'icon', '3': 5, '4': 1, '5': 9, '10': 'icon'},
    const {'1': 'favorite', '3': 6, '4': 1, '5': 8, '10': 'favorite'},
    const {'1': 'order', '3': 7, '4': 1, '5': 13, '10': 'order'},
    const {'1': 'library', '3': 8, '4': 1, '5': 11, '6': '.RemoteLibrary', '10': 'library'},
    const {'1': 'device', '3': 9, '4': 1, '5': 11, '6': '.Device', '10': 'device'},
    const {'1': 'state', '3': 10, '4': 1, '5': 11, '6': '.AirConditionerState', '10': 'state'},
    const {'1': 'nameEn', '3': 11, '4': 1, '5': 9, '10': 'nameEn'},
    const {'1': 'roomId', '3': 12, '4': 1, '5': 9, '10': 'roomId'},
    const {'1': 'roomName', '3': 13, '4': 1, '5': 9, '10': 'roomName'},
    const {'1': 'showHome', '3': 14, '4': 1, '5': 8, '10': 'showHome'},
  ],
};

/// Descriptor for `Remote`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteDescriptor = $convert.base64Decode('CgZSZW1vdGUSDgoCaWQYASABKAlSAmlkEigKD3JlbW90ZUxpYnJhcnlJZBgCIAEoCVIPcmVtb3RlTGlicmFyeUlkEhoKCGRldmljZUlkGAMgASgJUghkZXZpY2VJZBISCgRuYW1lGAQgASgJUgRuYW1lEhIKBGljb24YBSABKAlSBGljb24SGgoIZmF2b3JpdGUYBiABKAhSCGZhdm9yaXRlEhQKBW9yZGVyGAcgASgNUgVvcmRlchIoCgdsaWJyYXJ5GAggASgLMg4uUmVtb3RlTGlicmFyeVIHbGlicmFyeRIfCgZkZXZpY2UYCSABKAsyBy5EZXZpY2VSBmRldmljZRIqCgVzdGF0ZRgKIAEoCzIULkFpckNvbmRpdGlvbmVyU3RhdGVSBXN0YXRlEhYKBm5hbWVFbhgLIAEoCVIGbmFtZUVuEhYKBnJvb21JZBgMIAEoCVIGcm9vbUlkEhoKCHJvb21OYW1lGA0gASgJUghyb29tTmFtZRIaCghzaG93SG9tZRgOIAEoCFIIc2hvd0hvbWU=');
@$core.Deprecated('Use buttonDescriptor instead')
const Button$json = const {
  '1': 'Button',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'icon', '3': 2, '4': 1, '5': 9, '10': 'icon'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'nameEn', '3': 4, '4': 1, '5': 9, '10': 'nameEn'},
    const {'1': 'buttonState', '3': 5, '4': 1, '5': 14, '6': '.ButtonState', '10': 'buttonState'},
    const {'1': 'favorite', '3': 6, '4': 1, '5': 8, '10': 'favorite'},
    const {'1': 'order', '3': 7, '4': 1, '5': 13, '10': 'order'},
    const {'1': 'device', '3': 8, '4': 1, '5': 11, '6': '.Device', '10': 'device'},
    const {'1': 'index', '3': 9, '4': 1, '5': 13, '10': 'index'},
    const {'1': 'battery', '3': 10, '4': 1, '5': 13, '10': 'battery'},
    const {'1': 'roomId', '3': 11, '4': 1, '5': 9, '10': 'roomId'},
    const {'1': 'roomName', '3': 12, '4': 1, '5': 9, '10': 'roomName'},
    const {'1': 'showHome', '3': 13, '4': 1, '5': 8, '10': 'showHome'},
  ],
};

/// Descriptor for `Button`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buttonDescriptor = $convert.base64Decode('CgZCdXR0b24SDgoCaWQYASABKAlSAmlkEhIKBGljb24YAiABKAlSBGljb24SEgoEbmFtZRgDIAEoCVIEbmFtZRIWCgZuYW1lRW4YBCABKAlSBm5hbWVFbhIuCgtidXR0b25TdGF0ZRgFIAEoDjIMLkJ1dHRvblN0YXRlUgtidXR0b25TdGF0ZRIaCghmYXZvcml0ZRgGIAEoCFIIZmF2b3JpdGUSFAoFb3JkZXIYByABKA1SBW9yZGVyEh8KBmRldmljZRgIIAEoCzIHLkRldmljZVIGZGV2aWNlEhQKBWluZGV4GAkgASgNUgVpbmRleBIYCgdiYXR0ZXJ5GAogASgNUgdiYXR0ZXJ5EhYKBnJvb21JZBgLIAEoCVIGcm9vbUlkEhoKCHJvb21OYW1lGAwgASgJUghyb29tTmFtZRIaCghzaG93SG9tZRgNIAEoCFIIc2hvd0hvbWU=');
@$core.Deprecated('Use touchPanelDescriptor instead')
const TouchPanel$json = const {
  '1': 'TouchPanel',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'device', '3': 2, '4': 1, '5': 11, '6': '.Device', '10': 'device'},
    const {'1': 'icon', '3': 3, '4': 1, '5': 9, '10': 'icon'},
    const {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'nameEn', '3': 5, '4': 1, '5': 9, '10': 'nameEn'},
    const {'1': 'favorite', '3': 6, '4': 1, '5': 8, '10': 'favorite'},
    const {'1': 'room', '3': 7, '4': 1, '5': 11, '6': '.Room', '10': 'room'},
    const {'1': 'showHome', '3': 8, '4': 1, '5': 8, '10': 'showHome'},
    const {'1': 'autoOff', '3': 9, '4': 1, '5': 13, '10': 'autoOff'},
  ],
};

/// Descriptor for `TouchPanel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List touchPanelDescriptor = $convert.base64Decode('CgpUb3VjaFBhbmVsEg4KAmlkGAEgASgJUgJpZBIfCgZkZXZpY2UYAiABKAsyBy5EZXZpY2VSBmRldmljZRISCgRpY29uGAMgASgJUgRpY29uEhIKBG5hbWUYBCABKAlSBG5hbWUSFgoGbmFtZUVuGAUgASgJUgZuYW1lRW4SGgoIZmF2b3JpdGUYBiABKAhSCGZhdm9yaXRlEhkKBHJvb20YByABKAsyBS5Sb29tUgRyb29tEhoKCHNob3dIb21lGAggASgIUghzaG93SG9tZRIYCgdhdXRvT2ZmGAkgASgNUgdhdXRvT2Zm');
@$core.Deprecated('Use remoteLibraryDescriptor instead')
const RemoteLibrary$json = const {
  '1': 'RemoteLibrary',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'icon', '3': 3, '4': 1, '5': 9, '10': 'icon'},
    const {'1': 'model', '3': 4, '4': 1, '5': 9, '10': 'model'},
    const {'1': 'uiRemoteTemplate', '3': 5, '4': 1, '5': 13, '10': 'uiRemoteTemplate'},
    const {'1': 'appVersion', '3': 6, '4': 1, '5': 9, '10': 'appVersion'},
    const {'1': 'group', '3': 7, '4': 1, '5': 14, '6': '.GroupRemote', '10': 'group'},
    const {'1': 'brand', '3': 8, '4': 1, '5': 11, '6': '.RemoteBrand', '10': 'brand'},
  ],
};

/// Descriptor for `RemoteLibrary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteLibraryDescriptor = $convert.base64Decode('Cg1SZW1vdGVMaWJyYXJ5Eg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhIKBGljb24YAyABKAlSBGljb24SFAoFbW9kZWwYBCABKAlSBW1vZGVsEioKEHVpUmVtb3RlVGVtcGxhdGUYBSABKA1SEHVpUmVtb3RlVGVtcGxhdGUSHgoKYXBwVmVyc2lvbhgGIAEoCVIKYXBwVmVyc2lvbhIiCgVncm91cBgHIAEoDjIMLkdyb3VwUmVtb3RlUgVncm91cBIiCgVicmFuZBgIIAEoCzIMLlJlbW90ZUJyYW5kUgVicmFuZA==');
@$core.Deprecated('Use remoteBrandDescriptor instead')
const RemoteBrand$json = const {
  '1': 'RemoteBrand',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'category', '3': 3, '4': 1, '5': 14, '6': '.RemoteCategory', '10': 'category'},
  ],
};

/// Descriptor for `RemoteBrand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteBrandDescriptor = $convert.base64Decode('CgtSZW1vdGVCcmFuZBIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIrCghjYXRlZ29yeRgDIAEoDjIPLlJlbW90ZUNhdGVnb3J5UghjYXRlZ29yeQ==');
@$core.Deprecated('Use remoteMultiDescriptor instead')
const RemoteMulti$json = const {
  '1': 'RemoteMulti',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'remoteId', '3': 2, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'remoteMultiLibraryCmds', '3': 5, '4': 3, '5': 11, '6': '.RemoteMultiLibraryCmd', '10': 'remoteMultiLibraryCmds'},
  ],
};

/// Descriptor for `RemoteMulti`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteMultiDescriptor = $convert.base64Decode('CgtSZW1vdGVNdWx0aRIOCgJpZBgBIAEoCVICaWQSGgoIcmVtb3RlSWQYAiABKAlSCHJlbW90ZUlkEhIKBG5hbWUYAyABKAlSBG5hbWUSTgoWcmVtb3RlTXVsdGlMaWJyYXJ5Q21kcxgFIAMoCzIWLlJlbW90ZU11bHRpTGlicmFyeUNtZFIWcmVtb3RlTXVsdGlMaWJyYXJ5Q21kcw==');
@$core.Deprecated('Use remoteMultiLibraryCmdDescriptor instead')
const RemoteMultiLibraryCmd$json = const {
  '1': 'RemoteMultiLibraryCmd',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'remoteMultiId', '3': 2, '4': 1, '5': 9, '10': 'remoteMultiId'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'order', '3': 4, '4': 1, '5': 13, '10': 'order'},
    const {'1': 'type', '3': 5, '4': 1, '5': 14, '6': '.TypeLearn', '10': 'type'},
  ],
};

/// Descriptor for `RemoteMultiLibraryCmd`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteMultiLibraryCmdDescriptor = $convert.base64Decode('ChVSZW1vdGVNdWx0aUxpYnJhcnlDbWQSDgoCaWQYASABKAlSAmlkEiQKDXJlbW90ZU11bHRpSWQYAiABKAlSDXJlbW90ZU11bHRpSWQSEgoEbmFtZRgDIAEoCVIEbmFtZRIUCgVvcmRlchgEIAEoDVIFb3JkZXISHgoEdHlwZRgFIAEoDjIKLlR5cGVMZWFyblIEdHlwZQ==');
@$core.Deprecated('Use airConditionerStateDescriptor instead')
const AirConditionerState$json = const {
  '1': 'AirConditionerState',
  '2': const [
    const {'1': 'remoteId', '3': 1, '4': 1, '5': 9, '10': 'remoteId'},
    const {'1': 'powerState', '3': 2, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'temperature', '3': 3, '4': 1, '5': 2, '10': 'temperature'},
    const {'1': 'mode', '3': 4, '4': 1, '5': 14, '6': '.ModeAc', '10': 'mode'},
    const {'1': 'swing', '3': 5, '4': 1, '5': 14, '6': '.SwingAc', '10': 'swing'},
    const {'1': 'fan', '3': 6, '4': 1, '5': 14, '6': '.FanAc', '10': 'fan'},
    const {'1': 'temperatureRoom', '3': 7, '4': 1, '5': 2, '10': 'temperatureRoom'},
    const {'1': 'humidityRoom', '3': 8, '4': 1, '5': 2, '10': 'humidityRoom'},
    const {'1': 'deviceId', '3': 9, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'connectionState', '3': 10, '4': 1, '5': 14, '6': '.ConnectionState', '10': 'connectionState'},
    const {'1': 'indoorId', '3': 11, '4': 1, '5': 13, '10': 'indoorId'},
  ],
};

/// Descriptor for `AirConditionerState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List airConditionerStateDescriptor = $convert.base64Decode('ChNBaXJDb25kaXRpb25lclN0YXRlEhoKCHJlbW90ZUlkGAEgASgJUghyZW1vdGVJZBIrCgpwb3dlclN0YXRlGAIgASgOMgsuUG93ZXJTdGF0ZVIKcG93ZXJTdGF0ZRIgCgt0ZW1wZXJhdHVyZRgDIAEoAlILdGVtcGVyYXR1cmUSGwoEbW9kZRgEIAEoDjIHLk1vZGVBY1IEbW9kZRIeCgVzd2luZxgFIAEoDjIILlN3aW5nQWNSBXN3aW5nEhgKA2ZhbhgGIAEoDjIGLkZhbkFjUgNmYW4SKAoPdGVtcGVyYXR1cmVSb29tGAcgASgCUg90ZW1wZXJhdHVyZVJvb20SIgoMaHVtaWRpdHlSb29tGAggASgCUgxodW1pZGl0eVJvb20SGgoIZGV2aWNlSWQYCSABKAlSCGRldmljZUlkEjoKD2Nvbm5lY3Rpb25TdGF0ZRgKIAEoDjIQLkNvbm5lY3Rpb25TdGF0ZVIPY29ubmVjdGlvblN0YXRlEhoKCGluZG9vcklkGAsgASgNUghpbmRvb3JJZA==');
@$core.Deprecated('Use controlStateDescriptor instead')
const ControlState$json = const {
  '1': 'ControlState',
  '2': const [
    const {'1': 'controlId', '3': 1, '4': 1, '5': 9, '10': 'controlId'},
    const {'1': 'group', '3': 2, '4': 1, '5': 14, '6': '.GroupDevice', '10': 'group'},
    const {'1': 'powerState', '3': 3, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'temperature', '3': 4, '4': 1, '5': 2, '10': 'temperature'},
    const {'1': 'mode', '3': 5, '4': 1, '5': 14, '6': '.ModeAc', '10': 'mode'},
    const {'1': 'swing', '3': 6, '4': 1, '5': 14, '6': '.SwingAc', '10': 'swing'},
    const {'1': 'fan', '3': 7, '4': 1, '5': 14, '6': '.FanAc', '10': 'fan'},
    const {'1': 'connectionState', '3': 8, '4': 1, '5': 14, '6': '.ConnectionState', '10': 'connectionState'},
    const {'1': 'percentIn', '3': 9, '4': 1, '5': 13, '10': 'percentIn'},
    const {'1': 'percentOut', '3': 10, '4': 1, '5': 13, '10': 'percentOut'},
  ],
};

/// Descriptor for `ControlState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List controlStateDescriptor = $convert.base64Decode('CgxDb250cm9sU3RhdGUSHAoJY29udHJvbElkGAEgASgJUgljb250cm9sSWQSIgoFZ3JvdXAYAiABKA4yDC5Hcm91cERldmljZVIFZ3JvdXASKwoKcG93ZXJTdGF0ZRgDIAEoDjILLlBvd2VyU3RhdGVSCnBvd2VyU3RhdGUSIAoLdGVtcGVyYXR1cmUYBCABKAJSC3RlbXBlcmF0dXJlEhsKBG1vZGUYBSABKA4yBy5Nb2RlQWNSBG1vZGUSHgoFc3dpbmcYBiABKA4yCC5Td2luZ0FjUgVzd2luZxIYCgNmYW4YByABKA4yBi5GYW5BY1IDZmFuEjoKD2Nvbm5lY3Rpb25TdGF0ZRgIIAEoDjIQLkNvbm5lY3Rpb25TdGF0ZVIPY29ubmVjdGlvblN0YXRlEhwKCXBlcmNlbnRJbhgJIAEoDVIJcGVyY2VudEluEh4KCnBlcmNlbnRPdXQYCiABKA1SCnBlcmNlbnRPdXQ=');
@$core.Deprecated('Use remoteACStateDescriptor instead')
const RemoteACState$json = const {
  '1': 'RemoteACState',
  '2': const [
    const {'1': 'power', '3': 2, '4': 1, '5': 8, '10': 'power'},
    const {'1': 'temperature', '3': 3, '4': 1, '5': 13, '10': 'temperature'},
    const {'1': 'mode', '3': 4, '4': 1, '5': 14, '6': '.ModeAc', '10': 'mode'},
    const {'1': 'fan', '3': 5, '4': 1, '5': 14, '6': '.FanAc', '10': 'fan'},
    const {'1': 'swingHorizontal', '3': 6, '4': 1, '5': 8, '10': 'swingHorizontal'},
    const {'1': 'swingVertical', '3': 7, '4': 1, '5': 8, '10': 'swingVertical'},
  ],
};

/// Descriptor for `RemoteACState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteACStateDescriptor = $convert.base64Decode('Cg1SZW1vdGVBQ1N0YXRlEhQKBXBvd2VyGAIgASgIUgVwb3dlchIgCgt0ZW1wZXJhdHVyZRgDIAEoDVILdGVtcGVyYXR1cmUSGwoEbW9kZRgEIAEoDjIHLk1vZGVBY1IEbW9kZRIYCgNmYW4YBSABKA4yBi5GYW5BY1IDZmFuEigKD3N3aW5nSG9yaXpvbnRhbBgGIAEoCFIPc3dpbmdIb3Jpem9udGFsEiQKDXN3aW5nVmVydGljYWwYByABKAhSDXN3aW5nVmVydGljYWw=');
@$core.Deprecated('Use homeDescriptor instead')
const Home$json = const {
  '1': 'Home',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'nameEn', '3': 3, '4': 1, '5': 9, '10': 'nameEn'},
    const {'1': 'backgroundName', '3': 4, '4': 1, '5': 9, '10': 'backgroundName'},
    const {'1': 'longitude', '3': 5, '4': 1, '5': 2, '10': 'longitude'},
    const {'1': 'latitude', '3': 6, '4': 1, '5': 2, '10': 'latitude'},
    const {'1': 'isOwner', '3': 7, '4': 1, '5': 8, '10': 'isOwner'},
    const {'1': 'isDefault', '3': 8, '4': 1, '5': 8, '10': 'isDefault'},
    const {'1': 'fullNameSharer', '3': 9, '4': 1, '5': 9, '10': 'fullNameSharer'},
    const {'1': 'users', '3': 10, '4': 3, '5': 11, '6': '.UserHome', '10': 'users'},
    const {'1': 'featureCode', '3': 11, '4': 1, '5': 13, '10': 'featureCode'},
    const {'1': 'securityCode', '3': 12, '4': 1, '5': 9, '10': 'securityCode'},
    const {'1': 'securityMode', '3': 13, '4': 1, '5': 13, '10': 'securityMode'},
  ],
};

/// Descriptor for `Home`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List homeDescriptor = $convert.base64Decode('CgRIb21lEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhYKBm5hbWVFbhgDIAEoCVIGbmFtZUVuEiYKDmJhY2tncm91bmROYW1lGAQgASgJUg5iYWNrZ3JvdW5kTmFtZRIcCglsb25naXR1ZGUYBSABKAJSCWxvbmdpdHVkZRIaCghsYXRpdHVkZRgGIAEoAlIIbGF0aXR1ZGUSGAoHaXNPd25lchgHIAEoCFIHaXNPd25lchIcCglpc0RlZmF1bHQYCCABKAhSCWlzRGVmYXVsdBImCg5mdWxsTmFtZVNoYXJlchgJIAEoCVIOZnVsbE5hbWVTaGFyZXISHwoFdXNlcnMYCiADKAsyCS5Vc2VySG9tZVIFdXNlcnMSIAoLZmVhdHVyZUNvZGUYCyABKA1SC2ZlYXR1cmVDb2RlEiIKDHNlY3VyaXR5Q29kZRgMIAEoCVIMc2VjdXJpdHlDb2RlEiIKDHNlY3VyaXR5TW9kZRgNIAEoDVIMc2VjdXJpdHlNb2Rl');
@$core.Deprecated('Use userDescriptor instead')
const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'avatar', '3': 2, '4': 1, '5': 12, '10': 'avatar'},
    const {'1': 'fullName', '3': 3, '4': 1, '5': 9, '10': 'fullName'},
    const {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'phoneNumber', '3': 5, '4': 1, '5': 9, '10': 'phoneNumber'},
    const {'1': 'language', '3': 6, '4': 1, '5': 9, '10': 'language'},
    const {'1': 'autoSwitchGps', '3': 7, '4': 1, '5': 8, '10': 'autoSwitchGps'},
    const {'1': 'order', '3': 100, '4': 1, '5': 4, '10': 'order'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode('CgRVc2VyEhYKBnVzZXJJZBgBIAEoCVIGdXNlcklkEhYKBmF2YXRhchgCIAEoDFIGYXZhdGFyEhoKCGZ1bGxOYW1lGAMgASgJUghmdWxsTmFtZRIUCgVlbWFpbBgEIAEoCVIFZW1haWwSIAoLcGhvbmVOdW1iZXIYBSABKAlSC3Bob25lTnVtYmVyEhoKCGxhbmd1YWdlGAYgASgJUghsYW5ndWFnZRIkCg1hdXRvU3dpdGNoR3BzGAcgASgIUg1hdXRvU3dpdGNoR3BzEhQKBW9yZGVyGGQgASgEUgVvcmRlcg==');
@$core.Deprecated('Use userHomeDescriptor instead')
const UserHome$json = const {
  '1': 'UserHome',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'homeId', '3': 3, '4': 1, '5': 9, '10': 'homeId'},
    const {'1': 'avatar', '3': 4, '4': 1, '5': 12, '10': 'avatar'},
    const {'1': 'fullName', '3': 5, '4': 1, '5': 9, '10': 'fullName'},
    const {'1': 'isOwner', '3': 6, '4': 1, '5': 8, '10': 'isOwner'},
    const {'1': 'acceptedDate', '3': 7, '4': 1, '5': 4, '10': 'acceptedDate'},
  ],
};

/// Descriptor for `UserHome`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userHomeDescriptor = $convert.base64Decode('CghVc2VySG9tZRIOCgJpZBgBIAEoCVICaWQSFgoGdXNlcklkGAIgASgJUgZ1c2VySWQSFgoGaG9tZUlkGAMgASgJUgZob21lSWQSFgoGYXZhdGFyGAQgASgMUgZhdmF0YXISGgoIZnVsbE5hbWUYBSABKAlSCGZ1bGxOYW1lEhgKB2lzT3duZXIYBiABKAhSB2lzT3duZXISIgoMYWNjZXB0ZWREYXRlGAcgASgEUgxhY2NlcHRlZERhdGU=');
@$core.Deprecated('Use citizenDescriptor instead')
const Citizen$json = const {
  '1': 'Citizen',
  '2': const [
    const {'1': 'homeId', '3': 1, '4': 1, '5': 9, '10': 'homeId'},
    const {'1': 'project', '3': 2, '4': 1, '5': 11, '6': '.Project', '10': 'project'},
    const {'1': 'building', '3': 3, '4': 1, '5': 11, '6': '.Building', '10': 'building'},
    const {'1': 'floor', '3': 4, '4': 1, '5': 11, '6': '.Floor', '10': 'floor'},
    const {'1': 'apartment', '3': 5, '4': 1, '5': 11, '6': '.Apartment', '10': 'apartment'},
    const {'1': 'receivedDate', '3': 6, '4': 1, '5': 4, '10': 'receivedDate'},
    const {'1': 'approvedDate', '3': 7, '4': 1, '5': 4, '10': 'approvedDate'},
  ],
};

/// Descriptor for `Citizen`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List citizenDescriptor = $convert.base64Decode('CgdDaXRpemVuEhYKBmhvbWVJZBgBIAEoCVIGaG9tZUlkEiIKB3Byb2plY3QYAiABKAsyCC5Qcm9qZWN0Ugdwcm9qZWN0EiUKCGJ1aWxkaW5nGAMgASgLMgkuQnVpbGRpbmdSCGJ1aWxkaW5nEhwKBWZsb29yGAQgASgLMgYuRmxvb3JSBWZsb29yEigKCWFwYXJ0bWVudBgFIAEoCzIKLkFwYXJ0bWVudFIJYXBhcnRtZW50EiIKDHJlY2VpdmVkRGF0ZRgGIAEoBFIMcmVjZWl2ZWREYXRlEiIKDGFwcHJvdmVkRGF0ZRgHIAEoBFIMYXBwcm92ZWREYXRl');
@$core.Deprecated('Use roomDescriptor instead')
const Room$json = const {
  '1': 'Room',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'home', '3': 3, '4': 1, '5': 11, '6': '.Home', '10': 'home'},
    const {'1': 'devices', '3': 4, '4': 3, '5': 11, '6': '.Device', '10': 'devices'},
    const {'1': 'switchers', '3': 5, '4': 3, '5': 11, '6': '.Switcher', '10': 'switchers'},
    const {'1': 'curtainSwitchers', '3': 6, '4': 3, '5': 11, '6': '.CurtainSwitcher', '10': 'curtainSwitchers'},
    const {'1': 'remotes', '3': 7, '4': 3, '5': 11, '6': '.Remote', '10': 'remotes'},
    const {'1': 'motions', '3': 8, '4': 3, '5': 11, '6': '.Motion', '10': 'motions'},
    const {'1': 'homekits', '3': 9, '4': 3, '5': 11, '6': '.Homekit', '10': 'homekits'},
    const {'1': 'nameEn', '3': 10, '4': 1, '5': 9, '10': 'nameEn'},
    const {'1': 'backgroundName', '3': 11, '4': 1, '5': 9, '10': 'backgroundName'},
    const {'1': 'buttons', '3': 12, '4': 3, '5': 11, '6': '.Button', '10': 'buttons'},
    const {'1': 'groupControls', '3': 13, '4': 3, '5': 11, '6': '.GroupControl', '10': 'groupControls'},
    const {'1': 'ledItem', '3': 14, '4': 3, '5': 11, '6': '.LedItem', '10': 'ledItem'},
    const {'1': 'ledDriver', '3': 15, '4': 3, '5': 11, '6': '.LedDriver', '10': 'ledDriver'},
    const {'1': 'lightSensors', '3': 16, '4': 3, '5': 11, '6': '.LightSensor', '10': 'lightSensors'},
    const {'1': 'environmentSensors', '3': 17, '4': 3, '5': 11, '6': '.EnvironmentSensor', '10': 'environmentSensors'},
    const {'1': 'smartPlugs', '3': 18, '4': 3, '5': 11, '6': '.SmartPlug', '10': 'smartPlugs'},
    const {'1': 'curtains', '3': 19, '4': 3, '5': 11, '6': '.Curtain', '10': 'curtains'},
    const {'1': 'touchPanels', '3': 20, '4': 3, '5': 11, '6': '.TouchPanel', '10': 'touchPanels'},
  ],
};

/// Descriptor for `Room`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomDescriptor = $convert.base64Decode('CgRSb29tEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhkKBGhvbWUYAyABKAsyBS5Ib21lUgRob21lEiEKB2RldmljZXMYBCADKAsyBy5EZXZpY2VSB2RldmljZXMSJwoJc3dpdGNoZXJzGAUgAygLMgkuU3dpdGNoZXJSCXN3aXRjaGVycxI8ChBjdXJ0YWluU3dpdGNoZXJzGAYgAygLMhAuQ3VydGFpblN3aXRjaGVyUhBjdXJ0YWluU3dpdGNoZXJzEiEKB3JlbW90ZXMYByADKAsyBy5SZW1vdGVSB3JlbW90ZXMSIQoHbW90aW9ucxgIIAMoCzIHLk1vdGlvblIHbW90aW9ucxIkCghob21la2l0cxgJIAMoCzIILkhvbWVraXRSCGhvbWVraXRzEhYKBm5hbWVFbhgKIAEoCVIGbmFtZUVuEiYKDmJhY2tncm91bmROYW1lGAsgASgJUg5iYWNrZ3JvdW5kTmFtZRIhCgdidXR0b25zGAwgAygLMgcuQnV0dG9uUgdidXR0b25zEjMKDWdyb3VwQ29udHJvbHMYDSADKAsyDS5Hcm91cENvbnRyb2xSDWdyb3VwQ29udHJvbHMSIgoHbGVkSXRlbRgOIAMoCzIILkxlZEl0ZW1SB2xlZEl0ZW0SKAoJbGVkRHJpdmVyGA8gAygLMgouTGVkRHJpdmVyUglsZWREcml2ZXISMAoMbGlnaHRTZW5zb3JzGBAgAygLMgwuTGlnaHRTZW5zb3JSDGxpZ2h0U2Vuc29ycxJCChJlbnZpcm9ubWVudFNlbnNvcnMYESADKAsyEi5FbnZpcm9ubWVudFNlbnNvclISZW52aXJvbm1lbnRTZW5zb3JzEioKCnNtYXJ0UGx1Z3MYEiADKAsyCi5TbWFydFBsdWdSCnNtYXJ0UGx1Z3MSJAoIY3VydGFpbnMYEyADKAsyCC5DdXJ0YWluUghjdXJ0YWlucxItCgt0b3VjaFBhbmVscxgUIAMoCzILLlRvdWNoUGFuZWxSC3RvdWNoUGFuZWxz');
@$core.Deprecated('Use scheduleDescriptor instead')
const Schedule$json = const {
  '1': 'Schedule',
  '2': const [
    const {'1': 'datetime', '3': 1, '4': 1, '5': 11, '6': '.DateTime', '10': 'datetime'},
    const {'1': 'repeat', '3': 2, '4': 1, '5': 8, '10': 'repeat'},
    const {'1': 'mon', '3': 3, '4': 1, '5': 8, '10': 'mon'},
    const {'1': 'tue', '3': 4, '4': 1, '5': 8, '10': 'tue'},
    const {'1': 'wed', '3': 5, '4': 1, '5': 8, '10': 'wed'},
    const {'1': 'thu', '3': 6, '4': 1, '5': 8, '10': 'thu'},
    const {'1': 'fri', '3': 7, '4': 1, '5': 8, '10': 'fri'},
    const {'1': 'sat', '3': 8, '4': 1, '5': 8, '10': 'sat'},
    const {'1': 'sun', '3': 9, '4': 1, '5': 8, '10': 'sun'},
  ],
};

/// Descriptor for `Schedule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scheduleDescriptor = $convert.base64Decode('CghTY2hlZHVsZRIlCghkYXRldGltZRgBIAEoCzIJLkRhdGVUaW1lUghkYXRldGltZRIWCgZyZXBlYXQYAiABKAhSBnJlcGVhdBIQCgNtb24YAyABKAhSA21vbhIQCgN0dWUYBCABKAhSA3R1ZRIQCgN3ZWQYBSABKAhSA3dlZBIQCgN0aHUYBiABKAhSA3RodRIQCgNmcmkYByABKAhSA2ZyaRIQCgNzYXQYCCABKAhSA3NhdBIQCgNzdW4YCSABKAhSA3N1bg==');
@$core.Deprecated('Use remoteScheduleActionDescriptor instead')
const RemoteScheduleAction$json = const {
  '1': 'RemoteScheduleAction',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'remoteScheduleId', '3': 2, '4': 1, '5': 9, '10': 'remoteScheduleId'},
    const {'1': 'remoteLibraryCmdId', '3': 3, '4': 1, '5': 9, '10': 'remoteLibraryCmdId'},
    const {'1': 'remoteMultiLibraryCmdId', '3': 4, '4': 1, '5': 9, '10': 'remoteMultiLibraryCmdId'},
    const {'1': 'delay', '3': 5, '4': 1, '5': 13, '10': 'delay'},
    const {'1': 'order', '3': 6, '4': 1, '5': 13, '10': 'order'},
    const {'1': 'name', '3': 7, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `RemoteScheduleAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteScheduleActionDescriptor = $convert.base64Decode('ChRSZW1vdGVTY2hlZHVsZUFjdGlvbhIOCgJpZBgBIAEoCVICaWQSKgoQcmVtb3RlU2NoZWR1bGVJZBgCIAEoCVIQcmVtb3RlU2NoZWR1bGVJZBIuChJyZW1vdGVMaWJyYXJ5Q21kSWQYAyABKAlSEnJlbW90ZUxpYnJhcnlDbWRJZBI4ChdyZW1vdGVNdWx0aUxpYnJhcnlDbWRJZBgEIAEoCVIXcmVtb3RlTXVsdGlMaWJyYXJ5Q21kSWQSFAoFZGVsYXkYBSABKA1SBWRlbGF5EhQKBW9yZGVyGAYgASgNUgVvcmRlchISCgRuYW1lGAcgASgJUgRuYW1l');
@$core.Deprecated('Use airConditionerScheduleActionDescriptor instead')
const AirConditionerScheduleAction$json = const {
  '1': 'AirConditionerScheduleAction',
  '2': const [
    const {'1': 'remoteScheduleId', '3': 1, '4': 1, '5': 9, '10': 'remoteScheduleId'},
    const {'1': 'powerState', '3': 2, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'temperature', '3': 3, '4': 1, '5': 2, '10': 'temperature'},
    const {'1': 'mode', '3': 4, '4': 1, '5': 14, '6': '.ModeAc', '10': 'mode'},
    const {'1': 'swing', '3': 5, '4': 1, '5': 14, '6': '.SwingAc', '10': 'swing'},
    const {'1': 'fan', '3': 6, '4': 1, '5': 14, '6': '.FanAc', '10': 'fan'},
  ],
};

/// Descriptor for `AirConditionerScheduleAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List airConditionerScheduleActionDescriptor = $convert.base64Decode('ChxBaXJDb25kaXRpb25lclNjaGVkdWxlQWN0aW9uEioKEHJlbW90ZVNjaGVkdWxlSWQYASABKAlSEHJlbW90ZVNjaGVkdWxlSWQSKwoKcG93ZXJTdGF0ZRgCIAEoDjILLlBvd2VyU3RhdGVSCnBvd2VyU3RhdGUSIAoLdGVtcGVyYXR1cmUYAyABKAJSC3RlbXBlcmF0dXJlEhsKBG1vZGUYBCABKA4yBy5Nb2RlQWNSBG1vZGUSHgoFc3dpbmcYBSABKA4yCC5Td2luZ0FjUgVzd2luZxIYCgNmYW4YBiABKA4yBi5GYW5BY1IDZmFu');
@$core.Deprecated('Use remoteScheduleDescriptor instead')
const RemoteSchedule$json = const {
  '1': 'RemoteSchedule',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'remote', '3': 2, '4': 1, '5': 11, '6': '.Remote', '10': 'remote'},
    const {'1': 'schedule', '3': 3, '4': 1, '5': 11, '6': '.Schedule', '10': 'schedule'},
    const {'1': 'airConditionerAction', '3': 4, '4': 1, '5': 11, '6': '.AirConditionerScheduleAction', '10': 'airConditionerAction'},
    const {'1': 'remoteActions', '3': 5, '4': 3, '5': 11, '6': '.RemoteScheduleAction', '10': 'remoteActions'},
    const {'1': 'active', '3': 6, '4': 1, '5': 8, '10': 'active'},
  ],
};

/// Descriptor for `RemoteSchedule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteScheduleDescriptor = $convert.base64Decode('Cg5SZW1vdGVTY2hlZHVsZRIOCgJpZBgBIAEoCVICaWQSHwoGcmVtb3RlGAIgASgLMgcuUmVtb3RlUgZyZW1vdGUSJQoIc2NoZWR1bGUYAyABKAsyCS5TY2hlZHVsZVIIc2NoZWR1bGUSUQoUYWlyQ29uZGl0aW9uZXJBY3Rpb24YBCABKAsyHS5BaXJDb25kaXRpb25lclNjaGVkdWxlQWN0aW9uUhRhaXJDb25kaXRpb25lckFjdGlvbhI7Cg1yZW1vdGVBY3Rpb25zGAUgAygLMhUuUmVtb3RlU2NoZWR1bGVBY3Rpb25SDXJlbW90ZUFjdGlvbnMSFgoGYWN0aXZlGAYgASgIUgZhY3RpdmU=');
@$core.Deprecated('Use switcherScheduleDescriptor instead')
const SwitcherSchedule$json = const {
  '1': 'SwitcherSchedule',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'powerState', '3': 2, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'switcher', '3': 3, '4': 1, '5': 11, '6': '.Switcher', '10': 'switcher'},
    const {'1': 'schedule', '3': 4, '4': 1, '5': 11, '6': '.Schedule', '10': 'schedule'},
    const {'1': 'active', '3': 5, '4': 1, '5': 8, '10': 'active'},
  ],
};

/// Descriptor for `SwitcherSchedule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List switcherScheduleDescriptor = $convert.base64Decode('ChBTd2l0Y2hlclNjaGVkdWxlEg4KAmlkGAEgASgJUgJpZBIrCgpwb3dlclN0YXRlGAIgASgOMgsuUG93ZXJTdGF0ZVIKcG93ZXJTdGF0ZRIlCghzd2l0Y2hlchgDIAEoCzIJLlN3aXRjaGVyUghzd2l0Y2hlchIlCghzY2hlZHVsZRgEIAEoCzIJLlNjaGVkdWxlUghzY2hlZHVsZRIWCgZhY3RpdmUYBSABKAhSBmFjdGl2ZQ==');
@$core.Deprecated('Use curtainSwitcherScheduleDescriptor instead')
const CurtainSwitcherSchedule$json = const {
  '1': 'CurtainSwitcherSchedule',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'curtainSwitcher', '3': 2, '4': 1, '5': 11, '6': '.CurtainSwitcher', '10': 'curtainSwitcher'},
    const {'1': 'schedule', '3': 3, '4': 1, '5': 11, '6': '.Schedule', '10': 'schedule'},
    const {'1': 'percentIn', '3': 4, '4': 1, '5': 13, '10': 'percentIn'},
    const {'1': 'percentOut', '3': 5, '4': 1, '5': 13, '10': 'percentOut'},
    const {'1': 'active', '3': 6, '4': 1, '5': 8, '10': 'active'},
  ],
};

/// Descriptor for `CurtainSwitcherSchedule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List curtainSwitcherScheduleDescriptor = $convert.base64Decode('ChdDdXJ0YWluU3dpdGNoZXJTY2hlZHVsZRIOCgJpZBgBIAEoCVICaWQSOgoPY3VydGFpblN3aXRjaGVyGAIgASgLMhAuQ3VydGFpblN3aXRjaGVyUg9jdXJ0YWluU3dpdGNoZXISJQoIc2NoZWR1bGUYAyABKAsyCS5TY2hlZHVsZVIIc2NoZWR1bGUSHAoJcGVyY2VudEluGAQgASgNUglwZXJjZW50SW4SHgoKcGVyY2VudE91dBgFIAEoDVIKcGVyY2VudE91dBIWCgZhY3RpdmUYBiABKAhSBmFjdGl2ZQ==');
@$core.Deprecated('Use curtainScheduleDescriptor instead')
const CurtainSchedule$json = const {
  '1': 'CurtainSchedule',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'curtain', '3': 2, '4': 1, '5': 11, '6': '.Curtain', '10': 'curtain'},
    const {'1': 'schedule', '3': 3, '4': 1, '5': 11, '6': '.Schedule', '10': 'schedule'},
    const {'1': 'percent', '3': 4, '4': 1, '5': 13, '10': 'percent'},
    const {'1': 'active', '3': 5, '4': 1, '5': 8, '10': 'active'},
  ],
};

/// Descriptor for `CurtainSchedule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List curtainScheduleDescriptor = $convert.base64Decode('Cg9DdXJ0YWluU2NoZWR1bGUSDgoCaWQYASABKAlSAmlkEiIKB2N1cnRhaW4YAiABKAsyCC5DdXJ0YWluUgdjdXJ0YWluEiUKCHNjaGVkdWxlGAMgASgLMgkuU2NoZWR1bGVSCHNjaGVkdWxlEhgKB3BlcmNlbnQYBCABKA1SB3BlcmNlbnQSFgoGYWN0aXZlGAUgASgIUgZhY3RpdmU=');
@$core.Deprecated('Use lightSensorDescriptor instead')
const LightSensor$json = const {
  '1': 'LightSensor',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'icon', '3': 2, '4': 1, '5': 9, '10': 'icon'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'nameEn', '3': 4, '4': 1, '5': 9, '10': 'nameEn'},
    const {'1': 'buttonState', '3': 5, '4': 1, '5': 14, '6': '.ButtonState', '10': 'buttonState'},
    const {'1': 'favorite', '3': 6, '4': 1, '5': 8, '10': 'favorite'},
    const {'1': 'order', '3': 7, '4': 1, '5': 13, '10': 'order'},
    const {'1': 'device', '3': 8, '4': 1, '5': 11, '6': '.Device', '10': 'device'},
  ],
};

/// Descriptor for `LightSensor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lightSensorDescriptor = $convert.base64Decode('CgtMaWdodFNlbnNvchIOCgJpZBgBIAEoCVICaWQSEgoEaWNvbhgCIAEoCVIEaWNvbhISCgRuYW1lGAMgASgJUgRuYW1lEhYKBm5hbWVFbhgEIAEoCVIGbmFtZUVuEi4KC2J1dHRvblN0YXRlGAUgASgOMgwuQnV0dG9uU3RhdGVSC2J1dHRvblN0YXRlEhoKCGZhdm9yaXRlGAYgASgIUghmYXZvcml0ZRIUCgVvcmRlchgHIAEoDVIFb3JkZXISHwoGZGV2aWNlGAggASgLMgcuRGV2aWNlUgZkZXZpY2U=');
@$core.Deprecated('Use meterDescriptor instead')
const Meter$json = const {
  '1': 'Meter',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'serialNumber', '3': 2, '4': 1, '5': 9, '10': 'serialNumber'},
    const {'1': 'typeMeter', '3': 3, '4': 1, '5': 14, '6': '.TypeMeter', '10': 'typeMeter'},
    const {'1': 'deviceId', '3': 4, '4': 1, '5': 9, '10': 'deviceId'},
    const {'1': 'icon', '3': 5, '4': 1, '5': 9, '10': 'icon'},
    const {'1': 'month', '3': 6, '4': 1, '5': 13, '10': 'month'},
    const {'1': 'metric', '3': 7, '4': 1, '5': 2, '10': 'metric'},
    const {'1': 'estimate', '3': 8, '4': 1, '5': 13, '10': 'estimate'},
    const {'1': 'indexs', '3': 9, '4': 3, '5': 11, '6': '.MeterIndex', '10': 'indexs'},
    const {'1': 'estimates', '3': 10, '4': 3, '5': 11, '6': '.MeterEstimate', '10': 'estimates'},
    const {'1': 'connectionState', '3': 11, '4': 1, '5': 14, '6': '.ConnectionState', '10': 'connectionState'},
    const {'1': 'limitMoney', '3': 12, '4': 1, '5': 13, '10': 'limitMoney'},
    const {'1': 'alertOverConsume', '3': 13, '4': 1, '5': 13, '10': 'alertOverConsume'},
    const {'1': 'lastUpdateIndex', '3': 14, '4': 1, '5': 4, '10': 'lastUpdateIndex'},
    const {'1': 'lostUpdateIndex', '3': 15, '4': 1, '5': 8, '10': 'lostUpdateIndex'},
    const {'1': 'lastFromDate', '3': 16, '4': 1, '5': 4, '10': 'lastFromDate'},
    const {'1': 'estimateMonths', '3': 17, '4': 3, '5': 11, '6': '.MeterEstimate', '10': 'estimateMonths'},
    const {'1': 'estimateDays', '3': 18, '4': 3, '5': 11, '6': '.MeterEstimate', '10': 'estimateDays'},
    const {'1': 'device', '3': 19, '4': 1, '5': 11, '6': '.Device', '10': 'device'},
    const {'1': 'lastMetricIndex', '3': 20, '4': 1, '5': 2, '10': 'lastMetricIndex'},
  ],
};

/// Descriptor for `Meter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List meterDescriptor = $convert.base64Decode('CgVNZXRlchIOCgJpZBgBIAEoCVICaWQSIgoMc2VyaWFsTnVtYmVyGAIgASgJUgxzZXJpYWxOdW1iZXISKAoJdHlwZU1ldGVyGAMgASgOMgouVHlwZU1ldGVyUgl0eXBlTWV0ZXISGgoIZGV2aWNlSWQYBCABKAlSCGRldmljZUlkEhIKBGljb24YBSABKAlSBGljb24SFAoFbW9udGgYBiABKA1SBW1vbnRoEhYKBm1ldHJpYxgHIAEoAlIGbWV0cmljEhoKCGVzdGltYXRlGAggASgNUghlc3RpbWF0ZRIjCgZpbmRleHMYCSADKAsyCy5NZXRlckluZGV4UgZpbmRleHMSLAoJZXN0aW1hdGVzGAogAygLMg4uTWV0ZXJFc3RpbWF0ZVIJZXN0aW1hdGVzEjoKD2Nvbm5lY3Rpb25TdGF0ZRgLIAEoDjIQLkNvbm5lY3Rpb25TdGF0ZVIPY29ubmVjdGlvblN0YXRlEh4KCmxpbWl0TW9uZXkYDCABKA1SCmxpbWl0TW9uZXkSKgoQYWxlcnRPdmVyQ29uc3VtZRgNIAEoDVIQYWxlcnRPdmVyQ29uc3VtZRIoCg9sYXN0VXBkYXRlSW5kZXgYDiABKARSD2xhc3RVcGRhdGVJbmRleBIoCg9sb3N0VXBkYXRlSW5kZXgYDyABKAhSD2xvc3RVcGRhdGVJbmRleBIiCgxsYXN0RnJvbURhdGUYECABKARSDGxhc3RGcm9tRGF0ZRI2Cg5lc3RpbWF0ZU1vbnRocxgRIAMoCzIOLk1ldGVyRXN0aW1hdGVSDmVzdGltYXRlTW9udGhzEjIKDGVzdGltYXRlRGF5cxgSIAMoCzIOLk1ldGVyRXN0aW1hdGVSDGVzdGltYXRlRGF5cxIfCgZkZXZpY2UYEyABKAsyBy5EZXZpY2VSBmRldmljZRIoCg9sYXN0TWV0cmljSW5kZXgYFCABKAJSD2xhc3RNZXRyaWNJbmRleA==');
@$core.Deprecated('Use meterIndexDescriptor instead')
const MeterIndex$json = const {
  '1': 'MeterIndex',
  '2': const [
    const {'1': 'serialNumber', '3': 1, '4': 1, '5': 9, '10': 'serialNumber'},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.TypeMeter', '10': 'type'},
    const {'1': 'metric', '3': 3, '4': 1, '5': 2, '10': 'metric'},
    const {'1': 'hour', '3': 4, '4': 1, '5': 5, '10': 'hour'},
  ],
};

/// Descriptor for `MeterIndex`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List meterIndexDescriptor = $convert.base64Decode('CgpNZXRlckluZGV4EiIKDHNlcmlhbE51bWJlchgBIAEoCVIMc2VyaWFsTnVtYmVyEh4KBHR5cGUYAiABKA4yCi5UeXBlTWV0ZXJSBHR5cGUSFgoGbWV0cmljGAMgASgCUgZtZXRyaWMSEgoEaG91chgEIAEoBVIEaG91cg==');
@$core.Deprecated('Use meterEstimateDescriptor instead')
const MeterEstimate$json = const {
  '1': 'MeterEstimate',
  '2': const [
    const {'1': 'serialNumber', '3': 1, '4': 1, '5': 9, '10': 'serialNumber'},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.TypeMeter', '10': 'type'},
    const {'1': 'month', '3': 3, '4': 1, '5': 13, '10': 'month'},
    const {'1': 'estimate', '3': 4, '4': 1, '5': 13, '10': 'estimate'},
    const {'1': 'consume', '3': 5, '4': 1, '5': 2, '10': 'consume'},
    const {'1': 'year', '3': 6, '4': 1, '5': 13, '10': 'year'},
    const {'1': 'day', '3': 7, '4': 1, '5': 13, '10': 'day'},
    const {'1': 'hour', '3': 8, '4': 1, '5': 13, '10': 'hour'},
  ],
};

/// Descriptor for `MeterEstimate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List meterEstimateDescriptor = $convert.base64Decode('Cg1NZXRlckVzdGltYXRlEiIKDHNlcmlhbE51bWJlchgBIAEoCVIMc2VyaWFsTnVtYmVyEh4KBHR5cGUYAiABKA4yCi5UeXBlTWV0ZXJSBHR5cGUSFAoFbW9udGgYAyABKA1SBW1vbnRoEhoKCGVzdGltYXRlGAQgASgNUghlc3RpbWF0ZRIYCgdjb25zdW1lGAUgASgCUgdjb25zdW1lEhIKBHllYXIYBiABKA1SBHllYXISEAoDZGF5GAcgASgNUgNkYXkSEgoEaG91chgIIAEoDVIEaG91cg==');
@$core.Deprecated('Use activeTimeDescriptor instead')
const ActiveTime$json = const {
  '1': 'ActiveTime',
  '2': const [
    const {'1': 'enableFullTime', '3': 1, '4': 1, '5': 8, '10': 'enableFullTime'},
    const {'1': 'enableStart', '3': 2, '4': 1, '5': 13, '10': 'enableStart'},
    const {'1': 'enableEnd', '3': 3, '4': 1, '5': 13, '10': 'enableEnd'},
    const {'1': 'enableDayMap', '3': 4, '4': 1, '5': 13, '10': 'enableDayMap'},
  ],
};

/// Descriptor for `ActiveTime`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activeTimeDescriptor = $convert.base64Decode('CgpBY3RpdmVUaW1lEiYKDmVuYWJsZUZ1bGxUaW1lGAEgASgIUg5lbmFibGVGdWxsVGltZRIgCgtlbmFibGVTdGFydBgCIAEoDVILZW5hYmxlU3RhcnQSHAoJZW5hYmxlRW5kGAMgASgNUgllbmFibGVFbmQSIgoMZW5hYmxlRGF5TWFwGAQgASgNUgxlbmFibGVEYXlNYXA=');
@$core.Deprecated('Use sceneDescriptor instead')
const Scene$json = const {
  '1': 'Scene',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'homeId', '3': 2, '4': 1, '5': 9, '10': 'homeId'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'nameEn', '3': 4, '4': 1, '5': 9, '10': 'nameEn'},
    const {'1': 'icon', '3': 5, '4': 1, '5': 9, '10': 'icon'},
    const {'1': 'favorite', '3': 6, '4': 1, '5': 8, '10': 'favorite'},
    const {'1': 'condition', '3': 7, '4': 1, '5': 14, '6': '.ConditionScene', '10': 'condition'},
    const {'1': 'switcherCondition', '3': 8, '4': 1, '5': 11, '6': '.Switcher', '10': 'switcherCondition'},
    const {'1': 'powerState', '3': 9, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'sceneSwitcherActions', '3': 10, '4': 3, '5': 11, '6': '.SceneSwitcherAction', '10': 'sceneSwitcherActions'},
    const {'1': 'curtainSwitcherActions', '3': 11, '4': 3, '5': 11, '6': '.SceneCurtainSwitcherAction', '10': 'curtainSwitcherActions'},
    const {'1': 'airConditionerActions', '3': 12, '4': 3, '5': 11, '6': '.SceneAirConditionerAction', '10': 'airConditionerActions'},
    const {'1': 'sceneRemoteActions', '3': 13, '4': 3, '5': 11, '6': '.SceneRemoteAction', '10': 'sceneRemoteActions'},
    const {'1': 'sceneMotionActions', '3': 14, '4': 3, '5': 11, '6': '.SceneMotionAction', '10': 'sceneMotionActions'},
    const {'1': 'type', '3': 15, '4': 1, '5': 13, '10': 'type'},
    const {'1': 'confirmed', '3': 16, '4': 1, '5': 8, '10': 'confirmed'},
    const {'1': 'motionCondition', '3': 17, '4': 1, '5': 11, '6': '.Motion', '10': 'motionCondition'},
    const {'1': 'activeTime', '3': 18, '4': 1, '5': 11, '6': '.ActiveTime', '10': 'activeTime'},
    const {'1': 'isDisable', '3': 19, '4': 1, '5': 8, '10': 'isDisable'},
    const {'1': 'actionListIcon', '3': 20, '4': 1, '5': 9, '10': 'actionListIcon'},
    const {'1': 'schedule', '3': 21, '4': 1, '5': 11, '6': '.Schedule', '10': 'schedule'},
    const {'1': 'sceneLedDriverActions', '3': 22, '4': 3, '5': 11, '6': '.SceneLedDriverAction', '10': 'sceneLedDriverActions'},
    const {'1': 'buttonCondition', '3': 23, '4': 1, '5': 11, '6': '.Button', '10': 'buttonCondition'},
    const {'1': 'ledDriverCondition', '3': 24, '4': 1, '5': 11, '6': '.LedDriver', '10': 'ledDriverCondition'},
    const {'1': 'environmentSensorsCondition', '3': 25, '4': 1, '5': 11, '6': '.EnvironmentSensor', '10': 'environmentSensorsCondition'},
    const {'1': 'curtainActions', '3': 26, '4': 3, '5': 11, '6': '.SceneCurtainAction', '10': 'curtainActions'},
  ],
};

/// Descriptor for `Scene`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneDescriptor = $convert.base64Decode('CgVTY2VuZRIOCgJpZBgBIAEoCVICaWQSFgoGaG9tZUlkGAIgASgJUgZob21lSWQSEgoEbmFtZRgDIAEoCVIEbmFtZRIWCgZuYW1lRW4YBCABKAlSBm5hbWVFbhISCgRpY29uGAUgASgJUgRpY29uEhoKCGZhdm9yaXRlGAYgASgIUghmYXZvcml0ZRItCgljb25kaXRpb24YByABKA4yDy5Db25kaXRpb25TY2VuZVIJY29uZGl0aW9uEjcKEXN3aXRjaGVyQ29uZGl0aW9uGAggASgLMgkuU3dpdGNoZXJSEXN3aXRjaGVyQ29uZGl0aW9uEisKCnBvd2VyU3RhdGUYCSABKA4yCy5Qb3dlclN0YXRlUgpwb3dlclN0YXRlEkgKFHNjZW5lU3dpdGNoZXJBY3Rpb25zGAogAygLMhQuU2NlbmVTd2l0Y2hlckFjdGlvblIUc2NlbmVTd2l0Y2hlckFjdGlvbnMSUwoWY3VydGFpblN3aXRjaGVyQWN0aW9ucxgLIAMoCzIbLlNjZW5lQ3VydGFpblN3aXRjaGVyQWN0aW9uUhZjdXJ0YWluU3dpdGNoZXJBY3Rpb25zElAKFWFpckNvbmRpdGlvbmVyQWN0aW9ucxgMIAMoCzIaLlNjZW5lQWlyQ29uZGl0aW9uZXJBY3Rpb25SFWFpckNvbmRpdGlvbmVyQWN0aW9ucxJCChJzY2VuZVJlbW90ZUFjdGlvbnMYDSADKAsyEi5TY2VuZVJlbW90ZUFjdGlvblISc2NlbmVSZW1vdGVBY3Rpb25zEkIKEnNjZW5lTW90aW9uQWN0aW9ucxgOIAMoCzISLlNjZW5lTW90aW9uQWN0aW9uUhJzY2VuZU1vdGlvbkFjdGlvbnMSEgoEdHlwZRgPIAEoDVIEdHlwZRIcCgljb25maXJtZWQYECABKAhSCWNvbmZpcm1lZBIxCg9tb3Rpb25Db25kaXRpb24YESABKAsyBy5Nb3Rpb25SD21vdGlvbkNvbmRpdGlvbhIrCgphY3RpdmVUaW1lGBIgASgLMgsuQWN0aXZlVGltZVIKYWN0aXZlVGltZRIcCglpc0Rpc2FibGUYEyABKAhSCWlzRGlzYWJsZRImCg5hY3Rpb25MaXN0SWNvbhgUIAEoCVIOYWN0aW9uTGlzdEljb24SJQoIc2NoZWR1bGUYFSABKAsyCS5TY2hlZHVsZVIIc2NoZWR1bGUSSwoVc2NlbmVMZWREcml2ZXJBY3Rpb25zGBYgAygLMhUuU2NlbmVMZWREcml2ZXJBY3Rpb25SFXNjZW5lTGVkRHJpdmVyQWN0aW9ucxIxCg9idXR0b25Db25kaXRpb24YFyABKAsyBy5CdXR0b25SD2J1dHRvbkNvbmRpdGlvbhI6ChJsZWREcml2ZXJDb25kaXRpb24YGCABKAsyCi5MZWREcml2ZXJSEmxlZERyaXZlckNvbmRpdGlvbhJUChtlbnZpcm9ubWVudFNlbnNvcnNDb25kaXRpb24YGSABKAsyEi5FbnZpcm9ubWVudFNlbnNvclIbZW52aXJvbm1lbnRTZW5zb3JzQ29uZGl0aW9uEjsKDmN1cnRhaW5BY3Rpb25zGBogAygLMhMuU2NlbmVDdXJ0YWluQWN0aW9uUg5jdXJ0YWluQWN0aW9ucw==');
@$core.Deprecated('Use sceneSwitcherActionDescriptor instead')
const SceneSwitcherAction$json = const {
  '1': 'SceneSwitcherAction',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'sceneId', '3': 2, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'switcher', '3': 3, '4': 1, '5': 11, '6': '.Switcher', '10': 'switcher'},
    const {'1': 'powerState', '3': 4, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'order', '3': 5, '4': 1, '5': 13, '10': 'order'},
  ],
};

/// Descriptor for `SceneSwitcherAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneSwitcherActionDescriptor = $convert.base64Decode('ChNTY2VuZVN3aXRjaGVyQWN0aW9uEg4KAmlkGAEgASgJUgJpZBIYCgdzY2VuZUlkGAIgASgJUgdzY2VuZUlkEiUKCHN3aXRjaGVyGAMgASgLMgkuU3dpdGNoZXJSCHN3aXRjaGVyEisKCnBvd2VyU3RhdGUYBCABKA4yCy5Qb3dlclN0YXRlUgpwb3dlclN0YXRlEhQKBW9yZGVyGAUgASgNUgVvcmRlcg==');
@$core.Deprecated('Use sceneAirConditionerActionDescriptor instead')
const SceneAirConditionerAction$json = const {
  '1': 'SceneAirConditionerAction',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'sceneId', '3': 2, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'remote', '3': 3, '4': 1, '5': 11, '6': '.Remote', '10': 'remote'},
    const {'1': 'powerState', '3': 4, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'temperature', '3': 5, '4': 1, '5': 2, '10': 'temperature'},
    const {'1': 'mode', '3': 6, '4': 1, '5': 14, '6': '.ModeAc', '10': 'mode'},
    const {'1': 'swing', '3': 7, '4': 1, '5': 14, '6': '.SwingAc', '10': 'swing'},
    const {'1': 'fan', '3': 8, '4': 1, '5': 14, '6': '.FanAc', '10': 'fan'},
    const {'1': 'order', '3': 9, '4': 1, '5': 13, '10': 'order'},
  ],
};

/// Descriptor for `SceneAirConditionerAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneAirConditionerActionDescriptor = $convert.base64Decode('ChlTY2VuZUFpckNvbmRpdGlvbmVyQWN0aW9uEg4KAmlkGAEgASgJUgJpZBIYCgdzY2VuZUlkGAIgASgJUgdzY2VuZUlkEh8KBnJlbW90ZRgDIAEoCzIHLlJlbW90ZVIGcmVtb3RlEisKCnBvd2VyU3RhdGUYBCABKA4yCy5Qb3dlclN0YXRlUgpwb3dlclN0YXRlEiAKC3RlbXBlcmF0dXJlGAUgASgCUgt0ZW1wZXJhdHVyZRIbCgRtb2RlGAYgASgOMgcuTW9kZUFjUgRtb2RlEh4KBXN3aW5nGAcgASgOMgguU3dpbmdBY1IFc3dpbmcSGAoDZmFuGAggASgOMgYuRmFuQWNSA2ZhbhIUCgVvcmRlchgJIAEoDVIFb3JkZXI=');
@$core.Deprecated('Use sceneCurtainSwitcherActionDescriptor instead')
const SceneCurtainSwitcherAction$json = const {
  '1': 'SceneCurtainSwitcherAction',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'sceneId', '3': 2, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'curtainSwitcher', '3': 3, '4': 1, '5': 11, '6': '.CurtainSwitcher', '10': 'curtainSwitcher'},
    const {'1': 'percentIn', '3': 4, '4': 1, '5': 13, '10': 'percentIn'},
    const {'1': 'percentOut', '3': 5, '4': 1, '5': 13, '10': 'percentOut'},
  ],
};

/// Descriptor for `SceneCurtainSwitcherAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneCurtainSwitcherActionDescriptor = $convert.base64Decode('ChpTY2VuZUN1cnRhaW5Td2l0Y2hlckFjdGlvbhIOCgJpZBgBIAEoCVICaWQSGAoHc2NlbmVJZBgCIAEoCVIHc2NlbmVJZBI6Cg9jdXJ0YWluU3dpdGNoZXIYAyABKAsyEC5DdXJ0YWluU3dpdGNoZXJSD2N1cnRhaW5Td2l0Y2hlchIcCglwZXJjZW50SW4YBCABKA1SCXBlcmNlbnRJbhIeCgpwZXJjZW50T3V0GAUgASgNUgpwZXJjZW50T3V0');
@$core.Deprecated('Use sceneCurtainActionDescriptor instead')
const SceneCurtainAction$json = const {
  '1': 'SceneCurtainAction',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'sceneId', '3': 2, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'curtain', '3': 3, '4': 1, '5': 11, '6': '.Curtain', '10': 'curtain'},
    const {'1': 'percent', '3': 4, '4': 1, '5': 13, '10': 'percent'},
  ],
};

/// Descriptor for `SceneCurtainAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneCurtainActionDescriptor = $convert.base64Decode('ChJTY2VuZUN1cnRhaW5BY3Rpb24SDgoCaWQYASABKAlSAmlkEhgKB3NjZW5lSWQYAiABKAlSB3NjZW5lSWQSIgoHY3VydGFpbhgDIAEoCzIILkN1cnRhaW5SB2N1cnRhaW4SGAoHcGVyY2VudBgEIAEoDVIHcGVyY2VudA==');
@$core.Deprecated('Use sceneRemoteActionDescriptor instead')
const SceneRemoteAction$json = const {
  '1': 'SceneRemoteAction',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'sceneId', '3': 2, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'remote', '3': 3, '4': 1, '5': 11, '6': '.Remote', '10': 'remote'},
    const {'1': 'RemoteLibraryCmdId', '3': 4, '4': 1, '5': 9, '10': 'RemoteLibraryCmdId'},
    const {'1': 'RemoteMultiLibraryCmdId', '3': 5, '4': 1, '5': 9, '10': 'RemoteMultiLibraryCmdId'},
    const {'1': 'delay', '3': 6, '4': 1, '5': 13, '10': 'delay'},
    const {'1': 'order', '3': 7, '4': 1, '5': 13, '10': 'order'},
    const {'1': 'name', '3': 8, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `SceneRemoteAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneRemoteActionDescriptor = $convert.base64Decode('ChFTY2VuZVJlbW90ZUFjdGlvbhIOCgJpZBgBIAEoCVICaWQSGAoHc2NlbmVJZBgCIAEoCVIHc2NlbmVJZBIfCgZyZW1vdGUYAyABKAsyBy5SZW1vdGVSBnJlbW90ZRIuChJSZW1vdGVMaWJyYXJ5Q21kSWQYBCABKAlSElJlbW90ZUxpYnJhcnlDbWRJZBI4ChdSZW1vdGVNdWx0aUxpYnJhcnlDbWRJZBgFIAEoCVIXUmVtb3RlTXVsdGlMaWJyYXJ5Q21kSWQSFAoFZGVsYXkYBiABKA1SBWRlbGF5EhQKBW9yZGVyGAcgASgNUgVvcmRlchISCgRuYW1lGAggASgJUgRuYW1l');
@$core.Deprecated('Use sceneMotionActionDescriptor instead')
const SceneMotionAction$json = const {
  '1': 'SceneMotionAction',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'sceneId', '3': 2, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'motion', '3': 3, '4': 1, '5': 11, '6': '.Motion', '10': 'motion'},
    const {'1': 'state', '3': 4, '4': 1, '5': 14, '6': '.MotionState', '10': 'state'},
    const {'1': 'order', '3': 5, '4': 1, '5': 13, '10': 'order'},
  ],
};

/// Descriptor for `SceneMotionAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneMotionActionDescriptor = $convert.base64Decode('ChFTY2VuZU1vdGlvbkFjdGlvbhIOCgJpZBgBIAEoCVICaWQSGAoHc2NlbmVJZBgCIAEoCVIHc2NlbmVJZBIfCgZtb3Rpb24YAyABKAsyBy5Nb3Rpb25SBm1vdGlvbhIiCgVzdGF0ZRgEIAEoDjIMLk1vdGlvblN0YXRlUgVzdGF0ZRIUCgVvcmRlchgFIAEoDVIFb3JkZXI=');
@$core.Deprecated('Use sceneLedDriverActionDescriptor instead')
const SceneLedDriverAction$json = const {
  '1': 'SceneLedDriverAction',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'sceneId', '3': 2, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'ledDriver', '3': 3, '4': 1, '5': 11, '6': '.LedDriver', '10': 'ledDriver'},
    const {'1': 'powerState', '3': 4, '4': 1, '5': 14, '6': '.PowerState', '10': 'powerState'},
    const {'1': 'brightnessPercent', '3': 5, '4': 1, '5': 5, '10': 'brightnessPercent'},
    const {'1': 'icon', '3': 6, '4': 1, '5': 9, '10': 'icon'},
    const {'1': 'order', '3': 7, '4': 1, '5': 13, '10': 'order'},
  ],
};

/// Descriptor for `SceneLedDriverAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneLedDriverActionDescriptor = $convert.base64Decode('ChRTY2VuZUxlZERyaXZlckFjdGlvbhIOCgJpZBgBIAEoCVICaWQSGAoHc2NlbmVJZBgCIAEoCVIHc2NlbmVJZBIoCglsZWREcml2ZXIYAyABKAsyCi5MZWREcml2ZXJSCWxlZERyaXZlchIrCgpwb3dlclN0YXRlGAQgASgOMgsuUG93ZXJTdGF0ZVIKcG93ZXJTdGF0ZRIsChFicmlnaHRuZXNzUGVyY2VudBgFIAEoBVIRYnJpZ2h0bmVzc1BlcmNlbnQSEgoEaWNvbhgGIAEoCVIEaWNvbhIUCgVvcmRlchgHIAEoDVIFb3JkZXI=');
@$core.Deprecated('Use sceneButtonActionDescriptor instead')
const SceneButtonAction$json = const {
  '1': 'SceneButtonAction',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'sceneId', '3': 2, '4': 1, '5': 9, '10': 'sceneId'},
    const {'1': 'button', '3': 3, '4': 1, '5': 11, '6': '.Button', '10': 'button'},
    const {'1': 'buttonState', '3': 4, '4': 1, '5': 14, '6': '.ButtonState', '10': 'buttonState'},
    const {'1': 'order', '3': 5, '4': 1, '5': 13, '10': 'order'},
  ],
};

/// Descriptor for `SceneButtonAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sceneButtonActionDescriptor = $convert.base64Decode('ChFTY2VuZUJ1dHRvbkFjdGlvbhIOCgJpZBgBIAEoCVICaWQSGAoHc2NlbmVJZBgCIAEoCVIHc2NlbmVJZBIfCgZidXR0b24YAyABKAsyBy5CdXR0b25SBmJ1dHRvbhIuCgtidXR0b25TdGF0ZRgEIAEoDjIMLkJ1dHRvblN0YXRlUgtidXR0b25TdGF0ZRIUCgVvcmRlchgFIAEoDVIFb3JkZXI=');
@$core.Deprecated('Use remoteCommandDescriptor instead')
const RemoteCommand$json = const {
  '1': 'RemoteCommand',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'RemoteLibraryCmdId', '3': 2, '4': 1, '5': 9, '10': 'RemoteLibraryCmdId'},
    const {'1': 'RemoteMultiLibraryCmdId', '3': 3, '4': 1, '5': 9, '10': 'RemoteMultiLibraryCmdId'},
  ],
};

/// Descriptor for `RemoteCommand`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteCommandDescriptor = $convert.base64Decode('Cg1SZW1vdGVDb21tYW5kEhIKBG5hbWUYASABKAlSBG5hbWUSLgoSUmVtb3RlTGlicmFyeUNtZElkGAIgASgJUhJSZW1vdGVMaWJyYXJ5Q21kSWQSOAoXUmVtb3RlTXVsdGlMaWJyYXJ5Q21kSWQYAyABKAlSF1JlbW90ZU11bHRpTGlicmFyeUNtZElk');
@$core.Deprecated('Use statusCodeDescriptor instead')
const StatusCode$json = const {
  '1': 'StatusCode',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 13, '10': 'code'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `StatusCode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statusCodeDescriptor = $convert.base64Decode('CgpTdGF0dXNDb2RlEhIKBGNvZGUYASABKA1SBGNvZGUSGAoHbWVzc2FnZRgCIAEoCVIHbWVzc2FnZQ==');
@$core.Deprecated('Use deviceInSceneDescriptor instead')
const DeviceInScene$json = const {
  '1': 'DeviceInScene',
  '2': const [
    const {'1': 'switcher', '3': 1, '4': 1, '5': 11, '6': '.Switcher', '10': 'switcher'},
    const {'1': 'motion', '3': 2, '4': 1, '5': 11, '6': '.Motion', '10': 'motion'},
    const {'1': 'ledDriver', '3': 3, '4': 1, '5': 11, '6': '.LedDriver', '10': 'ledDriver'},
  ],
};

/// Descriptor for `DeviceInScene`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceInSceneDescriptor = $convert.base64Decode('Cg1EZXZpY2VJblNjZW5lEiUKCHN3aXRjaGVyGAEgASgLMgkuU3dpdGNoZXJSCHN3aXRjaGVyEh8KBm1vdGlvbhgCIAEoCzIHLk1vdGlvblIGbW90aW9uEigKCWxlZERyaXZlchgDIAEoCzIKLkxlZERyaXZlclIJbGVkRHJpdmVy');
@$core.Deprecated('Use curtainSwitcherStateDescriptor instead')
const CurtainSwitcherState$json = const {
  '1': 'CurtainSwitcherState',
  '2': const [
    const {'1': 'percentIn', '3': 1, '4': 1, '5': 13, '10': 'percentIn'},
    const {'1': 'percentOut', '3': 2, '4': 1, '5': 13, '10': 'percentOut'},
  ],
};

/// Descriptor for `CurtainSwitcherState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List curtainSwitcherStateDescriptor = $convert.base64Decode('ChRDdXJ0YWluU3dpdGNoZXJTdGF0ZRIcCglwZXJjZW50SW4YASABKA1SCXBlcmNlbnRJbhIeCgpwZXJjZW50T3V0GAIgASgNUgpwZXJjZW50T3V0');
@$core.Deprecated('Use curtainStateDescriptor instead')
const CurtainState$json = const {
  '1': 'CurtainState',
  '2': const [
    const {'1': 'percent', '3': 1, '4': 1, '5': 13, '10': 'percent'},
  ],
};

/// Descriptor for `CurtainState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List curtainStateDescriptor = $convert.base64Decode('CgxDdXJ0YWluU3RhdGUSGAoHcGVyY2VudBgBIAEoDVIHcGVyY2VudA==');
@$core.Deprecated('Use deviceTriggerSceneDescriptor instead')
const DeviceTriggerScene$json = const {
  '1': 'DeviceTriggerScene',
  '2': const [
    const {'1': 'hardwareId', '3': 1, '4': 1, '5': 9, '10': 'hardwareId'},
    const {'1': 'deviceIndex', '3': 2, '4': 1, '5': 13, '10': 'deviceIndex'},
    const {'1': 'groupControl', '3': 3, '4': 1, '5': 13, '10': 'groupControl'},
    const {'1': 'powerState', '3': 4, '4': 1, '5': 14, '6': '.PowerState', '9': 0, '10': 'powerState'},
    const {'1': 'motionState', '3': 5, '4': 1, '5': 14, '6': '.MotionState', '9': 0, '10': 'motionState'},
    const {'1': 'buttonState', '3': 6, '4': 1, '5': 14, '6': '.ButtonState', '9': 0, '10': 'buttonState'},
    const {'1': 'brightnessPercent', '3': 7, '4': 1, '5': 5, '9': 0, '10': 'brightnessPercent'},
    const {'1': 'environmentValue', '3': 8, '4': 1, '5': 2, '9': 0, '10': 'environmentValue'},
    const {'1': 'curtainSwitcherState', '3': 9, '4': 1, '5': 11, '6': '.CurtainSwitcherState', '9': 0, '10': 'curtainSwitcherState'},
    const {'1': 'airConditionerState', '3': 10, '4': 1, '5': 11, '6': '.AirConditionerState', '9': 0, '10': 'airConditionerState'},
    const {'1': 'curtainState', '3': 11, '4': 1, '5': 11, '6': '.CurtainState', '9': 0, '10': 'curtainState'},
  ],
  '8': const [
    const {'1': 'ControlState'},
  ],
};

/// Descriptor for `DeviceTriggerScene`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceTriggerSceneDescriptor = $convert.base64Decode('ChJEZXZpY2VUcmlnZ2VyU2NlbmUSHgoKaGFyZHdhcmVJZBgBIAEoCVIKaGFyZHdhcmVJZBIgCgtkZXZpY2VJbmRleBgCIAEoDVILZGV2aWNlSW5kZXgSIgoMZ3JvdXBDb250cm9sGAMgASgNUgxncm91cENvbnRyb2wSLQoKcG93ZXJTdGF0ZRgEIAEoDjILLlBvd2VyU3RhdGVIAFIKcG93ZXJTdGF0ZRIwCgttb3Rpb25TdGF0ZRgFIAEoDjIMLk1vdGlvblN0YXRlSABSC21vdGlvblN0YXRlEjAKC2J1dHRvblN0YXRlGAYgASgOMgwuQnV0dG9uU3RhdGVIAFILYnV0dG9uU3RhdGUSLgoRYnJpZ2h0bmVzc1BlcmNlbnQYByABKAVIAFIRYnJpZ2h0bmVzc1BlcmNlbnQSLAoQZW52aXJvbm1lbnRWYWx1ZRgIIAEoAkgAUhBlbnZpcm9ubWVudFZhbHVlEksKFGN1cnRhaW5Td2l0Y2hlclN0YXRlGAkgASgLMhUuQ3VydGFpblN3aXRjaGVyU3RhdGVIAFIUY3VydGFpblN3aXRjaGVyU3RhdGUSSAoTYWlyQ29uZGl0aW9uZXJTdGF0ZRgKIAEoCzIULkFpckNvbmRpdGlvbmVyU3RhdGVIAFITYWlyQ29uZGl0aW9uZXJTdGF0ZRIzCgxjdXJ0YWluU3RhdGUYCyABKAsyDS5DdXJ0YWluU3RhdGVIAFIMY3VydGFpblN0YXRlQg4KDENvbnRyb2xTdGF0ZQ==');
@$core.Deprecated('Use environmentSensorReportDescriptor instead')
const EnvironmentSensorReport$json = const {
  '1': 'EnvironmentSensorReport',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.EnvironmentSensorType', '10': 'type'},
    const {'1': 'value', '3': 2, '4': 1, '5': 2, '10': 'value'},
  ],
};

/// Descriptor for `EnvironmentSensorReport`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List environmentSensorReportDescriptor = $convert.base64Decode('ChdFbnZpcm9ubWVudFNlbnNvclJlcG9ydBIqCgR0eXBlGAEgASgOMhYuRW52aXJvbm1lbnRTZW5zb3JUeXBlUgR0eXBlEhQKBXZhbHVlGAIgASgCUgV2YWx1ZQ==');
@$core.Deprecated('Use environmentSensorDescriptor instead')
const EnvironmentSensor$json = const {
  '1': 'EnvironmentSensor',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'icon', '3': 2, '4': 1, '5': 9, '10': 'icon'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'nameEn', '3': 4, '4': 1, '5': 9, '10': 'nameEn'},
    const {'1': 'report', '3': 5, '4': 3, '5': 11, '6': '.EnvironmentSensorReport', '10': 'report'},
    const {'1': 'favorite', '3': 6, '4': 1, '5': 8, '10': 'favorite'},
    const {'1': 'order', '3': 7, '4': 1, '5': 13, '10': 'order'},
    const {'1': 'device', '3': 8, '4': 1, '5': 11, '6': '.Device', '10': 'device'},
    const {'1': 'index', '3': 9, '4': 1, '5': 13, '10': 'index'},
    const {'1': 'battery', '3': 10, '4': 1, '5': 13, '10': 'battery'},
    const {'1': 'room', '3': 11, '4': 1, '5': 11, '6': '.Room', '10': 'room'},
    const {'1': 'showHome', '3': 12, '4': 1, '5': 8, '10': 'showHome'},
    const {'1': 'type', '3': 13, '4': 1, '5': 14, '6': '.MotionSensorType', '10': 'type'},
  ],
};

/// Descriptor for `EnvironmentSensor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List environmentSensorDescriptor = $convert.base64Decode('ChFFbnZpcm9ubWVudFNlbnNvchIOCgJpZBgBIAEoCVICaWQSEgoEaWNvbhgCIAEoCVIEaWNvbhISCgRuYW1lGAMgASgJUgRuYW1lEhYKBm5hbWVFbhgEIAEoCVIGbmFtZUVuEjAKBnJlcG9ydBgFIAMoCzIYLkVudmlyb25tZW50U2Vuc29yUmVwb3J0UgZyZXBvcnQSGgoIZmF2b3JpdGUYBiABKAhSCGZhdm9yaXRlEhQKBW9yZGVyGAcgASgNUgVvcmRlchIfCgZkZXZpY2UYCCABKAsyBy5EZXZpY2VSBmRldmljZRIUCgVpbmRleBgJIAEoDVIFaW5kZXgSGAoHYmF0dGVyeRgKIAEoDVIHYmF0dGVyeRIZCgRyb29tGAsgASgLMgUuUm9vbVIEcm9vbRIaCghzaG93SG9tZRgMIAEoCFIIc2hvd0hvbWUSJQoEdHlwZRgNIAEoDjIRLk1vdGlvblNlbnNvclR5cGVSBHR5cGU=');
@$core.Deprecated('Use smartPlugDescriptor instead')
const SmartPlug$json = const {
  '1': 'SmartPlug',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'icon', '3': 2, '4': 1, '5': 9, '10': 'icon'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'nameEn', '3': 4, '4': 1, '5': 9, '10': 'nameEn'},
    const {'1': 'index', '3': 5, '4': 1, '5': 13, '10': 'index'},
    const {'1': 'favorite', '3': 6, '4': 1, '5': 8, '10': 'favorite'},
    const {'1': 'order', '3': 7, '4': 1, '5': 13, '10': 'order'},
    const {'1': 'device', '3': 8, '4': 1, '5': 11, '6': '.Device', '10': 'device'},
    const {'1': 'amp', '3': 9, '4': 1, '5': 2, '10': 'amp'},
    const {'1': 'power', '3': 10, '4': 1, '5': 2, '10': 'power'},
    const {'1': 'volt', '3': 11, '4': 1, '5': 2, '10': 'volt'},
    const {'1': 'room', '3': 12, '4': 1, '5': 11, '6': '.Room', '10': 'room'},
    const {'1': 'showHome', '3': 13, '4': 1, '5': 8, '10': 'showHome'},
  ],
};

/// Descriptor for `SmartPlug`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List smartPlugDescriptor = $convert.base64Decode('CglTbWFydFBsdWcSDgoCaWQYASABKAlSAmlkEhIKBGljb24YAiABKAlSBGljb24SEgoEbmFtZRgDIAEoCVIEbmFtZRIWCgZuYW1lRW4YBCABKAlSBm5hbWVFbhIUCgVpbmRleBgFIAEoDVIFaW5kZXgSGgoIZmF2b3JpdGUYBiABKAhSCGZhdm9yaXRlEhQKBW9yZGVyGAcgASgNUgVvcmRlchIfCgZkZXZpY2UYCCABKAsyBy5EZXZpY2VSBmRldmljZRIQCgNhbXAYCSABKAJSA2FtcBIUCgVwb3dlchgKIAEoAlIFcG93ZXISEgoEdm9sdBgLIAEoAlIEdm9sdBIZCgRyb29tGAwgASgLMgUuUm9vbVIEcm9vbRIaCghzaG93SG9tZRgNIAEoCFIIc2hvd0hvbWU=');
@$core.Deprecated('Use userSettingDescriptor instead')
const UserSetting$json = const {
  '1': 'UserSetting',
  '2': const [
    const {'1': 'defaultHomeId', '3': 1, '4': 1, '5': 9, '10': 'defaultHomeId'},
  ],
};

/// Descriptor for `UserSetting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userSettingDescriptor = $convert.base64Decode('CgtVc2VyU2V0dGluZxIkCg1kZWZhdWx0SG9tZUlkGAEgASgJUg1kZWZhdWx0SG9tZUlk');
@$core.Deprecated('Use fileUploadFormDescriptor instead')
const FileUploadForm$json = const {
  '1': 'FileUploadForm',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'image', '3': 2, '4': 1, '5': 12, '10': 'image'},
    const {'1': 'sizeInByte', '3': 3, '4': 1, '5': 13, '10': 'sizeInByte'},
  ],
};

/// Descriptor for `FileUploadForm`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileUploadFormDescriptor = $convert.base64Decode('Cg5GaWxlVXBsb2FkRm9ybRISCgRuYW1lGAEgASgJUgRuYW1lEhQKBWltYWdlGAIgASgMUgVpbWFnZRIeCgpzaXplSW5CeXRlGAMgASgNUgpzaXplSW5CeXRl');
