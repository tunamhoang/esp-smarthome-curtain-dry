///
//  Generated code. Do not modify.
//  source: common-message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class GroupRemote extends $pb.ProtobufEnum {
  static const GroupRemote AirConditioner = GroupRemote._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AirConditioner');
  static const GroupRemote Fan = GroupRemote._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Fan');
  static const GroupRemote Multi = GroupRemote._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Multi');

  static const $core.List<GroupRemote> values = <GroupRemote> [
    AirConditioner,
    Fan,
    Multi,
  ];

  static final $core.Map<$core.int, GroupRemote> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GroupRemote? valueOf($core.int value) => _byValue[value];

  const GroupRemote._($core.int v, $core.String n) : super(v, n);
}

class RemoteCategory extends $pb.ProtobufEnum {
  static const RemoteCategory CategoryAuto = RemoteCategory._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CategoryAuto');
  static const RemoteCategory CategoryAC = RemoteCategory._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CategoryAC');
  static const RemoteCategory CategoryTV = RemoteCategory._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CategoryTV');

  static const $core.List<RemoteCategory> values = <RemoteCategory> [
    CategoryAuto,
    CategoryAC,
    CategoryTV,
  ];

  static final $core.Map<$core.int, RemoteCategory> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RemoteCategory? valueOf($core.int value) => _byValue[value];

  const RemoteCategory._($core.int v, $core.String n) : super(v, n);
}

class GroupDevice extends $pb.ProtobufEnum {
  static const GroupDevice SwitcherGroup = GroupDevice._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SwitcherGroup');
  static const GroupDevice CurtainSwitcherGroup = GroupDevice._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CurtainSwitcherGroup');
  static const GroupDevice CurtainGroup = GroupDevice._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CurtainGroup');
  static const GroupDevice IrRfGroup = GroupDevice._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IrRfGroup');
  static const GroupDevice MeterGroup = GroupDevice._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MeterGroup');
  static const GroupDevice MotionGroup = GroupDevice._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MotionGroup');
  static const GroupDevice HomekitGroup = GroupDevice._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HomekitGroup');
  static const GroupDevice ButtonGroup = GroupDevice._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ButtonGroup');
  static const GroupDevice ACGroup = GroupDevice._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ACGroup');
  static const GroupDevice LedDriverGroup = GroupDevice._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LedDriverGroup');
  static const GroupDevice EnvironmentSensorGroup = GroupDevice._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EnvironmentSensorGroup');
  static const GroupDevice TouchPanelGroup = GroupDevice._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TouchPanelGroup');
  static const GroupDevice UnknowGroup = GroupDevice._(1000, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UnknowGroup');

  static const $core.List<GroupDevice> values = <GroupDevice> [
    SwitcherGroup,
    CurtainSwitcherGroup,
    CurtainGroup,
    IrRfGroup,
    MeterGroup,
    MotionGroup,
    HomekitGroup,
    ButtonGroup,
    ACGroup,
    LedDriverGroup,
    EnvironmentSensorGroup,
    TouchPanelGroup,
    UnknowGroup,
  ];

  static final $core.Map<$core.int, GroupDevice> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GroupDevice? valueOf($core.int value) => _byValue[value];

  const GroupDevice._($core.int v, $core.String n) : super(v, n);
}

class ConditionScene extends $pb.ProtobufEnum {
  static const ConditionScene AutoCondition = ConditionScene._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AutoCondition');
  static const ConditionScene ManualCondition = ConditionScene._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ManualCondition');

  static const $core.List<ConditionScene> values = <ConditionScene> [
    AutoCondition,
    ManualCondition,
  ];

  static final $core.Map<$core.int, ConditionScene> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ConditionScene? valueOf($core.int value) => _byValue[value];

  const ConditionScene._($core.int v, $core.String n) : super(v, n);
}

class PowerState extends $pb.ProtobufEnum {
  static const PowerState Off = PowerState._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Off');
  static const PowerState On = PowerState._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'On');
  static const PowerState DoubleTap = PowerState._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DoubleTap');
  static const PowerState SceneTrigger = PowerState._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SceneTrigger');
  static const PowerState None = PowerState._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'None');

  static const $core.List<PowerState> values = <PowerState> [
    Off,
    On,
    DoubleTap,
    SceneTrigger,
    None,
  ];

  static final $core.Map<$core.int, PowerState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PowerState? valueOf($core.int value) => _byValue[value];

  const PowerState._($core.int v, $core.String n) : super(v, n);
}

