///
//  Generated code. Do not modify.
//  source: mesh-message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'common-message.pb.dart' as $0;

import 'common-message.pbenum.dart' as $0;

class MeshRegisterRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MeshRegisterRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'model')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hwVersion', protoName: 'hwVersion')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'regToken', protoName: 'regToken')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceToken', protoName: 'deviceToken')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fwVersion', protoName: 'fwVersion')
    ..hasRequiredFields = false
  ;

  MeshRegisterRequest._() : super();
  factory MeshRegisterRequest({
    $core.String? hardwareId,
    $core.String? model,
    $core.String? hwVersion,
    $core.String? regToken,
    $core.String? deviceToken,
    $core.String? deviceId,
    $core.String? fwVersion,
  }) {
    final _result = create();
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    if (model != null) {
      _result.model = model;
    }
    if (hwVersion != null) {
      _result.hwVersion = hwVersion;
    }
    if (regToken != null) {
      _result.regToken = regToken;
    }
    if (deviceToken != null) {
      _result.deviceToken = deviceToken;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (fwVersion != null) {
      _result.fwVersion = fwVersion;
    }
    return _result;
  }
  factory MeshRegisterRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MeshRegisterRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MeshRegisterRequest clone() => MeshRegisterRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MeshRegisterRequest copyWith(void Function(MeshRegisterRequest) updates) => super.copyWith((message) => updates(message as MeshRegisterRequest)) as MeshRegisterRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MeshRegisterRequest create() => MeshRegisterRequest._();
  MeshRegisterRequest createEmptyInstance() => create();
  static $pb.PbList<MeshRegisterRequest> createRepeated() => $pb.PbList<MeshRegisterRequest>();
  @$core.pragma('dart2js:noInline')
  static MeshRegisterRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MeshRegisterRequest>(create);
  static MeshRegisterRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hardwareId => $_getSZ(0);
  @$pb.TagNumber(1)
  set hardwareId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHardwareId() => $_has(0);
  @$pb.TagNumber(1)
  void clearHardwareId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get model => $_getSZ(1);
  @$pb.TagNumber(2)
  set model($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasModel() => $_has(1);
  @$pb.TagNumber(2)
  void clearModel() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get hwVersion => $_getSZ(2);
  @$pb.TagNumber(3)
  set hwVersion($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHwVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearHwVersion() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get regToken => $_getSZ(3);
  @$pb.TagNumber(4)
  set regToken($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRegToken() => $_has(3);
  @$pb.TagNumber(4)
  void clearRegToken() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get deviceToken => $_getSZ(4);
  @$pb.TagNumber(5)
  set deviceToken($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDeviceToken() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeviceToken() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get deviceId => $_getSZ(5);
  @$pb.TagNumber(6)
  set deviceId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDeviceId() => $_has(5);
  @$pb.TagNumber(6)
  void clearDeviceId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get fwVersion => $_getSZ(6);
  @$pb.TagNumber(7)
  set fwVersion($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasFwVersion() => $_has(6);
  @$pb.TagNumber(7)
  void clearFwVersion() => clearField(7);
}

class MeshRegisterResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MeshRegisterResponse', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceToken', protoName: 'deviceToken')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'wsEnpoint', protoName: 'wsEnpoint')
    ..e<$0.DataType>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dataType', $pb.PbFieldType.OE, protoName: 'dataType', defaultOrMaker: $0.DataType.BINARIES, valueOf: $0.DataType.valueOf, enumValues: $0.DataType.values)
    ..aOM<$0.StatusCode>(1000, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', protoName: 'statusCode', subBuilder: $0.StatusCode.create)
    ..hasRequiredFields = false
  ;

  MeshRegisterResponse._() : super();
  factory MeshRegisterResponse({
    $core.String? hardwareId,
    $core.String? deviceToken,
    $core.String? wsEnpoint,
    $0.DataType? dataType,
    $0.StatusCode? statusCode,
  }) {
    final _result = create();
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    if (deviceToken != null) {
      _result.deviceToken = deviceToken;
    }
    if (wsEnpoint != null) {
      _result.wsEnpoint = wsEnpoint;
    }
    if (dataType != null) {
      _result.dataType = dataType;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    return _result;
  }
  factory MeshRegisterResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MeshRegisterResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MeshRegisterResponse clone() => MeshRegisterResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MeshRegisterResponse copyWith(void Function(MeshRegisterResponse) updates) => super.copyWith((message) => updates(message as MeshRegisterResponse)) as MeshRegisterResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MeshRegisterResponse create() => MeshRegisterResponse._();
  MeshRegisterResponse createEmptyInstance() => create();
  static $pb.PbList<MeshRegisterResponse> createRepeated() => $pb.PbList<MeshRegisterResponse>();
  @$core.pragma('dart2js:noInline')
  static MeshRegisterResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MeshRegisterResponse>(create);
  static MeshRegisterResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hardwareId => $_getSZ(0);
  @$pb.TagNumber(1)
  set hardwareId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHardwareId() => $_has(0);
  @$pb.TagNumber(1)
  void clearHardwareId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get deviceToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get wsEnpoint => $_getSZ(2);
  @$pb.TagNumber(3)
  set wsEnpoint($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWsEnpoint() => $_has(2);
  @$pb.TagNumber(3)
  void clearWsEnpoint() => clearField(3);

  @$pb.TagNumber(4)
  $0.DataType get dataType => $_getN(3);
  @$pb.TagNumber(4)
  set dataType($0.DataType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDataType() => $_has(3);
  @$pb.TagNumber(4)
  void clearDataType() => clearField(4);

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

class MeshOnChangedMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MeshOnChangedMessage', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serverConnected', $pb.PbFieldType.OU3, protoName: 'serverConnected')
    ..hasRequiredFields = false
  ;

  MeshOnChangedMessage._() : super();
  factory MeshOnChangedMessage({
    $core.String? hardwareId,
    $core.int? serverConnected,
  }) {
    final _result = create();
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    if (serverConnected != null) {
      _result.serverConnected = serverConnected;
    }
    return _result;
  }
  factory MeshOnChangedMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MeshOnChangedMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MeshOnChangedMessage clone() => MeshOnChangedMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MeshOnChangedMessage copyWith(void Function(MeshOnChangedMessage) updates) => super.copyWith((message) => updates(message as MeshOnChangedMessage)) as MeshOnChangedMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MeshOnChangedMessage create() => MeshOnChangedMessage._();
  MeshOnChangedMessage createEmptyInstance() => create();
  static $pb.PbList<MeshOnChangedMessage> createRepeated() => $pb.PbList<MeshOnChangedMessage>();
  @$core.pragma('dart2js:noInline')
  static MeshOnChangedMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MeshOnChangedMessage>(create);
  static MeshOnChangedMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hardwareId => $_getSZ(0);
  @$pb.TagNumber(1)
  set hardwareId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHardwareId() => $_has(0);
  @$pb.TagNumber(1)
  void clearHardwareId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get serverConnected => $_getIZ(1);
  @$pb.TagNumber(2)
  set serverConnected($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasServerConnected() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerConnected() => clearField(2);
}

class MeshDisconnectMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MeshDisconnectMessage', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rootChannel', $pb.PbFieldType.OU3, protoName: 'rootChannel')
    ..hasRequiredFields = false
  ;

  MeshDisconnectMessage._() : super();
  factory MeshDisconnectMessage({
    $core.int? rootChannel,
  }) {
    final _result = create();
    if (rootChannel != null) {
      _result.rootChannel = rootChannel;
    }
    return _result;
  }
  factory MeshDisconnectMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MeshDisconnectMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MeshDisconnectMessage clone() => MeshDisconnectMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MeshDisconnectMessage copyWith(void Function(MeshDisconnectMessage) updates) => super.copyWith((message) => updates(message as MeshDisconnectMessage)) as MeshDisconnectMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MeshDisconnectMessage create() => MeshDisconnectMessage._();
  MeshDisconnectMessage createEmptyInstance() => create();
  static $pb.PbList<MeshDisconnectMessage> createRepeated() => $pb.PbList<MeshDisconnectMessage>();
  @$core.pragma('dart2js:noInline')
  static MeshDisconnectMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MeshDisconnectMessage>(create);
  static MeshDisconnectMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rootChannel => $_getIZ(0);
  @$pb.TagNumber(1)
  set rootChannel($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRootChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearRootChannel() => clearField(1);
}

class MeshMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MeshMessage', createEmptyInstance: create)
    ..aOM<MeshRegisterRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'meshRegisterRequest', protoName: 'meshRegisterRequest', subBuilder: MeshRegisterRequest.create)
    ..aOM<MeshRegisterResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'meshRegisterResponse', protoName: 'meshRegisterResponse', subBuilder: MeshRegisterResponse.create)
    ..aOM<MeshOnChangedMessage>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'meshOnChangedMessage', protoName: 'meshOnChangedMessage', subBuilder: MeshOnChangedMessage.create)
    ..aOM<MeshDisconnectMessage>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'meshDisconnectMessage', protoName: 'meshDisconnectMessage', subBuilder: MeshDisconnectMessage.create)
    ..hasRequiredFields = false
  ;

  MeshMessage._() : super();
  factory MeshMessage({
    MeshRegisterRequest? meshRegisterRequest,
    MeshRegisterResponse? meshRegisterResponse,
    MeshOnChangedMessage? meshOnChangedMessage,
    MeshDisconnectMessage? meshDisconnectMessage,
  }) {
    final _result = create();
    if (meshRegisterRequest != null) {
      _result.meshRegisterRequest = meshRegisterRequest;
    }
    if (meshRegisterResponse != null) {
      _result.meshRegisterResponse = meshRegisterResponse;
    }
    if (meshOnChangedMessage != null) {
      _result.meshOnChangedMessage = meshOnChangedMessage;
    }
    if (meshDisconnectMessage != null) {
      _result.meshDisconnectMessage = meshDisconnectMessage;
    }
    return _result;
  }
  factory MeshMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MeshMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MeshMessage clone() => MeshMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MeshMessage copyWith(void Function(MeshMessage) updates) => super.copyWith((message) => updates(message as MeshMessage)) as MeshMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MeshMessage create() => MeshMessage._();
  MeshMessage createEmptyInstance() => create();
  static $pb.PbList<MeshMessage> createRepeated() => $pb.PbList<MeshMessage>();
  @$core.pragma('dart2js:noInline')
  static MeshMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MeshMessage>(create);
  static MeshMessage? _defaultInstance;

  @$pb.TagNumber(1)
  MeshRegisterRequest get meshRegisterRequest => $_getN(0);
  @$pb.TagNumber(1)
  set meshRegisterRequest(MeshRegisterRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMeshRegisterRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearMeshRegisterRequest() => clearField(1);
  @$pb.TagNumber(1)
  MeshRegisterRequest ensureMeshRegisterRequest() => $_ensure(0);

  @$pb.TagNumber(2)
  MeshRegisterResponse get meshRegisterResponse => $_getN(1);
  @$pb.TagNumber(2)
  set meshRegisterResponse(MeshRegisterResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMeshRegisterResponse() => $_has(1);
  @$pb.TagNumber(2)
  void clearMeshRegisterResponse() => clearField(2);
  @$pb.TagNumber(2)
  MeshRegisterResponse ensureMeshRegisterResponse() => $_ensure(1);

  @$pb.TagNumber(3)
  MeshOnChangedMessage get meshOnChangedMessage => $_getN(2);
  @$pb.TagNumber(3)
  set meshOnChangedMessage(MeshOnChangedMessage v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasMeshOnChangedMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMeshOnChangedMessage() => clearField(3);
  @$pb.TagNumber(3)
  MeshOnChangedMessage ensureMeshOnChangedMessage() => $_ensure(2);

  @$pb.TagNumber(4)
  MeshDisconnectMessage get meshDisconnectMessage => $_getN(3);
  @$pb.TagNumber(4)
  set meshDisconnectMessage(MeshDisconnectMessage v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMeshDisconnectMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMeshDisconnectMessage() => clearField(4);
  @$pb.TagNumber(4)
  MeshDisconnectMessage ensureMeshDisconnectMessage() => $_ensure(3);
}

