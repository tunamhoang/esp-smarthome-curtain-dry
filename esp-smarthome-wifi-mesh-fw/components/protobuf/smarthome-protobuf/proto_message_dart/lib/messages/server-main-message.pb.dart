///
//  Generated code. Do not modify.
//  source: server-main-message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'server-message.pb.dart' as $2;
import 'client-message.pb.dart' as $1;
import 'mesh-message.pb.dart' as $3;

class MessageHeader extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MessageHeader', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accessToken', protoName: 'accessToken')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..hasRequiredFields = false
  ;

  MessageHeader._() : super();
  factory MessageHeader({
    $core.String? accessToken,
    $core.String? userId,
    $core.String? deviceId,
    $core.String? hardwareId,
  }) {
    final _result = create();
    if (accessToken != null) {
      _result.accessToken = accessToken;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    return _result;
  }
  factory MessageHeader.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageHeader.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessageHeader clone() => MessageHeader()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessageHeader copyWith(void Function(MessageHeader) updates) => super.copyWith((message) => updates(message as MessageHeader)) as MessageHeader; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MessageHeader create() => MessageHeader._();
  MessageHeader createEmptyInstance() => create();
  static $pb.PbList<MessageHeader> createRepeated() => $pb.PbList<MessageHeader>();
  @$core.pragma('dart2js:noInline')
  static MessageHeader getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageHeader>(create);
  static MessageHeader? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get deviceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set deviceId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeviceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get hardwareId => $_getSZ(3);
  @$pb.TagNumber(4)
  set hardwareId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHardwareId() => $_has(3);
  @$pb.TagNumber(4)
  void clearHardwareId() => clearField(4);
}

class MainMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MainMessage', createEmptyInstance: create)
    ..aOM<$2.ServerMessage>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serverMessage', protoName: 'serverMessage', subBuilder: $2.ServerMessage.create)
    ..aOM<$1.ClientMessage>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'clientMessage', protoName: 'clientMessage', subBuilder: $1.ClientMessage.create)
    ..aOM<$3.MeshMessage>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'meshMessage', protoName: 'meshMessage', subBuilder: $3.MeshMessage.create)
    ..hasRequiredFields = false
  ;

  MainMessage._() : super();
  factory MainMessage({
    $2.ServerMessage? serverMessage,
    $1.ClientMessage? clientMessage,
    $3.MeshMessage? meshMessage,
  }) {
    final _result = create();
    if (serverMessage != null) {
      _result.serverMessage = serverMessage;
    }
    if (clientMessage != null) {
      _result.clientMessage = clientMessage;
    }
    if (meshMessage != null) {
      _result.meshMessage = meshMessage;
    }
    return _result;
  }
  factory MainMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MainMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MainMessage clone() => MainMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MainMessage copyWith(void Function(MainMessage) updates) => super.copyWith((message) => updates(message as MainMessage)) as MainMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MainMessage create() => MainMessage._();
  MainMessage createEmptyInstance() => create();
  static $pb.PbList<MainMessage> createRepeated() => $pb.PbList<MainMessage>();
  @$core.pragma('dart2js:noInline')
  static MainMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MainMessage>(create);
  static MainMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $2.ServerMessage get serverMessage => $_getN(0);
  @$pb.TagNumber(1)
  set serverMessage($2.ServerMessage v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasServerMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearServerMessage() => clearField(1);
  @$pb.TagNumber(1)
  $2.ServerMessage ensureServerMessage() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.ClientMessage get clientMessage => $_getN(1);
  @$pb.TagNumber(2)
  set clientMessage($1.ClientMessage v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasClientMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientMessage() => clearField(2);
  @$pb.TagNumber(2)
  $1.ClientMessage ensureClientMessage() => $_ensure(1);

  @$pb.TagNumber(3)
  $3.MeshMessage get meshMessage => $_getN(2);
  @$pb.TagNumber(3)
  set meshMessage($3.MeshMessage v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasMeshMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMeshMessage() => clearField(3);
  @$pb.TagNumber(3)
  $3.MeshMessage ensureMeshMessage() => $_ensure(2);
}

class MainMessageContainer extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MainMessageContainer', createEmptyInstance: create)
    ..aOM<MessageHeader>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'messageHeader', protoName: 'messageHeader', subBuilder: MessageHeader.create)
    ..aOM<MainMessage>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mainMessage', protoName: 'mainMessage', subBuilder: MainMessage.create)
    ..hasRequiredFields = false
  ;

  MainMessageContainer._() : super();
  factory MainMessageContainer({
    MessageHeader? messageHeader,
    MainMessage? mainMessage,
  }) {
    final _result = create();
    if (messageHeader != null) {
      _result.messageHeader = messageHeader;
    }
    if (mainMessage != null) {
      _result.mainMessage = mainMessage;
    }
    return _result;
  }
  factory MainMessageContainer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MainMessageContainer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MainMessageContainer clone() => MainMessageContainer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MainMessageContainer copyWith(void Function(MainMessageContainer) updates) => super.copyWith((message) => updates(message as MainMessageContainer)) as MainMessageContainer; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MainMessageContainer create() => MainMessageContainer._();
  MainMessageContainer createEmptyInstance() => create();
  static $pb.PbList<MainMessageContainer> createRepeated() => $pb.PbList<MainMessageContainer>();
  @$core.pragma('dart2js:noInline')
  static MainMessageContainer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MainMessageContainer>(create);
  static MainMessageContainer? _defaultInstance;

  @$pb.TagNumber(1)
  MessageHeader get messageHeader => $_getN(0);
  @$pb.TagNumber(1)
  set messageHeader(MessageHeader v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessageHeader() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageHeader() => clearField(1);
  @$pb.TagNumber(1)
  MessageHeader ensureMessageHeader() => $_ensure(0);

  @$pb.TagNumber(2)
  MainMessage get mainMessage => $_getN(1);
  @$pb.TagNumber(2)
  set mainMessage(MainMessage v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMainMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMainMessage() => clearField(2);
  @$pb.TagNumber(2)
  MainMessage ensureMainMessage() => $_ensure(1);
}