class CurtainControlState extends $pb.ProtobufEnum {
  static const CurtainControlState CurtainControlUnknown = CurtainControlState._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CurtainControlUnknown');
  static const CurtainControlState CurtainControlClose = CurtainControlState._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CurtainControlClose');
  static const CurtainControlState CurtainControlStop = CurtainControlState._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CurtainControlStop');
  static const CurtainControlState CurtainControlOpen = CurtainControlState._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CurtainControlOpen');

  static const $core.List<CurtainControlState> values = <CurtainControlState> [
    CurtainControlUnknown,
    CurtainControlClose,
    CurtainControlStop,
    CurtainControlOpen,
  ];

  static final $core.Map<$core.int, CurtainControlState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CurtainControlState? valueOf($core.int value) => _byValue[value];

  const CurtainControlState._($core.int v, $core.String n) : super(v, n);
}

class ButtonState extends $pb.ProtobufEnum {
  static const ButtonState Nothing = ButtonState._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Nothing');
  static const ButtonState OneClick = ButtonState._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OneClick');
  static const ButtonState DoubleClick = ButtonState._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DoubleClick');
  static const ButtonState LongClick = ButtonState._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LongClick');

  static const $core.List<ButtonState> values = <ButtonState> [
    Nothing,
    OneClick,
    DoubleClick,
    LongClick,
  ];

  static final $core.Map<$core.int, ButtonState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ButtonState? valueOf($core.int value) => _byValue[value];

  const ButtonState._($core.int v, $core.String n) : super(v, n);
}

class ConnectionState extends $pb.ProtobufEnum {
  static const ConnectionState Offline = ConnectionState._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Offline');
  static const ConnectionState Online = ConnectionState._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Online');
  static const ConnectionState Disconnect = ConnectionState._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Disconnect');
  static const ConnectionState AddNew = ConnectionState._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AddNew');
  static const ConnectionState Delete = ConnectionState._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Delete');

  static const $core.List<ConnectionState> values = <ConnectionState> [
    Offline,
    Online,
    Disconnect,
    AddNew,
    Delete,
  ];

  static final $core.Map<$core.int, ConnectionState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ConnectionState? valueOf($core.int value) => _byValue[value];

  const ConnectionState._($core.int v, $core.String n) : super(v, n);
}

class ModeAc extends $pb.ProtobufEnum {
  static const ModeAc AutoMode = ModeAc._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AutoMode');
  static const ModeAc CoolMode = ModeAc._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CoolMode');
  static const ModeAc HeatMode = ModeAc._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HeatMode');
  static const ModeAc DryMode = ModeAc._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DryMode');
  static const ModeAc FanMode = ModeAc._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FanMode');

  static const $core.List<ModeAc> values = <ModeAc> [
    AutoMode,
    CoolMode,
    HeatMode,
    DryMode,
    FanMode,
  ];

  static final $core.Map<$core.int, ModeAc> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ModeAc? valueOf($core.int value) => _byValue[value];

  const ModeAc._($core.int v, $core.String n) : super(v, n);
}

class SwingAc extends $pb.ProtobufEnum {
  static const SwingAc AutoSwing = SwingAc._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AutoSwing');
  static const SwingAc LowSwing = SwingAc._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LowSwing');
  static const SwingAc MediumSwing = SwingAc._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MediumSwing');
  static const SwingAc HighSwing = SwingAc._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HighSwing');

  static const $core.List<SwingAc> values = <SwingAc> [
    AutoSwing,
    LowSwing,
    MediumSwing,
    HighSwing,
  ];

  static final $core.Map<$core.int, SwingAc> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SwingAc? valueOf($core.int value) => _byValue[value];

  const SwingAc._($core.int v, $core.String n) : super(v, n);
}

class FanAc extends $pb.ProtobufEnum {
  static const FanAc AutoFan = FanAc._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AutoFan');
  static const FanAc LowFan = FanAc._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LowFan');
  static const FanAc MediumFan = FanAc._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MediumFan');
  static const FanAc HighFan = FanAc._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HighFan');

  static const $core.List<FanAc> values = <FanAc> [
    AutoFan,
    LowFan,
    MediumFan,
    HighFan,
  ];

