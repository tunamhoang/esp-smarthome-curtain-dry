///
//  Generated code. Do not modify.
//  source: client-message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'common-message.pb.dart' as $0;

import 'common-message.pbenum.dart' as $0;

class ForceUpdateFirmwareDeviceClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ForceUpdateFirmwareDeviceClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..hasRequiredFields = false
  ;

  ForceUpdateFirmwareDeviceClientRequest._() : super();
  factory ForceUpdateFirmwareDeviceClientRequest({
    $core.String? hardwareId,
  }) {
    final _result = create();
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    return _result;
  }
  factory ForceUpdateFirmwareDeviceClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ForceUpdateFirmwareDeviceClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ForceUpdateFirmwareDeviceClientRequest clone() => ForceUpdateFirmwareDeviceClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ForceUpdateFirmwareDeviceClientRequest copyWith(void Function(ForceUpdateFirmwareDeviceClientRequest) updates) => super.copyWith((message) => updates(message as ForceUpdateFirmwareDeviceClientRequest)) as ForceUpdateFirmwareDeviceClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ForceUpdateFirmwareDeviceClientRequest create() => ForceUpdateFirmwareDeviceClientRequest._();
  ForceUpdateFirmwareDeviceClientRequest createEmptyInstance() => create();
  static $pb.PbList<ForceUpdateFirmwareDeviceClientRequest> createRepeated() => $pb.PbList<ForceUpdateFirmwareDeviceClientRequest>();
  @$core.pragma('dart2js:noInline')
  static ForceUpdateFirmwareDeviceClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ForceUpdateFirmwareDeviceClientRequest>(create);
  static ForceUpdateFirmwareDeviceClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hardwareId => $_getSZ(0);
  @$pb.TagNumber(1)
  set hardwareId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHardwareId() => $_has(0);
  @$pb.TagNumber(1)
  void clearHardwareId() => clearField(1);
}

class ForceUpdateFirmwareDeviceClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ForceUpdateFirmwareDeviceClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  ForceUpdateFirmwareDeviceClientResponse._() : super();
  factory ForceUpdateFirmwareDeviceClientResponse({
    $core.String? deviceId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory ForceUpdateFirmwareDeviceClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ForceUpdateFirmwareDeviceClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ForceUpdateFirmwareDeviceClientResponse clone() => ForceUpdateFirmwareDeviceClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ForceUpdateFirmwareDeviceClientResponse copyWith(void Function(ForceUpdateFirmwareDeviceClientResponse) updates) => super.copyWith((message) => updates(message as ForceUpdateFirmwareDeviceClientResponse)) as ForceUpdateFirmwareDeviceClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ForceUpdateFirmwareDeviceClientResponse create() => ForceUpdateFirmwareDeviceClientResponse._();
  ForceUpdateFirmwareDeviceClientResponse createEmptyInstance() => create();
  static $pb.PbList<ForceUpdateFirmwareDeviceClientResponse> createRepeated() => $pb.PbList<ForceUpdateFirmwareDeviceClientResponse>();
  @$core.pragma('dart2js:noInline')
  static ForceUpdateFirmwareDeviceClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ForceUpdateFirmwareDeviceClientResponse>(create);
  static ForceUpdateFirmwareDeviceClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(1);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(1);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(1);
}

class UpdateDeviceClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateDeviceClientRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateMode', $pb.PbFieldType.OU3, protoName: 'updateMode')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reactivity', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'brightness', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timeDelay', $pb.PbFieldType.OU3, protoName: 'timeDelay')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneActiveMap', $pb.PbFieldType.OU3, protoName: 'sceneActiveMap')
    ..hasRequiredFields = false
  ;

  UpdateDeviceClientRequest._() : super();
  factory UpdateDeviceClientRequest({
    $core.int? updateMode,
    $core.String? hardwareId,
    $core.int? reactivity,
    $core.int? brightness,
    $core.int? timeDelay,
    $core.int? sceneActiveMap,
  }) {
    final _result = create();
    if (updateMode != null) {
      _result.updateMode = updateMode;
    }
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    if (reactivity != null) {
      _result.reactivity = reactivity;
    }
    if (brightness != null) {
      _result.brightness = brightness;
    }
    if (timeDelay != null) {
      _result.timeDelay = timeDelay;
    }
    if (sceneActiveMap != null) {
      _result.sceneActiveMap = sceneActiveMap;
    }
    return _result;
  }
  factory UpdateDeviceClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateDeviceClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateDeviceClientRequest clone() => UpdateDeviceClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateDeviceClientRequest copyWith(void Function(UpdateDeviceClientRequest) updates) => super.copyWith((message) => updates(message as UpdateDeviceClientRequest)) as UpdateDeviceClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateDeviceClientRequest create() => UpdateDeviceClientRequest._();
  UpdateDeviceClientRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateDeviceClientRequest> createRepeated() => $pb.PbList<UpdateDeviceClientRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateDeviceClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateDeviceClientRequest>(create);
  static UpdateDeviceClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get updateMode => $_getIZ(0);
  @$pb.TagNumber(1)
  set updateMode($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUpdateMode() => $_has(0);
  @$pb.TagNumber(1)
  void clearUpdateMode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get hardwareId => $_getSZ(1);
  @$pb.TagNumber(2)
  set hardwareId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHardwareId() => $_has(1);
  @$pb.TagNumber(2)
  void clearHardwareId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get reactivity => $_getIZ(2);
  @$pb.TagNumber(3)
  set reactivity($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasReactivity() => $_has(2);
  @$pb.TagNumber(3)
  void clearReactivity() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get brightness => $_getIZ(3);
  @$pb.TagNumber(4)
  set brightness($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBrightness() => $_has(3);
  @$pb.TagNumber(4)
  void clearBrightness() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get timeDelay => $_getIZ(4);
  @$pb.TagNumber(5)
  set timeDelay($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTimeDelay() => $_has(4);
  @$pb.TagNumber(5)
  void clearTimeDelay() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get sceneActiveMap => $_getIZ(5);
  @$pb.TagNumber(6)
  set sceneActiveMap($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSceneActiveMap() => $_has(5);
  @$pb.TagNumber(6)
  void clearSceneActiveMap() => clearField(6);
}

class UpdateDeviceClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateDeviceClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  UpdateDeviceClientResponse._() : super();
  factory UpdateDeviceClientResponse({
    $core.String? deviceId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory UpdateDeviceClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateDeviceClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateDeviceClientResponse clone() => UpdateDeviceClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateDeviceClientResponse copyWith(void Function(UpdateDeviceClientResponse) updates) => super.copyWith((message) => updates(message as UpdateDeviceClientResponse)) as UpdateDeviceClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateDeviceClientResponse create() => UpdateDeviceClientResponse._();
  UpdateDeviceClientResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateDeviceClientResponse> createRepeated() => $pb.PbList<UpdateDeviceClientResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateDeviceClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateDeviceClientResponse>(create);
  static UpdateDeviceClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(1);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(1);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(1);
}

class UpdateWSEndpointClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateWSEndpointClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'wsEnpoint', protoName: 'wsEnpoint')
    ..hasRequiredFields = false
  ;

  UpdateWSEndpointClientRequest._() : super();
  factory UpdateWSEndpointClientRequest({
    $core.String? deviceId,
    $core.String? wsEnpoint,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (wsEnpoint != null) {
      _result.wsEnpoint = wsEnpoint;
    }
    return _result;
  }
  factory UpdateWSEndpointClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateWSEndpointClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateWSEndpointClientRequest clone() => UpdateWSEndpointClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateWSEndpointClientRequest copyWith(void Function(UpdateWSEndpointClientRequest) updates) => super.copyWith((message) => updates(message as UpdateWSEndpointClientRequest)) as UpdateWSEndpointClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateWSEndpointClientRequest create() => UpdateWSEndpointClientRequest._();
  UpdateWSEndpointClientRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateWSEndpointClientRequest> createRepeated() => $pb.PbList<UpdateWSEndpointClientRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateWSEndpointClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateWSEndpointClientRequest>(create);
  static UpdateWSEndpointClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get wsEnpoint => $_getSZ(1);
  @$pb.TagNumber(2)
  set wsEnpoint($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasWsEnpoint() => $_has(1);
  @$pb.TagNumber(2)
  void clearWsEnpoint() => clearField(2);
}

class UpdateWSEndpointClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateWSEndpointClientResponse', createEmptyInstance: create)
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  UpdateWSEndpointClientResponse._() : super();
  factory UpdateWSEndpointClientResponse({
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory UpdateWSEndpointClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateWSEndpointClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateWSEndpointClientResponse clone() => UpdateWSEndpointClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateWSEndpointClientResponse copyWith(void Function(UpdateWSEndpointClientResponse) updates) => super.copyWith((message) => updates(message as UpdateWSEndpointClientResponse)) as UpdateWSEndpointClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateWSEndpointClientResponse create() => UpdateWSEndpointClientResponse._();
  UpdateWSEndpointClientResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateWSEndpointClientResponse> createRepeated() => $pb.PbList<UpdateWSEndpointClientResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateWSEndpointClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateWSEndpointClientResponse>(create);
  static UpdateWSEndpointClientResponse? _defaultInstance;

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(0);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(0);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(0);
}

class DeleteDeviceClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteDeviceClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..hasRequiredFields = false
  ;

  DeleteDeviceClientRequest._() : super();
  factory DeleteDeviceClientRequest({
    $core.String? hardwareId,
  }) {
    final _result = create();
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    return _result;
  }
  factory DeleteDeviceClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteDeviceClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteDeviceClientRequest clone() => DeleteDeviceClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteDeviceClientRequest copyWith(void Function(DeleteDeviceClientRequest) updates) => super.copyWith((message) => updates(message as DeleteDeviceClientRequest)) as DeleteDeviceClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteDeviceClientRequest create() => DeleteDeviceClientRequest._();
  DeleteDeviceClientRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteDeviceClientRequest> createRepeated() => $pb.PbList<DeleteDeviceClientRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteDeviceClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteDeviceClientRequest>(create);
  static DeleteDeviceClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hardwareId => $_getSZ(0);
  @$pb.TagNumber(1)
  set hardwareId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHardwareId() => $_has(0);
  @$pb.TagNumber(1)
  void clearHardwareId() => clearField(1);
}

class DeleteDeviceClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteDeviceClientResponse', createEmptyInstance: create)
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  DeleteDeviceClientResponse._() : super();
  factory DeleteDeviceClientResponse({
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory DeleteDeviceClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteDeviceClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteDeviceClientResponse clone() => DeleteDeviceClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteDeviceClientResponse copyWith(void Function(DeleteDeviceClientResponse) updates) => super.copyWith((message) => updates(message as DeleteDeviceClientResponse)) as DeleteDeviceClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteDeviceClientResponse create() => DeleteDeviceClientResponse._();
  DeleteDeviceClientResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteDeviceClientResponse> createRepeated() => $pb.PbList<DeleteDeviceClientResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteDeviceClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteDeviceClientResponse>(create);
  static DeleteDeviceClientResponse? _defaultInstance;

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(0);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(0);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(0);
}

class GetSwitchersClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetSwitchersClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..hasRequiredFields = false
  ;

  GetSwitchersClientRequest._() : super();
  factory GetSwitchersClientRequest({
    $core.String? hardwareId,
  }) {
    final _result = create();
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    return _result;
  }
  factory GetSwitchersClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSwitchersClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSwitchersClientRequest clone() => GetSwitchersClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSwitchersClientRequest copyWith(void Function(GetSwitchersClientRequest) updates) => super.copyWith((message) => updates(message as GetSwitchersClientRequest)) as GetSwitchersClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetSwitchersClientRequest create() => GetSwitchersClientRequest._();
  GetSwitchersClientRequest createEmptyInstance() => create();
  static $pb.PbList<GetSwitchersClientRequest> createRepeated() => $pb.PbList<GetSwitchersClientRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSwitchersClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSwitchersClientRequest>(create);
  static GetSwitchersClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hardwareId => $_getSZ(0);
  @$pb.TagNumber(1)
  set hardwareId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHardwareId() => $_has(0);
  @$pb.TagNumber(1)
  void clearHardwareId() => clearField(1);
}

class GetSwitchersClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetSwitchersClientResponse', createEmptyInstance: create)
    ..aOM<$0.Switcher>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switchers', subBuilder: $0.Switcher.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  GetSwitchersClientResponse._() : super();
  factory GetSwitchersClientResponse({
    $0.Switcher? switchers,
    $core.String? deviceId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (switchers != null) {
      _result.switchers = switchers;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory GetSwitchersClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSwitchersClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSwitchersClientResponse clone() => GetSwitchersClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSwitchersClientResponse copyWith(void Function(GetSwitchersClientResponse) updates) => super.copyWith((message) => updates(message as GetSwitchersClientResponse)) as GetSwitchersClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetSwitchersClientResponse create() => GetSwitchersClientResponse._();
  GetSwitchersClientResponse createEmptyInstance() => create();
  static $pb.PbList<GetSwitchersClientResponse> createRepeated() => $pb.PbList<GetSwitchersClientResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSwitchersClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSwitchersClientResponse>(create);
  static GetSwitchersClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Switcher get switchers => $_getN(0);
  @$pb.TagNumber(1)
  set switchers($0.Switcher v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSwitchers() => $_has(0);
  @$pb.TagNumber(1)
  void clearSwitchers() => clearField(1);
  @$pb.TagNumber(1)
  $0.Switcher ensureSwitchers() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get deviceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceId() => clearField(2);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(2);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(2);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(2);
}

class GetSwitcherClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetSwitcherClientRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcher', $pb.PbFieldType.OU3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..hasRequiredFields = false
  ;

  GetSwitcherClientRequest._() : super();
  factory GetSwitcherClientRequest({
    $core.int? switcher,
    $core.String? hardwareId,
  }) {
    final _result = create();
    if (switcher != null) {
      _result.switcher = switcher;
    }
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    return _result;
  }
  factory GetSwitcherClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSwitcherClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSwitcherClientRequest clone() => GetSwitcherClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSwitcherClientRequest copyWith(void Function(GetSwitcherClientRequest) updates) => super.copyWith((message) => updates(message as GetSwitcherClientRequest)) as GetSwitcherClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetSwitcherClientRequest create() => GetSwitcherClientRequest._();
  GetSwitcherClientRequest createEmptyInstance() => create();
  static $pb.PbList<GetSwitcherClientRequest> createRepeated() => $pb.PbList<GetSwitcherClientRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSwitcherClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSwitcherClientRequest>(create);
  static GetSwitcherClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get switcher => $_getIZ(0);
  @$pb.TagNumber(1)
  set switcher($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSwitcher() => $_has(0);
  @$pb.TagNumber(1)
  void clearSwitcher() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get hardwareId => $_getSZ(1);
  @$pb.TagNumber(2)
  set hardwareId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHardwareId() => $_has(1);
  @$pb.TagNumber(2)
  void clearHardwareId() => clearField(2);
}

class GetSwitcherClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetSwitcherClientResponse', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcher', $pb.PbFieldType.OU3)
    ..e<$0.PowerState>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: $0.PowerState.Off, valueOf: $0.PowerState.valueOf, enumValues: $0.PowerState.values)
    ..aOM<$0.Device>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'device', subBuilder: $0.Device.create)
    ..aOM<$0.DateTime>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'datetime', subBuilder: $0.DateTime.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  GetSwitcherClientResponse._() : super();
  factory GetSwitcherClientResponse({
    $core.int? switcher,
    $0.PowerState? powerState,
    $0.Device? device,
    $0.DateTime? datetime,
    $core.String? deviceId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (switcher != null) {
      _result.switcher = switcher;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (device != null) {
      _result.device = device;
    }
    if (datetime != null) {
      _result.datetime = datetime;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory GetSwitcherClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSwitcherClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSwitcherClientResponse clone() => GetSwitcherClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSwitcherClientResponse copyWith(void Function(GetSwitcherClientResponse) updates) => super.copyWith((message) => updates(message as GetSwitcherClientResponse)) as GetSwitcherClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetSwitcherClientResponse create() => GetSwitcherClientResponse._();
  GetSwitcherClientResponse createEmptyInstance() => create();
  static $pb.PbList<GetSwitcherClientResponse> createRepeated() => $pb.PbList<GetSwitcherClientResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSwitcherClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSwitcherClientResponse>(create);
  static GetSwitcherClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get switcher => $_getIZ(0);
  @$pb.TagNumber(1)
  set switcher($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSwitcher() => $_has(0);
  @$pb.TagNumber(1)
  void clearSwitcher() => clearField(1);

  @$pb.TagNumber(2)
  $0.PowerState get powerState => $_getN(1);
  @$pb.TagNumber(2)
  set powerState($0.PowerState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPowerState() => $_has(1);
  @$pb.TagNumber(2)
  void clearPowerState() => clearField(2);

  @$pb.TagNumber(3)
  $0.Device get device => $_getN(2);
  @$pb.TagNumber(3)
  set device($0.Device v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDevice() => $_has(2);
  @$pb.TagNumber(3)
  void clearDevice() => clearField(3);
  @$pb.TagNumber(3)
  $0.Device ensureDevice() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.DateTime get datetime => $_getN(3);
  @$pb.TagNumber(4)
  set datetime($0.DateTime v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDatetime() => $_has(3);
  @$pb.TagNumber(4)
  void clearDatetime() => clearField(4);
  @$pb.TagNumber(4)
  $0.DateTime ensureDatetime() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get deviceId => $_getSZ(4);
  @$pb.TagNumber(5)
  set deviceId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDeviceId() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeviceId() => clearField(5);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(5);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(5);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(5);
}

class GetLogSwitcherClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetLogSwitcherClientRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcher', $pb.PbFieldType.OU3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..hasRequiredFields = false
  ;

  GetLogSwitcherClientRequest._() : super();
  factory GetLogSwitcherClientRequest({
    $core.int? switcher,
    $core.String? hardwareId,
  }) {
    final _result = create();
    if (switcher != null) {
      _result.switcher = switcher;
    }
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    return _result;
  }
  factory GetLogSwitcherClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLogSwitcherClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLogSwitcherClientRequest clone() => GetLogSwitcherClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLogSwitcherClientRequest copyWith(void Function(GetLogSwitcherClientRequest) updates) => super.copyWith((message) => updates(message as GetLogSwitcherClientRequest)) as GetLogSwitcherClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetLogSwitcherClientRequest create() => GetLogSwitcherClientRequest._();
  GetLogSwitcherClientRequest createEmptyInstance() => create();
  static $pb.PbList<GetLogSwitcherClientRequest> createRepeated() => $pb.PbList<GetLogSwitcherClientRequest>();
  @$core.pragma('dart2js:noInline')
  static GetLogSwitcherClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLogSwitcherClientRequest>(create);
  static GetLogSwitcherClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get switcher => $_getIZ(0);
  @$pb.TagNumber(1)
  set switcher($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSwitcher() => $_has(0);
  @$pb.TagNumber(1)
  void clearSwitcher() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get hardwareId => $_getSZ(1);
  @$pb.TagNumber(2)
  set hardwareId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHardwareId() => $_has(1);
  @$pb.TagNumber(2)
  void clearHardwareId() => clearField(2);
}

class GetLogSwitcherClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetLogSwitcherClientResponse', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcher', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalTimeOnOrgin', $pb.PbFieldType.OU3, protoName: 'totalTimeOnOrgin')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalTimeOnYear', $pb.PbFieldType.OU3, protoName: 'totalTimeOnYear')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalTimeOnMonth', $pb.PbFieldType.OU3, protoName: 'totalTimeOnMonth')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timeOnLastDate', $pb.PbFieldType.OU3, protoName: 'timeOnLastDate')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timeOffLastDate', $pb.PbFieldType.OU3, protoName: 'timeOffLastDate')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  GetLogSwitcherClientResponse._() : super();
  factory GetLogSwitcherClientResponse({
    $core.int? switcher,
    $core.int? totalTimeOnOrgin,
    $core.int? totalTimeOnYear,
    $core.int? totalTimeOnMonth,
    $core.int? timeOnLastDate,
    $core.int? timeOffLastDate,
    $core.String? deviceId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (switcher != null) {
      _result.switcher = switcher;
    }
    if (totalTimeOnOrgin != null) {
      _result.totalTimeOnOrgin = totalTimeOnOrgin;
    }
    if (totalTimeOnYear != null) {
      _result.totalTimeOnYear = totalTimeOnYear;
    }
    if (totalTimeOnMonth != null) {
      _result.totalTimeOnMonth = totalTimeOnMonth;
    }
    if (timeOnLastDate != null) {
      _result.timeOnLastDate = timeOnLastDate;
    }
    if (timeOffLastDate != null) {
      _result.timeOffLastDate = timeOffLastDate;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory GetLogSwitcherClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLogSwitcherClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLogSwitcherClientResponse clone() => GetLogSwitcherClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLogSwitcherClientResponse copyWith(void Function(GetLogSwitcherClientResponse) updates) => super.copyWith((message) => updates(message as GetLogSwitcherClientResponse)) as GetLogSwitcherClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetLogSwitcherClientResponse create() => GetLogSwitcherClientResponse._();
  GetLogSwitcherClientResponse createEmptyInstance() => create();
  static $pb.PbList<GetLogSwitcherClientResponse> createRepeated() => $pb.PbList<GetLogSwitcherClientResponse>();
  @$core.pragma('dart2js:noInline')
  static GetLogSwitcherClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLogSwitcherClientResponse>(create);
  static GetLogSwitcherClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get switcher => $_getIZ(0);
  @$pb.TagNumber(1)
  set switcher($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSwitcher() => $_has(0);
  @$pb.TagNumber(1)
  void clearSwitcher() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get totalTimeOnOrgin => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalTimeOnOrgin($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalTimeOnOrgin() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalTimeOnOrgin() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get totalTimeOnYear => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalTimeOnYear($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTotalTimeOnYear() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalTimeOnYear() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get totalTimeOnMonth => $_getIZ(3);
  @$pb.TagNumber(4)
  set totalTimeOnMonth($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTotalTimeOnMonth() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalTimeOnMonth() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get timeOnLastDate => $_getIZ(4);
  @$pb.TagNumber(5)
  set timeOnLastDate($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTimeOnLastDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearTimeOnLastDate() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get timeOffLastDate => $_getIZ(5);
  @$pb.TagNumber(6)
  set timeOffLastDate($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTimeOffLastDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearTimeOffLastDate() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get deviceId => $_getSZ(6);
  @$pb.TagNumber(7)
  set deviceId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDeviceId() => $_has(6);
  @$pb.TagNumber(7)
  void clearDeviceId() => clearField(7);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(7);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(7);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(7);
}

class SwitcherClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SwitcherClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcher', $pb.PbFieldType.OU3)
    ..e<$0.PowerState>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: $0.PowerState.Off, valueOf: $0.PowerState.valueOf, enumValues: $0.PowerState.values)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..hasRequiredFields = false
  ;

  SwitcherClientRequest._() : super();
  factory SwitcherClientRequest({
    $core.String? deviceId,
    $core.int? switcher,
    $0.PowerState? powerState,
    $core.String? hardwareId,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (switcher != null) {
      _result.switcher = switcher;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    return _result;
  }
  factory SwitcherClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SwitcherClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SwitcherClientRequest clone() => SwitcherClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SwitcherClientRequest copyWith(void Function(SwitcherClientRequest) updates) => super.copyWith((message) => updates(message as SwitcherClientRequest)) as SwitcherClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SwitcherClientRequest create() => SwitcherClientRequest._();
  SwitcherClientRequest createEmptyInstance() => create();
  static $pb.PbList<SwitcherClientRequest> createRepeated() => $pb.PbList<SwitcherClientRequest>();
  @$core.pragma('dart2js:noInline')
  static SwitcherClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SwitcherClientRequest>(create);
  static SwitcherClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get switcher => $_getIZ(1);
  @$pb.TagNumber(2)
  set switcher($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSwitcher() => $_has(1);
  @$pb.TagNumber(2)
  void clearSwitcher() => clearField(2);

  @$pb.TagNumber(3)
  $0.PowerState get powerState => $_getN(2);
  @$pb.TagNumber(3)
  set powerState($0.PowerState v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPowerState() => $_has(2);
  @$pb.TagNumber(3)
  void clearPowerState() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get hardwareId => $_getSZ(3);
  @$pb.TagNumber(4)
  set hardwareId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHardwareId() => $_has(3);
  @$pb.TagNumber(4)
  void clearHardwareId() => clearField(4);
}

class SwitcherClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SwitcherClientResponse', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcher', $pb.PbFieldType.OU3)
    ..e<$0.PowerState>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: $0.PowerState.Off, valueOf: $0.PowerState.valueOf, enumValues: $0.PowerState.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  SwitcherClientResponse._() : super();
  factory SwitcherClientResponse({
    $core.int? switcher,
    $0.PowerState? powerState,
    $core.String? deviceId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (switcher != null) {
      _result.switcher = switcher;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory SwitcherClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SwitcherClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SwitcherClientResponse clone() => SwitcherClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SwitcherClientResponse copyWith(void Function(SwitcherClientResponse) updates) => super.copyWith((message) => updates(message as SwitcherClientResponse)) as SwitcherClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SwitcherClientResponse create() => SwitcherClientResponse._();
  SwitcherClientResponse createEmptyInstance() => create();
  static $pb.PbList<SwitcherClientResponse> createRepeated() => $pb.PbList<SwitcherClientResponse>();
  @$core.pragma('dart2js:noInline')
  static SwitcherClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SwitcherClientResponse>(create);
  static SwitcherClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get switcher => $_getIZ(0);
  @$pb.TagNumber(1)
  set switcher($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSwitcher() => $_has(0);
  @$pb.TagNumber(1)
  void clearSwitcher() => clearField(1);

  @$pb.TagNumber(2)
  $0.PowerState get powerState => $_getN(1);
  @$pb.TagNumber(2)
  set powerState($0.PowerState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPowerState() => $_has(1);
  @$pb.TagNumber(2)
  void clearPowerState() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get deviceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set deviceId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeviceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceId() => clearField(3);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(3);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(3);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(3);
}

class AddSwitcherScheduleClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddSwitcherScheduleClientRequest', createEmptyInstance: create)
    ..aOM<$0.SwitcherSchedule>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'schedule', subBuilder: $0.SwitcherSchedule.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..hasRequiredFields = false
  ;

  AddSwitcherScheduleClientRequest._() : super();
  factory AddSwitcherScheduleClientRequest({
    $0.SwitcherSchedule? schedule,
    $core.String? hardwareId,
  }) {
    final _result = create();
    if (schedule != null) {
      _result.schedule = schedule;
    }
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    return _result;
  }
  factory AddSwitcherScheduleClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddSwitcherScheduleClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddSwitcherScheduleClientRequest clone() => AddSwitcherScheduleClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddSwitcherScheduleClientRequest copyWith(void Function(AddSwitcherScheduleClientRequest) updates) => super.copyWith((message) => updates(message as AddSwitcherScheduleClientRequest)) as AddSwitcherScheduleClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddSwitcherScheduleClientRequest create() => AddSwitcherScheduleClientRequest._();
  AddSwitcherScheduleClientRequest createEmptyInstance() => create();
  static $pb.PbList<AddSwitcherScheduleClientRequest> createRepeated() => $pb.PbList<AddSwitcherScheduleClientRequest>();
  @$core.pragma('dart2js:noInline')
  static AddSwitcherScheduleClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddSwitcherScheduleClientRequest>(create);
  static AddSwitcherScheduleClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $0.SwitcherSchedule get schedule => $_getN(0);
  @$pb.TagNumber(1)
  set schedule($0.SwitcherSchedule v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSchedule() => $_has(0);
  @$pb.TagNumber(1)
  void clearSchedule() => clearField(1);
  @$pb.TagNumber(1)
  $0.SwitcherSchedule ensureSchedule() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get hardwareId => $_getSZ(1);
  @$pb.TagNumber(2)
  set hardwareId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHardwareId() => $_has(1);
  @$pb.TagNumber(2)
  void clearHardwareId() => clearField(2);
}

class AddSwitcherScheduleClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddSwitcherScheduleClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcherScheduleId', protoName: 'switcherScheduleId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  AddSwitcherScheduleClientResponse._() : super();
  factory AddSwitcherScheduleClientResponse({
    $core.String? switcherScheduleId,
    $core.String? deviceId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (switcherScheduleId != null) {
      _result.switcherScheduleId = switcherScheduleId;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory AddSwitcherScheduleClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddSwitcherScheduleClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddSwitcherScheduleClientResponse clone() => AddSwitcherScheduleClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddSwitcherScheduleClientResponse copyWith(void Function(AddSwitcherScheduleClientResponse) updates) => super.copyWith((message) => updates(message as AddSwitcherScheduleClientResponse)) as AddSwitcherScheduleClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddSwitcherScheduleClientResponse create() => AddSwitcherScheduleClientResponse._();
  AddSwitcherScheduleClientResponse createEmptyInstance() => create();
  static $pb.PbList<AddSwitcherScheduleClientResponse> createRepeated() => $pb.PbList<AddSwitcherScheduleClientResponse>();
  @$core.pragma('dart2js:noInline')
  static AddSwitcherScheduleClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddSwitcherScheduleClientResponse>(create);
  static AddSwitcherScheduleClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get switcherScheduleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set switcherScheduleId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSwitcherScheduleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSwitcherScheduleId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get deviceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceId() => clearField(2);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(2);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(2);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(2);
}

class UpdateSwitcherScheduleClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateSwitcherScheduleClientRequest', createEmptyInstance: create)
    ..aOM<$0.SwitcherSchedule>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'schedule', subBuilder: $0.SwitcherSchedule.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..hasRequiredFields = false
  ;

  UpdateSwitcherScheduleClientRequest._() : super();
  factory UpdateSwitcherScheduleClientRequest({
    $0.SwitcherSchedule? schedule,
    $core.String? hardwareId,
  }) {
    final _result = create();
    if (schedule != null) {
      _result.schedule = schedule;
    }
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    return _result;
  }
  factory UpdateSwitcherScheduleClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSwitcherScheduleClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSwitcherScheduleClientRequest clone() => UpdateSwitcherScheduleClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSwitcherScheduleClientRequest copyWith(void Function(UpdateSwitcherScheduleClientRequest) updates) => super.copyWith((message) => updates(message as UpdateSwitcherScheduleClientRequest)) as UpdateSwitcherScheduleClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateSwitcherScheduleClientRequest create() => UpdateSwitcherScheduleClientRequest._();
  UpdateSwitcherScheduleClientRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSwitcherScheduleClientRequest> createRepeated() => $pb.PbList<UpdateSwitcherScheduleClientRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSwitcherScheduleClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSwitcherScheduleClientRequest>(create);
  static UpdateSwitcherScheduleClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $0.SwitcherSchedule get schedule => $_getN(0);
  @$pb.TagNumber(1)
  set schedule($0.SwitcherSchedule v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSchedule() => $_has(0);
  @$pb.TagNumber(1)
  void clearSchedule() => clearField(1);
  @$pb.TagNumber(1)
  $0.SwitcherSchedule ensureSchedule() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get hardwareId => $_getSZ(1);
  @$pb.TagNumber(2)
  set hardwareId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHardwareId() => $_has(1);
  @$pb.TagNumber(2)
  void clearHardwareId() => clearField(2);
}

class UpdateSwitcherScheduleClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateSwitcherScheduleClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcherScheduleId', protoName: 'switcherScheduleId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  UpdateSwitcherScheduleClientResponse._() : super();
  factory UpdateSwitcherScheduleClientResponse({
    $core.String? switcherScheduleId,
    $core.String? deviceId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (switcherScheduleId != null) {
      _result.switcherScheduleId = switcherScheduleId;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory UpdateSwitcherScheduleClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSwitcherScheduleClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSwitcherScheduleClientResponse clone() => UpdateSwitcherScheduleClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSwitcherScheduleClientResponse copyWith(void Function(UpdateSwitcherScheduleClientResponse) updates) => super.copyWith((message) => updates(message as UpdateSwitcherScheduleClientResponse)) as UpdateSwitcherScheduleClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateSwitcherScheduleClientResponse create() => UpdateSwitcherScheduleClientResponse._();
  UpdateSwitcherScheduleClientResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateSwitcherScheduleClientResponse> createRepeated() => $pb.PbList<UpdateSwitcherScheduleClientResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateSwitcherScheduleClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSwitcherScheduleClientResponse>(create);
  static UpdateSwitcherScheduleClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get switcherScheduleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set switcherScheduleId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSwitcherScheduleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSwitcherScheduleId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get deviceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceId() => clearField(2);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(2);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(2);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(2);
}

class DeleteSwitcherScheduleClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteSwitcherScheduleClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcherScheduleId', protoName: 'switcherScheduleId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..hasRequiredFields = false
  ;

  DeleteSwitcherScheduleClientRequest._() : super();
  factory DeleteSwitcherScheduleClientRequest({
    $core.String? switcherScheduleId,
    $core.String? hardwareId,
  }) {
    final _result = create();
    if (switcherScheduleId != null) {
      _result.switcherScheduleId = switcherScheduleId;
    }
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    return _result;
  }
  factory DeleteSwitcherScheduleClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteSwitcherScheduleClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteSwitcherScheduleClientRequest clone() => DeleteSwitcherScheduleClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteSwitcherScheduleClientRequest copyWith(void Function(DeleteSwitcherScheduleClientRequest) updates) => super.copyWith((message) => updates(message as DeleteSwitcherScheduleClientRequest)) as DeleteSwitcherScheduleClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteSwitcherScheduleClientRequest create() => DeleteSwitcherScheduleClientRequest._();
  DeleteSwitcherScheduleClientRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteSwitcherScheduleClientRequest> createRepeated() => $pb.PbList<DeleteSwitcherScheduleClientRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteSwitcherScheduleClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteSwitcherScheduleClientRequest>(create);
  static DeleteSwitcherScheduleClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get switcherScheduleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set switcherScheduleId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSwitcherScheduleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSwitcherScheduleId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get hardwareId => $_getSZ(1);
  @$pb.TagNumber(2)
  set hardwareId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHardwareId() => $_has(1);
  @$pb.TagNumber(2)
  void clearHardwareId() => clearField(2);
}

class DeleteSwitcherScheduleClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteSwitcherScheduleClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcherScheduleId', protoName: 'switcherScheduleId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  DeleteSwitcherScheduleClientResponse._() : super();
  factory DeleteSwitcherScheduleClientResponse({
    $core.String? switcherScheduleId,
    $core.String? deviceId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (switcherScheduleId != null) {
      _result.switcherScheduleId = switcherScheduleId;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory DeleteSwitcherScheduleClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteSwitcherScheduleClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteSwitcherScheduleClientResponse clone() => DeleteSwitcherScheduleClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteSwitcherScheduleClientResponse copyWith(void Function(DeleteSwitcherScheduleClientResponse) updates) => super.copyWith((message) => updates(message as DeleteSwitcherScheduleClientResponse)) as DeleteSwitcherScheduleClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteSwitcherScheduleClientResponse create() => DeleteSwitcherScheduleClientResponse._();
  DeleteSwitcherScheduleClientResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteSwitcherScheduleClientResponse> createRepeated() => $pb.PbList<DeleteSwitcherScheduleClientResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteSwitcherScheduleClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteSwitcherScheduleClientResponse>(create);
  static DeleteSwitcherScheduleClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get switcherScheduleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set switcherScheduleId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSwitcherScheduleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSwitcherScheduleId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get deviceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceId() => clearField(2);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(2);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(2);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(2);
}

class UpdateSwitcherClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateSwitcherClientRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcher', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'keepState', $pb.PbFieldType.OU3, protoName: 'keepState')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'autoOff', $pb.PbFieldType.OU3, protoName: 'autoOff')
    ..hasRequiredFields = false
  ;

  UpdateSwitcherClientRequest._() : super();
  factory UpdateSwitcherClientRequest({
    $core.int? switcher,
    $core.int? keepState,
    $core.String? hardwareId,
    $core.int? autoOff,
  }) {
    final _result = create();
    if (switcher != null) {
      _result.switcher = switcher;
    }
    if (keepState != null) {
      _result.keepState = keepState;
    }
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    if (autoOff != null) {
      _result.autoOff = autoOff;
    }
    return _result;
  }
  factory UpdateSwitcherClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSwitcherClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSwitcherClientRequest clone() => UpdateSwitcherClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSwitcherClientRequest copyWith(void Function(UpdateSwitcherClientRequest) updates) => super.copyWith((message) => updates(message as UpdateSwitcherClientRequest)) as UpdateSwitcherClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateSwitcherClientRequest create() => UpdateSwitcherClientRequest._();
  UpdateSwitcherClientRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSwitcherClientRequest> createRepeated() => $pb.PbList<UpdateSwitcherClientRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSwitcherClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSwitcherClientRequest>(create);
  static UpdateSwitcherClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get switcher => $_getIZ(0);
  @$pb.TagNumber(1)
  set switcher($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSwitcher() => $_has(0);
  @$pb.TagNumber(1)
  void clearSwitcher() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get keepState => $_getIZ(1);
  @$pb.TagNumber(2)
  set keepState($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasKeepState() => $_has(1);
  @$pb.TagNumber(2)
  void clearKeepState() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get hardwareId => $_getSZ(2);
  @$pb.TagNumber(3)
  set hardwareId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHardwareId() => $_has(2);
  @$pb.TagNumber(3)
  void clearHardwareId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get autoOff => $_getIZ(3);
  @$pb.TagNumber(4)
  set autoOff($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAutoOff() => $_has(3);
  @$pb.TagNumber(4)
  void clearAutoOff() => clearField(4);
}

class UpdateSwitcherClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateSwitcherClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcher', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'keepState', $pb.PbFieldType.OU3, protoName: 'keepState')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'autoOff', $pb.PbFieldType.OU3, protoName: 'autoOff')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  UpdateSwitcherClientResponse._() : super();
  factory UpdateSwitcherClientResponse({
    $core.String? deviceId,
    $core.int? switcher,
    $core.int? keepState,
    $core.int? autoOff,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (switcher != null) {
      _result.switcher = switcher;
    }
    if (keepState != null) {
      _result.keepState = keepState;
    }
    if (autoOff != null) {
      _result.autoOff = autoOff;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory UpdateSwitcherClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSwitcherClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSwitcherClientResponse clone() => UpdateSwitcherClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSwitcherClientResponse copyWith(void Function(UpdateSwitcherClientResponse) updates) => super.copyWith((message) => updates(message as UpdateSwitcherClientResponse)) as UpdateSwitcherClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateSwitcherClientResponse create() => UpdateSwitcherClientResponse._();
  UpdateSwitcherClientResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateSwitcherClientResponse> createRepeated() => $pb.PbList<UpdateSwitcherClientResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateSwitcherClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSwitcherClientResponse>(create);
  static UpdateSwitcherClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get switcher => $_getIZ(1);
  @$pb.TagNumber(2)
  set switcher($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSwitcher() => $_has(1);
  @$pb.TagNumber(2)
  void clearSwitcher() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get keepState => $_getIZ(2);
  @$pb.TagNumber(3)
  set keepState($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasKeepState() => $_has(2);
  @$pb.TagNumber(3)
  void clearKeepState() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get autoOff => $_getIZ(3);
  @$pb.TagNumber(4)
  set autoOff($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAutoOff() => $_has(3);
  @$pb.TagNumber(4)
  void clearAutoOff() => clearField(4);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(4);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(4);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(4);
}

class UpdateSwitcherState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateSwitcherState', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcher', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'keepState', $pb.PbFieldType.OU3, protoName: 'keepState')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'autoOff', $pb.PbFieldType.OU3, protoName: 'autoOff')
    ..e<$0.PowerState>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: $0.PowerState.Off, valueOf: $0.PowerState.valueOf, enumValues: $0.PowerState.values)
    ..hasRequiredFields = false
  ;

  UpdateSwitcherState._() : super();
  factory UpdateSwitcherState({
    $core.String? deviceId,
    $core.int? switcher,
    $core.int? keepState,
    $core.int? autoOff,
    $0.PowerState? powerState,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (switcher != null) {
      _result.switcher = switcher;
    }
    if (keepState != null) {
      _result.keepState = keepState;
    }
    if (autoOff != null) {
      _result.autoOff = autoOff;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    return _result;
  }
  factory UpdateSwitcherState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSwitcherState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSwitcherState clone() => UpdateSwitcherState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSwitcherState copyWith(void Function(UpdateSwitcherState) updates) => super.copyWith((message) => updates(message as UpdateSwitcherState)) as UpdateSwitcherState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateSwitcherState create() => UpdateSwitcherState._();
  UpdateSwitcherState createEmptyInstance() => create();
  static $pb.PbList<UpdateSwitcherState> createRepeated() => $pb.PbList<UpdateSwitcherState>();
  @$core.pragma('dart2js:noInline')
  static UpdateSwitcherState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSwitcherState>(create);
  static UpdateSwitcherState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get switcher => $_getIZ(1);
  @$pb.TagNumber(2)
  set switcher($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSwitcher() => $_has(1);
  @$pb.TagNumber(2)
  void clearSwitcher() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get keepState => $_getIZ(2);
  @$pb.TagNumber(3)
  set keepState($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasKeepState() => $_has(2);
  @$pb.TagNumber(3)
  void clearKeepState() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get autoOff => $_getIZ(3);
  @$pb.TagNumber(4)
  set autoOff($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAutoOff() => $_has(3);
  @$pb.TagNumber(4)
  void clearAutoOff() => clearField(4);

  @$pb.TagNumber(5)
  $0.PowerState get powerState => $_getN(4);
  @$pb.TagNumber(5)
  set powerState($0.PowerState v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasPowerState() => $_has(4);
  @$pb.TagNumber(5)
  void clearPowerState() => clearField(5);
}

class CurtainSwitcherClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CurtainSwitcherClientRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percentIn', $pb.PbFieldType.OU3, protoName: 'percentIn')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percentOut', $pb.PbFieldType.OU3, protoName: 'percentOut')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..hasRequiredFields = false
  ;

  CurtainSwitcherClientRequest._() : super();
  factory CurtainSwitcherClientRequest({
    $core.int? percentIn,
    $core.int? percentOut,
    $core.String? hardwareId,
  }) {
    final _result = create();
    if (percentIn != null) {
      _result.percentIn = percentIn;
    }
    if (percentOut != null) {
      _result.percentOut = percentOut;
    }
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    return _result;
  }
  factory CurtainSwitcherClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CurtainSwitcherClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CurtainSwitcherClientRequest clone() => CurtainSwitcherClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CurtainSwitcherClientRequest copyWith(void Function(CurtainSwitcherClientRequest) updates) => super.copyWith((message) => updates(message as CurtainSwitcherClientRequest)) as CurtainSwitcherClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CurtainSwitcherClientRequest create() => CurtainSwitcherClientRequest._();
  CurtainSwitcherClientRequest createEmptyInstance() => create();
  static $pb.PbList<CurtainSwitcherClientRequest> createRepeated() => $pb.PbList<CurtainSwitcherClientRequest>();
  @$core.pragma('dart2js:noInline')
  static CurtainSwitcherClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CurtainSwitcherClientRequest>(create);
  static CurtainSwitcherClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get percentIn => $_getIZ(0);
  @$pb.TagNumber(1)
  set percentIn($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPercentIn() => $_has(0);
  @$pb.TagNumber(1)
  void clearPercentIn() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get percentOut => $_getIZ(1);
  @$pb.TagNumber(2)
  set percentOut($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPercentOut() => $_has(1);
  @$pb.TagNumber(2)
  void clearPercentOut() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get hardwareId => $_getSZ(2);
  @$pb.TagNumber(3)
  set hardwareId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHardwareId() => $_has(2);
  @$pb.TagNumber(3)
  void clearHardwareId() => clearField(3);
}

class CurtainSwitcherClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CurtainSwitcherClientResponse', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percentIn', $pb.PbFieldType.OU3, protoName: 'percentIn')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percentOut', $pb.PbFieldType.OU3, protoName: 'percentOut')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  CurtainSwitcherClientResponse._() : super();
  factory CurtainSwitcherClientResponse({
    $core.int? percentIn,
    $core.int? percentOut,
    $core.String? deviceId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (percentIn != null) {
      _result.percentIn = percentIn;
    }
    if (percentOut != null) {
      _result.percentOut = percentOut;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory CurtainSwitcherClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CurtainSwitcherClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CurtainSwitcherClientResponse clone() => CurtainSwitcherClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CurtainSwitcherClientResponse copyWith(void Function(CurtainSwitcherClientResponse) updates) => super.copyWith((message) => updates(message as CurtainSwitcherClientResponse)) as CurtainSwitcherClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CurtainSwitcherClientResponse create() => CurtainSwitcherClientResponse._();
  CurtainSwitcherClientResponse createEmptyInstance() => create();
  static $pb.PbList<CurtainSwitcherClientResponse> createRepeated() => $pb.PbList<CurtainSwitcherClientResponse>();
  @$core.pragma('dart2js:noInline')
  static CurtainSwitcherClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CurtainSwitcherClientResponse>(create);
  static CurtainSwitcherClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get percentIn => $_getIZ(0);
  @$pb.TagNumber(1)
  set percentIn($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPercentIn() => $_has(0);
  @$pb.TagNumber(1)
  void clearPercentIn() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get percentOut => $_getIZ(1);
  @$pb.TagNumber(2)
  set percentOut($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPercentOut() => $_has(1);
  @$pb.TagNumber(2)
  void clearPercentOut() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get deviceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set deviceId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeviceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceId() => clearField(3);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(3);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(3);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(3);
}

class AddCurtainSwitcherScheduleClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddCurtainSwitcherScheduleClientRequest', createEmptyInstance: create)
    ..aOM<$0.CurtainSwitcherSchedule>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'schedule', subBuilder: $0.CurtainSwitcherSchedule.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..hasRequiredFields = false
  ;

  AddCurtainSwitcherScheduleClientRequest._() : super();
  factory AddCurtainSwitcherScheduleClientRequest({
    $0.CurtainSwitcherSchedule? schedule,
    $core.String? hardwareId,
  }) {
    final _result = create();
    if (schedule != null) {
      _result.schedule = schedule;
    }
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    return _result;
  }
  factory AddCurtainSwitcherScheduleClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCurtainSwitcherScheduleClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCurtainSwitcherScheduleClientRequest clone() => AddCurtainSwitcherScheduleClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCurtainSwitcherScheduleClientRequest copyWith(void Function(AddCurtainSwitcherScheduleClientRequest) updates) => super.copyWith((message) => updates(message as AddCurtainSwitcherScheduleClientRequest)) as AddCurtainSwitcherScheduleClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddCurtainSwitcherScheduleClientRequest create() => AddCurtainSwitcherScheduleClientRequest._();
  AddCurtainSwitcherScheduleClientRequest createEmptyInstance() => create();
  static $pb.PbList<AddCurtainSwitcherScheduleClientRequest> createRepeated() => $pb.PbList<AddCurtainSwitcherScheduleClientRequest>();
  @$core.pragma('dart2js:noInline')
  static AddCurtainSwitcherScheduleClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCurtainSwitcherScheduleClientRequest>(create);
  static AddCurtainSwitcherScheduleClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $0.CurtainSwitcherSchedule get schedule => $_getN(0);
  @$pb.TagNumber(1)
  set schedule($0.CurtainSwitcherSchedule v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSchedule() => $_has(0);
  @$pb.TagNumber(1)
  void clearSchedule() => clearField(1);
  @$pb.TagNumber(1)
  $0.CurtainSwitcherSchedule ensureSchedule() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get hardwareId => $_getSZ(1);
  @$pb.TagNumber(2)
  set hardwareId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHardwareId() => $_has(1);
  @$pb.TagNumber(2)
  void clearHardwareId() => clearField(2);
}

class AddCurtainSwitcherScheduleClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddCurtainSwitcherScheduleClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainSwitcherScheduleId', protoName: 'curtainSwitcherScheduleId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  AddCurtainSwitcherScheduleClientResponse._() : super();
  factory AddCurtainSwitcherScheduleClientResponse({
    $core.String? curtainSwitcherScheduleId,
    $core.String? deviceId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (curtainSwitcherScheduleId != null) {
      _result.curtainSwitcherScheduleId = curtainSwitcherScheduleId;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory AddCurtainSwitcherScheduleClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddCurtainSwitcherScheduleClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddCurtainSwitcherScheduleClientResponse clone() => AddCurtainSwitcherScheduleClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddCurtainSwitcherScheduleClientResponse copyWith(void Function(AddCurtainSwitcherScheduleClientResponse) updates) => super.copyWith((message) => updates(message as AddCurtainSwitcherScheduleClientResponse)) as AddCurtainSwitcherScheduleClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddCurtainSwitcherScheduleClientResponse create() => AddCurtainSwitcherScheduleClientResponse._();
  AddCurtainSwitcherScheduleClientResponse createEmptyInstance() => create();
  static $pb.PbList<AddCurtainSwitcherScheduleClientResponse> createRepeated() => $pb.PbList<AddCurtainSwitcherScheduleClientResponse>();
  @$core.pragma('dart2js:noInline')
  static AddCurtainSwitcherScheduleClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddCurtainSwitcherScheduleClientResponse>(create);
  static AddCurtainSwitcherScheduleClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get curtainSwitcherScheduleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set curtainSwitcherScheduleId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCurtainSwitcherScheduleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurtainSwitcherScheduleId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get deviceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceId() => clearField(2);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(2);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(2);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(2);
}

class UpdateCurtainSwitcherScheduleClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateCurtainSwitcherScheduleClientRequest', createEmptyInstance: create)
    ..aOM<$0.CurtainSwitcherSchedule>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'schedule', subBuilder: $0.CurtainSwitcherSchedule.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..hasRequiredFields = false
  ;

  UpdateCurtainSwitcherScheduleClientRequest._() : super();
  factory UpdateCurtainSwitcherScheduleClientRequest({
    $0.CurtainSwitcherSchedule? schedule,
    $core.String? hardwareId,
  }) {
    final _result = create();
    if (schedule != null) {
      _result.schedule = schedule;
    }
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    return _result;
  }
  factory UpdateCurtainSwitcherScheduleClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateCurtainSwitcherScheduleClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateCurtainSwitcherScheduleClientRequest clone() => UpdateCurtainSwitcherScheduleClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateCurtainSwitcherScheduleClientRequest copyWith(void Function(UpdateCurtainSwitcherScheduleClientRequest) updates) => super.copyWith((message) => updates(message as UpdateCurtainSwitcherScheduleClientRequest)) as UpdateCurtainSwitcherScheduleClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateCurtainSwitcherScheduleClientRequest create() => UpdateCurtainSwitcherScheduleClientRequest._();
  UpdateCurtainSwitcherScheduleClientRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateCurtainSwitcherScheduleClientRequest> createRepeated() => $pb.PbList<UpdateCurtainSwitcherScheduleClientRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateCurtainSwitcherScheduleClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateCurtainSwitcherScheduleClientRequest>(create);
  static UpdateCurtainSwitcherScheduleClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $0.CurtainSwitcherSchedule get schedule => $_getN(0);
  @$pb.TagNumber(1)
  set schedule($0.CurtainSwitcherSchedule v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSchedule() => $_has(0);
  @$pb.TagNumber(1)
  void clearSchedule() => clearField(1);
  @$pb.TagNumber(1)
  $0.CurtainSwitcherSchedule ensureSchedule() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get hardwareId => $_getSZ(1);
  @$pb.TagNumber(2)
  set hardwareId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHardwareId() => $_has(1);
  @$pb.TagNumber(2)
  void clearHardwareId() => clearField(2);
}

class UpdateCurtainSwitcherScheduleClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateCurtainSwitcherScheduleClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainSwitcherScheduleId', protoName: 'curtainSwitcherScheduleId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  UpdateCurtainSwitcherScheduleClientResponse._() : super();
  factory UpdateCurtainSwitcherScheduleClientResponse({
    $core.String? curtainSwitcherScheduleId,
    $core.String? deviceId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (curtainSwitcherScheduleId != null) {
      _result.curtainSwitcherScheduleId = curtainSwitcherScheduleId;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory UpdateCurtainSwitcherScheduleClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateCurtainSwitcherScheduleClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateCurtainSwitcherScheduleClientResponse clone() => UpdateCurtainSwitcherScheduleClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateCurtainSwitcherScheduleClientResponse copyWith(void Function(UpdateCurtainSwitcherScheduleClientResponse) updates) => super.copyWith((message) => updates(message as UpdateCurtainSwitcherScheduleClientResponse)) as UpdateCurtainSwitcherScheduleClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateCurtainSwitcherScheduleClientResponse create() => UpdateCurtainSwitcherScheduleClientResponse._();
  UpdateCurtainSwitcherScheduleClientResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateCurtainSwitcherScheduleClientResponse> createRepeated() => $pb.PbList<UpdateCurtainSwitcherScheduleClientResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateCurtainSwitcherScheduleClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateCurtainSwitcherScheduleClientResponse>(create);
  static UpdateCurtainSwitcherScheduleClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get curtainSwitcherScheduleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set curtainSwitcherScheduleId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCurtainSwitcherScheduleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurtainSwitcherScheduleId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get deviceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceId() => clearField(2);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(2);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(2);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(2);
}

class DeleteCurtainSwitcherScheduleClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteCurtainSwitcherScheduleClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainSwitcherScheduleId', protoName: 'curtainSwitcherScheduleId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..hasRequiredFields = false
  ;

  DeleteCurtainSwitcherScheduleClientRequest._() : super();
  factory DeleteCurtainSwitcherScheduleClientRequest({
    $core.String? curtainSwitcherScheduleId,
    $core.String? hardwareId,
  }) {
    final _result = create();
    if (curtainSwitcherScheduleId != null) {
      _result.curtainSwitcherScheduleId = curtainSwitcherScheduleId;
    }
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    return _result;
  }
  factory DeleteCurtainSwitcherScheduleClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteCurtainSwitcherScheduleClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteCurtainSwitcherScheduleClientRequest clone() => DeleteCurtainSwitcherScheduleClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteCurtainSwitcherScheduleClientRequest copyWith(void Function(DeleteCurtainSwitcherScheduleClientRequest) updates) => super.copyWith((message) => updates(message as DeleteCurtainSwitcherScheduleClientRequest)) as DeleteCurtainSwitcherScheduleClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteCurtainSwitcherScheduleClientRequest create() => DeleteCurtainSwitcherScheduleClientRequest._();
  DeleteCurtainSwitcherScheduleClientRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteCurtainSwitcherScheduleClientRequest> createRepeated() => $pb.PbList<DeleteCurtainSwitcherScheduleClientRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteCurtainSwitcherScheduleClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteCurtainSwitcherScheduleClientRequest>(create);
  static DeleteCurtainSwitcherScheduleClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get curtainSwitcherScheduleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set curtainSwitcherScheduleId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCurtainSwitcherScheduleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurtainSwitcherScheduleId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get hardwareId => $_getSZ(1);
  @$pb.TagNumber(2)
  set hardwareId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHardwareId() => $_has(1);
  @$pb.TagNumber(2)
  void clearHardwareId() => clearField(2);
}

class DeleteCurtainSwitcherScheduleClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteCurtainSwitcherScheduleClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainSwitcherScheduleId', protoName: 'curtainSwitcherScheduleId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  DeleteCurtainSwitcherScheduleClientResponse._() : super();
  factory DeleteCurtainSwitcherScheduleClientResponse({
    $core.String? curtainSwitcherScheduleId,
    $core.String? deviceId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (curtainSwitcherScheduleId != null) {
      _result.curtainSwitcherScheduleId = curtainSwitcherScheduleId;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory DeleteCurtainSwitcherScheduleClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteCurtainSwitcherScheduleClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteCurtainSwitcherScheduleClientResponse clone() => DeleteCurtainSwitcherScheduleClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteCurtainSwitcherScheduleClientResponse copyWith(void Function(DeleteCurtainSwitcherScheduleClientResponse) updates) => super.copyWith((message) => updates(message as DeleteCurtainSwitcherScheduleClientResponse)) as DeleteCurtainSwitcherScheduleClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteCurtainSwitcherScheduleClientResponse create() => DeleteCurtainSwitcherScheduleClientResponse._();
  DeleteCurtainSwitcherScheduleClientResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteCurtainSwitcherScheduleClientResponse> createRepeated() => $pb.PbList<DeleteCurtainSwitcherScheduleClientResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteCurtainSwitcherScheduleClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteCurtainSwitcherScheduleClientResponse>(create);
  static DeleteCurtainSwitcherScheduleClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get curtainSwitcherScheduleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set curtainSwitcherScheduleId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCurtainSwitcherScheduleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurtainSwitcherScheduleId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get deviceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceId() => clearField(2);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(2);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(2);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(2);
}

class AirConditionerClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AirConditionerClientRequest', createEmptyInstance: create)
    ..aOM<$0.AirConditionerState>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', subBuilder: $0.AirConditionerState.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'encode')
    ..hasRequiredFields = false
  ;

  AirConditionerClientRequest._() : super();
  factory AirConditionerClientRequest({
    $0.AirConditionerState? state,
    $core.String? hardwareId,
    $core.String? encode,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    if (encode != null) {
      _result.encode = encode;
    }
    return _result;
  }
  factory AirConditionerClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AirConditionerClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AirConditionerClientRequest clone() => AirConditionerClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AirConditionerClientRequest copyWith(void Function(AirConditionerClientRequest) updates) => super.copyWith((message) => updates(message as AirConditionerClientRequest)) as AirConditionerClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AirConditionerClientRequest create() => AirConditionerClientRequest._();
  AirConditionerClientRequest createEmptyInstance() => create();
  static $pb.PbList<AirConditionerClientRequest> createRepeated() => $pb.PbList<AirConditionerClientRequest>();
  @$core.pragma('dart2js:noInline')
  static AirConditionerClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AirConditionerClientRequest>(create);
  static AirConditionerClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $0.AirConditionerState get state => $_getN(0);
  @$pb.TagNumber(1)
  set state($0.AirConditionerState v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);
  @$pb.TagNumber(1)
  $0.AirConditionerState ensureState() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get hardwareId => $_getSZ(1);
  @$pb.TagNumber(2)
  set hardwareId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHardwareId() => $_has(1);
  @$pb.TagNumber(2)
  void clearHardwareId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get encode => $_getSZ(2);
  @$pb.TagNumber(3)
  set encode($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEncode() => $_has(2);
  @$pb.TagNumber(3)
  void clearEncode() => clearField(3);
}

class AirConditionerClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AirConditionerClientResponse', createEmptyInstance: create)
    ..aOM<$0.AirConditionerState>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', subBuilder: $0.AirConditionerState.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  AirConditionerClientResponse._() : super();
  factory AirConditionerClientResponse({
    $0.AirConditionerState? state,
    $core.String? deviceId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory AirConditionerClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AirConditionerClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AirConditionerClientResponse clone() => AirConditionerClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AirConditionerClientResponse copyWith(void Function(AirConditionerClientResponse) updates) => super.copyWith((message) => updates(message as AirConditionerClientResponse)) as AirConditionerClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AirConditionerClientResponse create() => AirConditionerClientResponse._();
  AirConditionerClientResponse createEmptyInstance() => create();
  static $pb.PbList<AirConditionerClientResponse> createRepeated() => $pb.PbList<AirConditionerClientResponse>();
  @$core.pragma('dart2js:noInline')
  static AirConditionerClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AirConditionerClientResponse>(create);
  static AirConditionerClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $0.AirConditionerState get state => $_getN(0);
  @$pb.TagNumber(1)
  set state($0.AirConditionerState v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);
  @$pb.TagNumber(1)
  $0.AirConditionerState ensureState() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get deviceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceId() => clearField(2);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(2);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(2);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(2);
}

class GetAirConditionerClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetAirConditionerClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indoorId', $pb.PbFieldType.OU3, protoName: 'indoorId')
    ..hasRequiredFields = false
  ;

  GetAirConditionerClientRequest._() : super();
  factory GetAirConditionerClientRequest({
    $core.String? hardwareId,
    $core.int? indoorId,
  }) {
    final _result = create();
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    if (indoorId != null) {
      _result.indoorId = indoorId;
    }
    return _result;
  }
  factory GetAirConditionerClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAirConditionerClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAirConditionerClientRequest clone() => GetAirConditionerClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAirConditionerClientRequest copyWith(void Function(GetAirConditionerClientRequest) updates) => super.copyWith((message) => updates(message as GetAirConditionerClientRequest)) as GetAirConditionerClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetAirConditionerClientRequest create() => GetAirConditionerClientRequest._();
  GetAirConditionerClientRequest createEmptyInstance() => create();
  static $pb.PbList<GetAirConditionerClientRequest> createRepeated() => $pb.PbList<GetAirConditionerClientRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAirConditionerClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAirConditionerClientRequest>(create);
  static GetAirConditionerClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hardwareId => $_getSZ(0);
  @$pb.TagNumber(1)
  set hardwareId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHardwareId() => $_has(0);
  @$pb.TagNumber(1)
  void clearHardwareId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get indoorId => $_getIZ(1);
  @$pb.TagNumber(2)
  set indoorId($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndoorId() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndoorId() => clearField(2);
}

class GetAirConditionerClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetAirConditionerClientResponse', createEmptyInstance: create)
    ..aOM<$0.AirConditionerState>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', subBuilder: $0.AirConditionerState.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  GetAirConditionerClientResponse._() : super();
  factory GetAirConditionerClientResponse({
    $0.AirConditionerState? state,
    $core.String? deviceId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory GetAirConditionerClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAirConditionerClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAirConditionerClientResponse clone() => GetAirConditionerClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAirConditionerClientResponse copyWith(void Function(GetAirConditionerClientResponse) updates) => super.copyWith((message) => updates(message as GetAirConditionerClientResponse)) as GetAirConditionerClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetAirConditionerClientResponse create() => GetAirConditionerClientResponse._();
  GetAirConditionerClientResponse createEmptyInstance() => create();
  static $pb.PbList<GetAirConditionerClientResponse> createRepeated() => $pb.PbList<GetAirConditionerClientResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAirConditionerClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAirConditionerClientResponse>(create);
  static GetAirConditionerClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $0.AirConditionerState get state => $_getN(0);
  @$pb.TagNumber(1)
  set state($0.AirConditionerState v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);
  @$pb.TagNumber(1)
  $0.AirConditionerState ensureState() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get deviceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceId() => clearField(2);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(2);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(2);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(2);
}

class AirConditionerAddIndoorsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AirConditionerAddIndoorsRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..p<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indoorId', $pb.PbFieldType.KU3, protoName: 'indoorId')
    ..hasRequiredFields = false
  ;

  AirConditionerAddIndoorsRequest._() : super();
  factory AirConditionerAddIndoorsRequest({
    $core.String? deviceId,
    $core.Iterable<$core.int>? indoorId,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (indoorId != null) {
      _result.indoorId.addAll(indoorId);
    }
    return _result;
  }
  factory AirConditionerAddIndoorsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AirConditionerAddIndoorsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AirConditionerAddIndoorsRequest clone() => AirConditionerAddIndoorsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AirConditionerAddIndoorsRequest copyWith(void Function(AirConditionerAddIndoorsRequest) updates) => super.copyWith((message) => updates(message as AirConditionerAddIndoorsRequest)) as AirConditionerAddIndoorsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AirConditionerAddIndoorsRequest create() => AirConditionerAddIndoorsRequest._();
  AirConditionerAddIndoorsRequest createEmptyInstance() => create();
  static $pb.PbList<AirConditionerAddIndoorsRequest> createRepeated() => $pb.PbList<AirConditionerAddIndoorsRequest>();
  @$core.pragma('dart2js:noInline')
  static AirConditionerAddIndoorsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AirConditionerAddIndoorsRequest>(create);
  static AirConditionerAddIndoorsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get indoorId => $_getList(1);
}

class AirConditionerAddIndoorsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AirConditionerAddIndoorsResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..p<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indoorId', $pb.PbFieldType.KU3, protoName: 'indoorId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  AirConditionerAddIndoorsResponse._() : super();
  factory AirConditionerAddIndoorsResponse({
    $core.String? hardwareId,
    $core.Iterable<$core.int>? indoorId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    if (indoorId != null) {
      _result.indoorId.addAll(indoorId);
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory AirConditionerAddIndoorsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AirConditionerAddIndoorsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AirConditionerAddIndoorsResponse clone() => AirConditionerAddIndoorsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AirConditionerAddIndoorsResponse copyWith(void Function(AirConditionerAddIndoorsResponse) updates) => super.copyWith((message) => updates(message as AirConditionerAddIndoorsResponse)) as AirConditionerAddIndoorsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AirConditionerAddIndoorsResponse create() => AirConditionerAddIndoorsResponse._();
  AirConditionerAddIndoorsResponse createEmptyInstance() => create();
  static $pb.PbList<AirConditionerAddIndoorsResponse> createRepeated() => $pb.PbList<AirConditionerAddIndoorsResponse>();
  @$core.pragma('dart2js:noInline')
  static AirConditionerAddIndoorsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AirConditionerAddIndoorsResponse>(create);
  static AirConditionerAddIndoorsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hardwareId => $_getSZ(0);
  @$pb.TagNumber(1)
  set hardwareId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHardwareId() => $_has(0);
  @$pb.TagNumber(1)
  void clearHardwareId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get indoorId => $_getList(1);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(2);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(2);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(2);
}

class AirConditionerRemoveIndoorRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AirConditionerRemoveIndoorRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indoorId', $pb.PbFieldType.OU3, protoName: 'indoorId')
    ..hasRequiredFields = false
  ;

  AirConditionerRemoveIndoorRequest._() : super();
  factory AirConditionerRemoveIndoorRequest({
    $core.String? deviceId,
    $core.int? indoorId,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (indoorId != null) {
      _result.indoorId = indoorId;
    }
    return _result;
  }
  factory AirConditionerRemoveIndoorRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AirConditionerRemoveIndoorRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AirConditionerRemoveIndoorRequest clone() => AirConditionerRemoveIndoorRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AirConditionerRemoveIndoorRequest copyWith(void Function(AirConditionerRemoveIndoorRequest) updates) => super.copyWith((message) => updates(message as AirConditionerRemoveIndoorRequest)) as AirConditionerRemoveIndoorRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AirConditionerRemoveIndoorRequest create() => AirConditionerRemoveIndoorRequest._();
  AirConditionerRemoveIndoorRequest createEmptyInstance() => create();
  static $pb.PbList<AirConditionerRemoveIndoorRequest> createRepeated() => $pb.PbList<AirConditionerRemoveIndoorRequest>();
  @$core.pragma('dart2js:noInline')
  static AirConditionerRemoveIndoorRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AirConditionerRemoveIndoorRequest>(create);
  static AirConditionerRemoveIndoorRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get indoorId => $_getIZ(1);
  @$pb.TagNumber(2)
  set indoorId($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndoorId() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndoorId() => clearField(2);
}

class AirConditionerRemoveIndoorResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AirConditionerRemoveIndoorResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  AirConditionerRemoveIndoorResponse._() : super();
  factory AirConditionerRemoveIndoorResponse({
    $core.String? hardwareId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory AirConditionerRemoveIndoorResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AirConditionerRemoveIndoorResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AirConditionerRemoveIndoorResponse clone() => AirConditionerRemoveIndoorResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AirConditionerRemoveIndoorResponse copyWith(void Function(AirConditionerRemoveIndoorResponse) updates) => super.copyWith((message) => updates(message as AirConditionerRemoveIndoorResponse)) as AirConditionerRemoveIndoorResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AirConditionerRemoveIndoorResponse create() => AirConditionerRemoveIndoorResponse._();
  AirConditionerRemoveIndoorResponse createEmptyInstance() => create();
  static $pb.PbList<AirConditionerRemoveIndoorResponse> createRepeated() => $pb.PbList<AirConditionerRemoveIndoorResponse>();
  @$core.pragma('dart2js:noInline')
  static AirConditionerRemoveIndoorResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AirConditionerRemoveIndoorResponse>(create);
  static AirConditionerRemoveIndoorResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hardwareId => $_getSZ(0);
  @$pb.TagNumber(1)
  set hardwareId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHardwareId() => $_has(0);
  @$pb.TagNumber(1)
  void clearHardwareId() => clearField(1);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(1);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(1);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(1);
}

class SendCommandRemoteClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SendCommandRemoteClientRequest', createEmptyInstance: create)
    ..p<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'commands', $pb.PbFieldType.KU3)
    ..e<$0.TypeLearn>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: $0.TypeLearn.IR, valueOf: $0.TypeLearn.valueOf, enumValues: $0.TypeLearn.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..hasRequiredFields = false
  ;

  SendCommandRemoteClientRequest._() : super();
  factory SendCommandRemoteClientRequest({
    $core.Iterable<$core.int>? commands,
    $0.TypeLearn? type,
    $core.String? hardwareId,
  }) {
    final _result = create();
    if (commands != null) {
      _result.commands.addAll(commands);
    }
    if (type != null) {
      _result.type = type;
    }
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    return _result;
  }
  factory SendCommandRemoteClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendCommandRemoteClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendCommandRemoteClientRequest clone() => SendCommandRemoteClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendCommandRemoteClientRequest copyWith(void Function(SendCommandRemoteClientRequest) updates) => super.copyWith((message) => updates(message as SendCommandRemoteClientRequest)) as SendCommandRemoteClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendCommandRemoteClientRequest create() => SendCommandRemoteClientRequest._();
  SendCommandRemoteClientRequest createEmptyInstance() => create();
  static $pb.PbList<SendCommandRemoteClientRequest> createRepeated() => $pb.PbList<SendCommandRemoteClientRequest>();
  @$core.pragma('dart2js:noInline')
  static SendCommandRemoteClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendCommandRemoteClientRequest>(create);
  static SendCommandRemoteClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get commands => $_getList(0);

  @$pb.TagNumber(2)
  $0.TypeLearn get type => $_getN(1);
  @$pb.TagNumber(2)
  set type($0.TypeLearn v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get hardwareId => $_getSZ(2);
  @$pb.TagNumber(3)
  set hardwareId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHardwareId() => $_has(2);
  @$pb.TagNumber(3)
  void clearHardwareId() => clearField(3);
}

class SendCommandRemoteClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SendCommandRemoteClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  SendCommandRemoteClientResponse._() : super();
  factory SendCommandRemoteClientResponse({
    $core.String? deviceId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory SendCommandRemoteClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendCommandRemoteClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendCommandRemoteClientResponse clone() => SendCommandRemoteClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendCommandRemoteClientResponse copyWith(void Function(SendCommandRemoteClientResponse) updates) => super.copyWith((message) => updates(message as SendCommandRemoteClientResponse)) as SendCommandRemoteClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendCommandRemoteClientResponse create() => SendCommandRemoteClientResponse._();
  SendCommandRemoteClientResponse createEmptyInstance() => create();
  static $pb.PbList<SendCommandRemoteClientResponse> createRepeated() => $pb.PbList<SendCommandRemoteClientResponse>();
  @$core.pragma('dart2js:noInline')
  static SendCommandRemoteClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendCommandRemoteClientResponse>(create);
  static SendCommandRemoteClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(1);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(1);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(1);
}

class LearnCommandRemoteClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LearnCommandRemoteClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteId', protoName: 'remoteId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteLibraryCmdId', protoName: 'remoteLibraryCmdId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteMutilLibraryCmdId', protoName: 'remoteMutilLibraryCmdId')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timeout', $pb.PbFieldType.OU3)
    ..e<$0.TypeLearn>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: $0.TypeLearn.IR, valueOf: $0.TypeLearn.valueOf, enumValues: $0.TypeLearn.values)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..hasRequiredFields = false
  ;

  LearnCommandRemoteClientRequest._() : super();
  factory LearnCommandRemoteClientRequest({
    $core.String? remoteId,
    $core.String? remoteLibraryCmdId,
    $core.String? remoteMutilLibraryCmdId,
    $core.int? timeout,
    $0.TypeLearn? type,
    $core.String? hardwareId,
  }) {
    final _result = create();
    if (remoteId != null) {
      _result.remoteId = remoteId;
    }
    if (remoteLibraryCmdId != null) {
      _result.remoteLibraryCmdId = remoteLibraryCmdId;
    }
    if (remoteMutilLibraryCmdId != null) {
      _result.remoteMutilLibraryCmdId = remoteMutilLibraryCmdId;
    }
    if (timeout != null) {
      _result.timeout = timeout;
    }
    if (type != null) {
      _result.type = type;
    }
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    return _result;
  }
  factory LearnCommandRemoteClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LearnCommandRemoteClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LearnCommandRemoteClientRequest clone() => LearnCommandRemoteClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LearnCommandRemoteClientRequest copyWith(void Function(LearnCommandRemoteClientRequest) updates) => super.copyWith((message) => updates(message as LearnCommandRemoteClientRequest)) as LearnCommandRemoteClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LearnCommandRemoteClientRequest create() => LearnCommandRemoteClientRequest._();
  LearnCommandRemoteClientRequest createEmptyInstance() => create();
  static $pb.PbList<LearnCommandRemoteClientRequest> createRepeated() => $pb.PbList<LearnCommandRemoteClientRequest>();
  @$core.pragma('dart2js:noInline')
  static LearnCommandRemoteClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LearnCommandRemoteClientRequest>(create);
  static LearnCommandRemoteClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remoteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set remoteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemoteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get remoteLibraryCmdId => $_getSZ(1);
  @$pb.TagNumber(2)
  set remoteLibraryCmdId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRemoteLibraryCmdId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemoteLibraryCmdId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get remoteMutilLibraryCmdId => $_getSZ(2);
  @$pb.TagNumber(3)
  set remoteMutilLibraryCmdId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRemoteMutilLibraryCmdId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRemoteMutilLibraryCmdId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get timeout => $_getIZ(3);
  @$pb.TagNumber(4)
  set timeout($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTimeout() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimeout() => clearField(4);

  @$pb.TagNumber(5)
  $0.TypeLearn get type => $_getN(4);
  @$pb.TagNumber(5)
  set type($0.TypeLearn v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get hardwareId => $_getSZ(5);
  @$pb.TagNumber(6)
  set hardwareId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasHardwareId() => $_has(5);
  @$pb.TagNumber(6)
  void clearHardwareId() => clearField(6);
}

class LearnCommandRemoteClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LearnCommandRemoteClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteId', protoName: 'remoteId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteLibraryCmdId', protoName: 'remoteLibraryCmdId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteMutilLibraryCmdId', protoName: 'remoteMutilLibraryCmdId')
    ..p<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'commands', $pb.PbFieldType.KU3)
    ..e<$0.TypeLearn>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: $0.TypeLearn.IR, valueOf: $0.TypeLearn.valueOf, enumValues: $0.TypeLearn.values)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  LearnCommandRemoteClientResponse._() : super();
  factory LearnCommandRemoteClientResponse({
    $core.String? remoteId,
    $core.String? remoteLibraryCmdId,
    $core.String? remoteMutilLibraryCmdId,
    $core.Iterable<$core.int>? commands,
    $0.TypeLearn? type,
    $core.String? deviceId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (remoteId != null) {
      _result.remoteId = remoteId;
    }
    if (remoteLibraryCmdId != null) {
      _result.remoteLibraryCmdId = remoteLibraryCmdId;
    }
    if (remoteMutilLibraryCmdId != null) {
      _result.remoteMutilLibraryCmdId = remoteMutilLibraryCmdId;
    }
    if (commands != null) {
      _result.commands.addAll(commands);
    }
    if (type != null) {
      _result.type = type;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory LearnCommandRemoteClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LearnCommandRemoteClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LearnCommandRemoteClientResponse clone() => LearnCommandRemoteClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LearnCommandRemoteClientResponse copyWith(void Function(LearnCommandRemoteClientResponse) updates) => super.copyWith((message) => updates(message as LearnCommandRemoteClientResponse)) as LearnCommandRemoteClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LearnCommandRemoteClientResponse create() => LearnCommandRemoteClientResponse._();
  LearnCommandRemoteClientResponse createEmptyInstance() => create();
  static $pb.PbList<LearnCommandRemoteClientResponse> createRepeated() => $pb.PbList<LearnCommandRemoteClientResponse>();
  @$core.pragma('dart2js:noInline')
  static LearnCommandRemoteClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LearnCommandRemoteClientResponse>(create);
  static LearnCommandRemoteClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remoteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set remoteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemoteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get remoteLibraryCmdId => $_getSZ(1);
  @$pb.TagNumber(2)
  set remoteLibraryCmdId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRemoteLibraryCmdId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemoteLibraryCmdId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get remoteMutilLibraryCmdId => $_getSZ(2);
  @$pb.TagNumber(3)
  set remoteMutilLibraryCmdId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRemoteMutilLibraryCmdId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRemoteMutilLibraryCmdId() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get commands => $_getList(3);

  @$pb.TagNumber(5)
  $0.TypeLearn get type => $_getN(4);
  @$pb.TagNumber(5)
  set type($0.TypeLearn v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get deviceId => $_getSZ(5);
  @$pb.TagNumber(6)
  set deviceId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDeviceId() => $_has(5);
  @$pb.TagNumber(6)
  void clearDeviceId() => clearField(6);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(6);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(6);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(6);
}

class ControlRemoteACCommandClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ControlRemoteACCommandClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'model')
    ..aOM<$0.RemoteACState>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteACState', protoName: 'remoteACState', subBuilder: $0.RemoteACState.create)
    ..hasRequiredFields = false
  ;

  ControlRemoteACCommandClientRequest._() : super();
  factory ControlRemoteACCommandClientRequest({
    $core.String? deviceId,
    $core.String? model,
    $0.RemoteACState? remoteACState,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (model != null) {
      _result.model = model;
    }
    if (remoteACState != null) {
      _result.remoteACState = remoteACState;
    }
    return _result;
  }
  factory ControlRemoteACCommandClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ControlRemoteACCommandClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ControlRemoteACCommandClientRequest clone() => ControlRemoteACCommandClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ControlRemoteACCommandClientRequest copyWith(void Function(ControlRemoteACCommandClientRequest) updates) => super.copyWith((message) => updates(message as ControlRemoteACCommandClientRequest)) as ControlRemoteACCommandClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ControlRemoteACCommandClientRequest create() => ControlRemoteACCommandClientRequest._();
  ControlRemoteACCommandClientRequest createEmptyInstance() => create();
  static $pb.PbList<ControlRemoteACCommandClientRequest> createRepeated() => $pb.PbList<ControlRemoteACCommandClientRequest>();
  @$core.pragma('dart2js:noInline')
  static ControlRemoteACCommandClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ControlRemoteACCommandClientRequest>(create);
  static ControlRemoteACCommandClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get model => $_getSZ(1);
  @$pb.TagNumber(2)
  set model($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasModel() => $_has(1);
  @$pb.TagNumber(2)
  void clearModel() => clearField(2);

  @$pb.TagNumber(3)
  $0.RemoteACState get remoteACState => $_getN(2);
  @$pb.TagNumber(3)
  set remoteACState($0.RemoteACState v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRemoteACState() => $_has(2);
  @$pb.TagNumber(3)
  void clearRemoteACState() => clearField(3);
  @$pb.TagNumber(3)
  $0.RemoteACState ensureRemoteACState() => $_ensure(2);
}

class ControlRemoteACCommandClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ControlRemoteACCommandClientResponse', createEmptyInstance: create)
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  ControlRemoteACCommandClientResponse._() : super();
  factory ControlRemoteACCommandClientResponse({
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory ControlRemoteACCommandClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ControlRemoteACCommandClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ControlRemoteACCommandClientResponse clone() => ControlRemoteACCommandClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ControlRemoteACCommandClientResponse copyWith(void Function(ControlRemoteACCommandClientResponse) updates) => super.copyWith((message) => updates(message as ControlRemoteACCommandClientResponse)) as ControlRemoteACCommandClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ControlRemoteACCommandClientResponse create() => ControlRemoteACCommandClientResponse._();
  ControlRemoteACCommandClientResponse createEmptyInstance() => create();
  static $pb.PbList<ControlRemoteACCommandClientResponse> createRepeated() => $pb.PbList<ControlRemoteACCommandClientResponse>();
  @$core.pragma('dart2js:noInline')
  static ControlRemoteACCommandClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ControlRemoteACCommandClientResponse>(create);
  static ControlRemoteACCommandClientResponse? _defaultInstance;

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(0);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(0);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(0);
}

class MeterOnChangedClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MeterOnChangedClientResponse', createEmptyInstance: create)
    ..pc<$0.MeterIndex>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexs', $pb.PbFieldType.PM, subBuilder: $0.MeterIndex.create)
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  MeterOnChangedClientResponse._() : super();
  factory MeterOnChangedClientResponse({
    $core.Iterable<$0.MeterIndex>? indexs,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (indexs != null) {
      _result.indexs.addAll(indexs);
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory MeterOnChangedClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MeterOnChangedClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MeterOnChangedClientResponse clone() => MeterOnChangedClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MeterOnChangedClientResponse copyWith(void Function(MeterOnChangedClientResponse) updates) => super.copyWith((message) => updates(message as MeterOnChangedClientResponse)) as MeterOnChangedClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MeterOnChangedClientResponse create() => MeterOnChangedClientResponse._();
  MeterOnChangedClientResponse createEmptyInstance() => create();
  static $pb.PbList<MeterOnChangedClientResponse> createRepeated() => $pb.PbList<MeterOnChangedClientResponse>();
  @$core.pragma('dart2js:noInline')
  static MeterOnChangedClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MeterOnChangedClientResponse>(create);
  static MeterOnChangedClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.MeterIndex> get indexs => $_getList(0);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(1);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(1);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(1);
}

class SwitcherOnChangedClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SwitcherOnChangedClientResponse', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcher', $pb.PbFieldType.OU3)
    ..e<$0.PowerState>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: $0.PowerState.Off, valueOf: $0.PowerState.valueOf, enumValues: $0.PowerState.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.BridgeInfo>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bridge', subBuilder: $0.BridgeInfo.create)
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  SwitcherOnChangedClientResponse._() : super();
  factory SwitcherOnChangedClientResponse({
    $core.int? switcher,
    $0.PowerState? powerState,
    $core.String? deviceId,
    $0.BridgeInfo? bridge,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (switcher != null) {
      _result.switcher = switcher;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (bridge != null) {
      _result.bridge = bridge;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory SwitcherOnChangedClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SwitcherOnChangedClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SwitcherOnChangedClientResponse clone() => SwitcherOnChangedClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SwitcherOnChangedClientResponse copyWith(void Function(SwitcherOnChangedClientResponse) updates) => super.copyWith((message) => updates(message as SwitcherOnChangedClientResponse)) as SwitcherOnChangedClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SwitcherOnChangedClientResponse create() => SwitcherOnChangedClientResponse._();
  SwitcherOnChangedClientResponse createEmptyInstance() => create();
  static $pb.PbList<SwitcherOnChangedClientResponse> createRepeated() => $pb.PbList<SwitcherOnChangedClientResponse>();
  @$core.pragma('dart2js:noInline')
  static SwitcherOnChangedClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SwitcherOnChangedClientResponse>(create);
  static SwitcherOnChangedClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get switcher => $_getIZ(0);
  @$pb.TagNumber(1)
  set switcher($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSwitcher() => $_has(0);
  @$pb.TagNumber(1)
  void clearSwitcher() => clearField(1);

  @$pb.TagNumber(2)
  $0.PowerState get powerState => $_getN(1);
  @$pb.TagNumber(2)
  set powerState($0.PowerState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPowerState() => $_has(1);
  @$pb.TagNumber(2)
  void clearPowerState() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get deviceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set deviceId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeviceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceId() => clearField(3);

  @$pb.TagNumber(4)
  $0.BridgeInfo get bridge => $_getN(3);
  @$pb.TagNumber(4)
  set bridge($0.BridgeInfo v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasBridge() => $_has(3);
  @$pb.TagNumber(4)
  void clearBridge() => clearField(4);
  @$pb.TagNumber(4)
  $0.BridgeInfo ensureBridge() => $_ensure(3);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(4);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(4);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(4);
}

class CurtainSwitcherOnChangedClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CurtainSwitcherOnChangedClientResponse', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percentIn', $pb.PbFieldType.OU3, protoName: 'percentIn')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percentOut', $pb.PbFieldType.OU3, protoName: 'percentOut')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  CurtainSwitcherOnChangedClientResponse._() : super();
  factory CurtainSwitcherOnChangedClientResponse({
    $core.int? percentIn,
    $core.int? percentOut,
    $core.String? deviceId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (percentIn != null) {
      _result.percentIn = percentIn;
    }
    if (percentOut != null) {
      _result.percentOut = percentOut;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory CurtainSwitcherOnChangedClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CurtainSwitcherOnChangedClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CurtainSwitcherOnChangedClientResponse clone() => CurtainSwitcherOnChangedClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CurtainSwitcherOnChangedClientResponse copyWith(void Function(CurtainSwitcherOnChangedClientResponse) updates) => super.copyWith((message) => updates(message as CurtainSwitcherOnChangedClientResponse)) as CurtainSwitcherOnChangedClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CurtainSwitcherOnChangedClientResponse create() => CurtainSwitcherOnChangedClientResponse._();
  CurtainSwitcherOnChangedClientResponse createEmptyInstance() => create();
  static $pb.PbList<CurtainSwitcherOnChangedClientResponse> createRepeated() => $pb.PbList<CurtainSwitcherOnChangedClientResponse>();
  @$core.pragma('dart2js:noInline')
  static CurtainSwitcherOnChangedClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CurtainSwitcherOnChangedClientResponse>(create);
  static CurtainSwitcherOnChangedClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get percentIn => $_getIZ(0);
  @$pb.TagNumber(1)
  set percentIn($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPercentIn() => $_has(0);
  @$pb.TagNumber(1)
  void clearPercentIn() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get percentOut => $_getIZ(1);
  @$pb.TagNumber(2)
  set percentOut($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPercentOut() => $_has(1);
  @$pb.TagNumber(2)
  void clearPercentOut() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get deviceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set deviceId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeviceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceId() => clearField(3);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(3);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(3);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(3);
}

class AirConditionerOnChangedClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AirConditionerOnChangedClientResponse', createEmptyInstance: create)
    ..aOM<$0.AirConditionerState>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', subBuilder: $0.AirConditionerState.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  AirConditionerOnChangedClientResponse._() : super();
  factory AirConditionerOnChangedClientResponse({
    $0.AirConditionerState? state,
    $core.String? deviceId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (state != null) {
      _result.state = state;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory AirConditionerOnChangedClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AirConditionerOnChangedClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AirConditionerOnChangedClientResponse clone() => AirConditionerOnChangedClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AirConditionerOnChangedClientResponse copyWith(void Function(AirConditionerOnChangedClientResponse) updates) => super.copyWith((message) => updates(message as AirConditionerOnChangedClientResponse)) as AirConditionerOnChangedClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AirConditionerOnChangedClientResponse create() => AirConditionerOnChangedClientResponse._();
  AirConditionerOnChangedClientResponse createEmptyInstance() => create();
  static $pb.PbList<AirConditionerOnChangedClientResponse> createRepeated() => $pb.PbList<AirConditionerOnChangedClientResponse>();
  @$core.pragma('dart2js:noInline')
  static AirConditionerOnChangedClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AirConditionerOnChangedClientResponse>(create);
  static AirConditionerOnChangedClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $0.AirConditionerState get state => $_getN(0);
  @$pb.TagNumber(1)
  set state($0.AirConditionerState v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);
  @$pb.TagNumber(1)
  $0.AirConditionerState ensureState() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get deviceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceId() => clearField(2);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(2);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(2);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(2);
}

class ProgressUpdateFirmwareOnChangedDeviceClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ProgressUpdateFirmwareOnChangedDeviceClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageSize', $pb.PbFieldType.OU3, protoName: 'pageSize')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageIndex', $pb.PbFieldType.OU3, protoName: 'pageIndex')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalPage', $pb.PbFieldType.OU3, protoName: 'totalPage')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  ProgressUpdateFirmwareOnChangedDeviceClientResponse._() : super();
  factory ProgressUpdateFirmwareOnChangedDeviceClientResponse({
    $core.String? deviceId,
    $core.String? hardwareId,
    $core.int? pageSize,
    $core.int? pageIndex,
    $core.int? totalPage,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    if (pageSize != null) {
      _result.pageSize = pageSize;
    }
    if (pageIndex != null) {
      _result.pageIndex = pageIndex;
    }
    if (totalPage != null) {
      _result.totalPage = totalPage;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory ProgressUpdateFirmwareOnChangedDeviceClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProgressUpdateFirmwareOnChangedDeviceClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProgressUpdateFirmwareOnChangedDeviceClientResponse clone() => ProgressUpdateFirmwareOnChangedDeviceClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProgressUpdateFirmwareOnChangedDeviceClientResponse copyWith(void Function(ProgressUpdateFirmwareOnChangedDeviceClientResponse) updates) => super.copyWith((message) => updates(message as ProgressUpdateFirmwareOnChangedDeviceClientResponse)) as ProgressUpdateFirmwareOnChangedDeviceClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProgressUpdateFirmwareOnChangedDeviceClientResponse create() => ProgressUpdateFirmwareOnChangedDeviceClientResponse._();
  ProgressUpdateFirmwareOnChangedDeviceClientResponse createEmptyInstance() => create();
  static $pb.PbList<ProgressUpdateFirmwareOnChangedDeviceClientResponse> createRepeated() => $pb.PbList<ProgressUpdateFirmwareOnChangedDeviceClientResponse>();
  @$core.pragma('dart2js:noInline')
  static ProgressUpdateFirmwareOnChangedDeviceClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProgressUpdateFirmwareOnChangedDeviceClientResponse>(create);
  static ProgressUpdateFirmwareOnChangedDeviceClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get hardwareId => $_getSZ(1);
  @$pb.TagNumber(2)
  set hardwareId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHardwareId() => $_has(1);
  @$pb.TagNumber(2)
  void clearHardwareId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get pageSize => $_getIZ(2);
  @$pb.TagNumber(3)
  set pageSize($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPageSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageSize() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get pageIndex => $_getIZ(3);
  @$pb.TagNumber(4)
  set pageIndex($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPageIndex() => $_has(3);
  @$pb.TagNumber(4)
  void clearPageIndex() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get totalPage => $_getIZ(4);
  @$pb.TagNumber(5)
  set totalPage($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTotalPage() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalPage() => clearField(5);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(5);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(5);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(5);
}

class DeviceOnChangedDeviceClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeviceOnChangedDeviceClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..e<$0.ConnectionState>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'connectionState', $pb.PbFieldType.OE, protoName: 'connectionState', defaultOrMaker: $0.ConnectionState.Offline, valueOf: $0.ConnectionState.valueOf, enumValues: $0.ConnectionState.values)
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  DeviceOnChangedDeviceClientResponse._() : super();
  factory DeviceOnChangedDeviceClientResponse({
    $core.String? deviceId,
    $0.ConnectionState? connectionState,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (connectionState != null) {
      _result.connectionState = connectionState;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory DeviceOnChangedDeviceClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeviceOnChangedDeviceClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeviceOnChangedDeviceClientResponse clone() => DeviceOnChangedDeviceClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeviceOnChangedDeviceClientResponse copyWith(void Function(DeviceOnChangedDeviceClientResponse) updates) => super.copyWith((message) => updates(message as DeviceOnChangedDeviceClientResponse)) as DeviceOnChangedDeviceClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeviceOnChangedDeviceClientResponse create() => DeviceOnChangedDeviceClientResponse._();
  DeviceOnChangedDeviceClientResponse createEmptyInstance() => create();
  static $pb.PbList<DeviceOnChangedDeviceClientResponse> createRepeated() => $pb.PbList<DeviceOnChangedDeviceClientResponse>();
  @$core.pragma('dart2js:noInline')
  static DeviceOnChangedDeviceClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeviceOnChangedDeviceClientResponse>(create);
  static DeviceOnChangedDeviceClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $0.ConnectionState get connectionState => $_getN(1);
  @$pb.TagNumber(2)
  set connectionState($0.ConnectionState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasConnectionState() => $_has(1);
  @$pb.TagNumber(2)
  void clearConnectionState() => clearField(2);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(2);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(2);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(2);
}

class MotionOnChangedClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MotionOnChangedClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..e<$0.MotionState>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'motionState', $pb.PbFieldType.OE, protoName: 'motionState', defaultOrMaker: $0.MotionState.MotionNone, valueOf: $0.MotionState.valueOf, enumValues: $0.MotionState.values)
    ..aOM<$0.BridgeInfo>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bridge', subBuilder: $0.BridgeInfo.create)
    ..e<$0.MotionSensorType>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'motionSensorType', $pb.PbFieldType.OE, protoName: 'motionSensorType', defaultOrMaker: $0.MotionSensorType.MotionSensor, valueOf: $0.MotionSensorType.valueOf, enumValues: $0.MotionSensorType.values)
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'batteryCapacity', $pb.PbFieldType.OF, protoName: 'batteryCapacity')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  MotionOnChangedClientResponse._() : super();
  factory MotionOnChangedClientResponse({
    $core.String? deviceId,
    $0.MotionState? motionState,
    $0.BridgeInfo? bridge,
    $0.MotionSensorType? motionSensorType,
    $core.double? batteryCapacity,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (motionState != null) {
      _result.motionState = motionState;
    }
    if (bridge != null) {
      _result.bridge = bridge;
    }
    if (motionSensorType != null) {
      _result.motionSensorType = motionSensorType;
    }
    if (batteryCapacity != null) {
      _result.batteryCapacity = batteryCapacity;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory MotionOnChangedClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MotionOnChangedClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MotionOnChangedClientResponse clone() => MotionOnChangedClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MotionOnChangedClientResponse copyWith(void Function(MotionOnChangedClientResponse) updates) => super.copyWith((message) => updates(message as MotionOnChangedClientResponse)) as MotionOnChangedClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MotionOnChangedClientResponse create() => MotionOnChangedClientResponse._();
  MotionOnChangedClientResponse createEmptyInstance() => create();
  static $pb.PbList<MotionOnChangedClientResponse> createRepeated() => $pb.PbList<MotionOnChangedClientResponse>();
  @$core.pragma('dart2js:noInline')
  static MotionOnChangedClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MotionOnChangedClientResponse>(create);
  static MotionOnChangedClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $0.MotionState get motionState => $_getN(1);
  @$pb.TagNumber(2)
  set motionState($0.MotionState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMotionState() => $_has(1);
  @$pb.TagNumber(2)
  void clearMotionState() => clearField(2);

  @$pb.TagNumber(3)
  $0.BridgeInfo get bridge => $_getN(2);
  @$pb.TagNumber(3)
  set bridge($0.BridgeInfo v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasBridge() => $_has(2);
  @$pb.TagNumber(3)
  void clearBridge() => clearField(3);
  @$pb.TagNumber(3)
  $0.BridgeInfo ensureBridge() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.MotionSensorType get motionSensorType => $_getN(3);
  @$pb.TagNumber(4)
  set motionSensorType($0.MotionSensorType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMotionSensorType() => $_has(3);
  @$pb.TagNumber(4)
  void clearMotionSensorType() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get batteryCapacity => $_getN(4);
  @$pb.TagNumber(5)
  set batteryCapacity($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBatteryCapacity() => $_has(4);
  @$pb.TagNumber(5)
  void clearBatteryCapacity() => clearField(5);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(5);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(5);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(5);
}

class HomekitOnChangedClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HomekitOnChangedClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..e<$0.HomekitMode>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'homekitMode', $pb.PbFieldType.OE, protoName: 'homekitMode', defaultOrMaker: $0.HomekitMode.HomekitNormalMode, valueOf: $0.HomekitMode.valueOf, enumValues: $0.HomekitMode.values)
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  HomekitOnChangedClientResponse._() : super();
  factory HomekitOnChangedClientResponse({
    $core.String? deviceId,
    $0.HomekitMode? homekitMode,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (homekitMode != null) {
      _result.homekitMode = homekitMode;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory HomekitOnChangedClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HomekitOnChangedClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HomekitOnChangedClientResponse clone() => HomekitOnChangedClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HomekitOnChangedClientResponse copyWith(void Function(HomekitOnChangedClientResponse) updates) => super.copyWith((message) => updates(message as HomekitOnChangedClientResponse)) as HomekitOnChangedClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomekitOnChangedClientResponse create() => HomekitOnChangedClientResponse._();
  HomekitOnChangedClientResponse createEmptyInstance() => create();
  static $pb.PbList<HomekitOnChangedClientResponse> createRepeated() => $pb.PbList<HomekitOnChangedClientResponse>();
  @$core.pragma('dart2js:noInline')
  static HomekitOnChangedClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HomekitOnChangedClientResponse>(create);
  static HomekitOnChangedClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $0.HomekitMode get homekitMode => $_getN(1);
  @$pb.TagNumber(2)
  set homekitMode($0.HomekitMode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasHomekitMode() => $_has(1);
  @$pb.TagNumber(2)
  void clearHomekitMode() => clearField(2);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(2);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(2);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(2);
}

class ButtonOnChangedClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ButtonOnChangedClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..e<$0.ButtonState>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buttonState', $pb.PbFieldType.OE, protoName: 'buttonState', defaultOrMaker: $0.ButtonState.Nothing, valueOf: $0.ButtonState.valueOf, enumValues: $0.ButtonState.values)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'button', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'battery', $pb.PbFieldType.O3)
    ..aOM<$0.BridgeInfo>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bridge', subBuilder: $0.BridgeInfo.create)
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  ButtonOnChangedClientResponse._() : super();
  factory ButtonOnChangedClientResponse({
    $core.String? deviceId,
    $0.ButtonState? buttonState,
    $core.int? button,
    $core.int? battery,
    $0.BridgeInfo? bridge,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (buttonState != null) {
      _result.buttonState = buttonState;
    }
    if (button != null) {
      _result.button = button;
    }
    if (battery != null) {
      _result.battery = battery;
    }
    if (bridge != null) {
      _result.bridge = bridge;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory ButtonOnChangedClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ButtonOnChangedClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ButtonOnChangedClientResponse clone() => ButtonOnChangedClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ButtonOnChangedClientResponse copyWith(void Function(ButtonOnChangedClientResponse) updates) => super.copyWith((message) => updates(message as ButtonOnChangedClientResponse)) as ButtonOnChangedClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ButtonOnChangedClientResponse create() => ButtonOnChangedClientResponse._();
  ButtonOnChangedClientResponse createEmptyInstance() => create();
  static $pb.PbList<ButtonOnChangedClientResponse> createRepeated() => $pb.PbList<ButtonOnChangedClientResponse>();
  @$core.pragma('dart2js:noInline')
  static ButtonOnChangedClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ButtonOnChangedClientResponse>(create);
  static ButtonOnChangedClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $0.ButtonState get buttonState => $_getN(1);
  @$pb.TagNumber(2)
  set buttonState($0.ButtonState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasButtonState() => $_has(1);
  @$pb.TagNumber(2)
  void clearButtonState() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get button => $_getIZ(2);
  @$pb.TagNumber(3)
  set button($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasButton() => $_has(2);
  @$pb.TagNumber(3)
  void clearButton() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get battery => $_getIZ(3);
  @$pb.TagNumber(4)
  set battery($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBattery() => $_has(3);
  @$pb.TagNumber(4)
  void clearBattery() => clearField(4);

  @$pb.TagNumber(5)
  $0.BridgeInfo get bridge => $_getN(4);
  @$pb.TagNumber(5)
  set bridge($0.BridgeInfo v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasBridge() => $_has(4);
  @$pb.TagNumber(5)
  void clearBridge() => clearField(5);
  @$pb.TagNumber(5)
  $0.BridgeInfo ensureBridge() => $_ensure(4);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(5);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(5);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(5);
}

class DebugLoggingResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DebugLoggingResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'label')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  DebugLoggingResponse._() : super();
  factory DebugLoggingResponse({
    $core.String? deviceId,
    $core.String? label,
    $core.String? message,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (label != null) {
      _result.label = label;
    }
    if (message != null) {
      _result.message = message;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory DebugLoggingResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DebugLoggingResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DebugLoggingResponse clone() => DebugLoggingResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DebugLoggingResponse copyWith(void Function(DebugLoggingResponse) updates) => super.copyWith((message) => updates(message as DebugLoggingResponse)) as DebugLoggingResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DebugLoggingResponse create() => DebugLoggingResponse._();
  DebugLoggingResponse createEmptyInstance() => create();
  static $pb.PbList<DebugLoggingResponse> createRepeated() => $pb.PbList<DebugLoggingResponse>();
  @$core.pragma('dart2js:noInline')
  static DebugLoggingResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DebugLoggingResponse>(create);
  static DebugLoggingResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get label => $_getSZ(1);
  @$pb.TagNumber(2)
  set label($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLabel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLabel() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(3);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(3);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(3);
}

class LedDriverOnChangedClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LedDriverOnChangedClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ledIndex', $pb.PbFieldType.OU3, protoName: 'ledIndex')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'brightnessPercent', $pb.PbFieldType.O3, protoName: 'brightnessPercent')
    ..e<$0.PowerState>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: $0.PowerState.Off, valueOf: $0.PowerState.valueOf, enumValues: $0.PowerState.values)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupControl', $pb.PbFieldType.OU3, protoName: 'groupControl')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  LedDriverOnChangedClientResponse._() : super();
  factory LedDriverOnChangedClientResponse({
    $core.String? deviceId,
    $core.int? ledIndex,
    $core.int? brightnessPercent,
    $0.PowerState? powerState,
    $core.int? groupControl,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (ledIndex != null) {
      _result.ledIndex = ledIndex;
    }
    if (brightnessPercent != null) {
      _result.brightnessPercent = brightnessPercent;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (groupControl != null) {
      _result.groupControl = groupControl;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory LedDriverOnChangedClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LedDriverOnChangedClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LedDriverOnChangedClientResponse clone() => LedDriverOnChangedClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LedDriverOnChangedClientResponse copyWith(void Function(LedDriverOnChangedClientResponse) updates) => super.copyWith((message) => updates(message as LedDriverOnChangedClientResponse)) as LedDriverOnChangedClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LedDriverOnChangedClientResponse create() => LedDriverOnChangedClientResponse._();
  LedDriverOnChangedClientResponse createEmptyInstance() => create();
  static $pb.PbList<LedDriverOnChangedClientResponse> createRepeated() => $pb.PbList<LedDriverOnChangedClientResponse>();
  @$core.pragma('dart2js:noInline')
  static LedDriverOnChangedClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LedDriverOnChangedClientResponse>(create);
  static LedDriverOnChangedClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get ledIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set ledIndex($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLedIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearLedIndex() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get brightnessPercent => $_getIZ(2);
  @$pb.TagNumber(3)
  set brightnessPercent($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBrightnessPercent() => $_has(2);
  @$pb.TagNumber(3)
  void clearBrightnessPercent() => clearField(3);

  @$pb.TagNumber(4)
  $0.PowerState get powerState => $_getN(3);
  @$pb.TagNumber(4)
  set powerState($0.PowerState v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPowerState() => $_has(3);
  @$pb.TagNumber(4)
  void clearPowerState() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get groupControl => $_getIZ(4);
  @$pb.TagNumber(5)
  set groupControl($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasGroupControl() => $_has(4);
  @$pb.TagNumber(5)
  void clearGroupControl() => clearField(5);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(5);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(5);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(5);
}

class EnvironmentOnchangedClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EnvironmentOnchangedClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.EnvironmentSensorReport>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'report', subBuilder: $0.EnvironmentSensorReport.create)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'batteryCapacity', $pb.PbFieldType.OF, protoName: 'batteryCapacity')
    ..aOM<$0.BridgeInfo>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bridgeInfo', protoName: 'bridgeInfo', subBuilder: $0.BridgeInfo.create)
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  EnvironmentOnchangedClientResponse._() : super();
  factory EnvironmentOnchangedClientResponse({
    $core.String? deviceId,
    $0.EnvironmentSensorReport? report,
    $core.double? batteryCapacity,
    $0.BridgeInfo? bridgeInfo,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (report != null) {
      _result.report = report;
    }
    if (batteryCapacity != null) {
      _result.batteryCapacity = batteryCapacity;
    }
    if (bridgeInfo != null) {
      _result.bridgeInfo = bridgeInfo;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory EnvironmentOnchangedClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EnvironmentOnchangedClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EnvironmentOnchangedClientResponse clone() => EnvironmentOnchangedClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EnvironmentOnchangedClientResponse copyWith(void Function(EnvironmentOnchangedClientResponse) updates) => super.copyWith((message) => updates(message as EnvironmentOnchangedClientResponse)) as EnvironmentOnchangedClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EnvironmentOnchangedClientResponse create() => EnvironmentOnchangedClientResponse._();
  EnvironmentOnchangedClientResponse createEmptyInstance() => create();
  static $pb.PbList<EnvironmentOnchangedClientResponse> createRepeated() => $pb.PbList<EnvironmentOnchangedClientResponse>();
  @$core.pragma('dart2js:noInline')
  static EnvironmentOnchangedClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EnvironmentOnchangedClientResponse>(create);
  static EnvironmentOnchangedClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $0.EnvironmentSensorReport get report => $_getN(1);
  @$pb.TagNumber(2)
  set report($0.EnvironmentSensorReport v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasReport() => $_has(1);
  @$pb.TagNumber(2)
  void clearReport() => clearField(2);
  @$pb.TagNumber(2)
  $0.EnvironmentSensorReport ensureReport() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.double get batteryCapacity => $_getN(2);
  @$pb.TagNumber(3)
  set batteryCapacity($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBatteryCapacity() => $_has(2);
  @$pb.TagNumber(3)
  void clearBatteryCapacity() => clearField(3);

  @$pb.TagNumber(4)
  $0.BridgeInfo get bridgeInfo => $_getN(3);
  @$pb.TagNumber(4)
  set bridgeInfo($0.BridgeInfo v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasBridgeInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearBridgeInfo() => clearField(4);
  @$pb.TagNumber(4)
  $0.BridgeInfo ensureBridgeInfo() => $_ensure(3);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(4);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(4);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(4);
}

class SmartPlugOnchangedClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SmartPlugOnchangedClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'index', $pb.PbFieldType.OU3)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amp', $pb.PbFieldType.OF)
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'power', $pb.PbFieldType.OF)
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'volt', $pb.PbFieldType.OF)
    ..e<$0.PowerState>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: $0.PowerState.Off, valueOf: $0.PowerState.valueOf, enumValues: $0.PowerState.values)
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  SmartPlugOnchangedClientResponse._() : super();
  factory SmartPlugOnchangedClientResponse({
    $core.String? deviceId,
    $core.int? index,
    $core.double? amp,
    $core.double? power,
    $core.double? volt,
    $0.PowerState? powerState,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (index != null) {
      _result.index = index;
    }
    if (amp != null) {
      _result.amp = amp;
    }
    if (power != null) {
      _result.power = power;
    }
    if (volt != null) {
      _result.volt = volt;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory SmartPlugOnchangedClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SmartPlugOnchangedClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SmartPlugOnchangedClientResponse clone() => SmartPlugOnchangedClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SmartPlugOnchangedClientResponse copyWith(void Function(SmartPlugOnchangedClientResponse) updates) => super.copyWith((message) => updates(message as SmartPlugOnchangedClientResponse)) as SmartPlugOnchangedClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SmartPlugOnchangedClientResponse create() => SmartPlugOnchangedClientResponse._();
  SmartPlugOnchangedClientResponse createEmptyInstance() => create();
  static $pb.PbList<SmartPlugOnchangedClientResponse> createRepeated() => $pb.PbList<SmartPlugOnchangedClientResponse>();
  @$core.pragma('dart2js:noInline')
  static SmartPlugOnchangedClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SmartPlugOnchangedClientResponse>(create);
  static SmartPlugOnchangedClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get index => $_getIZ(1);
  @$pb.TagNumber(2)
  set index($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndex() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get amp => $_getN(2);
  @$pb.TagNumber(3)
  set amp($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmp() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmp() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get power => $_getN(3);
  @$pb.TagNumber(4)
  set power($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPower() => $_has(3);
  @$pb.TagNumber(4)
  void clearPower() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get volt => $_getN(4);
  @$pb.TagNumber(5)
  set volt($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasVolt() => $_has(4);
  @$pb.TagNumber(5)
  void clearVolt() => clearField(5);

  @$pb.TagNumber(6)
  $0.PowerState get powerState => $_getN(5);
  @$pb.TagNumber(6)
  set powerState($0.PowerState v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasPowerState() => $_has(5);
  @$pb.TagNumber(6)
  void clearPowerState() => clearField(6);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(6);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(6);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(6);
}

class CurtainOnChangedClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CurtainOnChangedClientResponse', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percent', $pb.PbFieldType.OU3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  CurtainOnChangedClientResponse._() : super();
  factory CurtainOnChangedClientResponse({
    $core.int? percent,
    $core.String? deviceId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (percent != null) {
      _result.percent = percent;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory CurtainOnChangedClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CurtainOnChangedClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CurtainOnChangedClientResponse clone() => CurtainOnChangedClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CurtainOnChangedClientResponse copyWith(void Function(CurtainOnChangedClientResponse) updates) => super.copyWith((message) => updates(message as CurtainOnChangedClientResponse)) as CurtainOnChangedClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CurtainOnChangedClientResponse create() => CurtainOnChangedClientResponse._();
  CurtainOnChangedClientResponse createEmptyInstance() => create();
  static $pb.PbList<CurtainOnChangedClientResponse> createRepeated() => $pb.PbList<CurtainOnChangedClientResponse>();
  @$core.pragma('dart2js:noInline')
  static CurtainOnChangedClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CurtainOnChangedClientResponse>(create);
  static CurtainOnChangedClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get percent => $_getIZ(0);
  @$pb.TagNumber(1)
  set percent($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPercent() => $_has(0);
  @$pb.TagNumber(1)
  void clearPercent() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get deviceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceId() => clearField(2);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(2);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(2);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(2);
}

class TouchPanelControlSwitchOnChangedClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TouchPanelControlSwitchOnChangedClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelId', protoName: 'touchPanelId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcherId', protoName: 'switcherId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcher', $pb.PbFieldType.OU3)
    ..e<$0.PowerState>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: $0.PowerState.Off, valueOf: $0.PowerState.valueOf, enumValues: $0.PowerState.values)
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  TouchPanelControlSwitchOnChangedClientResponse._() : super();
  factory TouchPanelControlSwitchOnChangedClientResponse({
    $core.String? touchPanelId,
    $core.String? switcherId,
    $core.int? switcher,
    $0.PowerState? powerState,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (touchPanelId != null) {
      _result.touchPanelId = touchPanelId;
    }
    if (switcherId != null) {
      _result.switcherId = switcherId;
    }
    if (switcher != null) {
      _result.switcher = switcher;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory TouchPanelControlSwitchOnChangedClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TouchPanelControlSwitchOnChangedClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TouchPanelControlSwitchOnChangedClientResponse clone() => TouchPanelControlSwitchOnChangedClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TouchPanelControlSwitchOnChangedClientResponse copyWith(void Function(TouchPanelControlSwitchOnChangedClientResponse) updates) => super.copyWith((message) => updates(message as TouchPanelControlSwitchOnChangedClientResponse)) as TouchPanelControlSwitchOnChangedClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TouchPanelControlSwitchOnChangedClientResponse create() => TouchPanelControlSwitchOnChangedClientResponse._();
  TouchPanelControlSwitchOnChangedClientResponse createEmptyInstance() => create();
  static $pb.PbList<TouchPanelControlSwitchOnChangedClientResponse> createRepeated() => $pb.PbList<TouchPanelControlSwitchOnChangedClientResponse>();
  @$core.pragma('dart2js:noInline')
  static TouchPanelControlSwitchOnChangedClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TouchPanelControlSwitchOnChangedClientResponse>(create);
  static TouchPanelControlSwitchOnChangedClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get touchPanelId => $_getSZ(0);
  @$pb.TagNumber(1)
  set touchPanelId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTouchPanelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTouchPanelId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get switcherId => $_getSZ(1);
  @$pb.TagNumber(2)
  set switcherId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSwitcherId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSwitcherId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get switcher => $_getIZ(2);
  @$pb.TagNumber(3)
  set switcher($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSwitcher() => $_has(2);
  @$pb.TagNumber(3)
  void clearSwitcher() => clearField(3);

  @$pb.TagNumber(4)
  $0.PowerState get powerState => $_getN(3);
  @$pb.TagNumber(4)
  set powerState($0.PowerState v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPowerState() => $_has(3);
  @$pb.TagNumber(4)
  void clearPowerState() => clearField(4);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(4);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(4);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(4);
}

class TouchPanelControlCurtainSwitchOnChangedClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TouchPanelControlCurtainSwitchOnChangedClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelId', protoName: 'touchPanelId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainSwitcherId', protoName: 'curtainSwitcherId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percentIn', $pb.PbFieldType.OU3, protoName: 'percentIn')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percentOut', $pb.PbFieldType.OU3, protoName: 'percentOut')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  TouchPanelControlCurtainSwitchOnChangedClientResponse._() : super();
  factory TouchPanelControlCurtainSwitchOnChangedClientResponse({
    $core.String? touchPanelId,
    $core.String? curtainSwitcherId,
    $core.int? percentIn,
    $core.int? percentOut,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (touchPanelId != null) {
      _result.touchPanelId = touchPanelId;
    }
    if (curtainSwitcherId != null) {
      _result.curtainSwitcherId = curtainSwitcherId;
    }
    if (percentIn != null) {
      _result.percentIn = percentIn;
    }
    if (percentOut != null) {
      _result.percentOut = percentOut;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory TouchPanelControlCurtainSwitchOnChangedClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TouchPanelControlCurtainSwitchOnChangedClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TouchPanelControlCurtainSwitchOnChangedClientResponse clone() => TouchPanelControlCurtainSwitchOnChangedClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TouchPanelControlCurtainSwitchOnChangedClientResponse copyWith(void Function(TouchPanelControlCurtainSwitchOnChangedClientResponse) updates) => super.copyWith((message) => updates(message as TouchPanelControlCurtainSwitchOnChangedClientResponse)) as TouchPanelControlCurtainSwitchOnChangedClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TouchPanelControlCurtainSwitchOnChangedClientResponse create() => TouchPanelControlCurtainSwitchOnChangedClientResponse._();
  TouchPanelControlCurtainSwitchOnChangedClientResponse createEmptyInstance() => create();
  static $pb.PbList<TouchPanelControlCurtainSwitchOnChangedClientResponse> createRepeated() => $pb.PbList<TouchPanelControlCurtainSwitchOnChangedClientResponse>();
  @$core.pragma('dart2js:noInline')
  static TouchPanelControlCurtainSwitchOnChangedClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TouchPanelControlCurtainSwitchOnChangedClientResponse>(create);
  static TouchPanelControlCurtainSwitchOnChangedClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get touchPanelId => $_getSZ(0);
  @$pb.TagNumber(1)
  set touchPanelId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTouchPanelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTouchPanelId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get curtainSwitcherId => $_getSZ(1);
  @$pb.TagNumber(2)
  set curtainSwitcherId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurtainSwitcherId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurtainSwitcherId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get percentIn => $_getIZ(2);
  @$pb.TagNumber(3)
  set percentIn($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPercentIn() => $_has(2);
  @$pb.TagNumber(3)
  void clearPercentIn() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get percentOut => $_getIZ(3);
  @$pb.TagNumber(4)
  set percentOut($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPercentOut() => $_has(3);
  @$pb.TagNumber(4)
  void clearPercentOut() => clearField(4);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(4);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(4);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(4);
}

class TouchPanelControlSceneOnChangedClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TouchPanelControlSceneOnChangedClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelId', protoName: 'touchPanelId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneId', protoName: 'sceneId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  TouchPanelControlSceneOnChangedClientResponse._() : super();
  factory TouchPanelControlSceneOnChangedClientResponse({
    $core.String? touchPanelId,
    $core.String? sceneId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (touchPanelId != null) {
      _result.touchPanelId = touchPanelId;
    }
    if (sceneId != null) {
      _result.sceneId = sceneId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory TouchPanelControlSceneOnChangedClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TouchPanelControlSceneOnChangedClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TouchPanelControlSceneOnChangedClientResponse clone() => TouchPanelControlSceneOnChangedClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TouchPanelControlSceneOnChangedClientResponse copyWith(void Function(TouchPanelControlSceneOnChangedClientResponse) updates) => super.copyWith((message) => updates(message as TouchPanelControlSceneOnChangedClientResponse)) as TouchPanelControlSceneOnChangedClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TouchPanelControlSceneOnChangedClientResponse create() => TouchPanelControlSceneOnChangedClientResponse._();
  TouchPanelControlSceneOnChangedClientResponse createEmptyInstance() => create();
  static $pb.PbList<TouchPanelControlSceneOnChangedClientResponse> createRepeated() => $pb.PbList<TouchPanelControlSceneOnChangedClientResponse>();
  @$core.pragma('dart2js:noInline')
  static TouchPanelControlSceneOnChangedClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TouchPanelControlSceneOnChangedClientResponse>(create);
  static TouchPanelControlSceneOnChangedClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get touchPanelId => $_getSZ(0);
  @$pb.TagNumber(1)
  set touchPanelId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTouchPanelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTouchPanelId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sceneId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sceneId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSceneId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSceneId() => clearField(2);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(2);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(2);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(2);
}

class TouchPanelControlLedDriverOnChangedClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TouchPanelControlLedDriverOnChangedClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelId', protoName: 'touchPanelId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ledDriverId', protoName: 'ledDriverId')
    ..e<$0.PowerState>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: $0.PowerState.Off, valueOf: $0.PowerState.valueOf, enumValues: $0.PowerState.values)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'brightnessPercent', $pb.PbFieldType.O3, protoName: 'brightnessPercent')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  TouchPanelControlLedDriverOnChangedClientResponse._() : super();
  factory TouchPanelControlLedDriverOnChangedClientResponse({
    $core.String? touchPanelId,
    $core.String? ledDriverId,
    $0.PowerState? powerState,
    $core.int? brightnessPercent,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (touchPanelId != null) {
      _result.touchPanelId = touchPanelId;
    }
    if (ledDriverId != null) {
      _result.ledDriverId = ledDriverId;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (brightnessPercent != null) {
      _result.brightnessPercent = brightnessPercent;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory TouchPanelControlLedDriverOnChangedClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TouchPanelControlLedDriverOnChangedClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TouchPanelControlLedDriverOnChangedClientResponse clone() => TouchPanelControlLedDriverOnChangedClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TouchPanelControlLedDriverOnChangedClientResponse copyWith(void Function(TouchPanelControlLedDriverOnChangedClientResponse) updates) => super.copyWith((message) => updates(message as TouchPanelControlLedDriverOnChangedClientResponse)) as TouchPanelControlLedDriverOnChangedClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TouchPanelControlLedDriverOnChangedClientResponse create() => TouchPanelControlLedDriverOnChangedClientResponse._();
  TouchPanelControlLedDriverOnChangedClientResponse createEmptyInstance() => create();
  static $pb.PbList<TouchPanelControlLedDriverOnChangedClientResponse> createRepeated() => $pb.PbList<TouchPanelControlLedDriverOnChangedClientResponse>();
  @$core.pragma('dart2js:noInline')
  static TouchPanelControlLedDriverOnChangedClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TouchPanelControlLedDriverOnChangedClientResponse>(create);
  static TouchPanelControlLedDriverOnChangedClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get touchPanelId => $_getSZ(0);
  @$pb.TagNumber(1)
  set touchPanelId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTouchPanelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTouchPanelId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get ledDriverId => $_getSZ(1);
  @$pb.TagNumber(2)
  set ledDriverId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLedDriverId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLedDriverId() => clearField(2);

  @$pb.TagNumber(3)
  $0.PowerState get powerState => $_getN(2);
  @$pb.TagNumber(3)
  set powerState($0.PowerState v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPowerState() => $_has(2);
  @$pb.TagNumber(3)
  void clearPowerState() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get brightnessPercent => $_getIZ(3);
  @$pb.TagNumber(4)
  set brightnessPercent($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBrightnessPercent() => $_has(3);
  @$pb.TagNumber(4)
  void clearBrightnessPercent() => clearField(4);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(4);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(4);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(4);
}

class TouchPanelRequestComponentStateOnChangedClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TouchPanelRequestComponentStateOnChangedClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelId', protoName: 'touchPanelId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'componentId', protoName: 'componentId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'index', $pb.PbFieldType.OU3)
    ..e<$0.TouchPanelComponentType>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: $0.TouchPanelComponentType.TouchPanelComponentUnknown, valueOf: $0.TouchPanelComponentType.valueOf, enumValues: $0.TouchPanelComponentType.values)
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  TouchPanelRequestComponentStateOnChangedClientResponse._() : super();
  factory TouchPanelRequestComponentStateOnChangedClientResponse({
    $core.String? touchPanelId,
    $core.String? componentId,
    $core.int? index,
    $0.TouchPanelComponentType? type,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (touchPanelId != null) {
      _result.touchPanelId = touchPanelId;
    }
    if (componentId != null) {
      _result.componentId = componentId;
    }
    if (index != null) {
      _result.index = index;
    }
    if (type != null) {
      _result.type = type;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory TouchPanelRequestComponentStateOnChangedClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TouchPanelRequestComponentStateOnChangedClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TouchPanelRequestComponentStateOnChangedClientResponse clone() => TouchPanelRequestComponentStateOnChangedClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TouchPanelRequestComponentStateOnChangedClientResponse copyWith(void Function(TouchPanelRequestComponentStateOnChangedClientResponse) updates) => super.copyWith((message) => updates(message as TouchPanelRequestComponentStateOnChangedClientResponse)) as TouchPanelRequestComponentStateOnChangedClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TouchPanelRequestComponentStateOnChangedClientResponse create() => TouchPanelRequestComponentStateOnChangedClientResponse._();
  TouchPanelRequestComponentStateOnChangedClientResponse createEmptyInstance() => create();
  static $pb.PbList<TouchPanelRequestComponentStateOnChangedClientResponse> createRepeated() => $pb.PbList<TouchPanelRequestComponentStateOnChangedClientResponse>();
  @$core.pragma('dart2js:noInline')
  static TouchPanelRequestComponentStateOnChangedClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TouchPanelRequestComponentStateOnChangedClientResponse>(create);
  static TouchPanelRequestComponentStateOnChangedClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get touchPanelId => $_getSZ(0);
  @$pb.TagNumber(1)
  set touchPanelId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTouchPanelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTouchPanelId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get componentId => $_getSZ(1);
  @$pb.TagNumber(2)
  set componentId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasComponentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearComponentId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get index => $_getIZ(2);
  @$pb.TagNumber(3)
  set index($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearIndex() => clearField(3);

  @$pb.TagNumber(4)
  $0.TouchPanelComponentType get type => $_getN(3);
  @$pb.TagNumber(4)
  set type($0.TouchPanelComponentType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(4);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(4);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(4);
}

class MotionClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MotionClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..e<$0.MotionState>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'motionState', $pb.PbFieldType.OE, protoName: 'motionState', defaultOrMaker: $0.MotionState.MotionNone, valueOf: $0.MotionState.valueOf, enumValues: $0.MotionState.values)
    ..hasRequiredFields = false
  ;

  MotionClientRequest._() : super();
  factory MotionClientRequest({
    $core.String? hardwareId,
    $0.MotionState? motionState,
  }) {
    final _result = create();
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    if (motionState != null) {
      _result.motionState = motionState;
    }
    return _result;
  }
  factory MotionClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MotionClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MotionClientRequest clone() => MotionClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MotionClientRequest copyWith(void Function(MotionClientRequest) updates) => super.copyWith((message) => updates(message as MotionClientRequest)) as MotionClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MotionClientRequest create() => MotionClientRequest._();
  MotionClientRequest createEmptyInstance() => create();
  static $pb.PbList<MotionClientRequest> createRepeated() => $pb.PbList<MotionClientRequest>();
  @$core.pragma('dart2js:noInline')
  static MotionClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MotionClientRequest>(create);
  static MotionClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hardwareId => $_getSZ(0);
  @$pb.TagNumber(1)
  set hardwareId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHardwareId() => $_has(0);
  @$pb.TagNumber(1)
  void clearHardwareId() => clearField(1);

  @$pb.TagNumber(2)
  $0.MotionState get motionState => $_getN(1);
  @$pb.TagNumber(2)
  set motionState($0.MotionState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMotionState() => $_has(1);
  @$pb.TagNumber(2)
  void clearMotionState() => clearField(2);
}

class MotionClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MotionClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..e<$0.MotionState>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'motionState', $pb.PbFieldType.OE, protoName: 'motionState', defaultOrMaker: $0.MotionState.MotionNone, valueOf: $0.MotionState.valueOf, enumValues: $0.MotionState.values)
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  MotionClientResponse._() : super();
  factory MotionClientResponse({
    $core.String? deviceId,
    $0.MotionState? motionState,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (motionState != null) {
      _result.motionState = motionState;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory MotionClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MotionClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MotionClientResponse clone() => MotionClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MotionClientResponse copyWith(void Function(MotionClientResponse) updates) => super.copyWith((message) => updates(message as MotionClientResponse)) as MotionClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MotionClientResponse create() => MotionClientResponse._();
  MotionClientResponse createEmptyInstance() => create();
  static $pb.PbList<MotionClientResponse> createRepeated() => $pb.PbList<MotionClientResponse>();
  @$core.pragma('dart2js:noInline')
  static MotionClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MotionClientResponse>(create);
  static MotionClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $0.MotionState get motionState => $_getN(1);
  @$pb.TagNumber(2)
  set motionState($0.MotionState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMotionState() => $_has(1);
  @$pb.TagNumber(2)
  void clearMotionState() => clearField(2);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(2);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(2);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(2);
}

class UpdateMotionState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateMotionState', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..e<$0.MotionState>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'motionState', $pb.PbFieldType.OE, protoName: 'motionState', defaultOrMaker: $0.MotionState.MotionNone, valueOf: $0.MotionState.valueOf, enumValues: $0.MotionState.values)
    ..hasRequiredFields = false
  ;

  UpdateMotionState._() : super();
  factory UpdateMotionState({
    $core.String? deviceId,
    $0.MotionState? motionState,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (motionState != null) {
      _result.motionState = motionState;
    }
    return _result;
  }
  factory UpdateMotionState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateMotionState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateMotionState clone() => UpdateMotionState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateMotionState copyWith(void Function(UpdateMotionState) updates) => super.copyWith((message) => updates(message as UpdateMotionState)) as UpdateMotionState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateMotionState create() => UpdateMotionState._();
  UpdateMotionState createEmptyInstance() => create();
  static $pb.PbList<UpdateMotionState> createRepeated() => $pb.PbList<UpdateMotionState>();
  @$core.pragma('dart2js:noInline')
  static UpdateMotionState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateMotionState>(create);
  static UpdateMotionState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $0.MotionState get motionState => $_getN(1);
  @$pb.TagNumber(2)
  set motionState($0.MotionState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMotionState() => $_has(1);
  @$pb.TagNumber(2)
  void clearMotionState() => clearField(2);
}

class SceneClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SceneClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneId', protoName: 'sceneId')
    ..aOM<$0.DeviceInScene>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'source', subBuilder: $0.DeviceInScene.create)
    ..pc<$0.DeviceInScene>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'target', $pb.PbFieldType.PM, subBuilder: $0.DeviceInScene.create)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mode', $pb.PbFieldType.OU3)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..aOM<$0.ActiveTime>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'activeTime', protoName: 'activeTime', subBuilder: $0.ActiveTime.create)
    ..hasRequiredFields = false
  ;

  SceneClientRequest._() : super();
  factory SceneClientRequest({
    $core.String? sceneId,
    $0.DeviceInScene? source,
    $core.Iterable<$0.DeviceInScene>? target,
    $core.int? type,
    $core.int? mode,
    $core.String? hardwareId,
    $0.ActiveTime? activeTime,
  }) {
    final _result = create();
    if (sceneId != null) {
      _result.sceneId = sceneId;
    }
    if (source != null) {
      _result.source = source;
    }
    if (target != null) {
      _result.target.addAll(target);
    }
    if (type != null) {
      _result.type = type;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    if (activeTime != null) {
      _result.activeTime = activeTime;
    }
    return _result;
  }
  factory SceneClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SceneClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SceneClientRequest clone() => SceneClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SceneClientRequest copyWith(void Function(SceneClientRequest) updates) => super.copyWith((message) => updates(message as SceneClientRequest)) as SceneClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SceneClientRequest create() => SceneClientRequest._();
  SceneClientRequest createEmptyInstance() => create();
  static $pb.PbList<SceneClientRequest> createRepeated() => $pb.PbList<SceneClientRequest>();
  @$core.pragma('dart2js:noInline')
  static SceneClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SceneClientRequest>(create);
  static SceneClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sceneId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sceneId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSceneId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSceneId() => clearField(1);

  @$pb.TagNumber(2)
  $0.DeviceInScene get source => $_getN(1);
  @$pb.TagNumber(2)
  set source($0.DeviceInScene v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSource() => $_has(1);
  @$pb.TagNumber(2)
  void clearSource() => clearField(2);
  @$pb.TagNumber(2)
  $0.DeviceInScene ensureSource() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$0.DeviceInScene> get target => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get type => $_getIZ(3);
  @$pb.TagNumber(4)
  set type($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get mode => $_getIZ(4);
  @$pb.TagNumber(5)
  set mode($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMode() => $_has(4);
  @$pb.TagNumber(5)
  void clearMode() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get hardwareId => $_getSZ(5);
  @$pb.TagNumber(6)
  set hardwareId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasHardwareId() => $_has(5);
  @$pb.TagNumber(6)
  void clearHardwareId() => clearField(6);

  @$pb.TagNumber(7)
  $0.ActiveTime get activeTime => $_getN(6);
  @$pb.TagNumber(7)
  set activeTime($0.ActiveTime v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasActiveTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearActiveTime() => clearField(7);
  @$pb.TagNumber(7)
  $0.ActiveTime ensureActiveTime() => $_ensure(6);
}

class SceneClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SceneClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneId', protoName: 'sceneId')
    ..aOM<$0.Switcher>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcher', subBuilder: $0.Switcher.create)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mode', $pb.PbFieldType.OU3)
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  SceneClientResponse._() : super();
  factory SceneClientResponse({
    $core.String? sceneId,
    $0.Switcher? switcher,
    $core.int? mode,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (sceneId != null) {
      _result.sceneId = sceneId;
    }
    if (switcher != null) {
      _result.switcher = switcher;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory SceneClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SceneClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SceneClientResponse clone() => SceneClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SceneClientResponse copyWith(void Function(SceneClientResponse) updates) => super.copyWith((message) => updates(message as SceneClientResponse)) as SceneClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SceneClientResponse create() => SceneClientResponse._();
  SceneClientResponse createEmptyInstance() => create();
  static $pb.PbList<SceneClientResponse> createRepeated() => $pb.PbList<SceneClientResponse>();
  @$core.pragma('dart2js:noInline')
  static SceneClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SceneClientResponse>(create);
  static SceneClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sceneId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sceneId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSceneId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSceneId() => clearField(1);

  @$pb.TagNumber(2)
  $0.Switcher get switcher => $_getN(1);
  @$pb.TagNumber(2)
  set switcher($0.Switcher v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSwitcher() => $_has(1);
  @$pb.TagNumber(2)
  void clearSwitcher() => clearField(2);
  @$pb.TagNumber(2)
  $0.Switcher ensureSwitcher() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get mode => $_getIZ(2);
  @$pb.TagNumber(3)
  set mode($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMode() => $_has(2);
  @$pb.TagNumber(3)
  void clearMode() => clearField(3);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(3);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(3);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(3);
}

class LedDriverClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LedDriverClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ledIndex', $pb.PbFieldType.OU3, protoName: 'ledIndex')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'brightnessPercent', $pb.PbFieldType.O3, protoName: 'brightnessPercent')
    ..e<$0.PowerState>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: $0.PowerState.Off, valueOf: $0.PowerState.valueOf, enumValues: $0.PowerState.values)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupControl', $pb.PbFieldType.OU3, protoName: 'groupControl')
    ..hasRequiredFields = false
  ;

  LedDriverClientRequest._() : super();
  factory LedDriverClientRequest({
    $core.String? hardwareId,
    $core.int? ledIndex,
    $core.int? brightnessPercent,
    $0.PowerState? powerState,
    $core.int? groupControl,
  }) {
    final _result = create();
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    if (ledIndex != null) {
      _result.ledIndex = ledIndex;
    }
    if (brightnessPercent != null) {
      _result.brightnessPercent = brightnessPercent;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (groupControl != null) {
      _result.groupControl = groupControl;
    }
    return _result;
  }
  factory LedDriverClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LedDriverClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LedDriverClientRequest clone() => LedDriverClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LedDriverClientRequest copyWith(void Function(LedDriverClientRequest) updates) => super.copyWith((message) => updates(message as LedDriverClientRequest)) as LedDriverClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LedDriverClientRequest create() => LedDriverClientRequest._();
  LedDriverClientRequest createEmptyInstance() => create();
  static $pb.PbList<LedDriverClientRequest> createRepeated() => $pb.PbList<LedDriverClientRequest>();
  @$core.pragma('dart2js:noInline')
  static LedDriverClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LedDriverClientRequest>(create);
  static LedDriverClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hardwareId => $_getSZ(0);
  @$pb.TagNumber(1)
  set hardwareId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHardwareId() => $_has(0);
  @$pb.TagNumber(1)
  void clearHardwareId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get ledIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set ledIndex($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLedIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearLedIndex() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get brightnessPercent => $_getIZ(2);
  @$pb.TagNumber(3)
  set brightnessPercent($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBrightnessPercent() => $_has(2);
  @$pb.TagNumber(3)
  void clearBrightnessPercent() => clearField(3);

  @$pb.TagNumber(4)
  $0.PowerState get powerState => $_getN(3);
  @$pb.TagNumber(4)
  set powerState($0.PowerState v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPowerState() => $_has(3);
  @$pb.TagNumber(4)
  void clearPowerState() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get groupControl => $_getIZ(4);
  @$pb.TagNumber(5)
  set groupControl($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasGroupControl() => $_has(4);
  @$pb.TagNumber(5)
  void clearGroupControl() => clearField(5);
}

class LedDriverClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LedDriverClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ledIndex', $pb.PbFieldType.O3, protoName: 'ledIndex')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'brightnessPercent', $pb.PbFieldType.O3, protoName: 'brightnessPercent')
    ..e<$0.PowerState>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: $0.PowerState.Off, valueOf: $0.PowerState.valueOf, enumValues: $0.PowerState.values)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupControl', $pb.PbFieldType.OU3, protoName: 'groupControl')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  LedDriverClientResponse._() : super();
  factory LedDriverClientResponse({
    $core.String? deviceId,
    $core.int? ledIndex,
    $core.int? brightnessPercent,
    $0.PowerState? powerState,
    $core.int? groupControl,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (ledIndex != null) {
      _result.ledIndex = ledIndex;
    }
    if (brightnessPercent != null) {
      _result.brightnessPercent = brightnessPercent;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (groupControl != null) {
      _result.groupControl = groupControl;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory LedDriverClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LedDriverClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LedDriverClientResponse clone() => LedDriverClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LedDriverClientResponse copyWith(void Function(LedDriverClientResponse) updates) => super.copyWith((message) => updates(message as LedDriverClientResponse)) as LedDriverClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LedDriverClientResponse create() => LedDriverClientResponse._();
  LedDriverClientResponse createEmptyInstance() => create();
  static $pb.PbList<LedDriverClientResponse> createRepeated() => $pb.PbList<LedDriverClientResponse>();
  @$core.pragma('dart2js:noInline')
  static LedDriverClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LedDriverClientResponse>(create);
  static LedDriverClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get ledIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set ledIndex($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLedIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearLedIndex() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get brightnessPercent => $_getIZ(2);
  @$pb.TagNumber(3)
  set brightnessPercent($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBrightnessPercent() => $_has(2);
  @$pb.TagNumber(3)
  void clearBrightnessPercent() => clearField(3);

  @$pb.TagNumber(4)
  $0.PowerState get powerState => $_getN(3);
  @$pb.TagNumber(4)
  set powerState($0.PowerState v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPowerState() => $_has(3);
  @$pb.TagNumber(4)
  void clearPowerState() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get groupControl => $_getIZ(4);
  @$pb.TagNumber(5)
  set groupControl($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasGroupControl() => $_has(4);
  @$pb.TagNumber(5)
  void clearGroupControl() => clearField(5);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(5);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(5);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(5);
}

class SceneGroupClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SceneGroupClientRequest', createEmptyInstance: create)
    ..pc<SwitcherClientRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcherClientRequest', $pb.PbFieldType.PM, protoName: 'switcherClientRequest', subBuilder: SwitcherClientRequest.create)
    ..pc<LedDriverClientRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ledDriverClientRequest', $pb.PbFieldType.PM, protoName: 'ledDriverClientRequest', subBuilder: LedDriverClientRequest.create)
    ..hasRequiredFields = false
  ;

  SceneGroupClientRequest._() : super();
  factory SceneGroupClientRequest({
    $core.Iterable<SwitcherClientRequest>? switcherClientRequest,
    $core.Iterable<LedDriverClientRequest>? ledDriverClientRequest,
  }) {
    final _result = create();
    if (switcherClientRequest != null) {
      _result.switcherClientRequest.addAll(switcherClientRequest);
    }
    if (ledDriverClientRequest != null) {
      _result.ledDriverClientRequest.addAll(ledDriverClientRequest);
    }
    return _result;
  }
  factory SceneGroupClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SceneGroupClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SceneGroupClientRequest clone() => SceneGroupClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SceneGroupClientRequest copyWith(void Function(SceneGroupClientRequest) updates) => super.copyWith((message) => updates(message as SceneGroupClientRequest)) as SceneGroupClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SceneGroupClientRequest create() => SceneGroupClientRequest._();
  SceneGroupClientRequest createEmptyInstance() => create();
  static $pb.PbList<SceneGroupClientRequest> createRepeated() => $pb.PbList<SceneGroupClientRequest>();
  @$core.pragma('dart2js:noInline')
  static SceneGroupClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SceneGroupClientRequest>(create);
  static SceneGroupClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SwitcherClientRequest> get switcherClientRequest => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<LedDriverClientRequest> get ledDriverClientRequest => $_getList(1);
}

class MeterClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MeterClientRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'date', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  MeterClientRequest._() : super();
  factory MeterClientRequest({
    $core.int? date,
  }) {
    final _result = create();
    if (date != null) {
      _result.date = date;
    }
    return _result;
  }
  factory MeterClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MeterClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MeterClientRequest clone() => MeterClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MeterClientRequest copyWith(void Function(MeterClientRequest) updates) => super.copyWith((message) => updates(message as MeterClientRequest)) as MeterClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MeterClientRequest create() => MeterClientRequest._();
  MeterClientRequest createEmptyInstance() => create();
  static $pb.PbList<MeterClientRequest> createRepeated() => $pb.PbList<MeterClientRequest>();
  @$core.pragma('dart2js:noInline')
  static MeterClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MeterClientRequest>(create);
  static MeterClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get date => $_getIZ(0);
  @$pb.TagNumber(1)
  set date($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearDate() => clearField(1);
}

class MeterClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MeterClientResponse', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..pc<$0.MeterIndex>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexs', $pb.PbFieldType.PM, subBuilder: $0.MeterIndex.create)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestamp', $pb.PbFieldType.OU3)
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  MeterClientResponse._() : super();
  factory MeterClientResponse({
    $core.int? id,
    $core.String? hardwareId,
    $core.Iterable<$0.MeterIndex>? indexs,
    $core.int? timestamp,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    if (indexs != null) {
      _result.indexs.addAll(indexs);
    }
    if (timestamp != null) {
      _result.timestamp = timestamp;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory MeterClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MeterClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MeterClientResponse clone() => MeterClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MeterClientResponse copyWith(void Function(MeterClientResponse) updates) => super.copyWith((message) => updates(message as MeterClientResponse)) as MeterClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MeterClientResponse create() => MeterClientResponse._();
  MeterClientResponse createEmptyInstance() => create();
  static $pb.PbList<MeterClientResponse> createRepeated() => $pb.PbList<MeterClientResponse>();
  @$core.pragma('dart2js:noInline')
  static MeterClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MeterClientResponse>(create);
  static MeterClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get hardwareId => $_getSZ(1);
  @$pb.TagNumber(2)
  set hardwareId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHardwareId() => $_has(1);
  @$pb.TagNumber(2)
  void clearHardwareId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$0.MeterIndex> get indexs => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get timestamp => $_getIZ(3);
  @$pb.TagNumber(4)
  set timestamp($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimestamp() => clearField(4);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(4);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(4);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(4);
}

class MeterClientConfirm extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MeterClientConfirm', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.OU3)
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  MeterClientConfirm._() : super();
  factory MeterClientConfirm({
    $core.int? id,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory MeterClientConfirm.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MeterClientConfirm.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MeterClientConfirm clone() => MeterClientConfirm()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MeterClientConfirm copyWith(void Function(MeterClientConfirm) updates) => super.copyWith((message) => updates(message as MeterClientConfirm)) as MeterClientConfirm; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MeterClientConfirm create() => MeterClientConfirm._();
  MeterClientConfirm createEmptyInstance() => create();
  static $pb.PbList<MeterClientConfirm> createRepeated() => $pb.PbList<MeterClientConfirm>();
  @$core.pragma('dart2js:noInline')
  static MeterClientConfirm getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MeterClientConfirm>(create);
  static MeterClientConfirm? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(1);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(1);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(1);
}

class SetHomekitModeClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SetHomekitModeClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..e<$0.HomekitMode>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'homekitMode', $pb.PbFieldType.OE, protoName: 'homekitMode', defaultOrMaker: $0.HomekitMode.HomekitNormalMode, valueOf: $0.HomekitMode.valueOf, enumValues: $0.HomekitMode.values)
    ..hasRequiredFields = false
  ;

  SetHomekitModeClientRequest._() : super();
  factory SetHomekitModeClientRequest({
    $core.String? hardwareId,
    $0.HomekitMode? homekitMode,
  }) {
    final _result = create();
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    if (homekitMode != null) {
      _result.homekitMode = homekitMode;
    }
    return _result;
  }
  factory SetHomekitModeClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetHomekitModeClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetHomekitModeClientRequest clone() => SetHomekitModeClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetHomekitModeClientRequest copyWith(void Function(SetHomekitModeClientRequest) updates) => super.copyWith((message) => updates(message as SetHomekitModeClientRequest)) as SetHomekitModeClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetHomekitModeClientRequest create() => SetHomekitModeClientRequest._();
  SetHomekitModeClientRequest createEmptyInstance() => create();
  static $pb.PbList<SetHomekitModeClientRequest> createRepeated() => $pb.PbList<SetHomekitModeClientRequest>();
  @$core.pragma('dart2js:noInline')
  static SetHomekitModeClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetHomekitModeClientRequest>(create);
  static SetHomekitModeClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hardwareId => $_getSZ(0);
  @$pb.TagNumber(1)
  set hardwareId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHardwareId() => $_has(0);
  @$pb.TagNumber(1)
  void clearHardwareId() => clearField(1);

  @$pb.TagNumber(2)
  $0.HomekitMode get homekitMode => $_getN(1);
  @$pb.TagNumber(2)
  set homekitMode($0.HomekitMode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasHomekitMode() => $_has(1);
  @$pb.TagNumber(2)
  void clearHomekitMode() => clearField(2);
}

class SetHomekitModeClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SetHomekitModeClientResponse', createEmptyInstance: create)
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  SetHomekitModeClientResponse._() : super();
  factory SetHomekitModeClientResponse({
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory SetHomekitModeClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetHomekitModeClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetHomekitModeClientResponse clone() => SetHomekitModeClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetHomekitModeClientResponse copyWith(void Function(SetHomekitModeClientResponse) updates) => super.copyWith((message) => updates(message as SetHomekitModeClientResponse)) as SetHomekitModeClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetHomekitModeClientResponse create() => SetHomekitModeClientResponse._();
  SetHomekitModeClientResponse createEmptyInstance() => create();
  static $pb.PbList<SetHomekitModeClientResponse> createRepeated() => $pb.PbList<SetHomekitModeClientResponse>();
  @$core.pragma('dart2js:noInline')
  static SetHomekitModeClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetHomekitModeClientResponse>(create);
  static SetHomekitModeClientResponse? _defaultInstance;

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(0);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(0);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(0);
}

class SceneTriggerClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SceneTriggerClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneId', protoName: 'sceneId')
    ..aOM<$0.DeviceInScene>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'source', subBuilder: $0.DeviceInScene.create)
    ..pc<$0.DeviceInScene>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'target', $pb.PbFieldType.PM, subBuilder: $0.DeviceInScene.create)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mode', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  SceneTriggerClientRequest._() : super();
  factory SceneTriggerClientRequest({
    $core.String? sceneId,
    $0.DeviceInScene? source,
    $core.Iterable<$0.DeviceInScene>? target,
    $core.int? mode,
  }) {
    final _result = create();
    if (sceneId != null) {
      _result.sceneId = sceneId;
    }
    if (source != null) {
      _result.source = source;
    }
    if (target != null) {
      _result.target.addAll(target);
    }
    if (mode != null) {
      _result.mode = mode;
    }
    return _result;
  }
  factory SceneTriggerClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SceneTriggerClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SceneTriggerClientRequest clone() => SceneTriggerClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SceneTriggerClientRequest copyWith(void Function(SceneTriggerClientRequest) updates) => super.copyWith((message) => updates(message as SceneTriggerClientRequest)) as SceneTriggerClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SceneTriggerClientRequest create() => SceneTriggerClientRequest._();
  SceneTriggerClientRequest createEmptyInstance() => create();
  static $pb.PbList<SceneTriggerClientRequest> createRepeated() => $pb.PbList<SceneTriggerClientRequest>();
  @$core.pragma('dart2js:noInline')
  static SceneTriggerClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SceneTriggerClientRequest>(create);
  static SceneTriggerClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sceneId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sceneId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSceneId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSceneId() => clearField(1);

  @$pb.TagNumber(2)
  $0.DeviceInScene get source => $_getN(1);
  @$pb.TagNumber(2)
  set source($0.DeviceInScene v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSource() => $_has(1);
  @$pb.TagNumber(2)
  void clearSource() => clearField(2);
  @$pb.TagNumber(2)
  $0.DeviceInScene ensureSource() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$0.DeviceInScene> get target => $_getList(2);

  @$pb.TagNumber(4)
  $core.int get mode => $_getIZ(3);
  @$pb.TagNumber(4)
  set mode($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMode() => $_has(3);
  @$pb.TagNumber(4)
  void clearMode() => clearField(4);
}

class SceneTriggerClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SceneTriggerClientResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneId', protoName: 'sceneId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  SceneTriggerClientResponse._() : super();
  factory SceneTriggerClientResponse({
    $core.String? sceneId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (sceneId != null) {
      _result.sceneId = sceneId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory SceneTriggerClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SceneTriggerClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SceneTriggerClientResponse clone() => SceneTriggerClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SceneTriggerClientResponse copyWith(void Function(SceneTriggerClientResponse) updates) => super.copyWith((message) => updates(message as SceneTriggerClientResponse)) as SceneTriggerClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SceneTriggerClientResponse create() => SceneTriggerClientResponse._();
  SceneTriggerClientResponse createEmptyInstance() => create();
  static $pb.PbList<SceneTriggerClientResponse> createRepeated() => $pb.PbList<SceneTriggerClientResponse>();
  @$core.pragma('dart2js:noInline')
  static SceneTriggerClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SceneTriggerClientResponse>(create);
  static SceneTriggerClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sceneId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sceneId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSceneId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSceneId() => clearField(1);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(1);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(1);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(1);
}

class CurtainClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CurtainClientRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percent', $pb.PbFieldType.OU3)
    ..e<$0.CurtainControlState>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'controlState', $pb.PbFieldType.OE, protoName: 'controlState', defaultOrMaker: $0.CurtainControlState.CurtainControlUnknown, valueOf: $0.CurtainControlState.valueOf, enumValues: $0.CurtainControlState.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..hasRequiredFields = false
  ;

  CurtainClientRequest._() : super();
  factory CurtainClientRequest({
    $core.int? percent,
    $0.CurtainControlState? controlState,
    $core.String? hardwareId,
  }) {
    final _result = create();
    if (percent != null) {
      _result.percent = percent;
    }
    if (controlState != null) {
      _result.controlState = controlState;
    }
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    return _result;
  }
  factory CurtainClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CurtainClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CurtainClientRequest clone() => CurtainClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CurtainClientRequest copyWith(void Function(CurtainClientRequest) updates) => super.copyWith((message) => updates(message as CurtainClientRequest)) as CurtainClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CurtainClientRequest create() => CurtainClientRequest._();
  CurtainClientRequest createEmptyInstance() => create();
  static $pb.PbList<CurtainClientRequest> createRepeated() => $pb.PbList<CurtainClientRequest>();
  @$core.pragma('dart2js:noInline')
  static CurtainClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CurtainClientRequest>(create);
  static CurtainClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get percent => $_getIZ(0);
  @$pb.TagNumber(1)
  set percent($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPercent() => $_has(0);
  @$pb.TagNumber(1)
  void clearPercent() => clearField(1);

  @$pb.TagNumber(2)
  $0.CurtainControlState get controlState => $_getN(1);
  @$pb.TagNumber(2)
  set controlState($0.CurtainControlState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasControlState() => $_has(1);
  @$pb.TagNumber(2)
  void clearControlState() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get hardwareId => $_getSZ(2);
  @$pb.TagNumber(3)
  set hardwareId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHardwareId() => $_has(2);
  @$pb.TagNumber(3)
  void clearHardwareId() => clearField(3);
}

class CurtainClientResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CurtainClientResponse', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percent', $pb.PbFieldType.OU3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  CurtainClientResponse._() : super();
  factory CurtainClientResponse({
    $core.int? percent,
    $core.String? deviceId,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (percent != null) {
      _result.percent = percent;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory CurtainClientResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CurtainClientResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CurtainClientResponse clone() => CurtainClientResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CurtainClientResponse copyWith(void Function(CurtainClientResponse) updates) => super.copyWith((message) => updates(message as CurtainClientResponse)) as CurtainClientResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CurtainClientResponse create() => CurtainClientResponse._();
  CurtainClientResponse createEmptyInstance() => create();
  static $pb.PbList<CurtainClientResponse> createRepeated() => $pb.PbList<CurtainClientResponse>();
  @$core.pragma('dart2js:noInline')
  static CurtainClientResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CurtainClientResponse>(create);
  static CurtainClientResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get percent => $_getIZ(0);
  @$pb.TagNumber(1)
  set percent($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPercent() => $_has(0);
  @$pb.TagNumber(1)
  void clearPercent() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get deviceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceId() => clearField(2);

  @$pb.TagNumber(1000)
  $0.StatusCode get statusCode => $_getN(2);
  @$pb.TagNumber(1000)
  set statusCode($0.StatusCode v) { setField(1000, v); }
  @$pb.TagNumber(1000)
  $core.bool hasStatusCode() => $_has(2);
  @$pb.TagNumber(1000)
  void clearStatusCode() => clearField(1000);
  @$pb.TagNumber(1000)
  $0.StatusCode ensureStatusCode() => $_ensure(2);
}

class TouchPanelChangeComponentClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TouchPanelChangeComponentClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelId', protoName: 'touchPanelId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'componentId', protoName: 'componentId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'index', $pb.PbFieldType.OU3)
    ..e<$0.TouchPanelComponentType>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: $0.TouchPanelComponentType.TouchPanelComponentUnknown, valueOf: $0.TouchPanelComponentType.valueOf, enumValues: $0.TouchPanelComponentType.values)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'activeMap', $pb.PbFieldType.OU3, protoName: 'activeMap')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mode', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  TouchPanelChangeComponentClientRequest._() : super();
  factory TouchPanelChangeComponentClientRequest({
    $core.String? touchPanelId,
    $core.String? componentId,
    $core.int? index,
    $0.TouchPanelComponentType? type,
    $core.int? activeMap,
    $core.String? name,
    $core.int? mode,
  }) {
    final _result = create();
    if (touchPanelId != null) {
      _result.touchPanelId = touchPanelId;
    }
    if (componentId != null) {
      _result.componentId = componentId;
    }
    if (index != null) {
      _result.index = index;
    }
    if (type != null) {
      _result.type = type;
    }
    if (activeMap != null) {
      _result.activeMap = activeMap;
    }
    if (name != null) {
      _result.name = name;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    return _result;
  }
  factory TouchPanelChangeComponentClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TouchPanelChangeComponentClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TouchPanelChangeComponentClientRequest clone() => TouchPanelChangeComponentClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TouchPanelChangeComponentClientRequest copyWith(void Function(TouchPanelChangeComponentClientRequest) updates) => super.copyWith((message) => updates(message as TouchPanelChangeComponentClientRequest)) as TouchPanelChangeComponentClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TouchPanelChangeComponentClientRequest create() => TouchPanelChangeComponentClientRequest._();
  TouchPanelChangeComponentClientRequest createEmptyInstance() => create();
  static $pb.PbList<TouchPanelChangeComponentClientRequest> createRepeated() => $pb.PbList<TouchPanelChangeComponentClientRequest>();
  @$core.pragma('dart2js:noInline')
  static TouchPanelChangeComponentClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TouchPanelChangeComponentClientRequest>(create);
  static TouchPanelChangeComponentClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get touchPanelId => $_getSZ(0);
  @$pb.TagNumber(1)
  set touchPanelId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTouchPanelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTouchPanelId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get componentId => $_getSZ(1);
  @$pb.TagNumber(2)
  set componentId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasComponentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearComponentId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get index => $_getIZ(2);
  @$pb.TagNumber(3)
  set index($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearIndex() => clearField(3);

  @$pb.TagNumber(4)
  $0.TouchPanelComponentType get type => $_getN(3);
  @$pb.TagNumber(4)
  set type($0.TouchPanelComponentType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get activeMap => $_getIZ(4);
  @$pb.TagNumber(5)
  set activeMap($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasActiveMap() => $_has(4);
  @$pb.TagNumber(5)
  void clearActiveMap() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get mode => $_getIZ(6);
  @$pb.TagNumber(7)
  set mode($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMode() => $_has(6);
  @$pb.TagNumber(7)
  void clearMode() => clearField(7);
}

class TouchPanelControlSwitcherClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TouchPanelControlSwitcherClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelId', protoName: 'touchPanelId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcherId', protoName: 'switcherId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcher', $pb.PbFieldType.OU3)
    ..e<$0.PowerState>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: $0.PowerState.Off, valueOf: $0.PowerState.valueOf, enumValues: $0.PowerState.values)
    ..hasRequiredFields = false
  ;

  TouchPanelControlSwitcherClientRequest._() : super();
  factory TouchPanelControlSwitcherClientRequest({
    $core.String? touchPanelId,
    $core.String? switcherId,
    $core.int? switcher,
    $0.PowerState? powerState,
  }) {
    final _result = create();
    if (touchPanelId != null) {
      _result.touchPanelId = touchPanelId;
    }
    if (switcherId != null) {
      _result.switcherId = switcherId;
    }
    if (switcher != null) {
      _result.switcher = switcher;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    return _result;
  }
  factory TouchPanelControlSwitcherClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TouchPanelControlSwitcherClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TouchPanelControlSwitcherClientRequest clone() => TouchPanelControlSwitcherClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TouchPanelControlSwitcherClientRequest copyWith(void Function(TouchPanelControlSwitcherClientRequest) updates) => super.copyWith((message) => updates(message as TouchPanelControlSwitcherClientRequest)) as TouchPanelControlSwitcherClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TouchPanelControlSwitcherClientRequest create() => TouchPanelControlSwitcherClientRequest._();
  TouchPanelControlSwitcherClientRequest createEmptyInstance() => create();
  static $pb.PbList<TouchPanelControlSwitcherClientRequest> createRepeated() => $pb.PbList<TouchPanelControlSwitcherClientRequest>();
  @$core.pragma('dart2js:noInline')
  static TouchPanelControlSwitcherClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TouchPanelControlSwitcherClientRequest>(create);
  static TouchPanelControlSwitcherClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get touchPanelId => $_getSZ(0);
  @$pb.TagNumber(1)
  set touchPanelId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTouchPanelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTouchPanelId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get switcherId => $_getSZ(1);
  @$pb.TagNumber(2)
  set switcherId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSwitcherId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSwitcherId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get switcher => $_getIZ(2);
  @$pb.TagNumber(3)
  set switcher($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSwitcher() => $_has(2);
  @$pb.TagNumber(3)
  void clearSwitcher() => clearField(3);

  @$pb.TagNumber(4)
  $0.PowerState get powerState => $_getN(3);
  @$pb.TagNumber(4)
  set powerState($0.PowerState v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPowerState() => $_has(3);
  @$pb.TagNumber(4)
  void clearPowerState() => clearField(4);
}

class TouchPanelUpdateSwitcherClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TouchPanelUpdateSwitcherClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelId', protoName: 'touchPanelId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcherId', protoName: 'switcherId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'index', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'activeMap', $pb.PbFieldType.OU3, protoName: 'activeMap')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..e<$0.ConnectionState>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'connectionState', $pb.PbFieldType.OE, protoName: 'connectionState', defaultOrMaker: $0.ConnectionState.Offline, valueOf: $0.ConnectionState.valueOf, enumValues: $0.ConnectionState.values)
    ..hasRequiredFields = false
  ;

  TouchPanelUpdateSwitcherClientRequest._() : super();
  factory TouchPanelUpdateSwitcherClientRequest({
    $core.String? touchPanelId,
    $core.String? switcherId,
    $core.int? index,
    $core.int? activeMap,
    $core.String? name,
    $0.ConnectionState? connectionState,
  }) {
    final _result = create();
    if (touchPanelId != null) {
      _result.touchPanelId = touchPanelId;
    }
    if (switcherId != null) {
      _result.switcherId = switcherId;
    }
    if (index != null) {
      _result.index = index;
    }
    if (activeMap != null) {
      _result.activeMap = activeMap;
    }
    if (name != null) {
      _result.name = name;
    }
    if (connectionState != null) {
      _result.connectionState = connectionState;
    }
    return _result;
  }
  factory TouchPanelUpdateSwitcherClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TouchPanelUpdateSwitcherClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TouchPanelUpdateSwitcherClientRequest clone() => TouchPanelUpdateSwitcherClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TouchPanelUpdateSwitcherClientRequest copyWith(void Function(TouchPanelUpdateSwitcherClientRequest) updates) => super.copyWith((message) => updates(message as TouchPanelUpdateSwitcherClientRequest)) as TouchPanelUpdateSwitcherClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TouchPanelUpdateSwitcherClientRequest create() => TouchPanelUpdateSwitcherClientRequest._();
  TouchPanelUpdateSwitcherClientRequest createEmptyInstance() => create();
  static $pb.PbList<TouchPanelUpdateSwitcherClientRequest> createRepeated() => $pb.PbList<TouchPanelUpdateSwitcherClientRequest>();
  @$core.pragma('dart2js:noInline')
  static TouchPanelUpdateSwitcherClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TouchPanelUpdateSwitcherClientRequest>(create);
  static TouchPanelUpdateSwitcherClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get touchPanelId => $_getSZ(0);
  @$pb.TagNumber(1)
  set touchPanelId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTouchPanelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTouchPanelId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get switcherId => $_getSZ(1);
  @$pb.TagNumber(2)
  set switcherId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSwitcherId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSwitcherId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get index => $_getIZ(2);
  @$pb.TagNumber(3)
  set index($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearIndex() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get activeMap => $_getIZ(3);
  @$pb.TagNumber(4)
  set activeMap($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasActiveMap() => $_has(3);
  @$pb.TagNumber(4)
  void clearActiveMap() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get name => $_getSZ(4);
  @$pb.TagNumber(5)
  set name($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasName() => $_has(4);
  @$pb.TagNumber(5)
  void clearName() => clearField(5);

  @$pb.TagNumber(6)
  $0.ConnectionState get connectionState => $_getN(5);
  @$pb.TagNumber(6)
  set connectionState($0.ConnectionState v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasConnectionState() => $_has(5);
  @$pb.TagNumber(6)
  void clearConnectionState() => clearField(6);
}

class TouchPanelControlCurtainSwitcherClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TouchPanelControlCurtainSwitcherClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelId', protoName: 'touchPanelId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainSwitcherId', protoName: 'curtainSwitcherId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percentIn', $pb.PbFieldType.OU3, protoName: 'percentIn')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percentOut', $pb.PbFieldType.OU3, protoName: 'percentOut')
    ..hasRequiredFields = false
  ;

  TouchPanelControlCurtainSwitcherClientRequest._() : super();
  factory TouchPanelControlCurtainSwitcherClientRequest({
    $core.String? touchPanelId,
    $core.String? curtainSwitcherId,
    $core.int? percentIn,
    $core.int? percentOut,
  }) {
    final _result = create();
    if (touchPanelId != null) {
      _result.touchPanelId = touchPanelId;
    }
    if (curtainSwitcherId != null) {
      _result.curtainSwitcherId = curtainSwitcherId;
    }
    if (percentIn != null) {
      _result.percentIn = percentIn;
    }
    if (percentOut != null) {
      _result.percentOut = percentOut;
    }
    return _result;
  }
  factory TouchPanelControlCurtainSwitcherClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TouchPanelControlCurtainSwitcherClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TouchPanelControlCurtainSwitcherClientRequest clone() => TouchPanelControlCurtainSwitcherClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TouchPanelControlCurtainSwitcherClientRequest copyWith(void Function(TouchPanelControlCurtainSwitcherClientRequest) updates) => super.copyWith((message) => updates(message as TouchPanelControlCurtainSwitcherClientRequest)) as TouchPanelControlCurtainSwitcherClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TouchPanelControlCurtainSwitcherClientRequest create() => TouchPanelControlCurtainSwitcherClientRequest._();
  TouchPanelControlCurtainSwitcherClientRequest createEmptyInstance() => create();
  static $pb.PbList<TouchPanelControlCurtainSwitcherClientRequest> createRepeated() => $pb.PbList<TouchPanelControlCurtainSwitcherClientRequest>();
  @$core.pragma('dart2js:noInline')
  static TouchPanelControlCurtainSwitcherClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TouchPanelControlCurtainSwitcherClientRequest>(create);
  static TouchPanelControlCurtainSwitcherClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get touchPanelId => $_getSZ(0);
  @$pb.TagNumber(1)
  set touchPanelId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTouchPanelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTouchPanelId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get curtainSwitcherId => $_getSZ(1);
  @$pb.TagNumber(2)
  set curtainSwitcherId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurtainSwitcherId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurtainSwitcherId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get percentIn => $_getIZ(2);
  @$pb.TagNumber(3)
  set percentIn($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPercentIn() => $_has(2);
  @$pb.TagNumber(3)
  void clearPercentIn() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get percentOut => $_getIZ(3);
  @$pb.TagNumber(4)
  set percentOut($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPercentOut() => $_has(3);
  @$pb.TagNumber(4)
  void clearPercentOut() => clearField(4);
}

class TouchPanelUpdateCurtainSwitcherClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TouchPanelUpdateCurtainSwitcherClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelId', protoName: 'touchPanelId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainSwitcherId', protoName: 'curtainSwitcherId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..e<$0.ConnectionState>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'connectionState', $pb.PbFieldType.OE, protoName: 'connectionState', defaultOrMaker: $0.ConnectionState.Offline, valueOf: $0.ConnectionState.valueOf, enumValues: $0.ConnectionState.values)
    ..hasRequiredFields = false
  ;

  TouchPanelUpdateCurtainSwitcherClientRequest._() : super();
  factory TouchPanelUpdateCurtainSwitcherClientRequest({
    $core.String? touchPanelId,
    $core.String? curtainSwitcherId,
    $core.String? name,
    $0.ConnectionState? connectionState,
  }) {
    final _result = create();
    if (touchPanelId != null) {
      _result.touchPanelId = touchPanelId;
    }
    if (curtainSwitcherId != null) {
      _result.curtainSwitcherId = curtainSwitcherId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (connectionState != null) {
      _result.connectionState = connectionState;
    }
    return _result;
  }
  factory TouchPanelUpdateCurtainSwitcherClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TouchPanelUpdateCurtainSwitcherClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TouchPanelUpdateCurtainSwitcherClientRequest clone() => TouchPanelUpdateCurtainSwitcherClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TouchPanelUpdateCurtainSwitcherClientRequest copyWith(void Function(TouchPanelUpdateCurtainSwitcherClientRequest) updates) => super.copyWith((message) => updates(message as TouchPanelUpdateCurtainSwitcherClientRequest)) as TouchPanelUpdateCurtainSwitcherClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TouchPanelUpdateCurtainSwitcherClientRequest create() => TouchPanelUpdateCurtainSwitcherClientRequest._();
  TouchPanelUpdateCurtainSwitcherClientRequest createEmptyInstance() => create();
  static $pb.PbList<TouchPanelUpdateCurtainSwitcherClientRequest> createRepeated() => $pb.PbList<TouchPanelUpdateCurtainSwitcherClientRequest>();
  @$core.pragma('dart2js:noInline')
  static TouchPanelUpdateCurtainSwitcherClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TouchPanelUpdateCurtainSwitcherClientRequest>(create);
  static TouchPanelUpdateCurtainSwitcherClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get touchPanelId => $_getSZ(0);
  @$pb.TagNumber(1)
  set touchPanelId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTouchPanelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTouchPanelId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get curtainSwitcherId => $_getSZ(1);
  @$pb.TagNumber(2)
  set curtainSwitcherId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurtainSwitcherId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurtainSwitcherId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $0.ConnectionState get connectionState => $_getN(3);
  @$pb.TagNumber(4)
  set connectionState($0.ConnectionState v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasConnectionState() => $_has(3);
  @$pb.TagNumber(4)
  void clearConnectionState() => clearField(4);
}

class TouchPanelUpdateSceneClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TouchPanelUpdateSceneClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelId', protoName: 'touchPanelId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneId', protoName: 'sceneId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  TouchPanelUpdateSceneClientRequest._() : super();
  factory TouchPanelUpdateSceneClientRequest({
    $core.String? touchPanelId,
    $core.String? sceneId,
    $core.String? name,
  }) {
    final _result = create();
    if (touchPanelId != null) {
      _result.touchPanelId = touchPanelId;
    }
    if (sceneId != null) {
      _result.sceneId = sceneId;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory TouchPanelUpdateSceneClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TouchPanelUpdateSceneClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TouchPanelUpdateSceneClientRequest clone() => TouchPanelUpdateSceneClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TouchPanelUpdateSceneClientRequest copyWith(void Function(TouchPanelUpdateSceneClientRequest) updates) => super.copyWith((message) => updates(message as TouchPanelUpdateSceneClientRequest)) as TouchPanelUpdateSceneClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TouchPanelUpdateSceneClientRequest create() => TouchPanelUpdateSceneClientRequest._();
  TouchPanelUpdateSceneClientRequest createEmptyInstance() => create();
  static $pb.PbList<TouchPanelUpdateSceneClientRequest> createRepeated() => $pb.PbList<TouchPanelUpdateSceneClientRequest>();
  @$core.pragma('dart2js:noInline')
  static TouchPanelUpdateSceneClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TouchPanelUpdateSceneClientRequest>(create);
  static TouchPanelUpdateSceneClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get touchPanelId => $_getSZ(0);
  @$pb.TagNumber(1)
  set touchPanelId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTouchPanelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTouchPanelId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sceneId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sceneId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSceneId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSceneId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);
}

class TouchPanelControlLedDriverClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TouchPanelControlLedDriverClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelId', protoName: 'touchPanelId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ledDriverId', protoName: 'ledDriverId')
    ..e<$0.PowerState>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: $0.PowerState.Off, valueOf: $0.PowerState.valueOf, enumValues: $0.PowerState.values)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'brightnessPercent', $pb.PbFieldType.O3, protoName: 'brightnessPercent')
    ..hasRequiredFields = false
  ;

  TouchPanelControlLedDriverClientRequest._() : super();
  factory TouchPanelControlLedDriverClientRequest({
    $core.String? touchPanelId,
    $core.String? ledDriverId,
    $0.PowerState? powerState,
    $core.int? brightnessPercent,
  }) {
    final _result = create();
    if (touchPanelId != null) {
      _result.touchPanelId = touchPanelId;
    }
    if (ledDriverId != null) {
      _result.ledDriverId = ledDriverId;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (brightnessPercent != null) {
      _result.brightnessPercent = brightnessPercent;
    }
    return _result;
  }
  factory TouchPanelControlLedDriverClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TouchPanelControlLedDriverClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TouchPanelControlLedDriverClientRequest clone() => TouchPanelControlLedDriverClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TouchPanelControlLedDriverClientRequest copyWith(void Function(TouchPanelControlLedDriverClientRequest) updates) => super.copyWith((message) => updates(message as TouchPanelControlLedDriverClientRequest)) as TouchPanelControlLedDriverClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TouchPanelControlLedDriverClientRequest create() => TouchPanelControlLedDriverClientRequest._();
  TouchPanelControlLedDriverClientRequest createEmptyInstance() => create();
  static $pb.PbList<TouchPanelControlLedDriverClientRequest> createRepeated() => $pb.PbList<TouchPanelControlLedDriverClientRequest>();
  @$core.pragma('dart2js:noInline')
  static TouchPanelControlLedDriverClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TouchPanelControlLedDriverClientRequest>(create);
  static TouchPanelControlLedDriverClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get touchPanelId => $_getSZ(0);
  @$pb.TagNumber(1)
  set touchPanelId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTouchPanelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTouchPanelId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get ledDriverId => $_getSZ(1);
  @$pb.TagNumber(2)
  set ledDriverId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLedDriverId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLedDriverId() => clearField(2);

  @$pb.TagNumber(3)
  $0.PowerState get powerState => $_getN(2);
  @$pb.TagNumber(3)
  set powerState($0.PowerState v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPowerState() => $_has(2);
  @$pb.TagNumber(3)
  void clearPowerState() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get brightnessPercent => $_getIZ(3);
  @$pb.TagNumber(4)
  set brightnessPercent($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBrightnessPercent() => $_has(3);
  @$pb.TagNumber(4)
  void clearBrightnessPercent() => clearField(4);
}

class TouchPanelUpdateLedDriverClientRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TouchPanelUpdateLedDriverClientRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelId', protoName: 'touchPanelId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ledDriverId', protoName: 'ledDriverId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..e<$0.ConnectionState>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'connectionState', $pb.PbFieldType.OE, protoName: 'connectionState', defaultOrMaker: $0.ConnectionState.Offline, valueOf: $0.ConnectionState.valueOf, enumValues: $0.ConnectionState.values)
    ..hasRequiredFields = false
  ;

  TouchPanelUpdateLedDriverClientRequest._() : super();
  factory TouchPanelUpdateLedDriverClientRequest({
    $core.String? touchPanelId,
    $core.String? ledDriverId,
    $core.String? name,
    $0.ConnectionState? connectionState,
  }) {
    final _result = create();
    if (touchPanelId != null) {
      _result.touchPanelId = touchPanelId;
    }
    if (ledDriverId != null) {
      _result.ledDriverId = ledDriverId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (connectionState != null) {
      _result.connectionState = connectionState;
    }
    return _result;
  }
  factory TouchPanelUpdateLedDriverClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TouchPanelUpdateLedDriverClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TouchPanelUpdateLedDriverClientRequest clone() => TouchPanelUpdateLedDriverClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TouchPanelUpdateLedDriverClientRequest copyWith(void Function(TouchPanelUpdateLedDriverClientRequest) updates) => super.copyWith((message) => updates(message as TouchPanelUpdateLedDriverClientRequest)) as TouchPanelUpdateLedDriverClientRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TouchPanelUpdateLedDriverClientRequest create() => TouchPanelUpdateLedDriverClientRequest._();
  TouchPanelUpdateLedDriverClientRequest createEmptyInstance() => create();
  static $pb.PbList<TouchPanelUpdateLedDriverClientRequest> createRepeated() => $pb.PbList<TouchPanelUpdateLedDriverClientRequest>();
  @$core.pragma('dart2js:noInline')
  static TouchPanelUpdateLedDriverClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TouchPanelUpdateLedDriverClientRequest>(create);
  static TouchPanelUpdateLedDriverClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get touchPanelId => $_getSZ(0);
  @$pb.TagNumber(1)
  set touchPanelId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTouchPanelId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTouchPanelId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get ledDriverId => $_getSZ(1);
  @$pb.TagNumber(2)
  set ledDriverId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLedDriverId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLedDriverId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $0.ConnectionState get connectionState => $_getN(3);
  @$pb.TagNumber(4)
  set connectionState($0.ConnectionState v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasConnectionState() => $_has(3);
  @$pb.TagNumber(4)
  void clearConnectionState() => clearField(4);
}

class DeviceClientMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeviceClientMessage', createEmptyInstance: create)
    ..aOM<ForceUpdateFirmwareDeviceClientRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'forceUpdateFirmwareDeviceClientRequest', protoName: 'forceUpdateFirmwareDeviceClientRequest', subBuilder: ForceUpdateFirmwareDeviceClientRequest.create)
    ..aOM<ForceUpdateFirmwareDeviceClientResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'forceUpdateFirmwareDeviceClientResponse', protoName: 'forceUpdateFirmwareDeviceClientResponse', subBuilder: ForceUpdateFirmwareDeviceClientResponse.create)
    ..aOM<UpdateDeviceClientRequest>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateDeviceClientRequest', protoName: 'updateDeviceClientRequest', subBuilder: UpdateDeviceClientRequest.create)
    ..aOM<UpdateDeviceClientResponse>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateDeviceClientResponse', protoName: 'updateDeviceClientResponse', subBuilder: UpdateDeviceClientResponse.create)
    ..aOM<UpdateWSEndpointClientRequest>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateWSEndpointClientRequest', protoName: 'updateWSEndpointClientRequest', subBuilder: UpdateWSEndpointClientRequest.create)
    ..aOM<UpdateWSEndpointClientResponse>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateWSEndpointClientResponse', protoName: 'updateWSEndpointClientResponse', subBuilder: UpdateWSEndpointClientResponse.create)
    ..aOM<DeleteDeviceClientRequest>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deleteDeviceClientRequest', protoName: 'deleteDeviceClientRequest', subBuilder: DeleteDeviceClientRequest.create)
    ..aOM<DeleteDeviceClientResponse>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deleteDeviceClientResponse', protoName: 'deleteDeviceClientResponse', subBuilder: DeleteDeviceClientResponse.create)
    ..hasRequiredFields = false
  ;

  DeviceClientMessage._() : super();
  factory DeviceClientMessage({
    ForceUpdateFirmwareDeviceClientRequest? forceUpdateFirmwareDeviceClientRequest,
    ForceUpdateFirmwareDeviceClientResponse? forceUpdateFirmwareDeviceClientResponse,
    UpdateDeviceClientRequest? updateDeviceClientRequest,
    UpdateDeviceClientResponse? updateDeviceClientResponse,
    UpdateWSEndpointClientRequest? updateWSEndpointClientRequest,
    UpdateWSEndpointClientResponse? updateWSEndpointClientResponse,
    DeleteDeviceClientRequest? deleteDeviceClientRequest,
    DeleteDeviceClientResponse? deleteDeviceClientResponse,
  }) {
    final _result = create();
    if (forceUpdateFirmwareDeviceClientRequest != null) {
      _result.forceUpdateFirmwareDeviceClientRequest = forceUpdateFirmwareDeviceClientRequest;
    }
    if (forceUpdateFirmwareDeviceClientResponse != null) {
      _result.forceUpdateFirmwareDeviceClientResponse = forceUpdateFirmwareDeviceClientResponse;
    }
    if (updateDeviceClientRequest != null) {
      _result.updateDeviceClientRequest = updateDeviceClientRequest;
    }
    if (updateDeviceClientResponse != null) {
      _result.updateDeviceClientResponse = updateDeviceClientResponse;
    }
    if (updateWSEndpointClientRequest != null) {
      _result.updateWSEndpointClientRequest = updateWSEndpointClientRequest;
    }
    if (updateWSEndpointClientResponse != null) {
      _result.updateWSEndpointClientResponse = updateWSEndpointClientResponse;
    }
    if (deleteDeviceClientRequest != null) {
      _result.deleteDeviceClientRequest = deleteDeviceClientRequest;
    }
    if (deleteDeviceClientResponse != null) {
      _result.deleteDeviceClientResponse = deleteDeviceClientResponse;
    }
    return _result;
  }
  factory DeviceClientMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeviceClientMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeviceClientMessage clone() => DeviceClientMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeviceClientMessage copyWith(void Function(DeviceClientMessage) updates) => super.copyWith((message) => updates(message as DeviceClientMessage)) as DeviceClientMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeviceClientMessage create() => DeviceClientMessage._();
  DeviceClientMessage createEmptyInstance() => create();
  static $pb.PbList<DeviceClientMessage> createRepeated() => $pb.PbList<DeviceClientMessage>();
  @$core.pragma('dart2js:noInline')
  static DeviceClientMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeviceClientMessage>(create);
  static DeviceClientMessage? _defaultInstance;

  @$pb.TagNumber(1)
  ForceUpdateFirmwareDeviceClientRequest get forceUpdateFirmwareDeviceClientRequest => $_getN(0);
  @$pb.TagNumber(1)
  set forceUpdateFirmwareDeviceClientRequest(ForceUpdateFirmwareDeviceClientRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasForceUpdateFirmwareDeviceClientRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearForceUpdateFirmwareDeviceClientRequest() => clearField(1);
  @$pb.TagNumber(1)
  ForceUpdateFirmwareDeviceClientRequest ensureForceUpdateFirmwareDeviceClientRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  ForceUpdateFirmwareDeviceClientResponse get forceUpdateFirmwareDeviceClientResponse => $_getN(1);
  @$pb.TagNumber(2)
  set forceUpdateFirmwareDeviceClientResponse(ForceUpdateFirmwareDeviceClientResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasForceUpdateFirmwareDeviceClientResponse() => $_has(1);
  @$pb.TagNumber(2)
  void clearForceUpdateFirmwareDeviceClientResponse() => clearField(2);
  @$pb.TagNumber(2)
  ForceUpdateFirmwareDeviceClientResponse ensureForceUpdateFirmwareDeviceClientResponse() => $_ensure(1);

  @$pb.TagNumber(3)
  UpdateDeviceClientRequest get updateDeviceClientRequest => $_getN(2);
  @$pb.TagNumber(3)
  set updateDeviceClientRequest(UpdateDeviceClientRequest v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasUpdateDeviceClientRequest() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdateDeviceClientRequest() => clearField(3);
  @$pb.TagNumber(3)
  UpdateDeviceClientRequest ensureUpdateDeviceClientRequest() => $_ensure(2);

  @$pb.TagNumber(4)
  UpdateDeviceClientResponse get updateDeviceClientResponse => $_getN(3);
  @$pb.TagNumber(4)
  set updateDeviceClientResponse(UpdateDeviceClientResponse v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasUpdateDeviceClientResponse() => $_has(3);
  @$pb.TagNumber(4)
  void clearUpdateDeviceClientResponse() => clearField(4);
  @$pb.TagNumber(4)
  UpdateDeviceClientResponse ensureUpdateDeviceClientResponse() => $_ensure(3);

  @$pb.TagNumber(5)
  UpdateWSEndpointClientRequest get updateWSEndpointClientRequest => $_getN(4);
  @$pb.TagNumber(5)
  set updateWSEndpointClientRequest(UpdateWSEndpointClientRequest v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasUpdateWSEndpointClientRequest() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdateWSEndpointClientRequest() => clearField(5);
  @$pb.TagNumber(5)
  UpdateWSEndpointClientRequest ensureUpdateWSEndpointClientRequest() => $_ensure(4);

  @$pb.TagNumber(6)
  UpdateWSEndpointClientResponse get updateWSEndpointClientResponse => $_getN(5);
  @$pb.TagNumber(6)
  set updateWSEndpointClientResponse(UpdateWSEndpointClientResponse v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasUpdateWSEndpointClientResponse() => $_has(5);
  @$pb.TagNumber(6)
  void clearUpdateWSEndpointClientResponse() => clearField(6);
  @$pb.TagNumber(6)
  UpdateWSEndpointClientResponse ensureUpdateWSEndpointClientResponse() => $_ensure(5);

  @$pb.TagNumber(7)
  DeleteDeviceClientRequest get deleteDeviceClientRequest => $_getN(6);
  @$pb.TagNumber(7)
  set deleteDeviceClientRequest(DeleteDeviceClientRequest v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasDeleteDeviceClientRequest() => $_has(6);
  @$pb.TagNumber(7)
  void clearDeleteDeviceClientRequest() => clearField(7);
  @$pb.TagNumber(7)
  DeleteDeviceClientRequest ensureDeleteDeviceClientRequest() => $_ensure(6);

  @$pb.TagNumber(8)
  DeleteDeviceClientResponse get deleteDeviceClientResponse => $_getN(7);
  @$pb.TagNumber(8)
  set deleteDeviceClientResponse(DeleteDeviceClientResponse v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasDeleteDeviceClientResponse() => $_has(7);
  @$pb.TagNumber(8)
  void clearDeleteDeviceClientResponse() => clearField(8);
  @$pb.TagNumber(8)
  DeleteDeviceClientResponse ensureDeleteDeviceClientResponse() => $_ensure(7);
}

class SwitcherClientMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SwitcherClientMessage', createEmptyInstance: create)
    ..aOM<GetSwitchersClientRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'getSwitchersClientRequest', protoName: 'getSwitchersClientRequest', subBuilder: GetSwitchersClientRequest.create)
    ..aOM<GetSwitchersClientResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'getSwitchersClientResponse', protoName: 'getSwitchersClientResponse', subBuilder: GetSwitchersClientResponse.create)
    ..aOM<GetSwitcherClientRequest>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'getSwitcherClientRequest', protoName: 'getSwitcherClientRequest', subBuilder: GetSwitcherClientRequest.create)
    ..aOM<GetSwitcherClientResponse>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'getSwitcherClientResponse', protoName: 'getSwitcherClientResponse', subBuilder: GetSwitcherClientResponse.create)
    ..aOM<GetLogSwitcherClientRequest>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'getLogSwitcherClientRequest', protoName: 'getLogSwitcherClientRequest', subBuilder: GetLogSwitcherClientRequest.create)
    ..aOM<GetLogSwitcherClientResponse>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'getLogSwitcherClientResponse', protoName: 'getLogSwitcherClientResponse', subBuilder: GetLogSwitcherClientResponse.create)
    ..aOM<SwitcherClientRequest>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcherClientRequest', protoName: 'switcherClientRequest', subBuilder: SwitcherClientRequest.create)
    ..aOM<SwitcherClientResponse>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcherClientResponse', protoName: 'switcherClientResponse', subBuilder: SwitcherClientResponse.create)
    ..aOM<AddSwitcherScheduleClientRequest>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'addSwitcherScheduleClientRequest', protoName: 'addSwitcherScheduleClientRequest', subBuilder: AddSwitcherScheduleClientRequest.create)
    ..aOM<AddSwitcherScheduleClientResponse>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'addSwitcherScheduleClientResponse', protoName: 'addSwitcherScheduleClientResponse', subBuilder: AddSwitcherScheduleClientResponse.create)
    ..aOM<UpdateSwitcherScheduleClientRequest>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateSwitcherScheduleClientRequest', protoName: 'updateSwitcherScheduleClientRequest', subBuilder: UpdateSwitcherScheduleClientRequest.create)
    ..aOM<UpdateSwitcherScheduleClientResponse>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateSwitcherScheduleClientResponse', protoName: 'updateSwitcherScheduleClientResponse', subBuilder: UpdateSwitcherScheduleClientResponse.create)
    ..aOM<DeleteSwitcherScheduleClientRequest>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deleteSwitcherScheduleClientRequest', protoName: 'deleteSwitcherScheduleClientRequest', subBuilder: DeleteSwitcherScheduleClientRequest.create)
    ..aOM<DeleteSwitcherScheduleClientResponse>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deleteSwitcherScheduleClientResponse', protoName: 'deleteSwitcherScheduleClientResponse', subBuilder: DeleteSwitcherScheduleClientResponse.create)
    ..aOM<UpdateSwitcherClientRequest>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateSwitcherClientRequest', protoName: 'updateSwitcherClientRequest', subBuilder: UpdateSwitcherClientRequest.create)
    ..aOM<UpdateSwitcherClientResponse>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateSwitcherClientResponse', protoName: 'updateSwitcherClientResponse', subBuilder: UpdateSwitcherClientResponse.create)
    ..aOM<UpdateSwitcherState>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateSwitcherState', protoName: 'updateSwitcherState', subBuilder: UpdateSwitcherState.create)
    ..hasRequiredFields = false
  ;

  SwitcherClientMessage._() : super();
  factory SwitcherClientMessage({
    GetSwitchersClientRequest? getSwitchersClientRequest,
    GetSwitchersClientResponse? getSwitchersClientResponse,
    GetSwitcherClientRequest? getSwitcherClientRequest,
    GetSwitcherClientResponse? getSwitcherClientResponse,
    GetLogSwitcherClientRequest? getLogSwitcherClientRequest,
    GetLogSwitcherClientResponse? getLogSwitcherClientResponse,
    SwitcherClientRequest? switcherClientRequest,
    SwitcherClientResponse? switcherClientResponse,
    AddSwitcherScheduleClientRequest? addSwitcherScheduleClientRequest,
    AddSwitcherScheduleClientResponse? addSwitcherScheduleClientResponse,
    UpdateSwitcherScheduleClientRequest? updateSwitcherScheduleClientRequest,
    UpdateSwitcherScheduleClientResponse? updateSwitcherScheduleClientResponse,
    DeleteSwitcherScheduleClientRequest? deleteSwitcherScheduleClientRequest,
    DeleteSwitcherScheduleClientResponse? deleteSwitcherScheduleClientResponse,
    UpdateSwitcherClientRequest? updateSwitcherClientRequest,
    UpdateSwitcherClientResponse? updateSwitcherClientResponse,
    UpdateSwitcherState? updateSwitcherState,
  }) {
    final _result = create();
    if (getSwitchersClientRequest != null) {
      _result.getSwitchersClientRequest = getSwitchersClientRequest;
    }
    if (getSwitchersClientResponse != null) {
      _result.getSwitchersClientResponse = getSwitchersClientResponse;
    }
    if (getSwitcherClientRequest != null) {
      _result.getSwitcherClientRequest = getSwitcherClientRequest;
    }
    if (getSwitcherClientResponse != null) {
      _result.getSwitcherClientResponse = getSwitcherClientResponse;
    }
    if (getLogSwitcherClientRequest != null) {
      _result.getLogSwitcherClientRequest = getLogSwitcherClientRequest;
    }
    if (getLogSwitcherClientResponse != null) {
      _result.getLogSwitcherClientResponse = getLogSwitcherClientResponse;
    }
    if (switcherClientRequest != null) {
      _result.switcherClientRequest = switcherClientRequest;
    }
    if (switcherClientResponse != null) {
      _result.switcherClientResponse = switcherClientResponse;
    }
    if (addSwitcherScheduleClientRequest != null) {
      _result.addSwitcherScheduleClientRequest = addSwitcherScheduleClientRequest;
    }
    if (addSwitcherScheduleClientResponse != null) {
      _result.addSwitcherScheduleClientResponse = addSwitcherScheduleClientResponse;
    }
    if (updateSwitcherScheduleClientRequest != null) {
      _result.updateSwitcherScheduleClientRequest = updateSwitcherScheduleClientRequest;
    }
    if (updateSwitcherScheduleClientResponse != null) {
      _result.updateSwitcherScheduleClientResponse = updateSwitcherScheduleClientResponse;
    }
    if (deleteSwitcherScheduleClientRequest != null) {
      _result.deleteSwitcherScheduleClientRequest = deleteSwitcherScheduleClientRequest;
    }
    if (deleteSwitcherScheduleClientResponse != null) {
      _result.deleteSwitcherScheduleClientResponse = deleteSwitcherScheduleClientResponse;
    }
    if (updateSwitcherClientRequest != null) {
      _result.updateSwitcherClientRequest = updateSwitcherClientRequest;
    }
    if (updateSwitcherClientResponse != null) {
      _result.updateSwitcherClientResponse = updateSwitcherClientResponse;
    }
    if (updateSwitcherState != null) {
      _result.updateSwitcherState = updateSwitcherState;
    }
    return _result;
  }
  factory SwitcherClientMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SwitcherClientMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SwitcherClientMessage clone() => SwitcherClientMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SwitcherClientMessage copyWith(void Function(SwitcherClientMessage) updates) => super.copyWith((message) => updates(message as SwitcherClientMessage)) as SwitcherClientMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SwitcherClientMessage create() => SwitcherClientMessage._();
  SwitcherClientMessage createEmptyInstance() => create();
  static $pb.PbList<SwitcherClientMessage> createRepeated() => $pb.PbList<SwitcherClientMessage>();
  @$core.pragma('dart2js:noInline')
  static SwitcherClientMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SwitcherClientMessage>(create);
  static SwitcherClientMessage? _defaultInstance;

  @$pb.TagNumber(1)
  GetSwitchersClientRequest get getSwitchersClientRequest => $_getN(0);
  @$pb.TagNumber(1)
  set getSwitchersClientRequest(GetSwitchersClientRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGetSwitchersClientRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearGetSwitchersClientRequest() => clearField(1);
  @$pb.TagNumber(1)
  GetSwitchersClientRequest ensureGetSwitchersClientRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  GetSwitchersClientResponse get getSwitchersClientResponse => $_getN(1);
  @$pb.TagNumber(2)
  set getSwitchersClientResponse(GetSwitchersClientResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasGetSwitchersClientResponse() => $_has(1);
  @$pb.TagNumber(2)
  void clearGetSwitchersClientResponse() => clearField(2);
  @$pb.TagNumber(2)
  GetSwitchersClientResponse ensureGetSwitchersClientResponse() => $_ensure(1);

  @$pb.TagNumber(3)
  GetSwitcherClientRequest get getSwitcherClientRequest => $_getN(2);
  @$pb.TagNumber(3)
  set getSwitcherClientRequest(GetSwitcherClientRequest v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasGetSwitcherClientRequest() => $_has(2);
  @$pb.TagNumber(3)
  void clearGetSwitcherClientRequest() => clearField(3);
  @$pb.TagNumber(3)
  GetSwitcherClientRequest ensureGetSwitcherClientRequest() => $_ensure(2);

  @$pb.TagNumber(4)
  GetSwitcherClientResponse get getSwitcherClientResponse => $_getN(3);
  @$pb.TagNumber(4)
  set getSwitcherClientResponse(GetSwitcherClientResponse v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasGetSwitcherClientResponse() => $_has(3);
  @$pb.TagNumber(4)
  void clearGetSwitcherClientResponse() => clearField(4);
  @$pb.TagNumber(4)
  GetSwitcherClientResponse ensureGetSwitcherClientResponse() => $_ensure(3);

  @$pb.TagNumber(5)
  GetLogSwitcherClientRequest get getLogSwitcherClientRequest => $_getN(4);
  @$pb.TagNumber(5)
  set getLogSwitcherClientRequest(GetLogSwitcherClientRequest v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasGetLogSwitcherClientRequest() => $_has(4);
  @$pb.TagNumber(5)
  void clearGetLogSwitcherClientRequest() => clearField(5);
  @$pb.TagNumber(5)
  GetLogSwitcherClientRequest ensureGetLogSwitcherClientRequest() => $_ensure(4);

  @$pb.TagNumber(6)
  GetLogSwitcherClientResponse get getLogSwitcherClientResponse => $_getN(5);
  @$pb.TagNumber(6)
  set getLogSwitcherClientResponse(GetLogSwitcherClientResponse v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasGetLogSwitcherClientResponse() => $_has(5);
  @$pb.TagNumber(6)
  void clearGetLogSwitcherClientResponse() => clearField(6);
  @$pb.TagNumber(6)
  GetLogSwitcherClientResponse ensureGetLogSwitcherClientResponse() => $_ensure(5);

  @$pb.TagNumber(7)
  SwitcherClientRequest get switcherClientRequest => $_getN(6);
  @$pb.TagNumber(7)
  set switcherClientRequest(SwitcherClientRequest v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasSwitcherClientRequest() => $_has(6);
  @$pb.TagNumber(7)
  void clearSwitcherClientRequest() => clearField(7);
  @$pb.TagNumber(7)
  SwitcherClientRequest ensureSwitcherClientRequest() => $_ensure(6);

  @$pb.TagNumber(8)
  SwitcherClientResponse get switcherClientResponse => $_getN(7);
  @$pb.TagNumber(8)
  set switcherClientResponse(SwitcherClientResponse v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasSwitcherClientResponse() => $_has(7);
  @$pb.TagNumber(8)
  void clearSwitcherClientResponse() => clearField(8);
  @$pb.TagNumber(8)
  SwitcherClientResponse ensureSwitcherClientResponse() => $_ensure(7);

  @$pb.TagNumber(9)
  AddSwitcherScheduleClientRequest get addSwitcherScheduleClientRequest => $_getN(8);
  @$pb.TagNumber(9)
  set addSwitcherScheduleClientRequest(AddSwitcherScheduleClientRequest v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasAddSwitcherScheduleClientRequest() => $_has(8);
  @$pb.TagNumber(9)
  void clearAddSwitcherScheduleClientRequest() => clearField(9);
  @$pb.TagNumber(9)
  AddSwitcherScheduleClientRequest ensureAddSwitcherScheduleClientRequest() => $_ensure(8);

  @$pb.TagNumber(10)
  AddSwitcherScheduleClientResponse get addSwitcherScheduleClientResponse => $_getN(9);
  @$pb.TagNumber(10)
  set addSwitcherScheduleClientResponse(AddSwitcherScheduleClientResponse v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasAddSwitcherScheduleClientResponse() => $_has(9);
  @$pb.TagNumber(10)
  void clearAddSwitcherScheduleClientResponse() => clearField(10);
  @$pb.TagNumber(10)
  AddSwitcherScheduleClientResponse ensureAddSwitcherScheduleClientResponse() => $_ensure(9);

  @$pb.TagNumber(11)
  UpdateSwitcherScheduleClientRequest get updateSwitcherScheduleClientRequest => $_getN(10);
  @$pb.TagNumber(11)
  set updateSwitcherScheduleClientRequest(UpdateSwitcherScheduleClientRequest v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasUpdateSwitcherScheduleClientRequest() => $_has(10);
  @$pb.TagNumber(11)
  void clearUpdateSwitcherScheduleClientRequest() => clearField(11);
  @$pb.TagNumber(11)
  UpdateSwitcherScheduleClientRequest ensureUpdateSwitcherScheduleClientRequest() => $_ensure(10);

  @$pb.TagNumber(12)
  UpdateSwitcherScheduleClientResponse get updateSwitcherScheduleClientResponse => $_getN(11);
  @$pb.TagNumber(12)
  set updateSwitcherScheduleClientResponse(UpdateSwitcherScheduleClientResponse v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasUpdateSwitcherScheduleClientResponse() => $_has(11);
  @$pb.TagNumber(12)
  void clearUpdateSwitcherScheduleClientResponse() => clearField(12);
  @$pb.TagNumber(12)
  UpdateSwitcherScheduleClientResponse ensureUpdateSwitcherScheduleClientResponse() => $_ensure(11);

  @$pb.TagNumber(13)
  DeleteSwitcherScheduleClientRequest get deleteSwitcherScheduleClientRequest => $_getN(12);
  @$pb.TagNumber(13)
  set deleteSwitcherScheduleClientRequest(DeleteSwitcherScheduleClientRequest v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasDeleteSwitcherScheduleClientRequest() => $_has(12);
  @$pb.TagNumber(13)
  void clearDeleteSwitcherScheduleClientRequest() => clearField(13);
  @$pb.TagNumber(13)
  DeleteSwitcherScheduleClientRequest ensureDeleteSwitcherScheduleClientRequest() => $_ensure(12);

  @$pb.TagNumber(14)
  DeleteSwitcherScheduleClientResponse get deleteSwitcherScheduleClientResponse => $_getN(13);
  @$pb.TagNumber(14)
  set deleteSwitcherScheduleClientResponse(DeleteSwitcherScheduleClientResponse v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasDeleteSwitcherScheduleClientResponse() => $_has(13);
  @$pb.TagNumber(14)
  void clearDeleteSwitcherScheduleClientResponse() => clearField(14);
  @$pb.TagNumber(14)
  DeleteSwitcherScheduleClientResponse ensureDeleteSwitcherScheduleClientResponse() => $_ensure(13);

  @$pb.TagNumber(15)
  UpdateSwitcherClientRequest get updateSwitcherClientRequest => $_getN(14);
  @$pb.TagNumber(15)
  set updateSwitcherClientRequest(UpdateSwitcherClientRequest v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasUpdateSwitcherClientRequest() => $_has(14);
  @$pb.TagNumber(15)
  void clearUpdateSwitcherClientRequest() => clearField(15);
  @$pb.TagNumber(15)
  UpdateSwitcherClientRequest ensureUpdateSwitcherClientRequest() => $_ensure(14);

  @$pb.TagNumber(16)
  UpdateSwitcherClientResponse get updateSwitcherClientResponse => $_getN(15);
  @$pb.TagNumber(16)
  set updateSwitcherClientResponse(UpdateSwitcherClientResponse v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasUpdateSwitcherClientResponse() => $_has(15);
  @$pb.TagNumber(16)
  void clearUpdateSwitcherClientResponse() => clearField(16);
  @$pb.TagNumber(16)
  UpdateSwitcherClientResponse ensureUpdateSwitcherClientResponse() => $_ensure(15);

  @$pb.TagNumber(17)
  UpdateSwitcherState get updateSwitcherState => $_getN(16);
  @$pb.TagNumber(17)
  set updateSwitcherState(UpdateSwitcherState v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasUpdateSwitcherState() => $_has(16);
  @$pb.TagNumber(17)
  void clearUpdateSwitcherState() => clearField(17);
  @$pb.TagNumber(17)
  UpdateSwitcherState ensureUpdateSwitcherState() => $_ensure(16);
}

class CurtainSwitcherClientMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CurtainSwitcherClientMessage', createEmptyInstance: create)
    ..aOM<CurtainSwitcherClientRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainSwitcherClientRequest', protoName: 'curtainSwitcherClientRequest', subBuilder: CurtainSwitcherClientRequest.create)
    ..aOM<CurtainSwitcherClientResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainSwitcherClientResponse', protoName: 'curtainSwitcherClientResponse', subBuilder: CurtainSwitcherClientResponse.create)
    ..aOM<AddCurtainSwitcherScheduleClientRequest>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'addCurtainSwitcherScheduleClientRequest', protoName: 'addCurtainSwitcherScheduleClientRequest', subBuilder: AddCurtainSwitcherScheduleClientRequest.create)
    ..aOM<AddCurtainSwitcherScheduleClientResponse>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'addCurtainSwitcherScheduleClientResponse', protoName: 'addCurtainSwitcherScheduleClientResponse', subBuilder: AddCurtainSwitcherScheduleClientResponse.create)
    ..aOM<UpdateCurtainSwitcherScheduleClientRequest>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateCurtainSwitcherScheduleClientRequest', protoName: 'updateCurtainSwitcherScheduleClientRequest', subBuilder: UpdateCurtainSwitcherScheduleClientRequest.create)
    ..aOM<UpdateCurtainSwitcherScheduleClientResponse>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateCurtainSwitcherScheduleClientResponse', protoName: 'updateCurtainSwitcherScheduleClientResponse', subBuilder: UpdateCurtainSwitcherScheduleClientResponse.create)
    ..aOM<DeleteCurtainSwitcherScheduleClientRequest>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deleteCurtainSwitcherScheduleClientRequest', protoName: 'deleteCurtainSwitcherScheduleClientRequest', subBuilder: DeleteCurtainSwitcherScheduleClientRequest.create)
    ..aOM<DeleteCurtainSwitcherScheduleClientResponse>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deleteCurtainSwitcherScheduleClientResponse', protoName: 'deleteCurtainSwitcherScheduleClientResponse', subBuilder: DeleteCurtainSwitcherScheduleClientResponse.create)
    ..hasRequiredFields = false
  ;

  CurtainSwitcherClientMessage._() : super();
  factory CurtainSwitcherClientMessage({
    CurtainSwitcherClientRequest? curtainSwitcherClientRequest,
    CurtainSwitcherClientResponse? curtainSwitcherClientResponse,
    AddCurtainSwitcherScheduleClientRequest? addCurtainSwitcherScheduleClientRequest,
    AddCurtainSwitcherScheduleClientResponse? addCurtainSwitcherScheduleClientResponse,
    UpdateCurtainSwitcherScheduleClientRequest? updateCurtainSwitcherScheduleClientRequest,
    UpdateCurtainSwitcherScheduleClientResponse? updateCurtainSwitcherScheduleClientResponse,
    DeleteCurtainSwitcherScheduleClientRequest? deleteCurtainSwitcherScheduleClientRequest,
    DeleteCurtainSwitcherScheduleClientResponse? deleteCurtainSwitcherScheduleClientResponse,
  }) {
    final _result = create();
    if (curtainSwitcherClientRequest != null) {
      _result.curtainSwitcherClientRequest = curtainSwitcherClientRequest;
    }
    if (curtainSwitcherClientResponse != null) {
      _result.curtainSwitcherClientResponse = curtainSwitcherClientResponse;
    }
    if (addCurtainSwitcherScheduleClientRequest != null) {
      _result.addCurtainSwitcherScheduleClientRequest = addCurtainSwitcherScheduleClientRequest;
    }
    if (addCurtainSwitcherScheduleClientResponse != null) {
      _result.addCurtainSwitcherScheduleClientResponse = addCurtainSwitcherScheduleClientResponse;
    }
    if (updateCurtainSwitcherScheduleClientRequest != null) {
      _result.updateCurtainSwitcherScheduleClientRequest = updateCurtainSwitcherScheduleClientRequest;
    }
    if (updateCurtainSwitcherScheduleClientResponse != null) {
      _result.updateCurtainSwitcherScheduleClientResponse = updateCurtainSwitcherScheduleClientResponse;
    }
    if (deleteCurtainSwitcherScheduleClientRequest != null) {
      _result.deleteCurtainSwitcherScheduleClientRequest = deleteCurtainSwitcherScheduleClientRequest;
    }
    if (deleteCurtainSwitcherScheduleClientResponse != null) {
      _result.deleteCurtainSwitcherScheduleClientResponse = deleteCurtainSwitcherScheduleClientResponse;
    }
    return _result;
  }
  factory CurtainSwitcherClientMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CurtainSwitcherClientMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CurtainSwitcherClientMessage clone() => CurtainSwitcherClientMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CurtainSwitcherClientMessage copyWith(void Function(CurtainSwitcherClientMessage) updates) => super.copyWith((message) => updates(message as CurtainSwitcherClientMessage)) as CurtainSwitcherClientMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CurtainSwitcherClientMessage create() => CurtainSwitcherClientMessage._();
  CurtainSwitcherClientMessage createEmptyInstance() => create();
  static $pb.PbList<CurtainSwitcherClientMessage> createRepeated() => $pb.PbList<CurtainSwitcherClientMessage>();
  @$core.pragma('dart2js:noInline')
  static CurtainSwitcherClientMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CurtainSwitcherClientMessage>(create);
  static CurtainSwitcherClientMessage? _defaultInstance;

  @$pb.TagNumber(1)
  CurtainSwitcherClientRequest get curtainSwitcherClientRequest => $_getN(0);
  @$pb.TagNumber(1)
  set curtainSwitcherClientRequest(CurtainSwitcherClientRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCurtainSwitcherClientRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurtainSwitcherClientRequest() => clearField(1);
  @$pb.TagNumber(1)
  CurtainSwitcherClientRequest ensureCurtainSwitcherClientRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  CurtainSwitcherClientResponse get curtainSwitcherClientResponse => $_getN(1);
  @$pb.TagNumber(2)
  set curtainSwitcherClientResponse(CurtainSwitcherClientResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurtainSwitcherClientResponse() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurtainSwitcherClientResponse() => clearField(2);
  @$pb.TagNumber(2)
  CurtainSwitcherClientResponse ensureCurtainSwitcherClientResponse() => $_ensure(1);

  @$pb.TagNumber(3)
  AddCurtainSwitcherScheduleClientRequest get addCurtainSwitcherScheduleClientRequest => $_getN(2);
  @$pb.TagNumber(3)
  set addCurtainSwitcherScheduleClientRequest(AddCurtainSwitcherScheduleClientRequest v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAddCurtainSwitcherScheduleClientRequest() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddCurtainSwitcherScheduleClientRequest() => clearField(3);
  @$pb.TagNumber(3)
  AddCurtainSwitcherScheduleClientRequest ensureAddCurtainSwitcherScheduleClientRequest() => $_ensure(2);

  @$pb.TagNumber(4)
  AddCurtainSwitcherScheduleClientResponse get addCurtainSwitcherScheduleClientResponse => $_getN(3);
  @$pb.TagNumber(4)
  set addCurtainSwitcherScheduleClientResponse(AddCurtainSwitcherScheduleClientResponse v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAddCurtainSwitcherScheduleClientResponse() => $_has(3);
  @$pb.TagNumber(4)
  void clearAddCurtainSwitcherScheduleClientResponse() => clearField(4);
  @$pb.TagNumber(4)
  AddCurtainSwitcherScheduleClientResponse ensureAddCurtainSwitcherScheduleClientResponse() => $_ensure(3);

  @$pb.TagNumber(5)
  UpdateCurtainSwitcherScheduleClientRequest get updateCurtainSwitcherScheduleClientRequest => $_getN(4);
  @$pb.TagNumber(5)
  set updateCurtainSwitcherScheduleClientRequest(UpdateCurtainSwitcherScheduleClientRequest v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasUpdateCurtainSwitcherScheduleClientRequest() => $_has(4);
  @$pb.TagNumber(5)
  void clearUpdateCurtainSwitcherScheduleClientRequest() => clearField(5);
  @$pb.TagNumber(5)
  UpdateCurtainSwitcherScheduleClientRequest ensureUpdateCurtainSwitcherScheduleClientRequest() => $_ensure(4);

  @$pb.TagNumber(6)
  UpdateCurtainSwitcherScheduleClientResponse get updateCurtainSwitcherScheduleClientResponse => $_getN(5);
  @$pb.TagNumber(6)
  set updateCurtainSwitcherScheduleClientResponse(UpdateCurtainSwitcherScheduleClientResponse v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasUpdateCurtainSwitcherScheduleClientResponse() => $_has(5);
  @$pb.TagNumber(6)
  void clearUpdateCurtainSwitcherScheduleClientResponse() => clearField(6);
  @$pb.TagNumber(6)
  UpdateCurtainSwitcherScheduleClientResponse ensureUpdateCurtainSwitcherScheduleClientResponse() => $_ensure(5);

  @$pb.TagNumber(7)
  DeleteCurtainSwitcherScheduleClientRequest get deleteCurtainSwitcherScheduleClientRequest => $_getN(6);
  @$pb.TagNumber(7)
  set deleteCurtainSwitcherScheduleClientRequest(DeleteCurtainSwitcherScheduleClientRequest v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasDeleteCurtainSwitcherScheduleClientRequest() => $_has(6);
  @$pb.TagNumber(7)
  void clearDeleteCurtainSwitcherScheduleClientRequest() => clearField(7);
  @$pb.TagNumber(7)
  DeleteCurtainSwitcherScheduleClientRequest ensureDeleteCurtainSwitcherScheduleClientRequest() => $_ensure(6);

  @$pb.TagNumber(8)
  DeleteCurtainSwitcherScheduleClientResponse get deleteCurtainSwitcherScheduleClientResponse => $_getN(7);
  @$pb.TagNumber(8)
  set deleteCurtainSwitcherScheduleClientResponse(DeleteCurtainSwitcherScheduleClientResponse v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasDeleteCurtainSwitcherScheduleClientResponse() => $_has(7);
  @$pb.TagNumber(8)
  void clearDeleteCurtainSwitcherScheduleClientResponse() => clearField(8);
  @$pb.TagNumber(8)
  DeleteCurtainSwitcherScheduleClientResponse ensureDeleteCurtainSwitcherScheduleClientResponse() => $_ensure(7);
}

class AirConditionerClientMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AirConditionerClientMessage', createEmptyInstance: create)
    ..aOM<AirConditionerClientRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'airConditionerClientRequest', protoName: 'airConditionerClientRequest', subBuilder: AirConditionerClientRequest.create)
    ..aOM<AirConditionerClientResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'airConditionerClientResponse', protoName: 'airConditionerClientResponse', subBuilder: AirConditionerClientResponse.create)
    ..aOM<GetAirConditionerClientRequest>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'getAirConditionerClientRequest', protoName: 'getAirConditionerClientRequest', subBuilder: GetAirConditionerClientRequest.create)
    ..aOM<GetAirConditionerClientResponse>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'getAirConditionerClientResponse', protoName: 'getAirConditionerClientResponse', subBuilder: GetAirConditionerClientResponse.create)
    ..aOM<AirConditionerAddIndoorsRequest>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'airConditionerAddIndoorsRequest', protoName: 'airConditionerAddIndoorsRequest', subBuilder: AirConditionerAddIndoorsRequest.create)
    ..aOM<AirConditionerAddIndoorsResponse>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'airConditionerAddIndoorsResponse', protoName: 'airConditionerAddIndoorsResponse', subBuilder: AirConditionerAddIndoorsResponse.create)
    ..aOM<AirConditionerRemoveIndoorRequest>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'airConditionerRemoveIndoorRequest', protoName: 'airConditionerRemoveIndoorRequest', subBuilder: AirConditionerRemoveIndoorRequest.create)
    ..aOM<AirConditionerRemoveIndoorResponse>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'airConditionerRemoveIndoorResponse', protoName: 'airConditionerRemoveIndoorResponse', subBuilder: AirConditionerRemoveIndoorResponse.create)
    ..hasRequiredFields = false
  ;

  AirConditionerClientMessage._() : super();
  factory AirConditionerClientMessage({
    AirConditionerClientRequest? airConditionerClientRequest,
    AirConditionerClientResponse? airConditionerClientResponse,
    GetAirConditionerClientRequest? getAirConditionerClientRequest,
    GetAirConditionerClientResponse? getAirConditionerClientResponse,
    AirConditionerAddIndoorsRequest? airConditionerAddIndoorsRequest,
    AirConditionerAddIndoorsResponse? airConditionerAddIndoorsResponse,
    AirConditionerRemoveIndoorRequest? airConditionerRemoveIndoorRequest,
    AirConditionerRemoveIndoorResponse? airConditionerRemoveIndoorResponse,
  }) {
    final _result = create();
    if (airConditionerClientRequest != null) {
      _result.airConditionerClientRequest = airConditionerClientRequest;
    }
    if (airConditionerClientResponse != null) {
      _result.airConditionerClientResponse = airConditionerClientResponse;
    }
    if (getAirConditionerClientRequest != null) {
      _result.getAirConditionerClientRequest = getAirConditionerClientRequest;
    }
    if (getAirConditionerClientResponse != null) {
      _result.getAirConditionerClientResponse = getAirConditionerClientResponse;
    }
    if (airConditionerAddIndoorsRequest != null) {
      _result.airConditionerAddIndoorsRequest = airConditionerAddIndoorsRequest;
    }
    if (airConditionerAddIndoorsResponse != null) {
      _result.airConditionerAddIndoorsResponse = airConditionerAddIndoorsResponse;
    }
    if (airConditionerRemoveIndoorRequest != null) {
      _result.airConditionerRemoveIndoorRequest = airConditionerRemoveIndoorRequest;
    }
    if (airConditionerRemoveIndoorResponse != null) {
      _result.airConditionerRemoveIndoorResponse = airConditionerRemoveIndoorResponse;
    }
    return _result;
  }
  factory AirConditionerClientMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AirConditionerClientMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AirConditionerClientMessage clone() => AirConditionerClientMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AirConditionerClientMessage copyWith(void Function(AirConditionerClientMessage) updates) => super.copyWith((message) => updates(message as AirConditionerClientMessage)) as AirConditionerClientMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AirConditionerClientMessage create() => AirConditionerClientMessage._();
  AirConditionerClientMessage createEmptyInstance() => create();
  static $pb.PbList<AirConditionerClientMessage> createRepeated() => $pb.PbList<AirConditionerClientMessage>();
  @$core.pragma('dart2js:noInline')
  static AirConditionerClientMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AirConditionerClientMessage>(create);
  static AirConditionerClientMessage? _defaultInstance;

  @$pb.TagNumber(1)
  AirConditionerClientRequest get airConditionerClientRequest => $_getN(0);
  @$pb.TagNumber(1)
  set airConditionerClientRequest(AirConditionerClientRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAirConditionerClientRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearAirConditionerClientRequest() => clearField(1);
  @$pb.TagNumber(1)
  AirConditionerClientRequest ensureAirConditionerClientRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  AirConditionerClientResponse get airConditionerClientResponse => $_getN(1);
  @$pb.TagNumber(2)
  set airConditionerClientResponse(AirConditionerClientResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAirConditionerClientResponse() => $_has(1);
  @$pb.TagNumber(2)
  void clearAirConditionerClientResponse() => clearField(2);
  @$pb.TagNumber(2)
  AirConditionerClientResponse ensureAirConditionerClientResponse() => $_ensure(1);

  @$pb.TagNumber(3)
  GetAirConditionerClientRequest get getAirConditionerClientRequest => $_getN(2);
  @$pb.TagNumber(3)
  set getAirConditionerClientRequest(GetAirConditionerClientRequest v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasGetAirConditionerClientRequest() => $_has(2);
  @$pb.TagNumber(3)
  void clearGetAirConditionerClientRequest() => clearField(3);
  @$pb.TagNumber(3)
  GetAirConditionerClientRequest ensureGetAirConditionerClientRequest() => $_ensure(2);

  @$pb.TagNumber(4)
  GetAirConditionerClientResponse get getAirConditionerClientResponse => $_getN(3);
  @$pb.TagNumber(4)
  set getAirConditionerClientResponse(GetAirConditionerClientResponse v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasGetAirConditionerClientResponse() => $_has(3);
  @$pb.TagNumber(4)
  void clearGetAirConditionerClientResponse() => clearField(4);
  @$pb.TagNumber(4)
  GetAirConditionerClientResponse ensureGetAirConditionerClientResponse() => $_ensure(3);

  @$pb.TagNumber(5)
  AirConditionerAddIndoorsRequest get airConditionerAddIndoorsRequest => $_getN(4);
  @$pb.TagNumber(5)
  set airConditionerAddIndoorsRequest(AirConditionerAddIndoorsRequest v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasAirConditionerAddIndoorsRequest() => $_has(4);
  @$pb.TagNumber(5)
  void clearAirConditionerAddIndoorsRequest() => clearField(5);
  @$pb.TagNumber(5)
  AirConditionerAddIndoorsRequest ensureAirConditionerAddIndoorsRequest() => $_ensure(4);

  @$pb.TagNumber(6)
  AirConditionerAddIndoorsResponse get airConditionerAddIndoorsResponse => $_getN(5);
  @$pb.TagNumber(6)
  set airConditionerAddIndoorsResponse(AirConditionerAddIndoorsResponse v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasAirConditionerAddIndoorsResponse() => $_has(5);
  @$pb.TagNumber(6)
  void clearAirConditionerAddIndoorsResponse() => clearField(6);
  @$pb.TagNumber(6)
  AirConditionerAddIndoorsResponse ensureAirConditionerAddIndoorsResponse() => $_ensure(5);

  @$pb.TagNumber(7)
  AirConditionerRemoveIndoorRequest get airConditionerRemoveIndoorRequest => $_getN(6);
  @$pb.TagNumber(7)
  set airConditionerRemoveIndoorRequest(AirConditionerRemoveIndoorRequest v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasAirConditionerRemoveIndoorRequest() => $_has(6);
  @$pb.TagNumber(7)
  void clearAirConditionerRemoveIndoorRequest() => clearField(7);
  @$pb.TagNumber(7)
  AirConditionerRemoveIndoorRequest ensureAirConditionerRemoveIndoorRequest() => $_ensure(6);

  @$pb.TagNumber(8)
  AirConditionerRemoveIndoorResponse get airConditionerRemoveIndoorResponse => $_getN(7);
  @$pb.TagNumber(8)
  set airConditionerRemoveIndoorResponse(AirConditionerRemoveIndoorResponse v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasAirConditionerRemoveIndoorResponse() => $_has(7);
  @$pb.TagNumber(8)
  void clearAirConditionerRemoveIndoorResponse() => clearField(8);
  @$pb.TagNumber(8)
  AirConditionerRemoveIndoorResponse ensureAirConditionerRemoveIndoorResponse() => $_ensure(7);
}

class RemoteClientMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RemoteClientMessage', createEmptyInstance: create)
    ..aOM<SendCommandRemoteClientRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sendCommandRemoteClientRequest', protoName: 'sendCommandRemoteClientRequest', subBuilder: SendCommandRemoteClientRequest.create)
    ..aOM<SendCommandRemoteClientResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sendCommandRemoteClientResponse', protoName: 'sendCommandRemoteClientResponse', subBuilder: SendCommandRemoteClientResponse.create)
    ..aOM<LearnCommandRemoteClientRequest>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'learnCommandRemoteClientRequest', protoName: 'learnCommandRemoteClientRequest', subBuilder: LearnCommandRemoteClientRequest.create)
    ..aOM<LearnCommandRemoteClientResponse>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'learnCommandRemoteClientResponse', protoName: 'learnCommandRemoteClientResponse', subBuilder: LearnCommandRemoteClientResponse.create)
    ..aOM<ControlRemoteACCommandClientRequest>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'controlRemoteACCommandClientRequest', protoName: 'controlRemoteACCommandClientRequest', subBuilder: ControlRemoteACCommandClientRequest.create)
    ..aOM<ControlRemoteACCommandClientResponse>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'controlRemoteACCommandClientResponse', protoName: 'controlRemoteACCommandClientResponse', subBuilder: ControlRemoteACCommandClientResponse.create)
    ..hasRequiredFields = false
  ;

  RemoteClientMessage._() : super();
  factory RemoteClientMessage({
    SendCommandRemoteClientRequest? sendCommandRemoteClientRequest,
    SendCommandRemoteClientResponse? sendCommandRemoteClientResponse,
    LearnCommandRemoteClientRequest? learnCommandRemoteClientRequest,
    LearnCommandRemoteClientResponse? learnCommandRemoteClientResponse,
    ControlRemoteACCommandClientRequest? controlRemoteACCommandClientRequest,
    ControlRemoteACCommandClientResponse? controlRemoteACCommandClientResponse,
  }) {
    final _result = create();
    if (sendCommandRemoteClientRequest != null) {
      _result.sendCommandRemoteClientRequest = sendCommandRemoteClientRequest;
    }
    if (sendCommandRemoteClientResponse != null) {
      _result.sendCommandRemoteClientResponse = sendCommandRemoteClientResponse;
    }
    if (learnCommandRemoteClientRequest != null) {
      _result.learnCommandRemoteClientRequest = learnCommandRemoteClientRequest;
    }
    if (learnCommandRemoteClientResponse != null) {
      _result.learnCommandRemoteClientResponse = learnCommandRemoteClientResponse;
    }
    if (controlRemoteACCommandClientRequest != null) {
      _result.controlRemoteACCommandClientRequest = controlRemoteACCommandClientRequest;
    }
    if (controlRemoteACCommandClientResponse != null) {
      _result.controlRemoteACCommandClientResponse = controlRemoteACCommandClientResponse;
    }
    return _result;
  }
  factory RemoteClientMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoteClientMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoteClientMessage clone() => RemoteClientMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoteClientMessage copyWith(void Function(RemoteClientMessage) updates) => super.copyWith((message) => updates(message as RemoteClientMessage)) as RemoteClientMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoteClientMessage create() => RemoteClientMessage._();
  RemoteClientMessage createEmptyInstance() => create();
  static $pb.PbList<RemoteClientMessage> createRepeated() => $pb.PbList<RemoteClientMessage>();
  @$core.pragma('dart2js:noInline')
  static RemoteClientMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoteClientMessage>(create);
  static RemoteClientMessage? _defaultInstance;

  @$pb.TagNumber(1)
  SendCommandRemoteClientRequest get sendCommandRemoteClientRequest => $_getN(0);
  @$pb.TagNumber(1)
  set sendCommandRemoteClientRequest(SendCommandRemoteClientRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSendCommandRemoteClientRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearSendCommandRemoteClientRequest() => clearField(1);
  @$pb.TagNumber(1)
  SendCommandRemoteClientRequest ensureSendCommandRemoteClientRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  SendCommandRemoteClientResponse get sendCommandRemoteClientResponse => $_getN(1);
  @$pb.TagNumber(2)
  set sendCommandRemoteClientResponse(SendCommandRemoteClientResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSendCommandRemoteClientResponse() => $_has(1);
  @$pb.TagNumber(2)
  void clearSendCommandRemoteClientResponse() => clearField(2);
  @$pb.TagNumber(2)
  SendCommandRemoteClientResponse ensureSendCommandRemoteClientResponse() => $_ensure(1);

  @$pb.TagNumber(3)
  LearnCommandRemoteClientRequest get learnCommandRemoteClientRequest => $_getN(2);
  @$pb.TagNumber(3)
  set learnCommandRemoteClientRequest(LearnCommandRemoteClientRequest v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasLearnCommandRemoteClientRequest() => $_has(2);
  @$pb.TagNumber(3)
  void clearLearnCommandRemoteClientRequest() => clearField(3);
  @$pb.TagNumber(3)
  LearnCommandRemoteClientRequest ensureLearnCommandRemoteClientRequest() => $_ensure(2);

  @$pb.TagNumber(4)
  LearnCommandRemoteClientResponse get learnCommandRemoteClientResponse => $_getN(3);
  @$pb.TagNumber(4)
  set learnCommandRemoteClientResponse(LearnCommandRemoteClientResponse v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasLearnCommandRemoteClientResponse() => $_has(3);
  @$pb.TagNumber(4)
  void clearLearnCommandRemoteClientResponse() => clearField(4);
  @$pb.TagNumber(4)
  LearnCommandRemoteClientResponse ensureLearnCommandRemoteClientResponse() => $_ensure(3);

  @$pb.TagNumber(5)
  ControlRemoteACCommandClientRequest get controlRemoteACCommandClientRequest => $_getN(4);
  @$pb.TagNumber(5)
  set controlRemoteACCommandClientRequest(ControlRemoteACCommandClientRequest v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasControlRemoteACCommandClientRequest() => $_has(4);
  @$pb.TagNumber(5)
  void clearControlRemoteACCommandClientRequest() => clearField(5);
  @$pb.TagNumber(5)
  ControlRemoteACCommandClientRequest ensureControlRemoteACCommandClientRequest() => $_ensure(4);

  @$pb.TagNumber(6)
  ControlRemoteACCommandClientResponse get controlRemoteACCommandClientResponse => $_getN(5);
  @$pb.TagNumber(6)
  set controlRemoteACCommandClientResponse(ControlRemoteACCommandClientResponse v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasControlRemoteACCommandClientResponse() => $_has(5);
  @$pb.TagNumber(6)
  void clearControlRemoteACCommandClientResponse() => clearField(6);
  @$pb.TagNumber(6)
  ControlRemoteACCommandClientResponse ensureControlRemoteACCommandClientResponse() => $_ensure(5);
}

class OnChangedClientMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'OnChangedClientMessage', createEmptyInstance: create)
    ..aOM<MeterOnChangedClientResponse>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'meterOnChangedClientResponse', protoName: 'meterOnChangedClientResponse', subBuilder: MeterOnChangedClientResponse.create)
    ..aOM<SwitcherOnChangedClientResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcherOnChangedClientResponse', protoName: 'switcherOnChangedClientResponse', subBuilder: SwitcherOnChangedClientResponse.create)
    ..aOM<CurtainSwitcherOnChangedClientResponse>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainSwitcherOnChangedClientResponse', protoName: 'curtainSwitcherOnChangedClientResponse', subBuilder: CurtainSwitcherOnChangedClientResponse.create)
    ..aOM<AirConditionerOnChangedClientResponse>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'airConditionerOnChangedClientResponse', protoName: 'airConditionerOnChangedClientResponse', subBuilder: AirConditionerOnChangedClientResponse.create)
    ..aOM<ProgressUpdateFirmwareOnChangedDeviceClientResponse>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'progressUpdateFirmwareOnChangedDeviceClientResponse', protoName: 'progressUpdateFirmwareOnChangedDeviceClientResponse', subBuilder: ProgressUpdateFirmwareOnChangedDeviceClientResponse.create)
    ..aOM<DeviceOnChangedDeviceClientResponse>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceOnChangedDeviceClientResponse', protoName: 'deviceOnChangedDeviceClientResponse', subBuilder: DeviceOnChangedDeviceClientResponse.create)
    ..aOM<MotionOnChangedClientResponse>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'motionOnChangedClientResponse', protoName: 'motionOnChangedClientResponse', subBuilder: MotionOnChangedClientResponse.create)
    ..aOM<HomekitOnChangedClientResponse>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'homekitOnChangedClientResponse', protoName: 'homekitOnChangedClientResponse', subBuilder: HomekitOnChangedClientResponse.create)
    ..aOM<ButtonOnChangedClientResponse>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buttonOnChangedClientResponse', protoName: 'buttonOnChangedClientResponse', subBuilder: ButtonOnChangedClientResponse.create)
    ..aOM<DebugLoggingResponse>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'debugLoggingResponse', protoName: 'debugLoggingResponse', subBuilder: DebugLoggingResponse.create)
    ..aOM<LedDriverOnChangedClientResponse>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ledDriverOnChangedClientResponse', protoName: 'ledDriverOnChangedClientResponse', subBuilder: LedDriverOnChangedClientResponse.create)
    ..aOM<EnvironmentOnchangedClientResponse>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'environmentOnchangedClientResponse', protoName: 'environmentOnchangedClientResponse', subBuilder: EnvironmentOnchangedClientResponse.create)
    ..aOM<SmartPlugOnchangedClientResponse>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'smartPlugOnchangedClientResponse', protoName: 'smartPlugOnchangedClientResponse', subBuilder: SmartPlugOnchangedClientResponse.create)
    ..aOM<CurtainOnChangedClientResponse>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainOnChangedClientResponse', protoName: 'curtainOnChangedClientResponse', subBuilder: CurtainOnChangedClientResponse.create)
    ..aOM<TouchPanelControlSwitchOnChangedClientResponse>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelControlSwitchOnChangedClientResponse', protoName: 'touchPanelControlSwitchOnChangedClientResponse', subBuilder: TouchPanelControlSwitchOnChangedClientResponse.create)
    ..aOM<TouchPanelControlCurtainSwitchOnChangedClientResponse>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelControlCurtainSwitchOnChangedClientResponse', protoName: 'touchPanelControlCurtainSwitchOnChangedClientResponse', subBuilder: TouchPanelControlCurtainSwitchOnChangedClientResponse.create)
    ..aOM<TouchPanelControlSceneOnChangedClientResponse>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelControlSceneOnChangedClientResponse', protoName: 'touchPanelControlSceneOnChangedClientResponse', subBuilder: TouchPanelControlSceneOnChangedClientResponse.create)
    ..aOM<TouchPanelControlLedDriverOnChangedClientResponse>(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelControlLedDriverOnChangedClientResponse', protoName: 'touchPanelControlLedDriverOnChangedClientResponse', subBuilder: TouchPanelControlLedDriverOnChangedClientResponse.create)
    ..aOM<TouchPanelRequestComponentStateOnChangedClientResponse>(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelRequestComponentStateOnChangedClientResponse', protoName: 'touchPanelRequestComponentStateOnChangedClientResponse', subBuilder: TouchPanelRequestComponentStateOnChangedClientResponse.create)
    ..hasRequiredFields = false
  ;

  OnChangedClientMessage._() : super();
  factory OnChangedClientMessage({
    MeterOnChangedClientResponse? meterOnChangedClientResponse,
    SwitcherOnChangedClientResponse? switcherOnChangedClientResponse,
    CurtainSwitcherOnChangedClientResponse? curtainSwitcherOnChangedClientResponse,
    AirConditionerOnChangedClientResponse? airConditionerOnChangedClientResponse,
    ProgressUpdateFirmwareOnChangedDeviceClientResponse? progressUpdateFirmwareOnChangedDeviceClientResponse,
    DeviceOnChangedDeviceClientResponse? deviceOnChangedDeviceClientResponse,
    MotionOnChangedClientResponse? motionOnChangedClientResponse,
    HomekitOnChangedClientResponse? homekitOnChangedClientResponse,
    ButtonOnChangedClientResponse? buttonOnChangedClientResponse,
    DebugLoggingResponse? debugLoggingResponse,
    LedDriverOnChangedClientResponse? ledDriverOnChangedClientResponse,
    EnvironmentOnchangedClientResponse? environmentOnchangedClientResponse,
    SmartPlugOnchangedClientResponse? smartPlugOnchangedClientResponse,
    CurtainOnChangedClientResponse? curtainOnChangedClientResponse,
    TouchPanelControlSwitchOnChangedClientResponse? touchPanelControlSwitchOnChangedClientResponse,
    TouchPanelControlCurtainSwitchOnChangedClientResponse? touchPanelControlCurtainSwitchOnChangedClientResponse,
    TouchPanelControlSceneOnChangedClientResponse? touchPanelControlSceneOnChangedClientResponse,
    TouchPanelControlLedDriverOnChangedClientResponse? touchPanelControlLedDriverOnChangedClientResponse,
    TouchPanelRequestComponentStateOnChangedClientResponse? touchPanelRequestComponentStateOnChangedClientResponse,
  }) {
    final _result = create();
    if (meterOnChangedClientResponse != null) {
      _result.meterOnChangedClientResponse = meterOnChangedClientResponse;
    }
    if (switcherOnChangedClientResponse != null) {
      _result.switcherOnChangedClientResponse = switcherOnChangedClientResponse;
    }
    if (curtainSwitcherOnChangedClientResponse != null) {
      _result.curtainSwitcherOnChangedClientResponse = curtainSwitcherOnChangedClientResponse;
    }
    if (airConditionerOnChangedClientResponse != null) {
      _result.airConditionerOnChangedClientResponse = airConditionerOnChangedClientResponse;
    }
    if (progressUpdateFirmwareOnChangedDeviceClientResponse != null) {
      _result.progressUpdateFirmwareOnChangedDeviceClientResponse = progressUpdateFirmwareOnChangedDeviceClientResponse;
    }
    if (deviceOnChangedDeviceClientResponse != null) {
      _result.deviceOnChangedDeviceClientResponse = deviceOnChangedDeviceClientResponse;
    }
    if (motionOnChangedClientResponse != null) {
      _result.motionOnChangedClientResponse = motionOnChangedClientResponse;
    }
    if (homekitOnChangedClientResponse != null) {
      _result.homekitOnChangedClientResponse = homekitOnChangedClientResponse;
    }
    if (buttonOnChangedClientResponse != null) {
      _result.buttonOnChangedClientResponse = buttonOnChangedClientResponse;
    }
    if (debugLoggingResponse != null) {
      _result.debugLoggingResponse = debugLoggingResponse;
    }
    if (ledDriverOnChangedClientResponse != null) {
      _result.ledDriverOnChangedClientResponse = ledDriverOnChangedClientResponse;
    }
    if (environmentOnchangedClientResponse != null) {
      _result.environmentOnchangedClientResponse = environmentOnchangedClientResponse;
    }
    if (smartPlugOnchangedClientResponse != null) {
      _result.smartPlugOnchangedClientResponse = smartPlugOnchangedClientResponse;
    }
    if (curtainOnChangedClientResponse != null) {
      _result.curtainOnChangedClientResponse = curtainOnChangedClientResponse;
    }
    if (touchPanelControlSwitchOnChangedClientResponse != null) {
      _result.touchPanelControlSwitchOnChangedClientResponse = touchPanelControlSwitchOnChangedClientResponse;
    }
    if (touchPanelControlCurtainSwitchOnChangedClientResponse != null) {
      _result.touchPanelControlCurtainSwitchOnChangedClientResponse = touchPanelControlCurtainSwitchOnChangedClientResponse;
    }
    if (touchPanelControlSceneOnChangedClientResponse != null) {
      _result.touchPanelControlSceneOnChangedClientResponse = touchPanelControlSceneOnChangedClientResponse;
    }
    if (touchPanelControlLedDriverOnChangedClientResponse != null) {
      _result.touchPanelControlLedDriverOnChangedClientResponse = touchPanelControlLedDriverOnChangedClientResponse;
    }
    if (touchPanelRequestComponentStateOnChangedClientResponse != null) {
      _result.touchPanelRequestComponentStateOnChangedClientResponse = touchPanelRequestComponentStateOnChangedClientResponse;
    }
    return _result;
  }
  factory OnChangedClientMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OnChangedClientMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OnChangedClientMessage clone() => OnChangedClientMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OnChangedClientMessage copyWith(void Function(OnChangedClientMessage) updates) => super.copyWith((message) => updates(message as OnChangedClientMessage)) as OnChangedClientMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OnChangedClientMessage create() => OnChangedClientMessage._();
  OnChangedClientMessage createEmptyInstance() => create();
  static $pb.PbList<OnChangedClientMessage> createRepeated() => $pb.PbList<OnChangedClientMessage>();
  @$core.pragma('dart2js:noInline')
  static OnChangedClientMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OnChangedClientMessage>(create);
  static OnChangedClientMessage? _defaultInstance;

  @$pb.TagNumber(1)
  MeterOnChangedClientResponse get meterOnChangedClientResponse => $_getN(0);
  @$pb.TagNumber(1)
  set meterOnChangedClientResponse(MeterOnChangedClientResponse v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMeterOnChangedClientResponse() => $_has(0);
  @$pb.TagNumber(1)
  void clearMeterOnChangedClientResponse() => clearField(1);
  @$pb.TagNumber(1)
  MeterOnChangedClientResponse ensureMeterOnChangedClientResponse() => $_ensure(0);

  @$pb.TagNumber(2)
  SwitcherOnChangedClientResponse get switcherOnChangedClientResponse => $_getN(1);
  @$pb.TagNumber(2)
  set switcherOnChangedClientResponse(SwitcherOnChangedClientResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSwitcherOnChangedClientResponse() => $_has(1);
  @$pb.TagNumber(2)
  void clearSwitcherOnChangedClientResponse() => clearField(2);
  @$pb.TagNumber(2)
  SwitcherOnChangedClientResponse ensureSwitcherOnChangedClientResponse() => $_ensure(1);

  @$pb.TagNumber(3)
  CurtainSwitcherOnChangedClientResponse get curtainSwitcherOnChangedClientResponse => $_getN(2);
  @$pb.TagNumber(3)
  set curtainSwitcherOnChangedClientResponse(CurtainSwitcherOnChangedClientResponse v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCurtainSwitcherOnChangedClientResponse() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurtainSwitcherOnChangedClientResponse() => clearField(3);
  @$pb.TagNumber(3)
  CurtainSwitcherOnChangedClientResponse ensureCurtainSwitcherOnChangedClientResponse() => $_ensure(2);

  @$pb.TagNumber(4)
  AirConditionerOnChangedClientResponse get airConditionerOnChangedClientResponse => $_getN(3);
  @$pb.TagNumber(4)
  set airConditionerOnChangedClientResponse(AirConditionerOnChangedClientResponse v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAirConditionerOnChangedClientResponse() => $_has(3);
  @$pb.TagNumber(4)
  void clearAirConditionerOnChangedClientResponse() => clearField(4);
  @$pb.TagNumber(4)
  AirConditionerOnChangedClientResponse ensureAirConditionerOnChangedClientResponse() => $_ensure(3);

  @$pb.TagNumber(5)
  ProgressUpdateFirmwareOnChangedDeviceClientResponse get progressUpdateFirmwareOnChangedDeviceClientResponse => $_getN(4);
  @$pb.TagNumber(5)
  set progressUpdateFirmwareOnChangedDeviceClientResponse(ProgressUpdateFirmwareOnChangedDeviceClientResponse v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasProgressUpdateFirmwareOnChangedDeviceClientResponse() => $_has(4);
  @$pb.TagNumber(5)
  void clearProgressUpdateFirmwareOnChangedDeviceClientResponse() => clearField(5);
  @$pb.TagNumber(5)
  ProgressUpdateFirmwareOnChangedDeviceClientResponse ensureProgressUpdateFirmwareOnChangedDeviceClientResponse() => $_ensure(4);

  @$pb.TagNumber(6)
  DeviceOnChangedDeviceClientResponse get deviceOnChangedDeviceClientResponse => $_getN(5);
  @$pb.TagNumber(6)
  set deviceOnChangedDeviceClientResponse(DeviceOnChangedDeviceClientResponse v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDeviceOnChangedDeviceClientResponse() => $_has(5);
  @$pb.TagNumber(6)
  void clearDeviceOnChangedDeviceClientResponse() => clearField(6);
  @$pb.TagNumber(6)
  DeviceOnChangedDeviceClientResponse ensureDeviceOnChangedDeviceClientResponse() => $_ensure(5);

  @$pb.TagNumber(7)
  MotionOnChangedClientResponse get motionOnChangedClientResponse => $_getN(6);
  @$pb.TagNumber(7)
  set motionOnChangedClientResponse(MotionOnChangedClientResponse v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasMotionOnChangedClientResponse() => $_has(6);
  @$pb.TagNumber(7)
  void clearMotionOnChangedClientResponse() => clearField(7);
  @$pb.TagNumber(7)
  MotionOnChangedClientResponse ensureMotionOnChangedClientResponse() => $_ensure(6);

  @$pb.TagNumber(8)
  HomekitOnChangedClientResponse get homekitOnChangedClientResponse => $_getN(7);
  @$pb.TagNumber(8)
  set homekitOnChangedClientResponse(HomekitOnChangedClientResponse v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasHomekitOnChangedClientResponse() => $_has(7);
  @$pb.TagNumber(8)
  void clearHomekitOnChangedClientResponse() => clearField(8);
  @$pb.TagNumber(8)
  HomekitOnChangedClientResponse ensureHomekitOnChangedClientResponse() => $_ensure(7);

  @$pb.TagNumber(9)
  ButtonOnChangedClientResponse get buttonOnChangedClientResponse => $_getN(8);
  @$pb.TagNumber(9)
  set buttonOnChangedClientResponse(ButtonOnChangedClientResponse v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasButtonOnChangedClientResponse() => $_has(8);
  @$pb.TagNumber(9)
  void clearButtonOnChangedClientResponse() => clearField(9);
  @$pb.TagNumber(9)
  ButtonOnChangedClientResponse ensureButtonOnChangedClientResponse() => $_ensure(8);

  @$pb.TagNumber(10)
  DebugLoggingResponse get debugLoggingResponse => $_getN(9);
  @$pb.TagNumber(10)
  set debugLoggingResponse(DebugLoggingResponse v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasDebugLoggingResponse() => $_has(9);
  @$pb.TagNumber(10)
  void clearDebugLoggingResponse() => clearField(10);
  @$pb.TagNumber(10)
  DebugLoggingResponse ensureDebugLoggingResponse() => $_ensure(9);

  @$pb.TagNumber(11)
  LedDriverOnChangedClientResponse get ledDriverOnChangedClientResponse => $_getN(10);
  @$pb.TagNumber(11)
  set ledDriverOnChangedClientResponse(LedDriverOnChangedClientResponse v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasLedDriverOnChangedClientResponse() => $_has(10);
  @$pb.TagNumber(11)
  void clearLedDriverOnChangedClientResponse() => clearField(11);
  @$pb.TagNumber(11)
  LedDriverOnChangedClientResponse ensureLedDriverOnChangedClientResponse() => $_ensure(10);

  @$pb.TagNumber(12)
  EnvironmentOnchangedClientResponse get environmentOnchangedClientResponse => $_getN(11);
  @$pb.TagNumber(12)
  set environmentOnchangedClientResponse(EnvironmentOnchangedClientResponse v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasEnvironmentOnchangedClientResponse() => $_has(11);
  @$pb.TagNumber(12)
  void clearEnvironmentOnchangedClientResponse() => clearField(12);
  @$pb.TagNumber(12)
  EnvironmentOnchangedClientResponse ensureEnvironmentOnchangedClientResponse() => $_ensure(11);

  @$pb.TagNumber(13)
  SmartPlugOnchangedClientResponse get smartPlugOnchangedClientResponse => $_getN(12);
  @$pb.TagNumber(13)
  set smartPlugOnchangedClientResponse(SmartPlugOnchangedClientResponse v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasSmartPlugOnchangedClientResponse() => $_has(12);
  @$pb.TagNumber(13)
  void clearSmartPlugOnchangedClientResponse() => clearField(13);
  @$pb.TagNumber(13)
  SmartPlugOnchangedClientResponse ensureSmartPlugOnchangedClientResponse() => $_ensure(12);

  @$pb.TagNumber(14)
  CurtainOnChangedClientResponse get curtainOnChangedClientResponse => $_getN(13);
  @$pb.TagNumber(14)
  set curtainOnChangedClientResponse(CurtainOnChangedClientResponse v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasCurtainOnChangedClientResponse() => $_has(13);
  @$pb.TagNumber(14)
  void clearCurtainOnChangedClientResponse() => clearField(14);
  @$pb.TagNumber(14)
  CurtainOnChangedClientResponse ensureCurtainOnChangedClientResponse() => $_ensure(13);

  @$pb.TagNumber(15)
  TouchPanelControlSwitchOnChangedClientResponse get touchPanelControlSwitchOnChangedClientResponse => $_getN(14);
  @$pb.TagNumber(15)
  set touchPanelControlSwitchOnChangedClientResponse(TouchPanelControlSwitchOnChangedClientResponse v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasTouchPanelControlSwitchOnChangedClientResponse() => $_has(14);
  @$pb.TagNumber(15)
  void clearTouchPanelControlSwitchOnChangedClientResponse() => clearField(15);
  @$pb.TagNumber(15)
  TouchPanelControlSwitchOnChangedClientResponse ensureTouchPanelControlSwitchOnChangedClientResponse() => $_ensure(14);

  @$pb.TagNumber(16)
  TouchPanelControlCurtainSwitchOnChangedClientResponse get touchPanelControlCurtainSwitchOnChangedClientResponse => $_getN(15);
  @$pb.TagNumber(16)
  set touchPanelControlCurtainSwitchOnChangedClientResponse(TouchPanelControlCurtainSwitchOnChangedClientResponse v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasTouchPanelControlCurtainSwitchOnChangedClientResponse() => $_has(15);
  @$pb.TagNumber(16)
  void clearTouchPanelControlCurtainSwitchOnChangedClientResponse() => clearField(16);
  @$pb.TagNumber(16)
  TouchPanelControlCurtainSwitchOnChangedClientResponse ensureTouchPanelControlCurtainSwitchOnChangedClientResponse() => $_ensure(15);

  @$pb.TagNumber(17)
  TouchPanelControlSceneOnChangedClientResponse get touchPanelControlSceneOnChangedClientResponse => $_getN(16);
  @$pb.TagNumber(17)
  set touchPanelControlSceneOnChangedClientResponse(TouchPanelControlSceneOnChangedClientResponse v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasTouchPanelControlSceneOnChangedClientResponse() => $_has(16);
  @$pb.TagNumber(17)
  void clearTouchPanelControlSceneOnChangedClientResponse() => clearField(17);
  @$pb.TagNumber(17)
  TouchPanelControlSceneOnChangedClientResponse ensureTouchPanelControlSceneOnChangedClientResponse() => $_ensure(16);

  @$pb.TagNumber(18)
  TouchPanelControlLedDriverOnChangedClientResponse get touchPanelControlLedDriverOnChangedClientResponse => $_getN(17);
  @$pb.TagNumber(18)
  set touchPanelControlLedDriverOnChangedClientResponse(TouchPanelControlLedDriverOnChangedClientResponse v) { setField(18, v); }
  @$pb.TagNumber(18)
  $core.bool hasTouchPanelControlLedDriverOnChangedClientResponse() => $_has(17);
  @$pb.TagNumber(18)
  void clearTouchPanelControlLedDriverOnChangedClientResponse() => clearField(18);
  @$pb.TagNumber(18)
  TouchPanelControlLedDriverOnChangedClientResponse ensureTouchPanelControlLedDriverOnChangedClientResponse() => $_ensure(17);

  @$pb.TagNumber(19)
  TouchPanelRequestComponentStateOnChangedClientResponse get touchPanelRequestComponentStateOnChangedClientResponse => $_getN(18);
  @$pb.TagNumber(19)
  set touchPanelRequestComponentStateOnChangedClientResponse(TouchPanelRequestComponentStateOnChangedClientResponse v) { setField(19, v); }
  @$pb.TagNumber(19)
  $core.bool hasTouchPanelRequestComponentStateOnChangedClientResponse() => $_has(18);
  @$pb.TagNumber(19)
  void clearTouchPanelRequestComponentStateOnChangedClientResponse() => clearField(19);
  @$pb.TagNumber(19)
  TouchPanelRequestComponentStateOnChangedClientResponse ensureTouchPanelRequestComponentStateOnChangedClientResponse() => $_ensure(18);
}

class MotionClientMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MotionClientMessage', createEmptyInstance: create)
    ..aOM<MotionClientRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'motionClientRequest', protoName: 'motionClientRequest', subBuilder: MotionClientRequest.create)
    ..aOM<MotionClientResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'motionClientResponse', protoName: 'motionClientResponse', subBuilder: MotionClientResponse.create)
    ..aOM<UpdateMotionState>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateMotionState', protoName: 'updateMotionState', subBuilder: UpdateMotionState.create)
    ..hasRequiredFields = false
  ;

  MotionClientMessage._() : super();
  factory MotionClientMessage({
    MotionClientRequest? motionClientRequest,
    MotionClientResponse? motionClientResponse,
    UpdateMotionState? updateMotionState,
  }) {
    final _result = create();
    if (motionClientRequest != null) {
      _result.motionClientRequest = motionClientRequest;
    }
    if (motionClientResponse != null) {
      _result.motionClientResponse = motionClientResponse;
    }
    if (updateMotionState != null) {
      _result.updateMotionState = updateMotionState;
    }
    return _result;
  }
  factory MotionClientMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MotionClientMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MotionClientMessage clone() => MotionClientMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MotionClientMessage copyWith(void Function(MotionClientMessage) updates) => super.copyWith((message) => updates(message as MotionClientMessage)) as MotionClientMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MotionClientMessage create() => MotionClientMessage._();
  MotionClientMessage createEmptyInstance() => create();
  static $pb.PbList<MotionClientMessage> createRepeated() => $pb.PbList<MotionClientMessage>();
  @$core.pragma('dart2js:noInline')
  static MotionClientMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MotionClientMessage>(create);
  static MotionClientMessage? _defaultInstance;

  @$pb.TagNumber(1)
  MotionClientRequest get motionClientRequest => $_getN(0);
  @$pb.TagNumber(1)
  set motionClientRequest(MotionClientRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMotionClientRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearMotionClientRequest() => clearField(1);
  @$pb.TagNumber(1)
  MotionClientRequest ensureMotionClientRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  MotionClientResponse get motionClientResponse => $_getN(1);
  @$pb.TagNumber(2)
  set motionClientResponse(MotionClientResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMotionClientResponse() => $_has(1);
  @$pb.TagNumber(2)
  void clearMotionClientResponse() => clearField(2);
  @$pb.TagNumber(2)
  MotionClientResponse ensureMotionClientResponse() => $_ensure(1);

  @$pb.TagNumber(3)
  UpdateMotionState get updateMotionState => $_getN(2);
  @$pb.TagNumber(3)
  set updateMotionState(UpdateMotionState v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasUpdateMotionState() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdateMotionState() => clearField(3);
  @$pb.TagNumber(3)
  UpdateMotionState ensureUpdateMotionState() => $_ensure(2);
}

class SceneClientMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SceneClientMessage', createEmptyInstance: create)
    ..aOM<SceneClientRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneClientRequest', protoName: 'sceneClientRequest', subBuilder: SceneClientRequest.create)
    ..aOM<SceneClientResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneClientResponse', protoName: 'sceneClientResponse', subBuilder: SceneClientResponse.create)
    ..aOM<SceneGroupClientRequest>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneGroupClientRequest', protoName: 'sceneGroupClientRequest', subBuilder: SceneGroupClientRequest.create)
    ..hasRequiredFields = false
  ;

  SceneClientMessage._() : super();
  factory SceneClientMessage({
    SceneClientRequest? sceneClientRequest,
    SceneClientResponse? sceneClientResponse,
    SceneGroupClientRequest? sceneGroupClientRequest,
  }) {
    final _result = create();
    if (sceneClientRequest != null) {
      _result.sceneClientRequest = sceneClientRequest;
    }
    if (sceneClientResponse != null) {
      _result.sceneClientResponse = sceneClientResponse;
    }
    if (sceneGroupClientRequest != null) {
      _result.sceneGroupClientRequest = sceneGroupClientRequest;
    }
    return _result;
  }
  factory SceneClientMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SceneClientMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SceneClientMessage clone() => SceneClientMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SceneClientMessage copyWith(void Function(SceneClientMessage) updates) => super.copyWith((message) => updates(message as SceneClientMessage)) as SceneClientMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SceneClientMessage create() => SceneClientMessage._();
  SceneClientMessage createEmptyInstance() => create();
  static $pb.PbList<SceneClientMessage> createRepeated() => $pb.PbList<SceneClientMessage>();
  @$core.pragma('dart2js:noInline')
  static SceneClientMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SceneClientMessage>(create);
  static SceneClientMessage? _defaultInstance;

  @$pb.TagNumber(1)
  SceneClientRequest get sceneClientRequest => $_getN(0);
  @$pb.TagNumber(1)
  set sceneClientRequest(SceneClientRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSceneClientRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearSceneClientRequest() => clearField(1);
  @$pb.TagNumber(1)
  SceneClientRequest ensureSceneClientRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  SceneClientResponse get sceneClientResponse => $_getN(1);
  @$pb.TagNumber(2)
  set sceneClientResponse(SceneClientResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSceneClientResponse() => $_has(1);
  @$pb.TagNumber(2)
  void clearSceneClientResponse() => clearField(2);
  @$pb.TagNumber(2)
  SceneClientResponse ensureSceneClientResponse() => $_ensure(1);

  @$pb.TagNumber(3)
  SceneGroupClientRequest get sceneGroupClientRequest => $_getN(2);
  @$pb.TagNumber(3)
  set sceneGroupClientRequest(SceneGroupClientRequest v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSceneGroupClientRequest() => $_has(2);
  @$pb.TagNumber(3)
  void clearSceneGroupClientRequest() => clearField(3);
  @$pb.TagNumber(3)
  SceneGroupClientRequest ensureSceneGroupClientRequest() => $_ensure(2);
}

class LedDriverClientMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LedDriverClientMessage', createEmptyInstance: create)
    ..aOM<LedDriverClientRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ledDriverClientRequest', protoName: 'ledDriverClientRequest', subBuilder: LedDriverClientRequest.create)
    ..aOM<LedDriverClientResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ledDriverClientResponse', protoName: 'ledDriverClientResponse', subBuilder: LedDriverClientResponse.create)
    ..hasRequiredFields = false
  ;

  LedDriverClientMessage._() : super();
  factory LedDriverClientMessage({
    LedDriverClientRequest? ledDriverClientRequest,
    LedDriverClientResponse? ledDriverClientResponse,
  }) {
    final _result = create();
    if (ledDriverClientRequest != null) {
      _result.ledDriverClientRequest = ledDriverClientRequest;
    }
    if (ledDriverClientResponse != null) {
      _result.ledDriverClientResponse = ledDriverClientResponse;
    }
    return _result;
  }
  factory LedDriverClientMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LedDriverClientMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LedDriverClientMessage clone() => LedDriverClientMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LedDriverClientMessage copyWith(void Function(LedDriverClientMessage) updates) => super.copyWith((message) => updates(message as LedDriverClientMessage)) as LedDriverClientMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LedDriverClientMessage create() => LedDriverClientMessage._();
  LedDriverClientMessage createEmptyInstance() => create();
  static $pb.PbList<LedDriverClientMessage> createRepeated() => $pb.PbList<LedDriverClientMessage>();
  @$core.pragma('dart2js:noInline')
  static LedDriverClientMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LedDriverClientMessage>(create);
  static LedDriverClientMessage? _defaultInstance;

  @$pb.TagNumber(1)
  LedDriverClientRequest get ledDriverClientRequest => $_getN(0);
  @$pb.TagNumber(1)
  set ledDriverClientRequest(LedDriverClientRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLedDriverClientRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearLedDriverClientRequest() => clearField(1);
  @$pb.TagNumber(1)
  LedDriverClientRequest ensureLedDriverClientRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  LedDriverClientResponse get ledDriverClientResponse => $_getN(1);
  @$pb.TagNumber(2)
  set ledDriverClientResponse(LedDriverClientResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLedDriverClientResponse() => $_has(1);
  @$pb.TagNumber(2)
  void clearLedDriverClientResponse() => clearField(2);
  @$pb.TagNumber(2)
  LedDriverClientResponse ensureLedDriverClientResponse() => $_ensure(1);
}

class MeterClientMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MeterClientMessage', createEmptyInstance: create)
    ..aOM<MeterClientRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'meterClientRequest', protoName: 'meterClientRequest', subBuilder: MeterClientRequest.create)
    ..aOM<MeterClientResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'meterClientResponse', protoName: 'meterClientResponse', subBuilder: MeterClientResponse.create)
    ..aOM<MeterClientConfirm>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'MeterClientConfirm', protoName: 'MeterClientConfirm', subBuilder: MeterClientConfirm.create)
    ..hasRequiredFields = false
  ;

  MeterClientMessage._() : super();
  factory MeterClientMessage({
    MeterClientRequest? meterClientRequest,
    MeterClientResponse? meterClientResponse,
    MeterClientConfirm? meterClientConfirm,
  }) {
    final _result = create();
    if (meterClientRequest != null) {
      _result.meterClientRequest = meterClientRequest;
    }
    if (meterClientResponse != null) {
      _result.meterClientResponse = meterClientResponse;
    }
    if (meterClientConfirm != null) {
      _result.meterClientConfirm = meterClientConfirm;
    }
    return _result;
  }
  factory MeterClientMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MeterClientMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MeterClientMessage clone() => MeterClientMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MeterClientMessage copyWith(void Function(MeterClientMessage) updates) => super.copyWith((message) => updates(message as MeterClientMessage)) as MeterClientMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MeterClientMessage create() => MeterClientMessage._();
  MeterClientMessage createEmptyInstance() => create();
  static $pb.PbList<MeterClientMessage> createRepeated() => $pb.PbList<MeterClientMessage>();
  @$core.pragma('dart2js:noInline')
  static MeterClientMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MeterClientMessage>(create);
  static MeterClientMessage? _defaultInstance;

  @$pb.TagNumber(1)
  MeterClientRequest get meterClientRequest => $_getN(0);
  @$pb.TagNumber(1)
  set meterClientRequest(MeterClientRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMeterClientRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearMeterClientRequest() => clearField(1);
  @$pb.TagNumber(1)
  MeterClientRequest ensureMeterClientRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  MeterClientResponse get meterClientResponse => $_getN(1);
  @$pb.TagNumber(2)
  set meterClientResponse(MeterClientResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMeterClientResponse() => $_has(1);
  @$pb.TagNumber(2)
  void clearMeterClientResponse() => clearField(2);
  @$pb.TagNumber(2)
  MeterClientResponse ensureMeterClientResponse() => $_ensure(1);

  @$pb.TagNumber(3)
  MeterClientConfirm get meterClientConfirm => $_getN(2);
  @$pb.TagNumber(3)
  set meterClientConfirm(MeterClientConfirm v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasMeterClientConfirm() => $_has(2);
  @$pb.TagNumber(3)
  void clearMeterClientConfirm() => clearField(3);
  @$pb.TagNumber(3)
  MeterClientConfirm ensureMeterClientConfirm() => $_ensure(2);
}

class HomekitClientMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HomekitClientMessage', createEmptyInstance: create)
    ..aOM<SetHomekitModeClientRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'setHomekitModeClientRequest', protoName: 'setHomekitModeClientRequest', subBuilder: SetHomekitModeClientRequest.create)
    ..aOM<SetHomekitModeClientResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'setHomekitModeClientResponse', protoName: 'setHomekitModeClientResponse', subBuilder: SetHomekitModeClientResponse.create)
    ..hasRequiredFields = false
  ;

  HomekitClientMessage._() : super();
  factory HomekitClientMessage({
    SetHomekitModeClientRequest? setHomekitModeClientRequest,
    SetHomekitModeClientResponse? setHomekitModeClientResponse,
  }) {
    final _result = create();
    if (setHomekitModeClientRequest != null) {
      _result.setHomekitModeClientRequest = setHomekitModeClientRequest;
    }
    if (setHomekitModeClientResponse != null) {
      _result.setHomekitModeClientResponse = setHomekitModeClientResponse;
    }
    return _result;
  }
  factory HomekitClientMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HomekitClientMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HomekitClientMessage clone() => HomekitClientMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HomekitClientMessage copyWith(void Function(HomekitClientMessage) updates) => super.copyWith((message) => updates(message as HomekitClientMessage)) as HomekitClientMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HomekitClientMessage create() => HomekitClientMessage._();
  HomekitClientMessage createEmptyInstance() => create();
  static $pb.PbList<HomekitClientMessage> createRepeated() => $pb.PbList<HomekitClientMessage>();
  @$core.pragma('dart2js:noInline')
  static HomekitClientMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HomekitClientMessage>(create);
  static HomekitClientMessage? _defaultInstance;

  @$pb.TagNumber(1)
  SetHomekitModeClientRequest get setHomekitModeClientRequest => $_getN(0);
  @$pb.TagNumber(1)
  set setHomekitModeClientRequest(SetHomekitModeClientRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSetHomekitModeClientRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearSetHomekitModeClientRequest() => clearField(1);
  @$pb.TagNumber(1)
  SetHomekitModeClientRequest ensureSetHomekitModeClientRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  SetHomekitModeClientResponse get setHomekitModeClientResponse => $_getN(1);
  @$pb.TagNumber(2)
  set setHomekitModeClientResponse(SetHomekitModeClientResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSetHomekitModeClientResponse() => $_has(1);
  @$pb.TagNumber(2)
  void clearSetHomekitModeClientResponse() => clearField(2);
  @$pb.TagNumber(2)
  SetHomekitModeClientResponse ensureSetHomekitModeClientResponse() => $_ensure(1);
}

class SceneTriggerClientMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SceneTriggerClientMessage', createEmptyInstance: create)
    ..aOM<SceneTriggerClientRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneTriggerClientRequest', protoName: 'sceneTriggerClientRequest', subBuilder: SceneTriggerClientRequest.create)
    ..aOM<SceneTriggerClientResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneTriggerClientResponse', protoName: 'sceneTriggerClientResponse', subBuilder: SceneTriggerClientResponse.create)
    ..hasRequiredFields = false
  ;

  SceneTriggerClientMessage._() : super();
  factory SceneTriggerClientMessage({
    SceneTriggerClientRequest? sceneTriggerClientRequest,
    SceneTriggerClientResponse? sceneTriggerClientResponse,
  }) {
    final _result = create();
    if (sceneTriggerClientRequest != null) {
      _result.sceneTriggerClientRequest = sceneTriggerClientRequest;
    }
    if (sceneTriggerClientResponse != null) {
      _result.sceneTriggerClientResponse = sceneTriggerClientResponse;
    }
    return _result;
  }
  factory SceneTriggerClientMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SceneTriggerClientMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SceneTriggerClientMessage clone() => SceneTriggerClientMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SceneTriggerClientMessage copyWith(void Function(SceneTriggerClientMessage) updates) => super.copyWith((message) => updates(message as SceneTriggerClientMessage)) as SceneTriggerClientMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SceneTriggerClientMessage create() => SceneTriggerClientMessage._();
  SceneTriggerClientMessage createEmptyInstance() => create();
  static $pb.PbList<SceneTriggerClientMessage> createRepeated() => $pb.PbList<SceneTriggerClientMessage>();
  @$core.pragma('dart2js:noInline')
  static SceneTriggerClientMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SceneTriggerClientMessage>(create);
  static SceneTriggerClientMessage? _defaultInstance;

  @$pb.TagNumber(1)
  SceneTriggerClientRequest get sceneTriggerClientRequest => $_getN(0);
  @$pb.TagNumber(1)
  set sceneTriggerClientRequest(SceneTriggerClientRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSceneTriggerClientRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearSceneTriggerClientRequest() => clearField(1);
  @$pb.TagNumber(1)
  SceneTriggerClientRequest ensureSceneTriggerClientRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  SceneTriggerClientResponse get sceneTriggerClientResponse => $_getN(1);
  @$pb.TagNumber(2)
  set sceneTriggerClientResponse(SceneTriggerClientResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSceneTriggerClientResponse() => $_has(1);
  @$pb.TagNumber(2)
  void clearSceneTriggerClientResponse() => clearField(2);
  @$pb.TagNumber(2)
  SceneTriggerClientResponse ensureSceneTriggerClientResponse() => $_ensure(1);
}

class CurtainClientMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CurtainClientMessage', createEmptyInstance: create)
    ..aOM<CurtainClientRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainClientRequest', protoName: 'curtainClientRequest', subBuilder: CurtainClientRequest.create)
    ..aOM<CurtainClientResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainClientResponse', protoName: 'curtainClientResponse', subBuilder: CurtainClientResponse.create)
    ..hasRequiredFields = false
  ;

  CurtainClientMessage._() : super();
  factory CurtainClientMessage({
    CurtainClientRequest? curtainClientRequest,
    CurtainClientResponse? curtainClientResponse,
  }) {
    final _result = create();
    if (curtainClientRequest != null) {
      _result.curtainClientRequest = curtainClientRequest;
    }
    if (curtainClientResponse != null) {
      _result.curtainClientResponse = curtainClientResponse;
    }
    return _result;
  }
  factory CurtainClientMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CurtainClientMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CurtainClientMessage clone() => CurtainClientMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CurtainClientMessage copyWith(void Function(CurtainClientMessage) updates) => super.copyWith((message) => updates(message as CurtainClientMessage)) as CurtainClientMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CurtainClientMessage create() => CurtainClientMessage._();
  CurtainClientMessage createEmptyInstance() => create();
  static $pb.PbList<CurtainClientMessage> createRepeated() => $pb.PbList<CurtainClientMessage>();
  @$core.pragma('dart2js:noInline')
  static CurtainClientMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CurtainClientMessage>(create);
  static CurtainClientMessage? _defaultInstance;

  @$pb.TagNumber(1)
  CurtainClientRequest get curtainClientRequest => $_getN(0);
  @$pb.TagNumber(1)
  set curtainClientRequest(CurtainClientRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCurtainClientRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurtainClientRequest() => clearField(1);
  @$pb.TagNumber(1)
  CurtainClientRequest ensureCurtainClientRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  CurtainClientResponse get curtainClientResponse => $_getN(1);
  @$pb.TagNumber(2)
  set curtainClientResponse(CurtainClientResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurtainClientResponse() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurtainClientResponse() => clearField(2);
  @$pb.TagNumber(2)
  CurtainClientResponse ensureCurtainClientResponse() => $_ensure(1);
}

class TouchPanelClientMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TouchPanelClientMessage', createEmptyInstance: create)
    ..aOM<TouchPanelChangeComponentClientRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelChangeComponentClientRequest', protoName: 'touchPanelChangeComponentClientRequest', subBuilder: TouchPanelChangeComponentClientRequest.create)
    ..aOM<TouchPanelControlSwitcherClientRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelControlSwitcherClientRequest', protoName: 'touchPanelControlSwitcherClientRequest', subBuilder: TouchPanelControlSwitcherClientRequest.create)
    ..aOM<TouchPanelUpdateSwitcherClientRequest>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelUpdateSwitcherClientRequest', protoName: 'touchPanelUpdateSwitcherClientRequest', subBuilder: TouchPanelUpdateSwitcherClientRequest.create)
    ..aOM<TouchPanelControlCurtainSwitcherClientRequest>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelControlCurtainSwitcherClientRequest', protoName: 'touchPanelControlCurtainSwitcherClientRequest', subBuilder: TouchPanelControlCurtainSwitcherClientRequest.create)
    ..aOM<TouchPanelUpdateCurtainSwitcherClientRequest>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelUpdateCurtainSwitcherClientRequest', protoName: 'touchPanelUpdateCurtainSwitcherClientRequest', subBuilder: TouchPanelUpdateCurtainSwitcherClientRequest.create)
    ..aOM<TouchPanelUpdateSceneClientRequest>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelUpdateSceneClientRequest', protoName: 'touchPanelUpdateSceneClientRequest', subBuilder: TouchPanelUpdateSceneClientRequest.create)
    ..aOM<TouchPanelControlLedDriverClientRequest>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelControlLedDriverClientRequest', protoName: 'touchPanelControlLedDriverClientRequest', subBuilder: TouchPanelControlLedDriverClientRequest.create)
    ..aOM<TouchPanelUpdateLedDriverClientRequest>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelUpdateLedDriverClientRequest', protoName: 'touchPanelUpdateLedDriverClientRequest', subBuilder: TouchPanelUpdateLedDriverClientRequest.create)
    ..hasRequiredFields = false
  ;

  TouchPanelClientMessage._() : super();
  factory TouchPanelClientMessage({
    TouchPanelChangeComponentClientRequest? touchPanelChangeComponentClientRequest,
    TouchPanelControlSwitcherClientRequest? touchPanelControlSwitcherClientRequest,
    TouchPanelUpdateSwitcherClientRequest? touchPanelUpdateSwitcherClientRequest,
    TouchPanelControlCurtainSwitcherClientRequest? touchPanelControlCurtainSwitcherClientRequest,
    TouchPanelUpdateCurtainSwitcherClientRequest? touchPanelUpdateCurtainSwitcherClientRequest,
    TouchPanelUpdateSceneClientRequest? touchPanelUpdateSceneClientRequest,
    TouchPanelControlLedDriverClientRequest? touchPanelControlLedDriverClientRequest,
    TouchPanelUpdateLedDriverClientRequest? touchPanelUpdateLedDriverClientRequest,
  }) {
    final _result = create();
    if (touchPanelChangeComponentClientRequest != null) {
      _result.touchPanelChangeComponentClientRequest = touchPanelChangeComponentClientRequest;
    }
    if (touchPanelControlSwitcherClientRequest != null) {
      _result.touchPanelControlSwitcherClientRequest = touchPanelControlSwitcherClientRequest;
    }
    if (touchPanelUpdateSwitcherClientRequest != null) {
      _result.touchPanelUpdateSwitcherClientRequest = touchPanelUpdateSwitcherClientRequest;
    }
    if (touchPanelControlCurtainSwitcherClientRequest != null) {
      _result.touchPanelControlCurtainSwitcherClientRequest = touchPanelControlCurtainSwitcherClientRequest;
    }
    if (touchPanelUpdateCurtainSwitcherClientRequest != null) {
      _result.touchPanelUpdateCurtainSwitcherClientRequest = touchPanelUpdateCurtainSwitcherClientRequest;
    }
    if (touchPanelUpdateSceneClientRequest != null) {
      _result.touchPanelUpdateSceneClientRequest = touchPanelUpdateSceneClientRequest;
    }
    if (touchPanelControlLedDriverClientRequest != null) {
      _result.touchPanelControlLedDriverClientRequest = touchPanelControlLedDriverClientRequest;
    }
    if (touchPanelUpdateLedDriverClientRequest != null) {
      _result.touchPanelUpdateLedDriverClientRequest = touchPanelUpdateLedDriverClientRequest;
    }
    return _result;
  }
  factory TouchPanelClientMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TouchPanelClientMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TouchPanelClientMessage clone() => TouchPanelClientMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TouchPanelClientMessage copyWith(void Function(TouchPanelClientMessage) updates) => super.copyWith((message) => updates(message as TouchPanelClientMessage)) as TouchPanelClientMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TouchPanelClientMessage create() => TouchPanelClientMessage._();
  TouchPanelClientMessage createEmptyInstance() => create();
  static $pb.PbList<TouchPanelClientMessage> createRepeated() => $pb.PbList<TouchPanelClientMessage>();
  @$core.pragma('dart2js:noInline')
  static TouchPanelClientMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TouchPanelClientMessage>(create);
  static TouchPanelClientMessage? _defaultInstance;

  @$pb.TagNumber(1)
  TouchPanelChangeComponentClientRequest get touchPanelChangeComponentClientRequest => $_getN(0);
  @$pb.TagNumber(1)
  set touchPanelChangeComponentClientRequest(TouchPanelChangeComponentClientRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTouchPanelChangeComponentClientRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearTouchPanelChangeComponentClientRequest() => clearField(1);
  @$pb.TagNumber(1)
  TouchPanelChangeComponentClientRequest ensureTouchPanelChangeComponentClientRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  TouchPanelControlSwitcherClientRequest get touchPanelControlSwitcherClientRequest => $_getN(1);
  @$pb.TagNumber(2)
  set touchPanelControlSwitcherClientRequest(TouchPanelControlSwitcherClientRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTouchPanelControlSwitcherClientRequest() => $_has(1);
  @$pb.TagNumber(2)
  void clearTouchPanelControlSwitcherClientRequest() => clearField(2);
  @$pb.TagNumber(2)
  TouchPanelControlSwitcherClientRequest ensureTouchPanelControlSwitcherClientRequest() => $_ensure(1);

  @$pb.TagNumber(3)
  TouchPanelUpdateSwitcherClientRequest get touchPanelUpdateSwitcherClientRequest => $_getN(2);
  @$pb.TagNumber(3)
  set touchPanelUpdateSwitcherClientRequest(TouchPanelUpdateSwitcherClientRequest v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTouchPanelUpdateSwitcherClientRequest() => $_has(2);
  @$pb.TagNumber(3)
  void clearTouchPanelUpdateSwitcherClientRequest() => clearField(3);
  @$pb.TagNumber(3)
  TouchPanelUpdateSwitcherClientRequest ensureTouchPanelUpdateSwitcherClientRequest() => $_ensure(2);

  @$pb.TagNumber(4)
  TouchPanelControlCurtainSwitcherClientRequest get touchPanelControlCurtainSwitcherClientRequest => $_getN(3);
  @$pb.TagNumber(4)
  set touchPanelControlCurtainSwitcherClientRequest(TouchPanelControlCurtainSwitcherClientRequest v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasTouchPanelControlCurtainSwitcherClientRequest() => $_has(3);
  @$pb.TagNumber(4)
  void clearTouchPanelControlCurtainSwitcherClientRequest() => clearField(4);
  @$pb.TagNumber(4)
  TouchPanelControlCurtainSwitcherClientRequest ensureTouchPanelControlCurtainSwitcherClientRequest() => $_ensure(3);

  @$pb.TagNumber(5)
  TouchPanelUpdateCurtainSwitcherClientRequest get touchPanelUpdateCurtainSwitcherClientRequest => $_getN(4);
  @$pb.TagNumber(5)
  set touchPanelUpdateCurtainSwitcherClientRequest(TouchPanelUpdateCurtainSwitcherClientRequest v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTouchPanelUpdateCurtainSwitcherClientRequest() => $_has(4);
  @$pb.TagNumber(5)
  void clearTouchPanelUpdateCurtainSwitcherClientRequest() => clearField(5);
  @$pb.TagNumber(5)
  TouchPanelUpdateCurtainSwitcherClientRequest ensureTouchPanelUpdateCurtainSwitcherClientRequest() => $_ensure(4);

  @$pb.TagNumber(6)
  TouchPanelUpdateSceneClientRequest get touchPanelUpdateSceneClientRequest => $_getN(5);
  @$pb.TagNumber(6)
  set touchPanelUpdateSceneClientRequest(TouchPanelUpdateSceneClientRequest v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasTouchPanelUpdateSceneClientRequest() => $_has(5);
  @$pb.TagNumber(6)
  void clearTouchPanelUpdateSceneClientRequest() => clearField(6);
  @$pb.TagNumber(6)
  TouchPanelUpdateSceneClientRequest ensureTouchPanelUpdateSceneClientRequest() => $_ensure(5);

  @$pb.TagNumber(7)
  TouchPanelControlLedDriverClientRequest get touchPanelControlLedDriverClientRequest => $_getN(6);
  @$pb.TagNumber(7)
  set touchPanelControlLedDriverClientRequest(TouchPanelControlLedDriverClientRequest v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasTouchPanelControlLedDriverClientRequest() => $_has(6);
  @$pb.TagNumber(7)
  void clearTouchPanelControlLedDriverClientRequest() => clearField(7);
  @$pb.TagNumber(7)
  TouchPanelControlLedDriverClientRequest ensureTouchPanelControlLedDriverClientRequest() => $_ensure(6);

  @$pb.TagNumber(8)
  TouchPanelUpdateLedDriverClientRequest get touchPanelUpdateLedDriverClientRequest => $_getN(7);
  @$pb.TagNumber(8)
  set touchPanelUpdateLedDriverClientRequest(TouchPanelUpdateLedDriverClientRequest v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasTouchPanelUpdateLedDriverClientRequest() => $_has(7);
  @$pb.TagNumber(8)
  void clearTouchPanelUpdateLedDriverClientRequest() => clearField(8);
  @$pb.TagNumber(8)
  TouchPanelUpdateLedDriverClientRequest ensureTouchPanelUpdateLedDriverClientRequest() => $_ensure(7);
}

class ClientMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ClientMessage', createEmptyInstance: create)
    ..aOM<DeviceClientMessage>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceClientMessage', protoName: 'deviceClientMessage', subBuilder: DeviceClientMessage.create)
    ..aOM<SwitcherClientMessage>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcherClientMessage', protoName: 'switcherClientMessage', subBuilder: SwitcherClientMessage.create)
    ..aOM<CurtainSwitcherClientMessage>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainSwitcherClientMessage', protoName: 'curtainSwitcherClientMessage', subBuilder: CurtainSwitcherClientMessage.create)
    ..aOM<AirConditionerClientMessage>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'airConditionerClientMessage', protoName: 'airConditionerClientMessage', subBuilder: AirConditionerClientMessage.create)
    ..aOM<RemoteClientMessage>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteClientMessage', protoName: 'remoteClientMessage', subBuilder: RemoteClientMessage.create)
    ..aOM<OnChangedClientMessage>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'onChangedClientMessage', protoName: 'onChangedClientMessage', subBuilder: OnChangedClientMessage.create)
    ..aOM<MotionClientMessage>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'motionClientMessage', protoName: 'motionClientMessage', subBuilder: MotionClientMessage.create)
    ..aOM<SceneClientMessage>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneClientMessage', protoName: 'sceneClientMessage', subBuilder: SceneClientMessage.create)
    ..aOM<LedDriverClientMessage>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ledDriverClientMessage', protoName: 'ledDriverClientMessage', subBuilder: LedDriverClientMessage.create)
    ..aOM<MeterClientMessage>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'meterClientMessage', protoName: 'meterClientMessage', subBuilder: MeterClientMessage.create)
    ..aOM<HomekitClientMessage>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'homekitClientMessage', protoName: 'homekitClientMessage', subBuilder: HomekitClientMessage.create)
    ..aOM<SceneTriggerClientMessage>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneTriggerClientMessage', protoName: 'sceneTriggerClientMessage', subBuilder: SceneTriggerClientMessage.create)
    ..aOM<CurtainClientMessage>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainClientMessage', protoName: 'curtainClientMessage', subBuilder: CurtainClientMessage.create)
    ..aOM<TouchPanelClientMessage>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanelClientMessage', protoName: 'touchPanelClientMessage', subBuilder: TouchPanelClientMessage.create)
    ..hasRequiredFields = false
  ;

  ClientMessage._() : super();
  factory ClientMessage({
    DeviceClientMessage? deviceClientMessage,
    SwitcherClientMessage? switcherClientMessage,
    CurtainSwitcherClientMessage? curtainSwitcherClientMessage,
    AirConditionerClientMessage? airConditionerClientMessage,
    RemoteClientMessage? remoteClientMessage,
    OnChangedClientMessage? onChangedClientMessage,
    MotionClientMessage? motionClientMessage,
    SceneClientMessage? sceneClientMessage,
    LedDriverClientMessage? ledDriverClientMessage,
    MeterClientMessage? meterClientMessage,
    HomekitClientMessage? homekitClientMessage,
    SceneTriggerClientMessage? sceneTriggerClientMessage,
    CurtainClientMessage? curtainClientMessage,
    TouchPanelClientMessage? touchPanelClientMessage,
  }) {
    final _result = create();
    if (deviceClientMessage != null) {
      _result.deviceClientMessage = deviceClientMessage;
    }
    if (switcherClientMessage != null) {
      _result.switcherClientMessage = switcherClientMessage;
    }
    if (curtainSwitcherClientMessage != null) {
      _result.curtainSwitcherClientMessage = curtainSwitcherClientMessage;
    }
    if (airConditionerClientMessage != null) {
      _result.airConditionerClientMessage = airConditionerClientMessage;
    }
    if (remoteClientMessage != null) {
      _result.remoteClientMessage = remoteClientMessage;
    }
    if (onChangedClientMessage != null) {
      _result.onChangedClientMessage = onChangedClientMessage;
    }
    if (motionClientMessage != null) {
      _result.motionClientMessage = motionClientMessage;
    }
    if (sceneClientMessage != null) {
      _result.sceneClientMessage = sceneClientMessage;
    }
    if (ledDriverClientMessage != null) {
      _result.ledDriverClientMessage = ledDriverClientMessage;
    }
    if (meterClientMessage != null) {
      _result.meterClientMessage = meterClientMessage;
    }
    if (homekitClientMessage != null) {
      _result.homekitClientMessage = homekitClientMessage;
    }
    if (sceneTriggerClientMessage != null) {
      _result.sceneTriggerClientMessage = sceneTriggerClientMessage;
    }
    if (curtainClientMessage != null) {
      _result.curtainClientMessage = curtainClientMessage;
    }
    if (touchPanelClientMessage != null) {
      _result.touchPanelClientMessage = touchPanelClientMessage;
    }
    return _result;
  }
  factory ClientMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClientMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ClientMessage clone() => ClientMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ClientMessage copyWith(void Function(ClientMessage) updates) => super.copyWith((message) => updates(message as ClientMessage)) as ClientMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ClientMessage create() => ClientMessage._();
  ClientMessage createEmptyInstance() => create();
  static $pb.PbList<ClientMessage> createRepeated() => $pb.PbList<ClientMessage>();
  @$core.pragma('dart2js:noInline')
  static ClientMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClientMessage>(create);
  static ClientMessage? _defaultInstance;

  @$pb.TagNumber(1)
  DeviceClientMessage get deviceClientMessage => $_getN(0);
  @$pb.TagNumber(1)
  set deviceClientMessage(DeviceClientMessage v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceClientMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceClientMessage() => clearField(1);
  @$pb.TagNumber(1)
  DeviceClientMessage ensureDeviceClientMessage() => $_ensure(0);

  @$pb.TagNumber(2)
  SwitcherClientMessage get switcherClientMessage => $_getN(1);
  @$pb.TagNumber(2)
  set switcherClientMessage(SwitcherClientMessage v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSwitcherClientMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearSwitcherClientMessage() => clearField(2);
  @$pb.TagNumber(2)
  SwitcherClientMessage ensureSwitcherClientMessage() => $_ensure(1);

  @$pb.TagNumber(3)
  CurtainSwitcherClientMessage get curtainSwitcherClientMessage => $_getN(2);
  @$pb.TagNumber(3)
  set curtainSwitcherClientMessage(CurtainSwitcherClientMessage v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCurtainSwitcherClientMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurtainSwitcherClientMessage() => clearField(3);
  @$pb.TagNumber(3)
  CurtainSwitcherClientMessage ensureCurtainSwitcherClientMessage() => $_ensure(2);

  @$pb.TagNumber(4)
  AirConditionerClientMessage get airConditionerClientMessage => $_getN(3);
  @$pb.TagNumber(4)
  set airConditionerClientMessage(AirConditionerClientMessage v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAirConditionerClientMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearAirConditionerClientMessage() => clearField(4);
  @$pb.TagNumber(4)
  AirConditionerClientMessage ensureAirConditionerClientMessage() => $_ensure(3);

  @$pb.TagNumber(5)
  RemoteClientMessage get remoteClientMessage => $_getN(4);
  @$pb.TagNumber(5)
  set remoteClientMessage(RemoteClientMessage v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasRemoteClientMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearRemoteClientMessage() => clearField(5);
  @$pb.TagNumber(5)
  RemoteClientMessage ensureRemoteClientMessage() => $_ensure(4);

  @$pb.TagNumber(6)
  OnChangedClientMessage get onChangedClientMessage => $_getN(5);
  @$pb.TagNumber(6)
  set onChangedClientMessage(OnChangedClientMessage v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasOnChangedClientMessage() => $_has(5);
  @$pb.TagNumber(6)
  void clearOnChangedClientMessage() => clearField(6);
  @$pb.TagNumber(6)
  OnChangedClientMessage ensureOnChangedClientMessage() => $_ensure(5);

  @$pb.TagNumber(7)
  MotionClientMessage get motionClientMessage => $_getN(6);
  @$pb.TagNumber(7)
  set motionClientMessage(MotionClientMessage v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasMotionClientMessage() => $_has(6);
  @$pb.TagNumber(7)
  void clearMotionClientMessage() => clearField(7);
  @$pb.TagNumber(7)
  MotionClientMessage ensureMotionClientMessage() => $_ensure(6);

  @$pb.TagNumber(8)
  SceneClientMessage get sceneClientMessage => $_getN(7);
  @$pb.TagNumber(8)
  set sceneClientMessage(SceneClientMessage v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasSceneClientMessage() => $_has(7);
  @$pb.TagNumber(8)
  void clearSceneClientMessage() => clearField(8);
  @$pb.TagNumber(8)
  SceneClientMessage ensureSceneClientMessage() => $_ensure(7);

  @$pb.TagNumber(9)
  LedDriverClientMessage get ledDriverClientMessage => $_getN(8);
  @$pb.TagNumber(9)
  set ledDriverClientMessage(LedDriverClientMessage v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasLedDriverClientMessage() => $_has(8);
  @$pb.TagNumber(9)
  void clearLedDriverClientMessage() => clearField(9);
  @$pb.TagNumber(9)
  LedDriverClientMessage ensureLedDriverClientMessage() => $_ensure(8);

  @$pb.TagNumber(10)
  MeterClientMessage get meterClientMessage => $_getN(9);
  @$pb.TagNumber(10)
  set meterClientMessage(MeterClientMessage v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasMeterClientMessage() => $_has(9);
  @$pb.TagNumber(10)
  void clearMeterClientMessage() => clearField(10);
  @$pb.TagNumber(10)
  MeterClientMessage ensureMeterClientMessage() => $_ensure(9);

  @$pb.TagNumber(11)
  HomekitClientMessage get homekitClientMessage => $_getN(10);
  @$pb.TagNumber(11)
  set homekitClientMessage(HomekitClientMessage v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasHomekitClientMessage() => $_has(10);
  @$pb.TagNumber(11)
  void clearHomekitClientMessage() => clearField(11);
  @$pb.TagNumber(11)
  HomekitClientMessage ensureHomekitClientMessage() => $_ensure(10);

  @$pb.TagNumber(12)
  SceneTriggerClientMessage get sceneTriggerClientMessage => $_getN(11);
  @$pb.TagNumber(12)
  set sceneTriggerClientMessage(SceneTriggerClientMessage v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasSceneTriggerClientMessage() => $_has(11);
  @$pb.TagNumber(12)
  void clearSceneTriggerClientMessage() => clearField(12);
  @$pb.TagNumber(12)
  SceneTriggerClientMessage ensureSceneTriggerClientMessage() => $_ensure(11);

  @$pb.TagNumber(13)
  CurtainClientMessage get curtainClientMessage => $_getN(12);
  @$pb.TagNumber(13)
  set curtainClientMessage(CurtainClientMessage v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasCurtainClientMessage() => $_has(12);
  @$pb.TagNumber(13)
  void clearCurtainClientMessage() => clearField(13);
  @$pb.TagNumber(13)
  CurtainClientMessage ensureCurtainClientMessage() => $_ensure(12);

  @$pb.TagNumber(14)
  TouchPanelClientMessage get touchPanelClientMessage => $_getN(13);
  @$pb.TagNumber(14)
  set touchPanelClientMessage(TouchPanelClientMessage v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasTouchPanelClientMessage() => $_has(13);
  @$pb.TagNumber(14)
  void clearTouchPanelClientMessage() => clearField(14);
  @$pb.TagNumber(14)
  TouchPanelClientMessage ensureTouchPanelClientMessage() => $_ensure(13);
}