  static final $core.Map<$core.int, FanAc> _byValue = $pb.ProtobufEnum.initByValue(values);
  static FanAc? valueOf($core.int value) => _byValue[value];

  const FanAc._($core.int v, $core.String n) : super(v, n);
}

class TypeMeter extends $pb.ProtobufEnum {
  static const TypeMeter ElectricMeter = TypeMeter._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ElectricMeter');
  static const TypeMeter WaterMeter = TypeMeter._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WaterMeter');

  static const $core.List<TypeMeter> values = <TypeMeter> [
    ElectricMeter,
    WaterMeter,
  ];

  static final $core.Map<$core.int, TypeMeter> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TypeMeter? valueOf($core.int value) => _byValue[value];

  const TypeMeter._($core.int v, $core.String n) : super(v, n);
}

class TypeLearn extends $pb.ProtobufEnum {
  static const TypeLearn IR = TypeLearn._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IR');
  static const TypeLearn RF = TypeLearn._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RF');

  static const $core.List<TypeLearn> values = <TypeLearn> [
    IR,
    RF,
  ];

  static final $core.Map<$core.int, TypeLearn> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TypeLearn? valueOf($core.int value) => _byValue[value];

  const TypeLearn._($core.int v, $core.String n) : super(v, n);
}

class TypeDevice extends $pb.ProtobufEnum {
  static const TypeDevice SwitchLight = TypeDevice._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SwitchLight');
  static const TypeDevice SwitchSwitcher = TypeDevice._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SwitchSwitcher');
  static const TypeDevice SwitchOutlet = TypeDevice._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SwitchOutlet');

  static const $core.List<TypeDevice> values = <TypeDevice> [
    SwitchLight,
    SwitchSwitcher,
    SwitchOutlet,
  ];

  static final $core.Map<$core.int, TypeDevice> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TypeDevice? valueOf($core.int value) => _byValue[value];

  const TypeDevice._($core.int v, $core.String n) : super(v, n);
}

class MotionState extends $pb.ProtobufEnum {
  static const MotionState MotionNone = MotionState._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MotionNone');
  static const MotionState MotionDetected = MotionState._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MotionDetected');

  static const $core.List<MotionState> values = <MotionState> [
    MotionNone,
    MotionDetected,
  ];

  static final $core.Map<$core.int, MotionState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MotionState? valueOf($core.int value) => _byValue[value];

  const MotionState._($core.int v, $core.String n) : super(v, n);
}

class TouchPanelComponentType extends $pb.ProtobufEnum {
  static const TouchPanelComponentType TouchPanelComponentUnknown = TouchPanelComponentType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TouchPanelComponentUnknown');
  static const TouchPanelComponentType TouchPanelComponentSwitcher = TouchPanelComponentType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TouchPanelComponentSwitcher');
  static const TouchPanelComponentType TouchPanelComponentCurtainSwitcher = TouchPanelComponentType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TouchPanelComponentCurtainSwitcher');
  static const TouchPanelComponentType TouchPanelComponentCurtain = TouchPanelComponentType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TouchPanelComponentCurtain');
  static const TouchPanelComponentType TouchPanelComponentAirConditioner = TouchPanelComponentType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TouchPanelComponentAirConditioner');
  static const TouchPanelComponentType TouchPanelComponentLedDriver = TouchPanelComponentType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TouchPanelComponentLedDriver');
  static const TouchPanelComponentType TouchPanelComponentScene = TouchPanelComponentType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TouchPanelComponentScene');

  static const $core.List<TouchPanelComponentType> values = <TouchPanelComponentType> [
    TouchPanelComponentUnknown,
    TouchPanelComponentSwitcher,
    TouchPanelComponentCurtainSwitcher,
    TouchPanelComponentCurtain,
    TouchPanelComponentAirConditioner,
    TouchPanelComponentLedDriver,
    TouchPanelComponentScene,
  ];

  static final $core.Map<$core.int, TouchPanelComponentType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TouchPanelComponentType? valueOf($core.int value) => _byValue[value];

  const TouchPanelComponentType._($core.int v, $core.String n) : super(v, n);
}

class HomekitMode extends $pb.ProtobufEnum {
  static const HomekitMode HomekitNormalMode = HomekitMode._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HomekitNormalMode');
  static const HomekitMode HomekitProvisioningMode = HomekitMode._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HomekitProvisioningMode');

  static const $core.List<HomekitMode> values = <HomekitMode> [
    HomekitNormalMode,
    HomekitProvisioningMode,
  ];

  static final $core.Map<$core.int, HomekitMode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static HomekitMode? valueOf($core.int value) => _byValue[value];

  const HomekitMode._($core.int v, $core.String n) : super(v, n);
}

class TypeEcho extends $pb.ProtobufEnum {
  static const TypeEcho Echo = TypeEcho._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Echo');
  static const TypeEcho DeviceLogin = TypeEcho._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DeviceLogin');

  static const $core.List<TypeEcho> values = <TypeEcho> [
    Echo,
    DeviceLogin,
  ];

  static final $core.Map<$core.int, TypeEcho> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TypeEcho? valueOf($core.int value) => _byValue[value];

  const TypeEcho._($core.int v, $core.String n) : super(v, n);
}

class DataType extends $pb.ProtobufEnum {
  static const DataType BINARIES = DataType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BINARIES');
  static const DataType BASE64 = DataType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BASE64');

  static const $core.List<DataType> values = <DataType> [
    BINARIES,
    BASE64,
  ];

  static final $core.Map<$core.int, DataType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DataType? valueOf($core.int value) => _byValue[value];

  const DataType._($core.int v, $core.String n) : super(v, n);
}

class UserRole extends $pb.ProtobufEnum {
  static const UserRole NormalUser = UserRole._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NormalUser');
  static const UserRole OperationalUser = UserRole._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OperationalUser');
  static const UserRole UserRoleMax = UserRole._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UserRoleMax');

  static const $core.List<UserRole> values = <UserRole> [
    NormalUser,
    OperationalUser,
    UserRoleMax,
  ];

  static final $core.Map<$core.int, UserRole> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UserRole? valueOf($core.int value) => _byValue[value];

  const UserRole._($core.int v, $core.String n) : super(v, n);
}

class MotionSensorType extends $pb.ProtobufEnum {
  static const MotionSensorType MotionSensor = MotionSensorType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MotionSensor');
  static const MotionSensorType DoorSensor = MotionSensorType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DoorSensor');
  static const MotionSensorType LeakSensor = MotionSensorType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LeakSensor');
  static const MotionSensorType SmokeSensor = MotionSensorType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SmokeSensor');
  static const MotionSensorType GasSensor = MotionSensorType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GasSensor');
  static const MotionSensorType Temperature_Humidity_Pressure = MotionSensorType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Temperature_Humidity_Pressure');
  static const MotionSensorType Motion_Light = MotionSensorType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Motion_Light');
  static const MotionSensorType Motion_Vibrate = MotionSensorType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Motion_Vibrate');

  static const $core.List<MotionSensorType> values = <MotionSensorType> [
    MotionSensor,
    DoorSensor,
    LeakSensor,
    SmokeSensor,
    GasSensor,
    Temperature_Humidity_Pressure,
    Motion_Light,
    Motion_Vibrate,
  ];

  static final $core.Map<$core.int, MotionSensorType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MotionSensorType? valueOf($core.int value) => _byValue[value];

  const MotionSensorType._($core.int v, $core.String n) : super(v, n);
}

class EnvironmentSensorType extends $pb.ProtobufEnum {
  static const EnvironmentSensorType Unknow = EnvironmentSensorType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Unknow');
  static const EnvironmentSensorType Temperature = EnvironmentSensorType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Temperature');
  static const EnvironmentSensorType Humidity = EnvironmentSensorType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Humidity');
  static const EnvironmentSensorType Pressure = EnvironmentSensorType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Pressure');
  static const EnvironmentSensorType Light = EnvironmentSensorType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Light');
  static const EnvironmentSensorType Vibrate = EnvironmentSensorType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Vibrate');

  static const $core.List<EnvironmentSensorType> values = <EnvironmentSensorType> [
    Unknow,
    Temperature,
    Humidity,
    Pressure,
    Light,
    Vibrate,
  ];

  static final $core.Map<$core.int, EnvironmentSensorType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static EnvironmentSensorType? valueOf($core.int value) => _byValue[value];

  const EnvironmentSensorType._($core.int v, $core.String n) : super(v, n);
}

