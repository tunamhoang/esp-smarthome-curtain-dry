///
//  Generated code. Do not modify.
//  source: common-message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'common-message.pbenum.dart';

export 'common-message.pbenum.dart';

class DateTime extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DateTime', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'day', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'month', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'year', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hour', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minute', $pb.PbFieldType.OU3)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'second', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  DateTime._() : super();
  factory DateTime({
    $core.int? day,
    $core.int? month,
    $core.int? year,
    $core.int? hour,
    $core.int? minute,
    $core.int? second,
  }) {
    final _result = create();
    if (day != null) {
      _result.day = day;
    }
    if (month != null) {
      _result.month = month;
    }
    if (year != null) {
      _result.year = year;
    }
    if (hour != null) {
      _result.hour = hour;
    }
    if (minute != null) {
      _result.minute = minute;
    }
    if (second != null) {
      _result.second = second;
    }
    return _result;
  }
  factory DateTime.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DateTime.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DateTime clone() => DateTime()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DateTime copyWith(void Function(DateTime) updates) => super.copyWith((message) => updates(message as DateTime)) as DateTime; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DateTime create() => DateTime._();
  DateTime createEmptyInstance() => create();
  static $pb.PbList<DateTime> createRepeated() => $pb.PbList<DateTime>();
  @$core.pragma('dart2js:noInline')
  static DateTime getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DateTime>(create);
  static DateTime? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get day => $_getIZ(0);
  @$pb.TagNumber(1)
  set day($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDay() => $_has(0);
  @$pb.TagNumber(1)
  void clearDay() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get month => $_getIZ(1);
  @$pb.TagNumber(2)
  set month($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMonth() => $_has(1);
  @$pb.TagNumber(2)
  void clearMonth() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get year => $_getIZ(2);
  @$pb.TagNumber(3)
  set year($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasYear() => $_has(2);
  @$pb.TagNumber(3)
  void clearYear() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get hour => $_getIZ(3);
  @$pb.TagNumber(4)
  set hour($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHour() => $_has(3);
  @$pb.TagNumber(4)
  void clearHour() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get minute => $_getIZ(4);
  @$pb.TagNumber(5)
  set minute($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMinute() => $_has(4);
  @$pb.TagNumber(5)
  void clearMinute() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get second => $_getIZ(5);
  @$pb.TagNumber(6)
  set second($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSecond() => $_has(5);
  @$pb.TagNumber(6)
  void clearSecond() => clearField(6);
}

class Project extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Project', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  Project._() : super();
  factory Project({
    $core.String? id,
    $core.String? code,
    $core.String? name,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (code != null) {
      _result.code = code;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory Project.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Project.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Project clone() => Project()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Project copyWith(void Function(Project) updates) => super.copyWith((message) => updates(message as Project)) as Project; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Project create() => Project._();
  Project createEmptyInstance() => create();
  static $pb.PbList<Project> createRepeated() => $pb.PbList<Project>();
  @$core.pragma('dart2js:noInline')
  static Project getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Project>(create);
  static Project? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);
}

class Building extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Building', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  Building._() : super();
  factory Building({
    $core.String? id,
    $core.String? code,
    $core.String? name,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (code != null) {
      _result.code = code;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory Building.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Building.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Building clone() => Building()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Building copyWith(void Function(Building) updates) => super.copyWith((message) => updates(message as Building)) as Building; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Building create() => Building._();
  Building createEmptyInstance() => create();
  static $pb.PbList<Building> createRepeated() => $pb.PbList<Building>();
  @$core.pragma('dart2js:noInline')
  static Building getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Building>(create);
  static Building? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);
}

class Floor extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Floor', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  Floor._() : super();
  factory Floor({
    $core.String? id,
    $core.String? code,
    $core.String? name,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (code != null) {
      _result.code = code;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory Floor.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Floor.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Floor clone() => Floor()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Floor copyWith(void Function(Floor) updates) => super.copyWith((message) => updates(message as Floor)) as Floor; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Floor create() => Floor._();
  Floor createEmptyInstance() => create();
  static $pb.PbList<Floor> createRepeated() => $pb.PbList<Floor>();
  @$core.pragma('dart2js:noInline')
  static Floor getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Floor>(create);
  static Floor? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);
}

class Apartment extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Apartment', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  Apartment._() : super();
  factory Apartment({
    $core.String? id,
    $core.String? code,
    $core.String? name,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (code != null) {
      _result.code = code;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory Apartment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Apartment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Apartment clone() => Apartment()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Apartment copyWith(void Function(Apartment) updates) => super.copyWith((message) => updates(message as Apartment)) as Apartment; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Apartment create() => Apartment._();
  Apartment createEmptyInstance() => create();
  static $pb.PbList<Apartment> createRepeated() => $pb.PbList<Apartment>();
  @$core.pragma('dart2js:noInline')
  static Apartment getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Apartment>(create);
  static Apartment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);
}

class ImageNetwork extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ImageNetwork', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'thumb')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'url')
    ..hasRequiredFields = false
  ;

  ImageNetwork._() : super();
  factory ImageNetwork({
    $core.String? thumb,
    $core.String? url,
  }) {
    final _result = create();
    if (thumb != null) {
      _result.thumb = thumb;
    }
    if (url != null) {
      _result.url = url;
    }
    return _result;
  }
  factory ImageNetwork.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageNetwork.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImageNetwork clone() => ImageNetwork()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImageNetwork copyWith(void Function(ImageNetwork) updates) => super.copyWith((message) => updates(message as ImageNetwork)) as ImageNetwork; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ImageNetwork create() => ImageNetwork._();
  ImageNetwork createEmptyInstance() => create();
  static $pb.PbList<ImageNetwork> createRepeated() => $pb.PbList<ImageNetwork>();
  @$core.pragma('dart2js:noInline')
  static ImageNetwork getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageNetwork>(create);
  static ImageNetwork? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get thumb => $_getSZ(0);
  @$pb.TagNumber(1)
  set thumb($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasThumb() => $_has(0);
  @$pb.TagNumber(1)
  void clearThumb() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);
}

class GroupControl extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GroupControl', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nameEn', protoName: 'nameEn')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..e<GroupDevice>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'group', $pb.PbFieldType.OE, defaultOrMaker: GroupDevice.SwitcherGroup, valueOf: GroupDevice.valueOf, enumValues: GroupDevice.values)
    ..aOM<Room>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'room', subBuilder: Room.create)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'count', $pb.PbFieldType.OU3)
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favorite')
    ..aOB(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'showHome', protoName: 'showHome')
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'autoOff', $pb.PbFieldType.OU3, protoName: 'autoOff')
    ..aOM<Device>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'device', subBuilder: Device.create)
    ..aOM<ControlState>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', subBuilder: ControlState.create)
    ..pc<Switcher>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switchers', $pb.PbFieldType.PM, subBuilder: Switcher.create)
    ..pc<CurtainSwitcher>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainSwitchers', $pb.PbFieldType.PM, protoName: 'curtainSwitchers', subBuilder: CurtainSwitcher.create)
    ..pc<Remote>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remotes', $pb.PbFieldType.PM, subBuilder: Remote.create)
    ..pc<Curtain>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtains', $pb.PbFieldType.PM, subBuilder: Curtain.create)
    ..hasRequiredFields = false
  ;

  GroupControl._() : super();
  factory GroupControl({
    $core.String? id,
    $core.String? name,
    $core.String? nameEn,
    $core.String? icon,
    GroupDevice? group,
    Room? room,
    $core.int? count,
    $core.bool? favorite,
    $core.bool? showHome,
    $core.int? autoOff,
    Device? device,
    ControlState? state,
    $core.Iterable<Switcher>? switchers,
    $core.Iterable<CurtainSwitcher>? curtainSwitchers,
    $core.Iterable<Remote>? remotes,
    $core.Iterable<Curtain>? curtains,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (nameEn != null) {
      _result.nameEn = nameEn;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (group != null) {
      _result.group = group;
    }
    if (room != null) {
      _result.room = room;
    }
    if (count != null) {
      _result.count = count;
    }
    if (favorite != null) {
      _result.favorite = favorite;
    }
    if (showHome != null) {
      _result.showHome = showHome;
    }
    if (autoOff != null) {
      _result.autoOff = autoOff;
    }
    if (device != null) {
      _result.device = device;
    }
    if (state != null) {
      _result.state = state;
    }
    if (switchers != null) {
      _result.switchers.addAll(switchers);
    }
    if (curtainSwitchers != null) {
      _result.curtainSwitchers.addAll(curtainSwitchers);
    }
    if (remotes != null) {
      _result.remotes.addAll(remotes);
    }
    if (curtains != null) {
      _result.curtains.addAll(curtains);
    }
    return _result;
  }
  factory GroupControl.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GroupControl.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GroupControl clone() => GroupControl()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GroupControl copyWith(void Function(GroupControl) updates) => super.copyWith((message) => updates(message as GroupControl)) as GroupControl; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GroupControl create() => GroupControl._();
  GroupControl createEmptyInstance() => create();
  static $pb.PbList<GroupControl> createRepeated() => $pb.PbList<GroupControl>();
  @$core.pragma('dart2js:noInline')
  static GroupControl getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GroupControl>(create);
  static GroupControl? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get nameEn => $_getSZ(2);
  @$pb.TagNumber(3)
  set nameEn($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNameEn() => $_has(2);
  @$pb.TagNumber(3)
  void clearNameEn() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => clearField(4);

  @$pb.TagNumber(5)
  GroupDevice get group => $_getN(4);
  @$pb.TagNumber(5)
  set group(GroupDevice v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasGroup() => $_has(4);
  @$pb.TagNumber(5)
  void clearGroup() => clearField(5);

  @$pb.TagNumber(6)
  Room get room => $_getN(5);
  @$pb.TagNumber(6)
  set room(Room v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasRoom() => $_has(5);
  @$pb.TagNumber(6)
  void clearRoom() => clearField(6);
  @$pb.TagNumber(6)
  Room ensureRoom() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.int get count => $_getIZ(6);
  @$pb.TagNumber(7)
  set count($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearCount() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get favorite => $_getBF(7);
  @$pb.TagNumber(8)
  set favorite($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasFavorite() => $_has(7);
  @$pb.TagNumber(8)
  void clearFavorite() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get showHome => $_getBF(8);
  @$pb.TagNumber(9)
  set showHome($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasShowHome() => $_has(8);
  @$pb.TagNumber(9)
  void clearShowHome() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get autoOff => $_getIZ(9);
  @$pb.TagNumber(10)
  set autoOff($core.int v) { $_setUnsignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAutoOff() => $_has(9);
  @$pb.TagNumber(10)
  void clearAutoOff() => clearField(10);

  @$pb.TagNumber(11)
  Device get device => $_getN(10);
  @$pb.TagNumber(11)
  set device(Device v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasDevice() => $_has(10);
  @$pb.TagNumber(11)
  void clearDevice() => clearField(11);
  @$pb.TagNumber(11)
  Device ensureDevice() => $_ensure(10);

  @$pb.TagNumber(12)
  ControlState get state => $_getN(11);
  @$pb.TagNumber(12)
  set state(ControlState v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasState() => $_has(11);
  @$pb.TagNumber(12)
  void clearState() => clearField(12);
  @$pb.TagNumber(12)
  ControlState ensureState() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.List<Switcher> get switchers => $_getList(12);

  @$pb.TagNumber(14)
  $core.List<CurtainSwitcher> get curtainSwitchers => $_getList(13);

  @$pb.TagNumber(15)
  $core.List<Remote> get remotes => $_getList(14);

  @$pb.TagNumber(16)
  $core.List<Curtain> get curtains => $_getList(15);
}

class Device extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Device', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId', protoName: 'roomId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceToken', protoName: 'deviceToken')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceName', protoName: 'deviceName')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'brandName', protoName: 'brandName')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomName', protoName: 'roomName')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ip')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mdns')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'model')
    ..a<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signal', $pb.PbFieldType.O3)
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firmwareVersion', protoName: 'firmwareVersion')
    ..aOS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareVersion', protoName: 'hardwareVersion')
    ..aOS(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..aOS(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accessKey', protoName: 'accessKey')
    ..e<ConnectionState>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'connectionState', $pb.PbFieldType.OE, protoName: 'connectionState', defaultOrMaker: ConnectionState.Offline, valueOf: ConnectionState.valueOf, enumValues: ConnectionState.values)
    ..e<GroupDevice>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'group', $pb.PbFieldType.OE, defaultOrMaker: GroupDevice.SwitcherGroup, valueOf: GroupDevice.valueOf, enumValues: GroupDevice.values)
    ..a<$core.int>(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateMode', $pb.PbFieldType.OU3, protoName: 'updateMode')
    ..aOS(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gatewayId', protoName: 'gatewayId')
    ..a<$core.int>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'reactivity', $pb.PbFieldType.OU3)
    ..a<$core.int>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'brightness', $pb.PbFieldType.OU3)
    ..a<$core.int>(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timeDelay', $pb.PbFieldType.OU3, protoName: 'timeDelay')
    ..a<$core.int>(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneActiveMap', $pb.PbFieldType.OU3, protoName: 'sceneActiveMap')
    ..aOB(24, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notification')
    ..hasRequiredFields = false
  ;

  Device._() : super();
  factory Device({
    $core.String? deviceId,
    $core.String? roomId,
    $core.String? deviceToken,
    $core.String? deviceName,
    $core.String? brandName,
    $core.String? roomName,
    $core.String? icon,
    $core.String? ip,
    $core.String? mdns,
    $core.String? model,
    $core.int? signal,
    $core.String? firmwareVersion,
    $core.String? hardwareVersion,
    $core.String? hardwareId,
    $core.String? accessKey,
    ConnectionState? connectionState,
    GroupDevice? group,
    $core.int? updateMode,
    $core.String? gatewayId,
    $core.int? reactivity,
    $core.int? brightness,
    $core.int? timeDelay,
    $core.int? sceneActiveMap,
    $core.bool? notification,
  }) {
    final _result = create();
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (deviceToken != null) {
      _result.deviceToken = deviceToken;
    }
    if (deviceName != null) {
      _result.deviceName = deviceName;
    }
    if (brandName != null) {
      _result.brandName = brandName;
    }
    if (roomName != null) {
      _result.roomName = roomName;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (ip != null) {
      _result.ip = ip;
    }
    if (mdns != null) {
      _result.mdns = mdns;
    }
    if (model != null) {
      _result.model = model;
    }
    if (signal != null) {
      _result.signal = signal;
    }
    if (firmwareVersion != null) {
      _result.firmwareVersion = firmwareVersion;
    }
    if (hardwareVersion != null) {
      _result.hardwareVersion = hardwareVersion;
    }
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    if (accessKey != null) {
      _result.accessKey = accessKey;
    }
    if (connectionState != null) {
      _result.connectionState = connectionState;
    }
    if (group != null) {
      _result.group = group;
    }
    if (updateMode != null) {
      _result.updateMode = updateMode;
    }
    if (gatewayId != null) {
      _result.gatewayId = gatewayId;
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
    if (notification != null) {
      _result.notification = notification;
    }
    return _result;
  }
  factory Device.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Device.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Device clone() => Device()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Device copyWith(void Function(Device) updates) => super.copyWith((message) => updates(message as Device)) as Device; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Device create() => Device._();
  Device createEmptyInstance() => create();
  static $pb.PbList<Device> createRepeated() => $pb.PbList<Device>();
  @$core.pragma('dart2js:noInline')
  static Device getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Device>(create);
  static Device? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get roomId => $_getSZ(1);
  @$pb.TagNumber(2)
  set roomId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get deviceToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set deviceToken($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeviceToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceToken() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get deviceName => $_getSZ(3);
  @$pb.TagNumber(4)
  set deviceName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDeviceName() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeviceName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get brandName => $_getSZ(4);
  @$pb.TagNumber(5)
  set brandName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBrandName() => $_has(4);
  @$pb.TagNumber(5)
  void clearBrandName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get roomName => $_getSZ(5);
  @$pb.TagNumber(6)
  set roomName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRoomName() => $_has(5);
  @$pb.TagNumber(6)
  void clearRoomName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get icon => $_getSZ(6);
  @$pb.TagNumber(7)
  set icon($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIcon() => $_has(6);
  @$pb.TagNumber(7)
  void clearIcon() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get ip => $_getSZ(7);
  @$pb.TagNumber(8)
  set ip($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasIp() => $_has(7);
  @$pb.TagNumber(8)
  void clearIp() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get mdns => $_getSZ(8);
  @$pb.TagNumber(9)
  set mdns($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasMdns() => $_has(8);
  @$pb.TagNumber(9)
  void clearMdns() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get model => $_getSZ(9);
  @$pb.TagNumber(10)
  set model($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasModel() => $_has(9);
  @$pb.TagNumber(10)
  void clearModel() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get signal => $_getIZ(10);
  @$pb.TagNumber(11)
  set signal($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasSignal() => $_has(10);
  @$pb.TagNumber(11)
  void clearSignal() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get firmwareVersion => $_getSZ(11);
  @$pb.TagNumber(12)
  set firmwareVersion($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasFirmwareVersion() => $_has(11);
  @$pb.TagNumber(12)
  void clearFirmwareVersion() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get hardwareVersion => $_getSZ(12);
  @$pb.TagNumber(13)
  set hardwareVersion($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasHardwareVersion() => $_has(12);
  @$pb.TagNumber(13)
  void clearHardwareVersion() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get hardwareId => $_getSZ(13);
  @$pb.TagNumber(14)
  set hardwareId($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasHardwareId() => $_has(13);
  @$pb.TagNumber(14)
  void clearHardwareId() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get accessKey => $_getSZ(14);
  @$pb.TagNumber(15)
  set accessKey($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasAccessKey() => $_has(14);
  @$pb.TagNumber(15)
  void clearAccessKey() => clearField(15);

  @$pb.TagNumber(16)
  ConnectionState get connectionState => $_getN(15);
  @$pb.TagNumber(16)
  set connectionState(ConnectionState v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasConnectionState() => $_has(15);
  @$pb.TagNumber(16)
  void clearConnectionState() => clearField(16);

  @$pb.TagNumber(17)
  GroupDevice get group => $_getN(16);
  @$pb.TagNumber(17)
  set group(GroupDevice v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasGroup() => $_has(16);
  @$pb.TagNumber(17)
  void clearGroup() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get updateMode => $_getIZ(17);
  @$pb.TagNumber(18)
  set updateMode($core.int v) { $_setUnsignedInt32(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasUpdateMode() => $_has(17);
  @$pb.TagNumber(18)
  void clearUpdateMode() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get gatewayId => $_getSZ(18);
  @$pb.TagNumber(19)
  set gatewayId($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasGatewayId() => $_has(18);
  @$pb.TagNumber(19)
  void clearGatewayId() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get reactivity => $_getIZ(19);
  @$pb.TagNumber(20)
  set reactivity($core.int v) { $_setUnsignedInt32(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasReactivity() => $_has(19);
  @$pb.TagNumber(20)
  void clearReactivity() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get brightness => $_getIZ(20);
  @$pb.TagNumber(21)
  set brightness($core.int v) { $_setUnsignedInt32(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasBrightness() => $_has(20);
  @$pb.TagNumber(21)
  void clearBrightness() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get timeDelay => $_getIZ(21);
  @$pb.TagNumber(22)
  set timeDelay($core.int v) { $_setUnsignedInt32(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasTimeDelay() => $_has(21);
  @$pb.TagNumber(22)
  void clearTimeDelay() => clearField(22);

  @$pb.TagNumber(23)
  $core.int get sceneActiveMap => $_getIZ(22);
  @$pb.TagNumber(23)
  set sceneActiveMap($core.int v) { $_setUnsignedInt32(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasSceneActiveMap() => $_has(22);
  @$pb.TagNumber(23)
  void clearSceneActiveMap() => clearField(23);

  @$pb.TagNumber(24)
  $core.bool get notification => $_getBF(23);
  @$pb.TagNumber(24)
  set notification($core.bool v) { $_setBool(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasNotification() => $_has(23);
  @$pb.TagNumber(24)
  void clearNotification() => clearField(24);
}

class Switcher extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Switcher', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nameEn', protoName: 'nameEn')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcher', $pb.PbFieldType.OU3)
    ..e<PowerState>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: PowerState.Off, valueOf: PowerState.valueOf, enumValues: PowerState.values)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'keepState', $pb.PbFieldType.OU3, protoName: 'keepState')
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favorite')
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order', $pb.PbFieldType.OU3)
    ..aOM<Device>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'device', subBuilder: Device.create)
    ..aOM<Room>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'room', subBuilder: Room.create)
    ..e<TypeDevice>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: TypeDevice.SwitchLight, valueOf: TypeDevice.valueOf, enumValues: TypeDevice.values)
    ..aOB(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'showHome', protoName: 'showHome')
    ..a<$core.int>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'autoOff', $pb.PbFieldType.OU3, protoName: 'autoOff')
    ..aOM<GroupControl>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupControl', protoName: 'groupControl', subBuilder: GroupControl.create)
    ..hasRequiredFields = false
  ;

  Switcher._() : super();
  factory Switcher({
    $core.String? id,
    $core.String? name,
    $core.String? nameEn,
    $core.String? icon,
    $core.int? switcher,
    PowerState? powerState,
    $core.int? keepState,
    $core.bool? favorite,
    $core.int? order,
    Device? device,
    Room? room,
    TypeDevice? type,
    $core.bool? showHome,
    $core.int? autoOff,
    GroupControl? groupControl,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (nameEn != null) {
      _result.nameEn = nameEn;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (switcher != null) {
      _result.switcher = switcher;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (keepState != null) {
      _result.keepState = keepState;
    }
    if (favorite != null) {
      _result.favorite = favorite;
    }
    if (order != null) {
      _result.order = order;
    }
    if (device != null) {
      _result.device = device;
    }
    if (room != null) {
      _result.room = room;
    }
    if (type != null) {
      _result.type = type;
    }
    if (showHome != null) {
      _result.showHome = showHome;
    }
    if (autoOff != null) {
      _result.autoOff = autoOff;
    }
    if (groupControl != null) {
      _result.groupControl = groupControl;
    }
    return _result;
  }
  factory Switcher.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Switcher.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Switcher clone() => Switcher()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Switcher copyWith(void Function(Switcher) updates) => super.copyWith((message) => updates(message as Switcher)) as Switcher; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Switcher create() => Switcher._();
  Switcher createEmptyInstance() => create();
  static $pb.PbList<Switcher> createRepeated() => $pb.PbList<Switcher>();
  @$core.pragma('dart2js:noInline')
  static Switcher getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Switcher>(create);
  static Switcher? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get nameEn => $_getSZ(2);
  @$pb.TagNumber(3)
  set nameEn($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNameEn() => $_has(2);
  @$pb.TagNumber(3)
  void clearNameEn() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get switcher => $_getIZ(4);
  @$pb.TagNumber(5)
  set switcher($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSwitcher() => $_has(4);
  @$pb.TagNumber(5)
  void clearSwitcher() => clearField(5);

  @$pb.TagNumber(6)
  PowerState get powerState => $_getN(5);
  @$pb.TagNumber(6)
  set powerState(PowerState v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasPowerState() => $_has(5);
  @$pb.TagNumber(6)
  void clearPowerState() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get keepState => $_getIZ(6);
  @$pb.TagNumber(7)
  set keepState($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasKeepState() => $_has(6);
  @$pb.TagNumber(7)
  void clearKeepState() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get favorite => $_getBF(7);
  @$pb.TagNumber(8)
  set favorite($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasFavorite() => $_has(7);
  @$pb.TagNumber(8)
  void clearFavorite() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get order => $_getIZ(8);
  @$pb.TagNumber(9)
  set order($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasOrder() => $_has(8);
  @$pb.TagNumber(9)
  void clearOrder() => clearField(9);

  @$pb.TagNumber(10)
  Device get device => $_getN(9);
  @$pb.TagNumber(10)
  set device(Device v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasDevice() => $_has(9);
  @$pb.TagNumber(10)
  void clearDevice() => clearField(10);
  @$pb.TagNumber(10)
  Device ensureDevice() => $_ensure(9);

  @$pb.TagNumber(11)
  Room get room => $_getN(10);
  @$pb.TagNumber(11)
  set room(Room v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasRoom() => $_has(10);
  @$pb.TagNumber(11)
  void clearRoom() => clearField(11);
  @$pb.TagNumber(11)
  Room ensureRoom() => $_ensure(10);

  @$pb.TagNumber(12)
  TypeDevice get type => $_getN(11);
  @$pb.TagNumber(12)
  set type(TypeDevice v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasType() => $_has(11);
  @$pb.TagNumber(12)
  void clearType() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get showHome => $_getBF(12);
  @$pb.TagNumber(13)
  set showHome($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasShowHome() => $_has(12);
  @$pb.TagNumber(13)
  void clearShowHome() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get autoOff => $_getIZ(13);
  @$pb.TagNumber(14)
  set autoOff($core.int v) { $_setUnsignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasAutoOff() => $_has(13);
  @$pb.TagNumber(14)
  void clearAutoOff() => clearField(14);

  @$pb.TagNumber(15)
  GroupControl get groupControl => $_getN(14);
  @$pb.TagNumber(15)
  set groupControl(GroupControl v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasGroupControl() => $_has(14);
  @$pb.TagNumber(15)
  void clearGroupControl() => clearField(15);
  @$pb.TagNumber(15)
  GroupControl ensureGroupControl() => $_ensure(14);
}

class LedItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LedItem', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nameEn', protoName: 'nameEn')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'index', $pb.PbFieldType.OU3)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'brightnessPercent', $pb.PbFieldType.O3, protoName: 'brightnessPercent')
    ..e<PowerState>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: PowerState.Off, valueOf: PowerState.valueOf, enumValues: PowerState.values)
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'keepState', $pb.PbFieldType.OU3, protoName: 'keepState')
    ..aOB(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favorite')
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order', $pb.PbFieldType.OU3)
    ..aOM<Device>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'device', subBuilder: Device.create)
    ..aOM<Room>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'room', subBuilder: Room.create)
    ..aOB(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'showHome', protoName: 'showHome')
    ..a<$core.int>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'autoOff', $pb.PbFieldType.OU3, protoName: 'autoOff')
    ..aOM<GroupControl>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupControl', protoName: 'groupControl', subBuilder: GroupControl.create)
    ..hasRequiredFields = false
  ;

  LedItem._() : super();
  factory LedItem({
    $core.String? id,
    $core.String? name,
    $core.String? nameEn,
    $core.String? icon,
    $core.int? index,
    $core.int? brightnessPercent,
    PowerState? powerState,
    $core.int? keepState,
    $core.bool? favorite,
    $core.int? order,
    Device? device,
    Room? room,
    $core.bool? showHome,
    $core.int? autoOff,
    GroupControl? groupControl,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (nameEn != null) {
      _result.nameEn = nameEn;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (index != null) {
      _result.index = index;
    }
    if (brightnessPercent != null) {
      _result.brightnessPercent = brightnessPercent;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (keepState != null) {
      _result.keepState = keepState;
    }
    if (favorite != null) {
      _result.favorite = favorite;
    }
    if (order != null) {
      _result.order = order;
    }
    if (device != null) {
      _result.device = device;
    }
    if (room != null) {
      _result.room = room;
    }
    if (showHome != null) {
      _result.showHome = showHome;
    }
    if (autoOff != null) {
      _result.autoOff = autoOff;
    }
    if (groupControl != null) {
      _result.groupControl = groupControl;
    }
    return _result;
  }
  factory LedItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LedItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LedItem clone() => LedItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LedItem copyWith(void Function(LedItem) updates) => super.copyWith((message) => updates(message as LedItem)) as LedItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LedItem create() => LedItem._();
  LedItem createEmptyInstance() => create();
  static $pb.PbList<LedItem> createRepeated() => $pb.PbList<LedItem>();
  @$core.pragma('dart2js:noInline')
  static LedItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LedItem>(create);
  static LedItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get nameEn => $_getSZ(2);
  @$pb.TagNumber(3)
  set nameEn($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNameEn() => $_has(2);
  @$pb.TagNumber(3)
  void clearNameEn() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get index => $_getIZ(4);
  @$pb.TagNumber(5)
  set index($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIndex() => $_has(4);
  @$pb.TagNumber(5)
  void clearIndex() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get brightnessPercent => $_getIZ(5);
  @$pb.TagNumber(6)
  set brightnessPercent($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBrightnessPercent() => $_has(5);
  @$pb.TagNumber(6)
  void clearBrightnessPercent() => clearField(6);

  @$pb.TagNumber(7)
  PowerState get powerState => $_getN(6);
  @$pb.TagNumber(7)
  set powerState(PowerState v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasPowerState() => $_has(6);
  @$pb.TagNumber(7)
  void clearPowerState() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get keepState => $_getIZ(7);
  @$pb.TagNumber(8)
  set keepState($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasKeepState() => $_has(7);
  @$pb.TagNumber(8)
  void clearKeepState() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get favorite => $_getBF(8);
  @$pb.TagNumber(9)
  set favorite($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasFavorite() => $_has(8);
  @$pb.TagNumber(9)
  void clearFavorite() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get order => $_getIZ(9);
  @$pb.TagNumber(10)
  set order($core.int v) { $_setUnsignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasOrder() => $_has(9);
  @$pb.TagNumber(10)
  void clearOrder() => clearField(10);

  @$pb.TagNumber(11)
  Device get device => $_getN(10);
  @$pb.TagNumber(11)
  set device(Device v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasDevice() => $_has(10);
  @$pb.TagNumber(11)
  void clearDevice() => clearField(11);
  @$pb.TagNumber(11)
  Device ensureDevice() => $_ensure(10);

  @$pb.TagNumber(12)
  Room get room => $_getN(11);
  @$pb.TagNumber(12)
  set room(Room v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasRoom() => $_has(11);
  @$pb.TagNumber(12)
  void clearRoom() => clearField(12);
  @$pb.TagNumber(12)
  Room ensureRoom() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.bool get showHome => $_getBF(12);
  @$pb.TagNumber(13)
  set showHome($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasShowHome() => $_has(12);
  @$pb.TagNumber(13)
  void clearShowHome() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get autoOff => $_getIZ(13);
  @$pb.TagNumber(14)
  set autoOff($core.int v) { $_setUnsignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasAutoOff() => $_has(13);
  @$pb.TagNumber(14)
  void clearAutoOff() => clearField(14);

  @$pb.TagNumber(15)
  GroupControl get groupControl => $_getN(14);
  @$pb.TagNumber(15)
  set groupControl(GroupControl v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasGroupControl() => $_has(14);
  @$pb.TagNumber(15)
  void clearGroupControl() => clearField(15);
  @$pb.TagNumber(15)
  GroupControl ensureGroupControl() => $_ensure(14);
}

class LedDriver extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LedDriver', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nameEn', protoName: 'nameEn')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..pc<LedItem>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ledItems', $pb.PbFieldType.PM, protoName: 'ledItems', subBuilder: LedItem.create)
    ..aOM<Device>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'device', subBuilder: Device.create)
    ..aOM<Room>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'room', subBuilder: Room.create)
    ..e<PowerState>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: PowerState.Off, valueOf: PowerState.valueOf, enumValues: PowerState.values)
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'brightnessPercent', $pb.PbFieldType.O3, protoName: 'brightnessPercent')
    ..aOM<GroupControl>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupControl', protoName: 'groupControl', subBuilder: GroupControl.create)
    ..hasRequiredFields = false
  ;

  LedDriver._() : super();
  factory LedDriver({
    $core.String? id,
    $core.String? name,
    $core.String? nameEn,
    $core.String? icon,
    $core.Iterable<LedItem>? ledItems,
    Device? device,
    Room? room,
    PowerState? powerState,
    $core.int? brightnessPercent,
    GroupControl? groupControl,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (nameEn != null) {
      _result.nameEn = nameEn;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (ledItems != null) {
      _result.ledItems.addAll(ledItems);
    }
    if (device != null) {
      _result.device = device;
    }
    if (room != null) {
      _result.room = room;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (brightnessPercent != null) {
      _result.brightnessPercent = brightnessPercent;
    }
    if (groupControl != null) {
      _result.groupControl = groupControl;
    }
    return _result;
  }
  factory LedDriver.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LedDriver.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LedDriver clone() => LedDriver()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LedDriver copyWith(void Function(LedDriver) updates) => super.copyWith((message) => updates(message as LedDriver)) as LedDriver; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LedDriver create() => LedDriver._();
  LedDriver createEmptyInstance() => create();
  static $pb.PbList<LedDriver> createRepeated() => $pb.PbList<LedDriver>();
  @$core.pragma('dart2js:noInline')
  static LedDriver getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LedDriver>(create);
  static LedDriver? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get nameEn => $_getSZ(2);
  @$pb.TagNumber(3)
  set nameEn($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNameEn() => $_has(2);
  @$pb.TagNumber(3)
  void clearNameEn() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<LedItem> get ledItems => $_getList(4);

  @$pb.TagNumber(6)
  Device get device => $_getN(5);
  @$pb.TagNumber(6)
  set device(Device v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDevice() => $_has(5);
  @$pb.TagNumber(6)
  void clearDevice() => clearField(6);
  @$pb.TagNumber(6)
  Device ensureDevice() => $_ensure(5);

  @$pb.TagNumber(7)
  Room get room => $_getN(6);
  @$pb.TagNumber(7)
  set room(Room v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasRoom() => $_has(6);
  @$pb.TagNumber(7)
  void clearRoom() => clearField(7);
  @$pb.TagNumber(7)
  Room ensureRoom() => $_ensure(6);

  @$pb.TagNumber(8)
  PowerState get powerState => $_getN(7);
  @$pb.TagNumber(8)
  set powerState(PowerState v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasPowerState() => $_has(7);
  @$pb.TagNumber(8)
  void clearPowerState() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get brightnessPercent => $_getIZ(8);
  @$pb.TagNumber(9)
  set brightnessPercent($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasBrightnessPercent() => $_has(8);
  @$pb.TagNumber(9)
  void clearBrightnessPercent() => clearField(9);

  @$pb.TagNumber(10)
  GroupControl get groupControl => $_getN(9);
  @$pb.TagNumber(10)
  set groupControl(GroupControl v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasGroupControl() => $_has(9);
  @$pb.TagNumber(10)
  void clearGroupControl() => clearField(10);
  @$pb.TagNumber(10)
  GroupControl ensureGroupControl() => $_ensure(9);
}

class BridgeInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BridgeInfo', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'targetSwitcher', $pb.PbFieldType.OU3, protoName: 'targetSwitcher')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'targetHardwareId', protoName: 'targetHardwareId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bridgeType', $pb.PbFieldType.OU3, protoName: 'bridgeType')
    ..e<GroupDevice>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceType', $pb.PbFieldType.OE, protoName: 'deviceType', defaultOrMaker: GroupDevice.SwitcherGroup, valueOf: GroupDevice.valueOf, enumValues: GroupDevice.values)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'executed')
    ..hasRequiredFields = false
  ;

  BridgeInfo._() : super();
  factory BridgeInfo({
    $core.int? targetSwitcher,
    $core.String? targetHardwareId,
    $core.int? bridgeType,
    GroupDevice? deviceType,
    $core.bool? executed,
  }) {
    final _result = create();
    if (targetSwitcher != null) {
      _result.targetSwitcher = targetSwitcher;
    }
    if (targetHardwareId != null) {
      _result.targetHardwareId = targetHardwareId;
    }
    if (bridgeType != null) {
      _result.bridgeType = bridgeType;
    }
    if (deviceType != null) {
      _result.deviceType = deviceType;
    }
    if (executed != null) {
      _result.executed = executed;
    }
    return _result;
  }
  factory BridgeInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BridgeInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BridgeInfo clone() => BridgeInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BridgeInfo copyWith(void Function(BridgeInfo) updates) => super.copyWith((message) => updates(message as BridgeInfo)) as BridgeInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BridgeInfo create() => BridgeInfo._();
  BridgeInfo createEmptyInstance() => create();
  static $pb.PbList<BridgeInfo> createRepeated() => $pb.PbList<BridgeInfo>();
  @$core.pragma('dart2js:noInline')
  static BridgeInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BridgeInfo>(create);
  static BridgeInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get targetSwitcher => $_getIZ(0);
  @$pb.TagNumber(1)
  set targetSwitcher($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTargetSwitcher() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetSwitcher() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get targetHardwareId => $_getSZ(1);
  @$pb.TagNumber(2)
  set targetHardwareId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTargetHardwareId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetHardwareId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get bridgeType => $_getIZ(2);
  @$pb.TagNumber(3)
  set bridgeType($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBridgeType() => $_has(2);
  @$pb.TagNumber(3)
  void clearBridgeType() => clearField(3);

  @$pb.TagNumber(4)
  GroupDevice get deviceType => $_getN(3);
  @$pb.TagNumber(4)
  set deviceType(GroupDevice v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDeviceType() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeviceType() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get executed => $_getBF(4);
  @$pb.TagNumber(5)
  set executed($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasExecuted() => $_has(4);
  @$pb.TagNumber(5)
  void clearExecuted() => clearField(5);
}

class CurtainSwitcher extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CurtainSwitcher', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favorite')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order', $pb.PbFieldType.OU3)
    ..aOM<Device>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'device', subBuilder: Device.create)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percentIn', $pb.PbFieldType.OU3, protoName: 'percentIn')
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percentOut', $pb.PbFieldType.OU3, protoName: 'percentOut')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nameEn', protoName: 'nameEn')
    ..aOM<Room>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'room', subBuilder: Room.create)
    ..aOB(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'showHome', protoName: 'showHome')
    ..a<$core.int>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'autoOff', $pb.PbFieldType.OU3, protoName: 'autoOff')
    ..aOM<GroupControl>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupControl', protoName: 'groupControl', subBuilder: GroupControl.create)
    ..hasRequiredFields = false
  ;

  CurtainSwitcher._() : super();
  factory CurtainSwitcher({
    $core.String? id,
    $core.String? name,
    $core.String? icon,
    $core.bool? favorite,
    $core.int? order,
    Device? device,
    $core.int? percentIn,
    $core.int? percentOut,
    $core.String? nameEn,
    Room? room,
    $core.bool? showHome,
    $core.int? autoOff,
    GroupControl? groupControl,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (favorite != null) {
      _result.favorite = favorite;
    }
    if (order != null) {
      _result.order = order;
    }
    if (device != null) {
      _result.device = device;
    }
    if (percentIn != null) {
      _result.percentIn = percentIn;
    }
    if (percentOut != null) {
      _result.percentOut = percentOut;
    }
    if (nameEn != null) {
      _result.nameEn = nameEn;
    }
    if (room != null) {
      _result.room = room;
    }
    if (showHome != null) {
      _result.showHome = showHome;
    }
    if (autoOff != null) {
      _result.autoOff = autoOff;
    }
    if (groupControl != null) {
      _result.groupControl = groupControl;
    }
    return _result;
  }
  factory CurtainSwitcher.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CurtainSwitcher.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CurtainSwitcher clone() => CurtainSwitcher()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CurtainSwitcher copyWith(void Function(CurtainSwitcher) updates) => super.copyWith((message) => updates(message as CurtainSwitcher)) as CurtainSwitcher; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CurtainSwitcher create() => CurtainSwitcher._();
  CurtainSwitcher createEmptyInstance() => create();
  static $pb.PbList<CurtainSwitcher> createRepeated() => $pb.PbList<CurtainSwitcher>();
  @$core.pragma('dart2js:noInline')
  static CurtainSwitcher getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CurtainSwitcher>(create);
  static CurtainSwitcher? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get favorite => $_getBF(3);
  @$pb.TagNumber(4)
  set favorite($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFavorite() => $_has(3);
  @$pb.TagNumber(4)
  void clearFavorite() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get order => $_getIZ(4);
  @$pb.TagNumber(5)
  set order($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOrder() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrder() => clearField(5);

  @$pb.TagNumber(6)
  Device get device => $_getN(5);
  @$pb.TagNumber(6)
  set device(Device v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDevice() => $_has(5);
  @$pb.TagNumber(6)
  void clearDevice() => clearField(6);
  @$pb.TagNumber(6)
  Device ensureDevice() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.int get percentIn => $_getIZ(6);
  @$pb.TagNumber(7)
  set percentIn($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPercentIn() => $_has(6);
  @$pb.TagNumber(7)
  void clearPercentIn() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get percentOut => $_getIZ(7);
  @$pb.TagNumber(8)
  set percentOut($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPercentOut() => $_has(7);
  @$pb.TagNumber(8)
  void clearPercentOut() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get nameEn => $_getSZ(8);
  @$pb.TagNumber(9)
  set nameEn($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasNameEn() => $_has(8);
  @$pb.TagNumber(9)
  void clearNameEn() => clearField(9);

  @$pb.TagNumber(10)
  Room get room => $_getN(9);
  @$pb.TagNumber(10)
  set room(Room v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasRoom() => $_has(9);
  @$pb.TagNumber(10)
  void clearRoom() => clearField(10);
  @$pb.TagNumber(10)
  Room ensureRoom() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.bool get showHome => $_getBF(10);
  @$pb.TagNumber(11)
  set showHome($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasShowHome() => $_has(10);
  @$pb.TagNumber(11)
  void clearShowHome() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get autoOff => $_getIZ(11);
  @$pb.TagNumber(12)
  set autoOff($core.int v) { $_setUnsignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasAutoOff() => $_has(11);
  @$pb.TagNumber(12)
  void clearAutoOff() => clearField(12);

  @$pb.TagNumber(13)
  GroupControl get groupControl => $_getN(12);
  @$pb.TagNumber(13)
  set groupControl(GroupControl v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasGroupControl() => $_has(12);
  @$pb.TagNumber(13)
  void clearGroupControl() => clearField(13);
  @$pb.TagNumber(13)
  GroupControl ensureGroupControl() => $_ensure(12);
}

class Curtain extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Curtain', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favorite')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order', $pb.PbFieldType.OU3)
    ..aOM<Device>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'device', subBuilder: Device.create)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percent', $pb.PbFieldType.OU3)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nameEn', protoName: 'nameEn')
    ..aOM<Room>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'room', subBuilder: Room.create)
    ..aOB(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'showHome', protoName: 'showHome')
    ..aOM<GroupControl>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupControl', protoName: 'groupControl', subBuilder: GroupControl.create)
    ..hasRequiredFields = false
  ;

  Curtain._() : super();
  factory Curtain({
    $core.String? id,
    $core.String? name,
    $core.String? icon,
    $core.bool? favorite,
    $core.int? order,
    Device? device,
    $core.int? percent,
    $core.String? nameEn,
    Room? room,
    $core.bool? showHome,
    GroupControl? groupControl,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (favorite != null) {
      _result.favorite = favorite;
    }
    if (order != null) {
      _result.order = order;
    }
    if (device != null) {
      _result.device = device;
    }
    if (percent != null) {
      _result.percent = percent;
    }
    if (nameEn != null) {
      _result.nameEn = nameEn;
    }
    if (room != null) {
      _result.room = room;
    }
    if (showHome != null) {
      _result.showHome = showHome;
    }
    if (groupControl != null) {
      _result.groupControl = groupControl;
    }
    return _result;
  }
  factory Curtain.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Curtain.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Curtain clone() => Curtain()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Curtain copyWith(void Function(Curtain) updates) => super.copyWith((message) => updates(message as Curtain)) as Curtain; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Curtain create() => Curtain._();
  Curtain createEmptyInstance() => create();
  static $pb.PbList<Curtain> createRepeated() => $pb.PbList<Curtain>();
  @$core.pragma('dart2js:noInline')
  static Curtain getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Curtain>(create);
  static Curtain? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get favorite => $_getBF(3);
  @$pb.TagNumber(4)
  set favorite($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFavorite() => $_has(3);
  @$pb.TagNumber(4)
  void clearFavorite() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get order => $_getIZ(4);
  @$pb.TagNumber(5)
  set order($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOrder() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrder() => clearField(5);

  @$pb.TagNumber(6)
  Device get device => $_getN(5);
  @$pb.TagNumber(6)
  set device(Device v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDevice() => $_has(5);
  @$pb.TagNumber(6)
  void clearDevice() => clearField(6);
  @$pb.TagNumber(6)
  Device ensureDevice() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.int get percent => $_getIZ(6);
  @$pb.TagNumber(7)
  set percent($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPercent() => $_has(6);
  @$pb.TagNumber(7)
  void clearPercent() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get nameEn => $_getSZ(7);
  @$pb.TagNumber(8)
  set nameEn($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasNameEn() => $_has(7);
  @$pb.TagNumber(8)
  void clearNameEn() => clearField(8);

  @$pb.TagNumber(9)
  Room get room => $_getN(8);
  @$pb.TagNumber(9)
  set room(Room v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasRoom() => $_has(8);
  @$pb.TagNumber(9)
  void clearRoom() => clearField(9);
  @$pb.TagNumber(9)
  Room ensureRoom() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.bool get showHome => $_getBF(9);
  @$pb.TagNumber(10)
  set showHome($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasShowHome() => $_has(9);
  @$pb.TagNumber(10)
  void clearShowHome() => clearField(10);

  @$pb.TagNumber(11)
  GroupControl get groupControl => $_getN(10);
  @$pb.TagNumber(11)
  set groupControl(GroupControl v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasGroupControl() => $_has(10);
  @$pb.TagNumber(11)
  void clearGroupControl() => clearField(11);
  @$pb.TagNumber(11)
  GroupControl ensureGroupControl() => $_ensure(10);
}

class Motion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Motion', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..e<MotionState>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: MotionState.MotionNone, valueOf: MotionState.valueOf, enumValues: MotionState.values)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favorite')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order', $pb.PbFieldType.OU3)
    ..aOM<Device>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'device', subBuilder: Device.create)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nameEn', protoName: 'nameEn')
    ..e<MotionSensorType>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: MotionSensorType.MotionSensor, valueOf: MotionSensorType.valueOf, enumValues: MotionSensorType.values)
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'battery', $pb.PbFieldType.OU3)
    ..aOB(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notification')
    ..hasRequiredFields = false
  ;

  Motion._() : super();
  factory Motion({
    $core.String? id,
    $core.String? name,
    $core.String? icon,
    MotionState? state,
    $core.bool? favorite,
    $core.int? order,
    Device? device,
    $core.String? nameEn,
    MotionSensorType? type,
    $core.int? battery,
    $core.bool? notification,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (state != null) {
      _result.state = state;
    }
    if (favorite != null) {
      _result.favorite = favorite;
    }
    if (order != null) {
      _result.order = order;
    }
    if (device != null) {
      _result.device = device;
    }
    if (nameEn != null) {
      _result.nameEn = nameEn;
    }
    if (type != null) {
      _result.type = type;
    }
    if (battery != null) {
      _result.battery = battery;
    }
    if (notification != null) {
      _result.notification = notification;
    }
    return _result;
  }
  factory Motion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Motion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Motion clone() => Motion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Motion copyWith(void Function(Motion) updates) => super.copyWith((message) => updates(message as Motion)) as Motion; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Motion create() => Motion._();
  Motion createEmptyInstance() => create();
  static $pb.PbList<Motion> createRepeated() => $pb.PbList<Motion>();
  @$core.pragma('dart2js:noInline')
  static Motion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Motion>(create);
  static Motion? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  MotionState get state => $_getN(3);
  @$pb.TagNumber(4)
  set state(MotionState v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasState() => $_has(3);
  @$pb.TagNumber(4)
  void clearState() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get favorite => $_getBF(4);
  @$pb.TagNumber(5)
  set favorite($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFavorite() => $_has(4);
  @$pb.TagNumber(5)
  void clearFavorite() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get order => $_getIZ(5);
  @$pb.TagNumber(6)
  set order($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOrder() => $_has(5);
  @$pb.TagNumber(6)
  void clearOrder() => clearField(6);

  @$pb.TagNumber(7)
  Device get device => $_getN(6);
  @$pb.TagNumber(7)
  set device(Device v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasDevice() => $_has(6);
  @$pb.TagNumber(7)
  void clearDevice() => clearField(7);
  @$pb.TagNumber(7)
  Device ensureDevice() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.String get nameEn => $_getSZ(7);
  @$pb.TagNumber(8)
  set nameEn($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasNameEn() => $_has(7);
  @$pb.TagNumber(8)
  void clearNameEn() => clearField(8);

  @$pb.TagNumber(9)
  MotionSensorType get type => $_getN(8);
  @$pb.TagNumber(9)
  set type(MotionSensorType v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasType() => $_has(8);
  @$pb.TagNumber(9)
  void clearType() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get battery => $_getIZ(9);
  @$pb.TagNumber(10)
  set battery($core.int v) { $_setUnsignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasBattery() => $_has(9);
  @$pb.TagNumber(10)
  void clearBattery() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get notification => $_getBF(10);
  @$pb.TagNumber(11)
  set notification($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasNotification() => $_has(10);
  @$pb.TagNumber(11)
  void clearNotification() => clearField(11);
}

class Homekit extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Homekit', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nameEn', protoName: 'nameEn')
    ..e<HomekitMode>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mode', $pb.PbFieldType.OE, defaultOrMaker: HomekitMode.HomekitNormalMode, valueOf: HomekitMode.valueOf, enumValues: HomekitMode.values)
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favorite')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order', $pb.PbFieldType.OU3)
    ..aOM<Device>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'device', subBuilder: Device.create)
    ..hasRequiredFields = false
  ;

  Homekit._() : super();
  factory Homekit({
    $core.String? id,
    $core.String? icon,
    $core.String? name,
    $core.String? nameEn,
    HomekitMode? mode,
    $core.bool? favorite,
    $core.int? order,
    Device? device,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (nameEn != null) {
      _result.nameEn = nameEn;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    if (favorite != null) {
      _result.favorite = favorite;
    }
    if (order != null) {
      _result.order = order;
    }
    if (device != null) {
      _result.device = device;
    }
    return _result;
  }
  factory Homekit.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Homekit.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Homekit clone() => Homekit()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Homekit copyWith(void Function(Homekit) updates) => super.copyWith((message) => updates(message as Homekit)) as Homekit; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Homekit create() => Homekit._();
  Homekit createEmptyInstance() => create();
  static $pb.PbList<Homekit> createRepeated() => $pb.PbList<Homekit>();
  @$core.pragma('dart2js:noInline')
  static Homekit getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Homekit>(create);
  static Homekit? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get nameEn => $_getSZ(3);
  @$pb.TagNumber(4)
  set nameEn($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNameEn() => $_has(3);
  @$pb.TagNumber(4)
  void clearNameEn() => clearField(4);

  @$pb.TagNumber(5)
  HomekitMode get mode => $_getN(4);
  @$pb.TagNumber(5)
  set mode(HomekitMode v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasMode() => $_has(4);
  @$pb.TagNumber(5)
  void clearMode() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get favorite => $_getBF(5);
  @$pb.TagNumber(6)
  set favorite($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFavorite() => $_has(5);
  @$pb.TagNumber(6)
  void clearFavorite() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get order => $_getIZ(6);
  @$pb.TagNumber(7)
  set order($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOrder() => $_has(6);
  @$pb.TagNumber(7)
  void clearOrder() => clearField(7);

  @$pb.TagNumber(8)
  Device get device => $_getN(7);
  @$pb.TagNumber(8)
  set device(Device v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasDevice() => $_has(7);
  @$pb.TagNumber(8)
  void clearDevice() => clearField(8);
  @$pb.TagNumber(8)
  Device ensureDevice() => $_ensure(7);
}

class Remote extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Remote', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteLibraryId', protoName: 'remoteLibraryId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favorite')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order', $pb.PbFieldType.OU3)
    ..aOM<RemoteLibrary>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'library', subBuilder: RemoteLibrary.create)
    ..aOM<Device>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'device', subBuilder: Device.create)
    ..aOM<AirConditionerState>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', subBuilder: AirConditionerState.create)
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nameEn', protoName: 'nameEn')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId', protoName: 'roomId')
    ..aOS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomName', protoName: 'roomName')
    ..aOB(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'showHome', protoName: 'showHome')
    ..hasRequiredFields = false
  ;

  Remote._() : super();
  factory Remote({
    $core.String? id,
    $core.String? remoteLibraryId,
    $core.String? deviceId,
    $core.String? name,
    $core.String? icon,
    $core.bool? favorite,
    $core.int? order,
    RemoteLibrary? library,
    Device? device,
    AirConditionerState? state,
    $core.String? nameEn,
    $core.String? roomId,
    $core.String? roomName,
    $core.bool? showHome,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (remoteLibraryId != null) {
      _result.remoteLibraryId = remoteLibraryId;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (favorite != null) {
      _result.favorite = favorite;
    }
    if (order != null) {
      _result.order = order;
    }
    if (library != null) {
      _result.library = library;
    }
    if (device != null) {
      _result.device = device;
    }
    if (state != null) {
      _result.state = state;
    }
    if (nameEn != null) {
      _result.nameEn = nameEn;
    }
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (roomName != null) {
      _result.roomName = roomName;
    }
    if (showHome != null) {
      _result.showHome = showHome;
    }
    return _result;
  }
  factory Remote.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Remote.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Remote clone() => Remote()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Remote copyWith(void Function(Remote) updates) => super.copyWith((message) => updates(message as Remote)) as Remote; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Remote create() => Remote._();
  Remote createEmptyInstance() => create();
  static $pb.PbList<Remote> createRepeated() => $pb.PbList<Remote>();
  @$core.pragma('dart2js:noInline')
  static Remote getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Remote>(create);
  static Remote? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get remoteLibraryId => $_getSZ(1);
  @$pb.TagNumber(2)
  set remoteLibraryId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRemoteLibraryId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemoteLibraryId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get deviceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set deviceId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeviceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get favorite => $_getBF(5);
  @$pb.TagNumber(6)
  set favorite($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFavorite() => $_has(5);
  @$pb.TagNumber(6)
  void clearFavorite() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get order => $_getIZ(6);
  @$pb.TagNumber(7)
  set order($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOrder() => $_has(6);
  @$pb.TagNumber(7)
  void clearOrder() => clearField(7);

  @$pb.TagNumber(8)
  RemoteLibrary get library => $_getN(7);
  @$pb.TagNumber(8)
  set library(RemoteLibrary v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasLibrary() => $_has(7);
  @$pb.TagNumber(8)
  void clearLibrary() => clearField(8);
  @$pb.TagNumber(8)
  RemoteLibrary ensureLibrary() => $_ensure(7);

  @$pb.TagNumber(9)
  Device get device => $_getN(8);
  @$pb.TagNumber(9)
  set device(Device v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasDevice() => $_has(8);
  @$pb.TagNumber(9)
  void clearDevice() => clearField(9);
  @$pb.TagNumber(9)
  Device ensureDevice() => $_ensure(8);

  @$pb.TagNumber(10)
  AirConditionerState get state => $_getN(9);
  @$pb.TagNumber(10)
  set state(AirConditionerState v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasState() => $_has(9);
  @$pb.TagNumber(10)
  void clearState() => clearField(10);
  @$pb.TagNumber(10)
  AirConditionerState ensureState() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.String get nameEn => $_getSZ(10);
  @$pb.TagNumber(11)
  set nameEn($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasNameEn() => $_has(10);
  @$pb.TagNumber(11)
  void clearNameEn() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get roomId => $_getSZ(11);
  @$pb.TagNumber(12)
  set roomId($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasRoomId() => $_has(11);
  @$pb.TagNumber(12)
  void clearRoomId() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get roomName => $_getSZ(12);
  @$pb.TagNumber(13)
  set roomName($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasRoomName() => $_has(12);
  @$pb.TagNumber(13)
  void clearRoomName() => clearField(13);

  @$pb.TagNumber(14)
  $core.bool get showHome => $_getBF(13);
  @$pb.TagNumber(14)
  set showHome($core.bool v) { $_setBool(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasShowHome() => $_has(13);
  @$pb.TagNumber(14)
  void clearShowHome() => clearField(14);
}

class Button extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Button', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nameEn', protoName: 'nameEn')
    ..e<ButtonState>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buttonState', $pb.PbFieldType.OE, protoName: 'buttonState', defaultOrMaker: ButtonState.Nothing, valueOf: ButtonState.valueOf, enumValues: ButtonState.values)
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favorite')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order', $pb.PbFieldType.OU3)
    ..aOM<Device>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'device', subBuilder: Device.create)
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'index', $pb.PbFieldType.OU3)
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'battery', $pb.PbFieldType.OU3)
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId', protoName: 'roomId')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomName', protoName: 'roomName')
    ..aOB(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'showHome', protoName: 'showHome')
    ..hasRequiredFields = false
  ;

  Button._() : super();
  factory Button({
    $core.String? id,
    $core.String? icon,
    $core.String? name,
    $core.String? nameEn,
    ButtonState? buttonState,
    $core.bool? favorite,
    $core.int? order,
    Device? device,
    $core.int? index,
    $core.int? battery,
    $core.String? roomId,
    $core.String? roomName,
    $core.bool? showHome,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (nameEn != null) {
      _result.nameEn = nameEn;
    }
    if (buttonState != null) {
      _result.buttonState = buttonState;
    }
    if (favorite != null) {
      _result.favorite = favorite;
    }
    if (order != null) {
      _result.order = order;
    }
    if (device != null) {
      _result.device = device;
    }
    if (index != null) {
      _result.index = index;
    }
    if (battery != null) {
      _result.battery = battery;
    }
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (roomName != null) {
      _result.roomName = roomName;
    }
    if (showHome != null) {
      _result.showHome = showHome;
    }
    return _result;
  }
  factory Button.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Button.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Button clone() => Button()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Button copyWith(void Function(Button) updates) => super.copyWith((message) => updates(message as Button)) as Button; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Button create() => Button._();
  Button createEmptyInstance() => create();
  static $pb.PbList<Button> createRepeated() => $pb.PbList<Button>();
  @$core.pragma('dart2js:noInline')
  static Button getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Button>(create);
  static Button? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get nameEn => $_getSZ(3);
  @$pb.TagNumber(4)
  set nameEn($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNameEn() => $_has(3);
  @$pb.TagNumber(4)
  void clearNameEn() => clearField(4);

  @$pb.TagNumber(5)
  ButtonState get buttonState => $_getN(4);
  @$pb.TagNumber(5)
  set buttonState(ButtonState v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasButtonState() => $_has(4);
  @$pb.TagNumber(5)
  void clearButtonState() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get favorite => $_getBF(5);
  @$pb.TagNumber(6)
  set favorite($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFavorite() => $_has(5);
  @$pb.TagNumber(6)
  void clearFavorite() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get order => $_getIZ(6);
  @$pb.TagNumber(7)
  set order($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOrder() => $_has(6);
  @$pb.TagNumber(7)
  void clearOrder() => clearField(7);

  @$pb.TagNumber(8)
  Device get device => $_getN(7);
  @$pb.TagNumber(8)
  set device(Device v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasDevice() => $_has(7);
  @$pb.TagNumber(8)
  void clearDevice() => clearField(8);
  @$pb.TagNumber(8)
  Device ensureDevice() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.int get index => $_getIZ(8);
  @$pb.TagNumber(9)
  set index($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIndex() => $_has(8);
  @$pb.TagNumber(9)
  void clearIndex() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get battery => $_getIZ(9);
  @$pb.TagNumber(10)
  set battery($core.int v) { $_setUnsignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasBattery() => $_has(9);
  @$pb.TagNumber(10)
  void clearBattery() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get roomId => $_getSZ(10);
  @$pb.TagNumber(11)
  set roomId($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasRoomId() => $_has(10);
  @$pb.TagNumber(11)
  void clearRoomId() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get roomName => $_getSZ(11);
  @$pb.TagNumber(12)
  set roomName($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasRoomName() => $_has(11);
  @$pb.TagNumber(12)
  void clearRoomName() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get showHome => $_getBF(12);
  @$pb.TagNumber(13)
  set showHome($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasShowHome() => $_has(12);
  @$pb.TagNumber(13)
  void clearShowHome() => clearField(13);
}

class TouchPanel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TouchPanel', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOM<Device>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'device', subBuilder: Device.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nameEn', protoName: 'nameEn')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favorite')
    ..aOM<Room>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'room', subBuilder: Room.create)
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'showHome', protoName: 'showHome')
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'autoOff', $pb.PbFieldType.OU3, protoName: 'autoOff')
    ..hasRequiredFields = false
  ;

  TouchPanel._() : super();
  factory TouchPanel({
    $core.String? id,
    Device? device,
    $core.String? icon,
    $core.String? name,
    $core.String? nameEn,
    $core.bool? favorite,
    Room? room,
    $core.bool? showHome,
    $core.int? autoOff,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (device != null) {
      _result.device = device;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (nameEn != null) {
      _result.nameEn = nameEn;
    }
    if (favorite != null) {
      _result.favorite = favorite;
    }
    if (room != null) {
      _result.room = room;
    }
    if (showHome != null) {
      _result.showHome = showHome;
    }
    if (autoOff != null) {
      _result.autoOff = autoOff;
    }
    return _result;
  }
  factory TouchPanel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TouchPanel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TouchPanel clone() => TouchPanel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TouchPanel copyWith(void Function(TouchPanel) updates) => super.copyWith((message) => updates(message as TouchPanel)) as TouchPanel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TouchPanel create() => TouchPanel._();
  TouchPanel createEmptyInstance() => create();
  static $pb.PbList<TouchPanel> createRepeated() => $pb.PbList<TouchPanel>();
  @$core.pragma('dart2js:noInline')
  static TouchPanel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TouchPanel>(create);
  static TouchPanel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  Device get device => $_getN(1);
  @$pb.TagNumber(2)
  set device(Device v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDevice() => $_has(1);
  @$pb.TagNumber(2)
  void clearDevice() => clearField(2);
  @$pb.TagNumber(2)
  Device ensureDevice() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get nameEn => $_getSZ(4);
  @$pb.TagNumber(5)
  set nameEn($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNameEn() => $_has(4);
  @$pb.TagNumber(5)
  void clearNameEn() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get favorite => $_getBF(5);
  @$pb.TagNumber(6)
  set favorite($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFavorite() => $_has(5);
  @$pb.TagNumber(6)
  void clearFavorite() => clearField(6);

  @$pb.TagNumber(7)
  Room get room => $_getN(6);
  @$pb.TagNumber(7)
  set room(Room v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasRoom() => $_has(6);
  @$pb.TagNumber(7)
  void clearRoom() => clearField(7);
  @$pb.TagNumber(7)
  Room ensureRoom() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.bool get showHome => $_getBF(7);
  @$pb.TagNumber(8)
  set showHome($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasShowHome() => $_has(7);
  @$pb.TagNumber(8)
  void clearShowHome() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get autoOff => $_getIZ(8);
  @$pb.TagNumber(9)
  set autoOff($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasAutoOff() => $_has(8);
  @$pb.TagNumber(9)
  void clearAutoOff() => clearField(9);
}

class RemoteLibrary extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RemoteLibrary', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'model')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uiRemoteTemplate', $pb.PbFieldType.OU3, protoName: 'uiRemoteTemplate')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'appVersion', protoName: 'appVersion')
    ..e<GroupRemote>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'group', $pb.PbFieldType.OE, defaultOrMaker: GroupRemote.AirConditioner, valueOf: GroupRemote.valueOf, enumValues: GroupRemote.values)
    ..aOM<RemoteBrand>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'brand', subBuilder: RemoteBrand.create)
    ..hasRequiredFields = false
  ;

  RemoteLibrary._() : super();
  factory RemoteLibrary({
    $core.String? id,
    $core.String? name,
    $core.String? icon,
    $core.String? model,
    $core.int? uiRemoteTemplate,
    $core.String? appVersion,
    GroupRemote? group,
    RemoteBrand? brand,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (model != null) {
      _result.model = model;
    }
    if (uiRemoteTemplate != null) {
      _result.uiRemoteTemplate = uiRemoteTemplate;
    }
    if (appVersion != null) {
      _result.appVersion = appVersion;
    }
    if (group != null) {
      _result.group = group;
    }
    if (brand != null) {
      _result.brand = brand;
    }
    return _result;
  }
  factory RemoteLibrary.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoteLibrary.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoteLibrary clone() => RemoteLibrary()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoteLibrary copyWith(void Function(RemoteLibrary) updates) => super.copyWith((message) => updates(message as RemoteLibrary)) as RemoteLibrary; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoteLibrary create() => RemoteLibrary._();
  RemoteLibrary createEmptyInstance() => create();
  static $pb.PbList<RemoteLibrary> createRepeated() => $pb.PbList<RemoteLibrary>();
  @$core.pragma('dart2js:noInline')
  static RemoteLibrary getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoteLibrary>(create);
  static RemoteLibrary? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get model => $_getSZ(3);
  @$pb.TagNumber(4)
  set model($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasModel() => $_has(3);
  @$pb.TagNumber(4)
  void clearModel() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get uiRemoteTemplate => $_getIZ(4);
  @$pb.TagNumber(5)
  set uiRemoteTemplate($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUiRemoteTemplate() => $_has(4);
  @$pb.TagNumber(5)
  void clearUiRemoteTemplate() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get appVersion => $_getSZ(5);
  @$pb.TagNumber(6)
  set appVersion($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAppVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearAppVersion() => clearField(6);

  @$pb.TagNumber(7)
  GroupRemote get group => $_getN(6);
  @$pb.TagNumber(7)
  set group(GroupRemote v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasGroup() => $_has(6);
  @$pb.TagNumber(7)
  void clearGroup() => clearField(7);

  @$pb.TagNumber(8)
  RemoteBrand get brand => $_getN(7);
  @$pb.TagNumber(8)
  set brand(RemoteBrand v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasBrand() => $_has(7);
  @$pb.TagNumber(8)
  void clearBrand() => clearField(8);
  @$pb.TagNumber(8)
  RemoteBrand ensureBrand() => $_ensure(7);
}

class RemoteBrand extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RemoteBrand', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..e<RemoteCategory>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'category', $pb.PbFieldType.OE, defaultOrMaker: RemoteCategory.CategoryAuto, valueOf: RemoteCategory.valueOf, enumValues: RemoteCategory.values)
    ..hasRequiredFields = false
  ;

  RemoteBrand._() : super();
  factory RemoteBrand({
    $core.String? id,
    $core.String? name,
    RemoteCategory? category,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (category != null) {
      _result.category = category;
    }
    return _result;
  }
  factory RemoteBrand.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoteBrand.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoteBrand clone() => RemoteBrand()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoteBrand copyWith(void Function(RemoteBrand) updates) => super.copyWith((message) => updates(message as RemoteBrand)) as RemoteBrand; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoteBrand create() => RemoteBrand._();
  RemoteBrand createEmptyInstance() => create();
  static $pb.PbList<RemoteBrand> createRepeated() => $pb.PbList<RemoteBrand>();
  @$core.pragma('dart2js:noInline')
  static RemoteBrand getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoteBrand>(create);
  static RemoteBrand? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  RemoteCategory get category => $_getN(2);
  @$pb.TagNumber(3)
  set category(RemoteCategory v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCategory() => $_has(2);
  @$pb.TagNumber(3)
  void clearCategory() => clearField(3);
}

class RemoteMulti extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RemoteMulti', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteId', protoName: 'remoteId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..pc<RemoteMultiLibraryCmd>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteMultiLibraryCmds', $pb.PbFieldType.PM, protoName: 'remoteMultiLibraryCmds', subBuilder: RemoteMultiLibraryCmd.create)
    ..hasRequiredFields = false
  ;

  RemoteMulti._() : super();
  factory RemoteMulti({
    $core.String? id,
    $core.String? remoteId,
    $core.String? name,
    $core.Iterable<RemoteMultiLibraryCmd>? remoteMultiLibraryCmds,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (remoteId != null) {
      _result.remoteId = remoteId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (remoteMultiLibraryCmds != null) {
      _result.remoteMultiLibraryCmds.addAll(remoteMultiLibraryCmds);
    }
    return _result;
  }
  factory RemoteMulti.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoteMulti.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoteMulti clone() => RemoteMulti()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoteMulti copyWith(void Function(RemoteMulti) updates) => super.copyWith((message) => updates(message as RemoteMulti)) as RemoteMulti; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoteMulti create() => RemoteMulti._();
  RemoteMulti createEmptyInstance() => create();
  static $pb.PbList<RemoteMulti> createRepeated() => $pb.PbList<RemoteMulti>();
  @$core.pragma('dart2js:noInline')
  static RemoteMulti getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoteMulti>(create);
  static RemoteMulti? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get remoteId => $_getSZ(1);
  @$pb.TagNumber(2)
  set remoteId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRemoteId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemoteId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(5)
  $core.List<RemoteMultiLibraryCmd> get remoteMultiLibraryCmds => $_getList(3);
}

class RemoteMultiLibraryCmd extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RemoteMultiLibraryCmd', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteMultiId', protoName: 'remoteMultiId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order', $pb.PbFieldType.OU3)
    ..e<TypeLearn>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: TypeLearn.IR, valueOf: TypeLearn.valueOf, enumValues: TypeLearn.values)
    ..hasRequiredFields = false
  ;

  RemoteMultiLibraryCmd._() : super();
  factory RemoteMultiLibraryCmd({
    $core.String? id,
    $core.String? remoteMultiId,
    $core.String? name,
    $core.int? order,
    TypeLearn? type,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (remoteMultiId != null) {
      _result.remoteMultiId = remoteMultiId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (order != null) {
      _result.order = order;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory RemoteMultiLibraryCmd.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoteMultiLibraryCmd.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoteMultiLibraryCmd clone() => RemoteMultiLibraryCmd()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoteMultiLibraryCmd copyWith(void Function(RemoteMultiLibraryCmd) updates) => super.copyWith((message) => updates(message as RemoteMultiLibraryCmd)) as RemoteMultiLibraryCmd; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoteMultiLibraryCmd create() => RemoteMultiLibraryCmd._();
  RemoteMultiLibraryCmd createEmptyInstance() => create();
  static $pb.PbList<RemoteMultiLibraryCmd> createRepeated() => $pb.PbList<RemoteMultiLibraryCmd>();
  @$core.pragma('dart2js:noInline')
  static RemoteMultiLibraryCmd getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoteMultiLibraryCmd>(create);
  static RemoteMultiLibraryCmd? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get remoteMultiId => $_getSZ(1);
  @$pb.TagNumber(2)
  set remoteMultiId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRemoteMultiId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemoteMultiId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get order => $_getIZ(3);
  @$pb.TagNumber(4)
  set order($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOrder() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrder() => clearField(4);

  @$pb.TagNumber(5)
  TypeLearn get type => $_getN(4);
  @$pb.TagNumber(5)
  set type(TypeLearn v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => clearField(5);
}

class AirConditionerState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AirConditionerState', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteId', protoName: 'remoteId')
    ..e<PowerState>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: PowerState.Off, valueOf: PowerState.valueOf, enumValues: PowerState.values)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'temperature', $pb.PbFieldType.OF)
    ..e<ModeAc>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mode', $pb.PbFieldType.OE, defaultOrMaker: ModeAc.AutoMode, valueOf: ModeAc.valueOf, enumValues: ModeAc.values)
    ..e<SwingAc>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'swing', $pb.PbFieldType.OE, defaultOrMaker: SwingAc.AutoSwing, valueOf: SwingAc.valueOf, enumValues: SwingAc.values)
    ..e<FanAc>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fan', $pb.PbFieldType.OE, defaultOrMaker: FanAc.AutoFan, valueOf: FanAc.valueOf, enumValues: FanAc.values)
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'temperatureRoom', $pb.PbFieldType.OF, protoName: 'temperatureRoom')
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'humidityRoom', $pb.PbFieldType.OF, protoName: 'humidityRoom')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..e<ConnectionState>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'connectionState', $pb.PbFieldType.OE, protoName: 'connectionState', defaultOrMaker: ConnectionState.Offline, valueOf: ConnectionState.valueOf, enumValues: ConnectionState.values)
    ..a<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indoorId', $pb.PbFieldType.OU3, protoName: 'indoorId')
    ..hasRequiredFields = false
  ;

  AirConditionerState._() : super();
  factory AirConditionerState({
    $core.String? remoteId,
    PowerState? powerState,
    $core.double? temperature,
    ModeAc? mode,
    SwingAc? swing,
    FanAc? fan,
    $core.double? temperatureRoom,
    $core.double? humidityRoom,
    $core.String? deviceId,
    ConnectionState? connectionState,
    $core.int? indoorId,
  }) {
    final _result = create();
    if (remoteId != null) {
      _result.remoteId = remoteId;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (temperature != null) {
      _result.temperature = temperature;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    if (swing != null) {
      _result.swing = swing;
    }
    if (fan != null) {
      _result.fan = fan;
    }
    if (temperatureRoom != null) {
      _result.temperatureRoom = temperatureRoom;
    }
    if (humidityRoom != null) {
      _result.humidityRoom = humidityRoom;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (connectionState != null) {
      _result.connectionState = connectionState;
    }
    if (indoorId != null) {
      _result.indoorId = indoorId;
    }
    return _result;
  }
  factory AirConditionerState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AirConditionerState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AirConditionerState clone() => AirConditionerState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AirConditionerState copyWith(void Function(AirConditionerState) updates) => super.copyWith((message) => updates(message as AirConditionerState)) as AirConditionerState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AirConditionerState create() => AirConditionerState._();
  AirConditionerState createEmptyInstance() => create();
  static $pb.PbList<AirConditionerState> createRepeated() => $pb.PbList<AirConditionerState>();
  @$core.pragma('dart2js:noInline')
  static AirConditionerState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AirConditionerState>(create);
  static AirConditionerState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remoteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set remoteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemoteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteId() => clearField(1);

  @$pb.TagNumber(2)
  PowerState get powerState => $_getN(1);
  @$pb.TagNumber(2)
  set powerState(PowerState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPowerState() => $_has(1);
  @$pb.TagNumber(2)
  void clearPowerState() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get temperature => $_getN(2);
  @$pb.TagNumber(3)
  set temperature($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTemperature() => $_has(2);
  @$pb.TagNumber(3)
  void clearTemperature() => clearField(3);

  @$pb.TagNumber(4)
  ModeAc get mode => $_getN(3);
  @$pb.TagNumber(4)
  set mode(ModeAc v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMode() => $_has(3);
  @$pb.TagNumber(4)
  void clearMode() => clearField(4);

  @$pb.TagNumber(5)
  SwingAc get swing => $_getN(4);
  @$pb.TagNumber(5)
  set swing(SwingAc v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasSwing() => $_has(4);
  @$pb.TagNumber(5)
  void clearSwing() => clearField(5);

  @$pb.TagNumber(6)
  FanAc get fan => $_getN(5);
  @$pb.TagNumber(6)
  set fan(FanAc v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasFan() => $_has(5);
  @$pb.TagNumber(6)
  void clearFan() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get temperatureRoom => $_getN(6);
  @$pb.TagNumber(7)
  set temperatureRoom($core.double v) { $_setFloat(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTemperatureRoom() => $_has(6);
  @$pb.TagNumber(7)
  void clearTemperatureRoom() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get humidityRoom => $_getN(7);
  @$pb.TagNumber(8)
  set humidityRoom($core.double v) { $_setFloat(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasHumidityRoom() => $_has(7);
  @$pb.TagNumber(8)
  void clearHumidityRoom() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get deviceId => $_getSZ(8);
  @$pb.TagNumber(9)
  set deviceId($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasDeviceId() => $_has(8);
  @$pb.TagNumber(9)
  void clearDeviceId() => clearField(9);

  @$pb.TagNumber(10)
  ConnectionState get connectionState => $_getN(9);
  @$pb.TagNumber(10)
  set connectionState(ConnectionState v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasConnectionState() => $_has(9);
  @$pb.TagNumber(10)
  void clearConnectionState() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get indoorId => $_getIZ(10);
  @$pb.TagNumber(11)
  set indoorId($core.int v) { $_setUnsignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasIndoorId() => $_has(10);
  @$pb.TagNumber(11)
  void clearIndoorId() => clearField(11);
}

class ControlState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ControlState', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'controlId', protoName: 'controlId')
    ..e<GroupDevice>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'group', $pb.PbFieldType.OE, defaultOrMaker: GroupDevice.SwitcherGroup, valueOf: GroupDevice.valueOf, enumValues: GroupDevice.values)
    ..e<PowerState>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: PowerState.Off, valueOf: PowerState.valueOf, enumValues: PowerState.values)
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'temperature', $pb.PbFieldType.OF)
    ..e<ModeAc>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mode', $pb.PbFieldType.OE, defaultOrMaker: ModeAc.AutoMode, valueOf: ModeAc.valueOf, enumValues: ModeAc.values)
    ..e<SwingAc>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'swing', $pb.PbFieldType.OE, defaultOrMaker: SwingAc.AutoSwing, valueOf: SwingAc.valueOf, enumValues: SwingAc.values)
    ..e<FanAc>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fan', $pb.PbFieldType.OE, defaultOrMaker: FanAc.AutoFan, valueOf: FanAc.valueOf, enumValues: FanAc.values)
    ..e<ConnectionState>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'connectionState', $pb.PbFieldType.OE, protoName: 'connectionState', defaultOrMaker: ConnectionState.Offline, valueOf: ConnectionState.valueOf, enumValues: ConnectionState.values)
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percentIn', $pb.PbFieldType.OU3, protoName: 'percentIn')
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percentOut', $pb.PbFieldType.OU3, protoName: 'percentOut')
    ..hasRequiredFields = false
  ;

  ControlState._() : super();
  factory ControlState({
    $core.String? controlId,
    GroupDevice? group,
    PowerState? powerState,
    $core.double? temperature,
    ModeAc? mode,
    SwingAc? swing,
    FanAc? fan,
    ConnectionState? connectionState,
    $core.int? percentIn,
    $core.int? percentOut,
  }) {
    final _result = create();
    if (controlId != null) {
      _result.controlId = controlId;
    }
    if (group != null) {
      _result.group = group;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (temperature != null) {
      _result.temperature = temperature;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    if (swing != null) {
      _result.swing = swing;
    }
    if (fan != null) {
      _result.fan = fan;
    }
    if (connectionState != null) {
      _result.connectionState = connectionState;
    }
    if (percentIn != null) {
      _result.percentIn = percentIn;
    }
    if (percentOut != null) {
      _result.percentOut = percentOut;
    }
    return _result;
  }
  factory ControlState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ControlState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ControlState clone() => ControlState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ControlState copyWith(void Function(ControlState) updates) => super.copyWith((message) => updates(message as ControlState)) as ControlState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ControlState create() => ControlState._();
  ControlState createEmptyInstance() => create();
  static $pb.PbList<ControlState> createRepeated() => $pb.PbList<ControlState>();
  @$core.pragma('dart2js:noInline')
  static ControlState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ControlState>(create);
  static ControlState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get controlId => $_getSZ(0);
  @$pb.TagNumber(1)
  set controlId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasControlId() => $_has(0);
  @$pb.TagNumber(1)
  void clearControlId() => clearField(1);

  @$pb.TagNumber(2)
  GroupDevice get group => $_getN(1);
  @$pb.TagNumber(2)
  set group(GroupDevice v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasGroup() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroup() => clearField(2);

  @$pb.TagNumber(3)
  PowerState get powerState => $_getN(2);
  @$pb.TagNumber(3)
  set powerState(PowerState v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPowerState() => $_has(2);
  @$pb.TagNumber(3)
  void clearPowerState() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get temperature => $_getN(3);
  @$pb.TagNumber(4)
  set temperature($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTemperature() => $_has(3);
  @$pb.TagNumber(4)
  void clearTemperature() => clearField(4);

  @$pb.TagNumber(5)
  ModeAc get mode => $_getN(4);
  @$pb.TagNumber(5)
  set mode(ModeAc v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasMode() => $_has(4);
  @$pb.TagNumber(5)
  void clearMode() => clearField(5);

  @$pb.TagNumber(6)
  SwingAc get swing => $_getN(5);
  @$pb.TagNumber(6)
  set swing(SwingAc v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasSwing() => $_has(5);
  @$pb.TagNumber(6)
  void clearSwing() => clearField(6);

  @$pb.TagNumber(7)
  FanAc get fan => $_getN(6);
  @$pb.TagNumber(7)
  set fan(FanAc v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasFan() => $_has(6);
  @$pb.TagNumber(7)
  void clearFan() => clearField(7);

  @$pb.TagNumber(8)
  ConnectionState get connectionState => $_getN(7);
  @$pb.TagNumber(8)
  set connectionState(ConnectionState v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasConnectionState() => $_has(7);
  @$pb.TagNumber(8)
  void clearConnectionState() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get percentIn => $_getIZ(8);
  @$pb.TagNumber(9)
  set percentIn($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPercentIn() => $_has(8);
  @$pb.TagNumber(9)
  void clearPercentIn() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get percentOut => $_getIZ(9);
  @$pb.TagNumber(10)
  set percentOut($core.int v) { $_setUnsignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasPercentOut() => $_has(9);
  @$pb.TagNumber(10)
  void clearPercentOut() => clearField(10);
}

class RemoteACState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RemoteACState', createEmptyInstance: create)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'power')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'temperature', $pb.PbFieldType.OU3)
    ..e<ModeAc>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mode', $pb.PbFieldType.OE, defaultOrMaker: ModeAc.AutoMode, valueOf: ModeAc.valueOf, enumValues: ModeAc.values)
    ..e<FanAc>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fan', $pb.PbFieldType.OE, defaultOrMaker: FanAc.AutoFan, valueOf: FanAc.valueOf, enumValues: FanAc.values)
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'swingHorizontal', protoName: 'swingHorizontal')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'swingVertical', protoName: 'swingVertical')
    ..hasRequiredFields = false
  ;

  RemoteACState._() : super();
  factory RemoteACState({
    $core.bool? power,
    $core.int? temperature,
    ModeAc? mode,
    FanAc? fan,
    $core.bool? swingHorizontal,
    $core.bool? swingVertical,
  }) {
    final _result = create();
    if (power != null) {
      _result.power = power;
    }
    if (temperature != null) {
      _result.temperature = temperature;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    if (fan != null) {
      _result.fan = fan;
    }
    if (swingHorizontal != null) {
      _result.swingHorizontal = swingHorizontal;
    }
    if (swingVertical != null) {
      _result.swingVertical = swingVertical;
    }
    return _result;
  }
  factory RemoteACState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoteACState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoteACState clone() => RemoteACState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoteACState copyWith(void Function(RemoteACState) updates) => super.copyWith((message) => updates(message as RemoteACState)) as RemoteACState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoteACState create() => RemoteACState._();
  RemoteACState createEmptyInstance() => create();
  static $pb.PbList<RemoteACState> createRepeated() => $pb.PbList<RemoteACState>();
  @$core.pragma('dart2js:noInline')
  static RemoteACState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoteACState>(create);
  static RemoteACState? _defaultInstance;

  @$pb.TagNumber(2)
  $core.bool get power => $_getBF(0);
  @$pb.TagNumber(2)
  set power($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasPower() => $_has(0);
  @$pb.TagNumber(2)
  void clearPower() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get temperature => $_getIZ(1);
  @$pb.TagNumber(3)
  set temperature($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasTemperature() => $_has(1);
  @$pb.TagNumber(3)
  void clearTemperature() => clearField(3);

  @$pb.TagNumber(4)
  ModeAc get mode => $_getN(2);
  @$pb.TagNumber(4)
  set mode(ModeAc v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMode() => $_has(2);
  @$pb.TagNumber(4)
  void clearMode() => clearField(4);

  @$pb.TagNumber(5)
  FanAc get fan => $_getN(3);
  @$pb.TagNumber(5)
  set fan(FanAc v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasFan() => $_has(3);
  @$pb.TagNumber(5)
  void clearFan() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get swingHorizontal => $_getBF(4);
  @$pb.TagNumber(6)
  set swingHorizontal($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasSwingHorizontal() => $_has(4);
  @$pb.TagNumber(6)
  void clearSwingHorizontal() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get swingVertical => $_getBF(5);
  @$pb.TagNumber(7)
  set swingVertical($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasSwingVertical() => $_has(5);
  @$pb.TagNumber(7)
  void clearSwingVertical() => clearField(7);
}

class Home extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Home', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nameEn', protoName: 'nameEn')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'backgroundName', protoName: 'backgroundName')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'longitude', $pb.PbFieldType.OF)
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'latitude', $pb.PbFieldType.OF)
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isOwner', protoName: 'isOwner')
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isDefault', protoName: 'isDefault')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fullNameSharer', protoName: 'fullNameSharer')
    ..pc<UserHome>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'users', $pb.PbFieldType.PM, subBuilder: UserHome.create)
    ..a<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'featureCode', $pb.PbFieldType.OU3, protoName: 'featureCode')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'securityCode', protoName: 'securityCode')
    ..a<$core.int>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'securityMode', $pb.PbFieldType.OU3, protoName: 'securityMode')
    ..hasRequiredFields = false
  ;

  Home._() : super();
  factory Home({
    $core.String? id,
    $core.String? name,
    $core.String? nameEn,
    $core.String? backgroundName,
    $core.double? longitude,
    $core.double? latitude,
    $core.bool? isOwner,
    $core.bool? isDefault,
    $core.String? fullNameSharer,
    $core.Iterable<UserHome>? users,
    $core.int? featureCode,
    $core.String? securityCode,
    $core.int? securityMode,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (nameEn != null) {
      _result.nameEn = nameEn;
    }
    if (backgroundName != null) {
      _result.backgroundName = backgroundName;
    }
    if (longitude != null) {
      _result.longitude = longitude;
    }
    if (latitude != null) {
      _result.latitude = latitude;
    }
    if (isOwner != null) {
      _result.isOwner = isOwner;
    }
    if (isDefault != null) {
      _result.isDefault = isDefault;
    }
    if (fullNameSharer != null) {
      _result.fullNameSharer = fullNameSharer;
    }
    if (users != null) {
      _result.users.addAll(users);
    }
    if (featureCode != null) {
      _result.featureCode = featureCode;
    }
    if (securityCode != null) {
      _result.securityCode = securityCode;
    }
    if (securityMode != null) {
      _result.securityMode = securityMode;
    }
    return _result;
  }
  factory Home.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Home.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Home clone() => Home()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Home copyWith(void Function(Home) updates) => super.copyWith((message) => updates(message as Home)) as Home; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Home create() => Home._();
  Home createEmptyInstance() => create();
  static $pb.PbList<Home> createRepeated() => $pb.PbList<Home>();
  @$core.pragma('dart2js:noInline')
  static Home getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Home>(create);
  static Home? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get nameEn => $_getSZ(2);
  @$pb.TagNumber(3)
  set nameEn($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNameEn() => $_has(2);
  @$pb.TagNumber(3)
  void clearNameEn() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get backgroundName => $_getSZ(3);
  @$pb.TagNumber(4)
  set backgroundName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBackgroundName() => $_has(3);
  @$pb.TagNumber(4)
  void clearBackgroundName() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get longitude => $_getN(4);
  @$pb.TagNumber(5)
  set longitude($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLongitude() => $_has(4);
  @$pb.TagNumber(5)
  void clearLongitude() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get latitude => $_getN(5);
  @$pb.TagNumber(6)
  set latitude($core.double v) { $_setFloat(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLatitude() => $_has(5);
  @$pb.TagNumber(6)
  void clearLatitude() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isOwner => $_getBF(6);
  @$pb.TagNumber(7)
  set isOwner($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsOwner() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsOwner() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isDefault => $_getBF(7);
  @$pb.TagNumber(8)
  set isDefault($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasIsDefault() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsDefault() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get fullNameSharer => $_getSZ(8);
  @$pb.TagNumber(9)
  set fullNameSharer($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasFullNameSharer() => $_has(8);
  @$pb.TagNumber(9)
  void clearFullNameSharer() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<UserHome> get users => $_getList(9);

  @$pb.TagNumber(11)
  $core.int get featureCode => $_getIZ(10);
  @$pb.TagNumber(11)
  set featureCode($core.int v) { $_setUnsignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasFeatureCode() => $_has(10);
  @$pb.TagNumber(11)
  void clearFeatureCode() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get securityCode => $_getSZ(11);
  @$pb.TagNumber(12)
  set securityCode($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasSecurityCode() => $_has(11);
  @$pb.TagNumber(12)
  void clearSecurityCode() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get securityMode => $_getIZ(12);
  @$pb.TagNumber(13)
  set securityMode($core.int v) { $_setUnsignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasSecurityMode() => $_has(12);
  @$pb.TagNumber(13)
  void clearSecurityMode() => clearField(13);
}

class User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'User', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatar', $pb.PbFieldType.OY)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fullName', protoName: 'fullName')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'phoneNumber', protoName: 'phoneNumber')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'language')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'autoSwitchGps', protoName: 'autoSwitchGps')
    ..a<$fixnum.Int64>(100, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  User._() : super();
  factory User({
    $core.String? userId,
    $core.List<$core.int>? avatar,
    $core.String? fullName,
    $core.String? email,
    $core.String? phoneNumber,
    $core.String? language,
    $core.bool? autoSwitchGps,
    $fixnum.Int64? order,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (avatar != null) {
      _result.avatar = avatar;
    }
    if (fullName != null) {
      _result.fullName = fullName;
    }
    if (email != null) {
      _result.email = email;
    }
    if (phoneNumber != null) {
      _result.phoneNumber = phoneNumber;
    }
    if (language != null) {
      _result.language = language;
    }
    if (autoSwitchGps != null) {
      _result.autoSwitchGps = autoSwitchGps;
    }
    if (order != null) {
      _result.order = order;
    }
    return _result;
  }
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  User clone() => User()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User)) as User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get avatar => $_getN(1);
  @$pb.TagNumber(2)
  set avatar($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAvatar() => $_has(1);
  @$pb.TagNumber(2)
  void clearAvatar() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get fullName => $_getSZ(2);
  @$pb.TagNumber(3)
  set fullName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFullName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFullName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get email => $_getSZ(3);
  @$pb.TagNumber(4)
  set email($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmail() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get phoneNumber => $_getSZ(4);
  @$pb.TagNumber(5)
  set phoneNumber($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPhoneNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhoneNumber() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get language => $_getSZ(5);
  @$pb.TagNumber(6)
  set language($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLanguage() => $_has(5);
  @$pb.TagNumber(6)
  void clearLanguage() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get autoSwitchGps => $_getBF(6);
  @$pb.TagNumber(7)
  set autoSwitchGps($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAutoSwitchGps() => $_has(6);
  @$pb.TagNumber(7)
  void clearAutoSwitchGps() => clearField(7);

  @$pb.TagNumber(100)
  $fixnum.Int64 get order => $_getI64(7);
  @$pb.TagNumber(100)
  set order($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(100)
  $core.bool hasOrder() => $_has(7);
  @$pb.TagNumber(100)
  void clearOrder() => clearField(100);
}

class UserHome extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserHome', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'homeId', protoName: 'homeId')
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatar', $pb.PbFieldType.OY)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fullName', protoName: 'fullName')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isOwner', protoName: 'isOwner')
    ..a<$fixnum.Int64>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'acceptedDate', $pb.PbFieldType.OU6, protoName: 'acceptedDate', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  UserHome._() : super();
  factory UserHome({
    $core.String? id,
    $core.String? userId,
    $core.String? homeId,
    $core.List<$core.int>? avatar,
    $core.String? fullName,
    $core.bool? isOwner,
    $fixnum.Int64? acceptedDate,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (homeId != null) {
      _result.homeId = homeId;
    }
    if (avatar != null) {
      _result.avatar = avatar;
    }
    if (fullName != null) {
      _result.fullName = fullName;
    }
    if (isOwner != null) {
      _result.isOwner = isOwner;
    }
    if (acceptedDate != null) {
      _result.acceptedDate = acceptedDate;
    }
    return _result;
  }
  factory UserHome.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserHome.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserHome clone() => UserHome()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserHome copyWith(void Function(UserHome) updates) => super.copyWith((message) => updates(message as UserHome)) as UserHome; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserHome create() => UserHome._();
  UserHome createEmptyInstance() => create();
  static $pb.PbList<UserHome> createRepeated() => $pb.PbList<UserHome>();
  @$core.pragma('dart2js:noInline')
  static UserHome getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserHome>(create);
  static UserHome? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get homeId => $_getSZ(2);
  @$pb.TagNumber(3)
  set homeId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHomeId() => $_has(2);
  @$pb.TagNumber(3)
  void clearHomeId() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get avatar => $_getN(3);
  @$pb.TagNumber(4)
  set avatar($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAvatar() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvatar() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get fullName => $_getSZ(4);
  @$pb.TagNumber(5)
  set fullName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFullName() => $_has(4);
  @$pb.TagNumber(5)
  void clearFullName() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isOwner => $_getBF(5);
  @$pb.TagNumber(6)
  set isOwner($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsOwner() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsOwner() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get acceptedDate => $_getI64(6);
  @$pb.TagNumber(7)
  set acceptedDate($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAcceptedDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearAcceptedDate() => clearField(7);
}

class Citizen extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Citizen', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'homeId', protoName: 'homeId')
    ..aOM<Project>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'project', subBuilder: Project.create)
    ..aOM<Building>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'building', subBuilder: Building.create)
    ..aOM<Floor>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'floor', subBuilder: Floor.create)
    ..aOM<Apartment>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'apartment', subBuilder: Apartment.create)
    ..a<$fixnum.Int64>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'receivedDate', $pb.PbFieldType.OU6, protoName: 'receivedDate', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'approvedDate', $pb.PbFieldType.OU6, protoName: 'approvedDate', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  Citizen._() : super();
  factory Citizen({
    $core.String? homeId,
    Project? project,
    Building? building,
    Floor? floor,
    Apartment? apartment,
    $fixnum.Int64? receivedDate,
    $fixnum.Int64? approvedDate,
  }) {
    final _result = create();
    if (homeId != null) {
      _result.homeId = homeId;
    }
    if (project != null) {
      _result.project = project;
    }
    if (building != null) {
      _result.building = building;
    }
    if (floor != null) {
      _result.floor = floor;
    }
    if (apartment != null) {
      _result.apartment = apartment;
    }
    if (receivedDate != null) {
      _result.receivedDate = receivedDate;
    }
    if (approvedDate != null) {
      _result.approvedDate = approvedDate;
    }
    return _result;
  }
  factory Citizen.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Citizen.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Citizen clone() => Citizen()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Citizen copyWith(void Function(Citizen) updates) => super.copyWith((message) => updates(message as Citizen)) as Citizen; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Citizen create() => Citizen._();
  Citizen createEmptyInstance() => create();
  static $pb.PbList<Citizen> createRepeated() => $pb.PbList<Citizen>();
  @$core.pragma('dart2js:noInline')
  static Citizen getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Citizen>(create);
  static Citizen? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get homeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set homeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHomeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearHomeId() => clearField(1);

  @$pb.TagNumber(2)
  Project get project => $_getN(1);
  @$pb.TagNumber(2)
  set project(Project v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProject() => $_has(1);
  @$pb.TagNumber(2)
  void clearProject() => clearField(2);
  @$pb.TagNumber(2)
  Project ensureProject() => $_ensure(1);

  @$pb.TagNumber(3)
  Building get building => $_getN(2);
  @$pb.TagNumber(3)
  set building(Building v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasBuilding() => $_has(2);
  @$pb.TagNumber(3)
  void clearBuilding() => clearField(3);
  @$pb.TagNumber(3)
  Building ensureBuilding() => $_ensure(2);

  @$pb.TagNumber(4)
  Floor get floor => $_getN(3);
  @$pb.TagNumber(4)
  set floor(Floor v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasFloor() => $_has(3);
  @$pb.TagNumber(4)
  void clearFloor() => clearField(4);
  @$pb.TagNumber(4)
  Floor ensureFloor() => $_ensure(3);

  @$pb.TagNumber(5)
  Apartment get apartment => $_getN(4);
  @$pb.TagNumber(5)
  set apartment(Apartment v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasApartment() => $_has(4);
  @$pb.TagNumber(5)
  void clearApartment() => clearField(5);
  @$pb.TagNumber(5)
  Apartment ensureApartment() => $_ensure(4);

  @$pb.TagNumber(6)
  $fixnum.Int64 get receivedDate => $_getI64(5);
  @$pb.TagNumber(6)
  set receivedDate($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasReceivedDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearReceivedDate() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get approvedDate => $_getI64(6);
  @$pb.TagNumber(7)
  set approvedDate($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasApprovedDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearApprovedDate() => clearField(7);
}

class Room extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Room', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOM<Home>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'home', subBuilder: Home.create)
    ..pc<Device>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'devices', $pb.PbFieldType.PM, subBuilder: Device.create)
    ..pc<Switcher>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switchers', $pb.PbFieldType.PM, subBuilder: Switcher.create)
    ..pc<CurtainSwitcher>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainSwitchers', $pb.PbFieldType.PM, protoName: 'curtainSwitchers', subBuilder: CurtainSwitcher.create)
    ..pc<Remote>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remotes', $pb.PbFieldType.PM, subBuilder: Remote.create)
    ..pc<Motion>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'motions', $pb.PbFieldType.PM, subBuilder: Motion.create)
    ..pc<Homekit>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'homekits', $pb.PbFieldType.PM, subBuilder: Homekit.create)
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nameEn', protoName: 'nameEn')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'backgroundName', protoName: 'backgroundName')
    ..pc<Button>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buttons', $pb.PbFieldType.PM, subBuilder: Button.create)
    ..pc<GroupControl>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupControls', $pb.PbFieldType.PM, protoName: 'groupControls', subBuilder: GroupControl.create)
    ..pc<LedItem>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ledItem', $pb.PbFieldType.PM, protoName: 'ledItem', subBuilder: LedItem.create)
    ..pc<LedDriver>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ledDriver', $pb.PbFieldType.PM, protoName: 'ledDriver', subBuilder: LedDriver.create)
    ..pc<LightSensor>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lightSensors', $pb.PbFieldType.PM, protoName: 'lightSensors', subBuilder: LightSensor.create)
    ..pc<EnvironmentSensor>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'environmentSensors', $pb.PbFieldType.PM, protoName: 'environmentSensors', subBuilder: EnvironmentSensor.create)
    ..pc<SmartPlug>(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'smartPlugs', $pb.PbFieldType.PM, protoName: 'smartPlugs', subBuilder: SmartPlug.create)
    ..pc<Curtain>(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtains', $pb.PbFieldType.PM, subBuilder: Curtain.create)
    ..pc<TouchPanel>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchPanels', $pb.PbFieldType.PM, protoName: 'touchPanels', subBuilder: TouchPanel.create)
    ..hasRequiredFields = false
  ;

  Room._() : super();
  factory Room({
    $core.String? id,
    $core.String? name,
    Home? home,
    $core.Iterable<Device>? devices,
    $core.Iterable<Switcher>? switchers,
    $core.Iterable<CurtainSwitcher>? curtainSwitchers,
    $core.Iterable<Remote>? remotes,
    $core.Iterable<Motion>? motions,
    $core.Iterable<Homekit>? homekits,
    $core.String? nameEn,
    $core.String? backgroundName,
    $core.Iterable<Button>? buttons,
    $core.Iterable<GroupControl>? groupControls,
    $core.Iterable<LedItem>? ledItem,
    $core.Iterable<LedDriver>? ledDriver,
    $core.Iterable<LightSensor>? lightSensors,
    $core.Iterable<EnvironmentSensor>? environmentSensors,
    $core.Iterable<SmartPlug>? smartPlugs,
    $core.Iterable<Curtain>? curtains,
    $core.Iterable<TouchPanel>? touchPanels,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (home != null) {
      _result.home = home;
    }
    if (devices != null) {
      _result.devices.addAll(devices);
    }
    if (switchers != null) {
      _result.switchers.addAll(switchers);
    }
    if (curtainSwitchers != null) {
      _result.curtainSwitchers.addAll(curtainSwitchers);
    }
    if (remotes != null) {
      _result.remotes.addAll(remotes);
    }
    if (motions != null) {
      _result.motions.addAll(motions);
    }
    if (homekits != null) {
      _result.homekits.addAll(homekits);
    }
    if (nameEn != null) {
      _result.nameEn = nameEn;
    }
    if (backgroundName != null) {
      _result.backgroundName = backgroundName;
    }
    if (buttons != null) {
      _result.buttons.addAll(buttons);
    }
    if (groupControls != null) {
      _result.groupControls.addAll(groupControls);
    }
    if (ledItem != null) {
      _result.ledItem.addAll(ledItem);
    }
    if (ledDriver != null) {
      _result.ledDriver.addAll(ledDriver);
    }
    if (lightSensors != null) {
      _result.lightSensors.addAll(lightSensors);
    }
    if (environmentSensors != null) {
      _result.environmentSensors.addAll(environmentSensors);
    }
    if (smartPlugs != null) {
      _result.smartPlugs.addAll(smartPlugs);
    }
    if (curtains != null) {
      _result.curtains.addAll(curtains);
    }
    if (touchPanels != null) {
      _result.touchPanels.addAll(touchPanels);
    }
    return _result;
  }
  factory Room.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Room.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Room clone() => Room()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Room copyWith(void Function(Room) updates) => super.copyWith((message) => updates(message as Room)) as Room; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Room create() => Room._();
  Room createEmptyInstance() => create();
  static $pb.PbList<Room> createRepeated() => $pb.PbList<Room>();
  @$core.pragma('dart2js:noInline')
  static Room getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Room>(create);
  static Room? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  Home get home => $_getN(2);
  @$pb.TagNumber(3)
  set home(Home v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasHome() => $_has(2);
  @$pb.TagNumber(3)
  void clearHome() => clearField(3);
  @$pb.TagNumber(3)
  Home ensureHome() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<Device> get devices => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<Switcher> get switchers => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<CurtainSwitcher> get curtainSwitchers => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<Remote> get remotes => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<Motion> get motions => $_getList(7);

  @$pb.TagNumber(9)
  $core.List<Homekit> get homekits => $_getList(8);

  @$pb.TagNumber(10)
  $core.String get nameEn => $_getSZ(9);
  @$pb.TagNumber(10)
  set nameEn($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasNameEn() => $_has(9);
  @$pb.TagNumber(10)
  void clearNameEn() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get backgroundName => $_getSZ(10);
  @$pb.TagNumber(11)
  set backgroundName($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasBackgroundName() => $_has(10);
  @$pb.TagNumber(11)
  void clearBackgroundName() => clearField(11);

  @$pb.TagNumber(12)
  $core.List<Button> get buttons => $_getList(11);

  @$pb.TagNumber(13)
  $core.List<GroupControl> get groupControls => $_getList(12);

  @$pb.TagNumber(14)
  $core.List<LedItem> get ledItem => $_getList(13);

  @$pb.TagNumber(15)
  $core.List<LedDriver> get ledDriver => $_getList(14);

  @$pb.TagNumber(16)
  $core.List<LightSensor> get lightSensors => $_getList(15);

  @$pb.TagNumber(17)
  $core.List<EnvironmentSensor> get environmentSensors => $_getList(16);

  @$pb.TagNumber(18)
  $core.List<SmartPlug> get smartPlugs => $_getList(17);

  @$pb.TagNumber(19)
  $core.List<Curtain> get curtains => $_getList(18);

  @$pb.TagNumber(20)
  $core.List<TouchPanel> get touchPanels => $_getList(19);
}

class Schedule extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Schedule', createEmptyInstance: create)
    ..aOM<DateTime>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'datetime', subBuilder: DateTime.create)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'repeat')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mon')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tue')
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'wed')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'thu')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fri')
    ..aOB(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sat')
    ..aOB(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sun')
    ..hasRequiredFields = false
  ;

  Schedule._() : super();
  factory Schedule({
    DateTime? datetime,
    $core.bool? repeat,
    $core.bool? mon,
    $core.bool? tue,
    $core.bool? wed,
    $core.bool? thu,
    $core.bool? fri,
    $core.bool? sat,
    $core.bool? sun,
  }) {
    final _result = create();
    if (datetime != null) {
      _result.datetime = datetime;
    }
    if (repeat != null) {
      _result.repeat = repeat;
    }
    if (mon != null) {
      _result.mon = mon;
    }
    if (tue != null) {
      _result.tue = tue;
    }
    if (wed != null) {
      _result.wed = wed;
    }
    if (thu != null) {
      _result.thu = thu;
    }
    if (fri != null) {
      _result.fri = fri;
    }
    if (sat != null) {
      _result.sat = sat;
    }
    if (sun != null) {
      _result.sun = sun;
    }
    return _result;
  }
  factory Schedule.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Schedule.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Schedule clone() => Schedule()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Schedule copyWith(void Function(Schedule) updates) => super.copyWith((message) => updates(message as Schedule)) as Schedule; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Schedule create() => Schedule._();
  Schedule createEmptyInstance() => create();
  static $pb.PbList<Schedule> createRepeated() => $pb.PbList<Schedule>();
  @$core.pragma('dart2js:noInline')
  static Schedule getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Schedule>(create);
  static Schedule? _defaultInstance;

  @$pb.TagNumber(1)
  DateTime get datetime => $_getN(0);
  @$pb.TagNumber(1)
  set datetime(DateTime v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDatetime() => $_has(0);
  @$pb.TagNumber(1)
  void clearDatetime() => clearField(1);
  @$pb.TagNumber(1)
  DateTime ensureDatetime() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get repeat => $_getBF(1);
  @$pb.TagNumber(2)
  set repeat($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRepeat() => $_has(1);
  @$pb.TagNumber(2)
  void clearRepeat() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get mon => $_getBF(2);
  @$pb.TagNumber(3)
  set mon($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMon() => $_has(2);
  @$pb.TagNumber(3)
  void clearMon() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get tue => $_getBF(3);
  @$pb.TagNumber(4)
  set tue($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTue() => $_has(3);
  @$pb.TagNumber(4)
  void clearTue() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get wed => $_getBF(4);
  @$pb.TagNumber(5)
  set wed($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasWed() => $_has(4);
  @$pb.TagNumber(5)
  void clearWed() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get thu => $_getBF(5);
  @$pb.TagNumber(6)
  set thu($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasThu() => $_has(5);
  @$pb.TagNumber(6)
  void clearThu() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get fri => $_getBF(6);
  @$pb.TagNumber(7)
  set fri($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasFri() => $_has(6);
  @$pb.TagNumber(7)
  void clearFri() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get sat => $_getBF(7);
  @$pb.TagNumber(8)
  set sat($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSat() => $_has(7);
  @$pb.TagNumber(8)
  void clearSat() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get sun => $_getBF(8);
  @$pb.TagNumber(9)
  set sun($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSun() => $_has(8);
  @$pb.TagNumber(9)
  void clearSun() => clearField(9);
}

class RemoteScheduleAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RemoteScheduleAction', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteScheduleId', protoName: 'remoteScheduleId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteLibraryCmdId', protoName: 'remoteLibraryCmdId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteMultiLibraryCmdId', protoName: 'remoteMultiLibraryCmdId')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'delay', $pb.PbFieldType.OU3)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order', $pb.PbFieldType.OU3)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  RemoteScheduleAction._() : super();
  factory RemoteScheduleAction({
    $core.String? id,
    $core.String? remoteScheduleId,
    $core.String? remoteLibraryCmdId,
    $core.String? remoteMultiLibraryCmdId,
    $core.int? delay,
    $core.int? order,
    $core.String? name,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (remoteScheduleId != null) {
      _result.remoteScheduleId = remoteScheduleId;
    }
    if (remoteLibraryCmdId != null) {
      _result.remoteLibraryCmdId = remoteLibraryCmdId;
    }
    if (remoteMultiLibraryCmdId != null) {
      _result.remoteMultiLibraryCmdId = remoteMultiLibraryCmdId;
    }
    if (delay != null) {
      _result.delay = delay;
    }
    if (order != null) {
      _result.order = order;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory RemoteScheduleAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoteScheduleAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoteScheduleAction clone() => RemoteScheduleAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoteScheduleAction copyWith(void Function(RemoteScheduleAction) updates) => super.copyWith((message) => updates(message as RemoteScheduleAction)) as RemoteScheduleAction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoteScheduleAction create() => RemoteScheduleAction._();
  RemoteScheduleAction createEmptyInstance() => create();
  static $pb.PbList<RemoteScheduleAction> createRepeated() => $pb.PbList<RemoteScheduleAction>();
  @$core.pragma('dart2js:noInline')
  static RemoteScheduleAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoteScheduleAction>(create);
  static RemoteScheduleAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get remoteScheduleId => $_getSZ(1);
  @$pb.TagNumber(2)
  set remoteScheduleId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRemoteScheduleId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemoteScheduleId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get remoteLibraryCmdId => $_getSZ(2);
  @$pb.TagNumber(3)
  set remoteLibraryCmdId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRemoteLibraryCmdId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRemoteLibraryCmdId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get remoteMultiLibraryCmdId => $_getSZ(3);
  @$pb.TagNumber(4)
  set remoteMultiLibraryCmdId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRemoteMultiLibraryCmdId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRemoteMultiLibraryCmdId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get delay => $_getIZ(4);
  @$pb.TagNumber(5)
  set delay($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDelay() => $_has(4);
  @$pb.TagNumber(5)
  void clearDelay() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get order => $_getIZ(5);
  @$pb.TagNumber(6)
  set order($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOrder() => $_has(5);
  @$pb.TagNumber(6)
  void clearOrder() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get name => $_getSZ(6);
  @$pb.TagNumber(7)
  set name($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasName() => $_has(6);
  @$pb.TagNumber(7)
  void clearName() => clearField(7);
}

class AirConditionerScheduleAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AirConditionerScheduleAction', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteScheduleId', protoName: 'remoteScheduleId')
    ..e<PowerState>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: PowerState.Off, valueOf: PowerState.valueOf, enumValues: PowerState.values)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'temperature', $pb.PbFieldType.OF)
    ..e<ModeAc>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mode', $pb.PbFieldType.OE, defaultOrMaker: ModeAc.AutoMode, valueOf: ModeAc.valueOf, enumValues: ModeAc.values)
    ..e<SwingAc>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'swing', $pb.PbFieldType.OE, defaultOrMaker: SwingAc.AutoSwing, valueOf: SwingAc.valueOf, enumValues: SwingAc.values)
    ..e<FanAc>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fan', $pb.PbFieldType.OE, defaultOrMaker: FanAc.AutoFan, valueOf: FanAc.valueOf, enumValues: FanAc.values)
    ..hasRequiredFields = false
  ;

  AirConditionerScheduleAction._() : super();
  factory AirConditionerScheduleAction({
    $core.String? remoteScheduleId,
    PowerState? powerState,
    $core.double? temperature,
    ModeAc? mode,
    SwingAc? swing,
    FanAc? fan,
  }) {
    final _result = create();
    if (remoteScheduleId != null) {
      _result.remoteScheduleId = remoteScheduleId;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (temperature != null) {
      _result.temperature = temperature;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    if (swing != null) {
      _result.swing = swing;
    }
    if (fan != null) {
      _result.fan = fan;
    }
    return _result;
  }
  factory AirConditionerScheduleAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AirConditionerScheduleAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AirConditionerScheduleAction clone() => AirConditionerScheduleAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AirConditionerScheduleAction copyWith(void Function(AirConditionerScheduleAction) updates) => super.copyWith((message) => updates(message as AirConditionerScheduleAction)) as AirConditionerScheduleAction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AirConditionerScheduleAction create() => AirConditionerScheduleAction._();
  AirConditionerScheduleAction createEmptyInstance() => create();
  static $pb.PbList<AirConditionerScheduleAction> createRepeated() => $pb.PbList<AirConditionerScheduleAction>();
  @$core.pragma('dart2js:noInline')
  static AirConditionerScheduleAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AirConditionerScheduleAction>(create);
  static AirConditionerScheduleAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get remoteScheduleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set remoteScheduleId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRemoteScheduleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRemoteScheduleId() => clearField(1);

  @$pb.TagNumber(2)
  PowerState get powerState => $_getN(1);
  @$pb.TagNumber(2)
  set powerState(PowerState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPowerState() => $_has(1);
  @$pb.TagNumber(2)
  void clearPowerState() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get temperature => $_getN(2);
  @$pb.TagNumber(3)
  set temperature($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTemperature() => $_has(2);
  @$pb.TagNumber(3)
  void clearTemperature() => clearField(3);

  @$pb.TagNumber(4)
  ModeAc get mode => $_getN(3);
  @$pb.TagNumber(4)
  set mode(ModeAc v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMode() => $_has(3);
  @$pb.TagNumber(4)
  void clearMode() => clearField(4);

  @$pb.TagNumber(5)
  SwingAc get swing => $_getN(4);
  @$pb.TagNumber(5)
  set swing(SwingAc v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasSwing() => $_has(4);
  @$pb.TagNumber(5)
  void clearSwing() => clearField(5);

  @$pb.TagNumber(6)
  FanAc get fan => $_getN(5);
  @$pb.TagNumber(6)
  set fan(FanAc v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasFan() => $_has(5);
  @$pb.TagNumber(6)
  void clearFan() => clearField(6);
}

class RemoteSchedule extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RemoteSchedule', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOM<Remote>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remote', subBuilder: Remote.create)
    ..aOM<Schedule>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'schedule', subBuilder: Schedule.create)
    ..aOM<AirConditionerScheduleAction>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'airConditionerAction', protoName: 'airConditionerAction', subBuilder: AirConditionerScheduleAction.create)
    ..pc<RemoteScheduleAction>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remoteActions', $pb.PbFieldType.PM, protoName: 'remoteActions', subBuilder: RemoteScheduleAction.create)
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'active')
    ..hasRequiredFields = false
  ;

  RemoteSchedule._() : super();
  factory RemoteSchedule({
    $core.String? id,
    Remote? remote,
    Schedule? schedule,
    AirConditionerScheduleAction? airConditionerAction,
    $core.Iterable<RemoteScheduleAction>? remoteActions,
    $core.bool? active,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (remote != null) {
      _result.remote = remote;
    }
    if (schedule != null) {
      _result.schedule = schedule;
    }
    if (airConditionerAction != null) {
      _result.airConditionerAction = airConditionerAction;
    }
    if (remoteActions != null) {
      _result.remoteActions.addAll(remoteActions);
    }
    if (active != null) {
      _result.active = active;
    }
    return _result;
  }
  factory RemoteSchedule.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoteSchedule.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoteSchedule clone() => RemoteSchedule()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoteSchedule copyWith(void Function(RemoteSchedule) updates) => super.copyWith((message) => updates(message as RemoteSchedule)) as RemoteSchedule; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoteSchedule create() => RemoteSchedule._();
  RemoteSchedule createEmptyInstance() => create();
  static $pb.PbList<RemoteSchedule> createRepeated() => $pb.PbList<RemoteSchedule>();
  @$core.pragma('dart2js:noInline')
  static RemoteSchedule getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoteSchedule>(create);
  static RemoteSchedule? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  Remote get remote => $_getN(1);
  @$pb.TagNumber(2)
  set remote(Remote v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRemote() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemote() => clearField(2);
  @$pb.TagNumber(2)
  Remote ensureRemote() => $_ensure(1);

  @$pb.TagNumber(3)
  Schedule get schedule => $_getN(2);
  @$pb.TagNumber(3)
  set schedule(Schedule v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSchedule() => $_has(2);
  @$pb.TagNumber(3)
  void clearSchedule() => clearField(3);
  @$pb.TagNumber(3)
  Schedule ensureSchedule() => $_ensure(2);

  @$pb.TagNumber(4)
  AirConditionerScheduleAction get airConditionerAction => $_getN(3);
  @$pb.TagNumber(4)
  set airConditionerAction(AirConditionerScheduleAction v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAirConditionerAction() => $_has(3);
  @$pb.TagNumber(4)
  void clearAirConditionerAction() => clearField(4);
  @$pb.TagNumber(4)
  AirConditionerScheduleAction ensureAirConditionerAction() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.List<RemoteScheduleAction> get remoteActions => $_getList(4);

  @$pb.TagNumber(6)
  $core.bool get active => $_getBF(5);
  @$pb.TagNumber(6)
  set active($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasActive() => $_has(5);
  @$pb.TagNumber(6)
  void clearActive() => clearField(6);
}

class SwitcherSchedule extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SwitcherSchedule', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..e<PowerState>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: PowerState.Off, valueOf: PowerState.valueOf, enumValues: PowerState.values)
    ..aOM<Switcher>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcher', subBuilder: Switcher.create)
    ..aOM<Schedule>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'schedule', subBuilder: Schedule.create)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'active')
    ..hasRequiredFields = false
  ;

  SwitcherSchedule._() : super();
  factory SwitcherSchedule({
    $core.String? id,
    PowerState? powerState,
    Switcher? switcher,
    Schedule? schedule,
    $core.bool? active,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (switcher != null) {
      _result.switcher = switcher;
    }
    if (schedule != null) {
      _result.schedule = schedule;
    }
    if (active != null) {
      _result.active = active;
    }
    return _result;
  }
  factory SwitcherSchedule.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SwitcherSchedule.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SwitcherSchedule clone() => SwitcherSchedule()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SwitcherSchedule copyWith(void Function(SwitcherSchedule) updates) => super.copyWith((message) => updates(message as SwitcherSchedule)) as SwitcherSchedule; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SwitcherSchedule create() => SwitcherSchedule._();
  SwitcherSchedule createEmptyInstance() => create();
  static $pb.PbList<SwitcherSchedule> createRepeated() => $pb.PbList<SwitcherSchedule>();
  @$core.pragma('dart2js:noInline')
  static SwitcherSchedule getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SwitcherSchedule>(create);
  static SwitcherSchedule? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  PowerState get powerState => $_getN(1);
  @$pb.TagNumber(2)
  set powerState(PowerState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPowerState() => $_has(1);
  @$pb.TagNumber(2)
  void clearPowerState() => clearField(2);

  @$pb.TagNumber(3)
  Switcher get switcher => $_getN(2);
  @$pb.TagNumber(3)
  set switcher(Switcher v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSwitcher() => $_has(2);
  @$pb.TagNumber(3)
  void clearSwitcher() => clearField(3);
  @$pb.TagNumber(3)
  Switcher ensureSwitcher() => $_ensure(2);

  @$pb.TagNumber(4)
  Schedule get schedule => $_getN(3);
  @$pb.TagNumber(4)
  set schedule(Schedule v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSchedule() => $_has(3);
  @$pb.TagNumber(4)
  void clearSchedule() => clearField(4);
  @$pb.TagNumber(4)
  Schedule ensureSchedule() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.bool get active => $_getBF(4);
  @$pb.TagNumber(5)
  set active($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasActive() => $_has(4);
  @$pb.TagNumber(5)
  void clearActive() => clearField(5);
}

class CurtainSwitcherSchedule extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CurtainSwitcherSchedule', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOM<CurtainSwitcher>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainSwitcher', protoName: 'curtainSwitcher', subBuilder: CurtainSwitcher.create)
    ..aOM<Schedule>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'schedule', subBuilder: Schedule.create)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percentIn', $pb.PbFieldType.OU3, protoName: 'percentIn')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percentOut', $pb.PbFieldType.OU3, protoName: 'percentOut')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'active')
    ..hasRequiredFields = false
  ;

  CurtainSwitcherSchedule._() : super();
  factory CurtainSwitcherSchedule({
    $core.String? id,
    CurtainSwitcher? curtainSwitcher,
    Schedule? schedule,
    $core.int? percentIn,
    $core.int? percentOut,
    $core.bool? active,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (curtainSwitcher != null) {
      _result.curtainSwitcher = curtainSwitcher;
    }
    if (schedule != null) {
      _result.schedule = schedule;
    }
    if (percentIn != null) {
      _result.percentIn = percentIn;
    }
    if (percentOut != null) {
      _result.percentOut = percentOut;
    }
    if (active != null) {
      _result.active = active;
    }
    return _result;
  }
  factory CurtainSwitcherSchedule.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CurtainSwitcherSchedule.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CurtainSwitcherSchedule clone() => CurtainSwitcherSchedule()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CurtainSwitcherSchedule copyWith(void Function(CurtainSwitcherSchedule) updates) => super.copyWith((message) => updates(message as CurtainSwitcherSchedule)) as CurtainSwitcherSchedule; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CurtainSwitcherSchedule create() => CurtainSwitcherSchedule._();
  CurtainSwitcherSchedule createEmptyInstance() => create();
  static $pb.PbList<CurtainSwitcherSchedule> createRepeated() => $pb.PbList<CurtainSwitcherSchedule>();
  @$core.pragma('dart2js:noInline')
  static CurtainSwitcherSchedule getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CurtainSwitcherSchedule>(create);
  static CurtainSwitcherSchedule? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  CurtainSwitcher get curtainSwitcher => $_getN(1);
  @$pb.TagNumber(2)
  set curtainSwitcher(CurtainSwitcher v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurtainSwitcher() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurtainSwitcher() => clearField(2);
  @$pb.TagNumber(2)
  CurtainSwitcher ensureCurtainSwitcher() => $_ensure(1);

  @$pb.TagNumber(3)
  Schedule get schedule => $_getN(2);
  @$pb.TagNumber(3)
  set schedule(Schedule v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSchedule() => $_has(2);
  @$pb.TagNumber(3)
  void clearSchedule() => clearField(3);
  @$pb.TagNumber(3)
  Schedule ensureSchedule() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get percentIn => $_getIZ(3);
  @$pb.TagNumber(4)
  set percentIn($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPercentIn() => $_has(3);
  @$pb.TagNumber(4)
  void clearPercentIn() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get percentOut => $_getIZ(4);
  @$pb.TagNumber(5)
  set percentOut($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPercentOut() => $_has(4);
  @$pb.TagNumber(5)
  void clearPercentOut() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get active => $_getBF(5);
  @$pb.TagNumber(6)
  set active($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasActive() => $_has(5);
  @$pb.TagNumber(6)
  void clearActive() => clearField(6);
}

class CurtainSchedule extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CurtainSchedule', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOM<Curtain>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtain', subBuilder: Curtain.create)
    ..aOM<Schedule>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'schedule', subBuilder: Schedule.create)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percent', $pb.PbFieldType.OU3)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'active')
    ..hasRequiredFields = false
  ;

  CurtainSchedule._() : super();
  factory CurtainSchedule({
    $core.String? id,
    Curtain? curtain,
    Schedule? schedule,
    $core.int? percent,
    $core.bool? active,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (curtain != null) {
      _result.curtain = curtain;
    }
    if (schedule != null) {
      _result.schedule = schedule;
    }
    if (percent != null) {
      _result.percent = percent;
    }
    if (active != null) {
      _result.active = active;
    }
    return _result;
  }
  factory CurtainSchedule.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CurtainSchedule.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CurtainSchedule clone() => CurtainSchedule()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CurtainSchedule copyWith(void Function(CurtainSchedule) updates) => super.copyWith((message) => updates(message as CurtainSchedule)) as CurtainSchedule; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CurtainSchedule create() => CurtainSchedule._();
  CurtainSchedule createEmptyInstance() => create();
  static $pb.PbList<CurtainSchedule> createRepeated() => $pb.PbList<CurtainSchedule>();
  @$core.pragma('dart2js:noInline')
  static CurtainSchedule getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CurtainSchedule>(create);
  static CurtainSchedule? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  Curtain get curtain => $_getN(1);
  @$pb.TagNumber(2)
  set curtain(Curtain v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurtain() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurtain() => clearField(2);
  @$pb.TagNumber(2)
  Curtain ensureCurtain() => $_ensure(1);

  @$pb.TagNumber(3)
  Schedule get schedule => $_getN(2);
  @$pb.TagNumber(3)
  set schedule(Schedule v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSchedule() => $_has(2);
  @$pb.TagNumber(3)
  void clearSchedule() => clearField(3);
  @$pb.TagNumber(3)
  Schedule ensureSchedule() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get percent => $_getIZ(3);
  @$pb.TagNumber(4)
  set percent($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPercent() => $_has(3);
  @$pb.TagNumber(4)
  void clearPercent() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get active => $_getBF(4);
  @$pb.TagNumber(5)
  set active($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasActive() => $_has(4);
  @$pb.TagNumber(5)
  void clearActive() => clearField(5);
}

class LightSensor extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LightSensor', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nameEn', protoName: 'nameEn')
    ..e<ButtonState>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buttonState', $pb.PbFieldType.OE, protoName: 'buttonState', defaultOrMaker: ButtonState.Nothing, valueOf: ButtonState.valueOf, enumValues: ButtonState.values)
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favorite')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order', $pb.PbFieldType.OU3)
    ..aOM<Device>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'device', subBuilder: Device.create)
    ..hasRequiredFields = false
  ;

  LightSensor._() : super();
  factory LightSensor({
    $core.String? id,
    $core.String? icon,
    $core.String? name,
    $core.String? nameEn,
    ButtonState? buttonState,
    $core.bool? favorite,
    $core.int? order,
    Device? device,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (nameEn != null) {
      _result.nameEn = nameEn;
    }
    if (buttonState != null) {
      _result.buttonState = buttonState;
    }
    if (favorite != null) {
      _result.favorite = favorite;
    }
    if (order != null) {
      _result.order = order;
    }
    if (device != null) {
      _result.device = device;
    }
    return _result;
  }
  factory LightSensor.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LightSensor.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LightSensor clone() => LightSensor()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LightSensor copyWith(void Function(LightSensor) updates) => super.copyWith((message) => updates(message as LightSensor)) as LightSensor; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LightSensor create() => LightSensor._();
  LightSensor createEmptyInstance() => create();
  static $pb.PbList<LightSensor> createRepeated() => $pb.PbList<LightSensor>();
  @$core.pragma('dart2js:noInline')
  static LightSensor getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LightSensor>(create);
  static LightSensor? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get nameEn => $_getSZ(3);
  @$pb.TagNumber(4)
  set nameEn($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNameEn() => $_has(3);
  @$pb.TagNumber(4)
  void clearNameEn() => clearField(4);

  @$pb.TagNumber(5)
  ButtonState get buttonState => $_getN(4);
  @$pb.TagNumber(5)
  set buttonState(ButtonState v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasButtonState() => $_has(4);
  @$pb.TagNumber(5)
  void clearButtonState() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get favorite => $_getBF(5);
  @$pb.TagNumber(6)
  set favorite($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFavorite() => $_has(5);
  @$pb.TagNumber(6)
  void clearFavorite() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get order => $_getIZ(6);
  @$pb.TagNumber(7)
  set order($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOrder() => $_has(6);
  @$pb.TagNumber(7)
  void clearOrder() => clearField(7);

  @$pb.TagNumber(8)
  Device get device => $_getN(7);
  @$pb.TagNumber(8)
  set device(Device v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasDevice() => $_has(7);
  @$pb.TagNumber(8)
  void clearDevice() => clearField(8);
  @$pb.TagNumber(8)
  Device ensureDevice() => $_ensure(7);
}

class Meter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Meter', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serialNumber', protoName: 'serialNumber')
    ..e<TypeMeter>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'typeMeter', $pb.PbFieldType.OE, protoName: 'typeMeter', defaultOrMaker: TypeMeter.ElectricMeter, valueOf: TypeMeter.valueOf, enumValues: TypeMeter.values)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'month', $pb.PbFieldType.OU3)
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metric', $pb.PbFieldType.OF)
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'estimate', $pb.PbFieldType.OU3)
    ..pc<MeterIndex>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexs', $pb.PbFieldType.PM, subBuilder: MeterIndex.create)
    ..pc<MeterEstimate>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'estimates', $pb.PbFieldType.PM, subBuilder: MeterEstimate.create)
    ..e<ConnectionState>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'connectionState', $pb.PbFieldType.OE, protoName: 'connectionState', defaultOrMaker: ConnectionState.Offline, valueOf: ConnectionState.valueOf, enumValues: ConnectionState.values)
    ..a<$core.int>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limitMoney', $pb.PbFieldType.OU3, protoName: 'limitMoney')
    ..a<$core.int>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'alertOverConsume', $pb.PbFieldType.OU3, protoName: 'alertOverConsume')
    ..a<$fixnum.Int64>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastUpdateIndex', $pb.PbFieldType.OU6, protoName: 'lastUpdateIndex', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lostUpdateIndex', protoName: 'lostUpdateIndex')
    ..a<$fixnum.Int64>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastFromDate', $pb.PbFieldType.OU6, protoName: 'lastFromDate', defaultOrMaker: $fixnum.Int64.ZERO)
    ..pc<MeterEstimate>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'estimateMonths', $pb.PbFieldType.PM, protoName: 'estimateMonths', subBuilder: MeterEstimate.create)
    ..pc<MeterEstimate>(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'estimateDays', $pb.PbFieldType.PM, protoName: 'estimateDays', subBuilder: MeterEstimate.create)
    ..aOM<Device>(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'device', subBuilder: Device.create)
    ..a<$core.double>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastMetricIndex', $pb.PbFieldType.OF, protoName: 'lastMetricIndex')
    ..hasRequiredFields = false
  ;

  Meter._() : super();
  factory Meter({
    $core.String? id,
    $core.String? serialNumber,
    TypeMeter? typeMeter,
    $core.String? deviceId,
    $core.String? icon,
    $core.int? month,
    $core.double? metric,
    $core.int? estimate,
    $core.Iterable<MeterIndex>? indexs,
    $core.Iterable<MeterEstimate>? estimates,
    ConnectionState? connectionState,
    $core.int? limitMoney,
    $core.int? alertOverConsume,
    $fixnum.Int64? lastUpdateIndex,
    $core.bool? lostUpdateIndex,
    $fixnum.Int64? lastFromDate,
    $core.Iterable<MeterEstimate>? estimateMonths,
    $core.Iterable<MeterEstimate>? estimateDays,
    Device? device,
    $core.double? lastMetricIndex,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (serialNumber != null) {
      _result.serialNumber = serialNumber;
    }
    if (typeMeter != null) {
      _result.typeMeter = typeMeter;
    }
    if (deviceId != null) {
      _result.deviceId = deviceId;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (month != null) {
      _result.month = month;
    }
    if (metric != null) {
      _result.metric = metric;
    }
    if (estimate != null) {
      _result.estimate = estimate;
    }
    if (indexs != null) {
      _result.indexs.addAll(indexs);
    }
    if (estimates != null) {
      _result.estimates.addAll(estimates);
    }
    if (connectionState != null) {
      _result.connectionState = connectionState;
    }
    if (limitMoney != null) {
      _result.limitMoney = limitMoney;
    }
    if (alertOverConsume != null) {
      _result.alertOverConsume = alertOverConsume;
    }
    if (lastUpdateIndex != null) {
      _result.lastUpdateIndex = lastUpdateIndex;
    }
    if (lostUpdateIndex != null) {
      _result.lostUpdateIndex = lostUpdateIndex;
    }
    if (lastFromDate != null) {
      _result.lastFromDate = lastFromDate;
    }
    if (estimateMonths != null) {
      _result.estimateMonths.addAll(estimateMonths);
    }
    if (estimateDays != null) {
      _result.estimateDays.addAll(estimateDays);
    }
    if (device != null) {
      _result.device = device;
    }
    if (lastMetricIndex != null) {
      _result.lastMetricIndex = lastMetricIndex;
    }
    return _result;
  }
  factory Meter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Meter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Meter clone() => Meter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Meter copyWith(void Function(Meter) updates) => super.copyWith((message) => updates(message as Meter)) as Meter; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Meter create() => Meter._();
  Meter createEmptyInstance() => create();
  static $pb.PbList<Meter> createRepeated() => $pb.PbList<Meter>();
  @$core.pragma('dart2js:noInline')
  static Meter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Meter>(create);
  static Meter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get serialNumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set serialNumber($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSerialNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearSerialNumber() => clearField(2);

  @$pb.TagNumber(3)
  TypeMeter get typeMeter => $_getN(2);
  @$pb.TagNumber(3)
  set typeMeter(TypeMeter v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTypeMeter() => $_has(2);
  @$pb.TagNumber(3)
  void clearTypeMeter() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get deviceId => $_getSZ(3);
  @$pb.TagNumber(4)
  set deviceId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDeviceId() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeviceId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get month => $_getIZ(5);
  @$pb.TagNumber(6)
  set month($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMonth() => $_has(5);
  @$pb.TagNumber(6)
  void clearMonth() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get metric => $_getN(6);
  @$pb.TagNumber(7)
  set metric($core.double v) { $_setFloat(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMetric() => $_has(6);
  @$pb.TagNumber(7)
  void clearMetric() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get estimate => $_getIZ(7);
  @$pb.TagNumber(8)
  set estimate($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasEstimate() => $_has(7);
  @$pb.TagNumber(8)
  void clearEstimate() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<MeterIndex> get indexs => $_getList(8);

  @$pb.TagNumber(10)
  $core.List<MeterEstimate> get estimates => $_getList(9);

  @$pb.TagNumber(11)
  ConnectionState get connectionState => $_getN(10);
  @$pb.TagNumber(11)
  set connectionState(ConnectionState v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasConnectionState() => $_has(10);
  @$pb.TagNumber(11)
  void clearConnectionState() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get limitMoney => $_getIZ(11);
  @$pb.TagNumber(12)
  set limitMoney($core.int v) { $_setUnsignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasLimitMoney() => $_has(11);
  @$pb.TagNumber(12)
  void clearLimitMoney() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get alertOverConsume => $_getIZ(12);
  @$pb.TagNumber(13)
  set alertOverConsume($core.int v) { $_setUnsignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasAlertOverConsume() => $_has(12);
  @$pb.TagNumber(13)
  void clearAlertOverConsume() => clearField(13);

  @$pb.TagNumber(14)
  $fixnum.Int64 get lastUpdateIndex => $_getI64(13);
  @$pb.TagNumber(14)
  set lastUpdateIndex($fixnum.Int64 v) { $_setInt64(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasLastUpdateIndex() => $_has(13);
  @$pb.TagNumber(14)
  void clearLastUpdateIndex() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get lostUpdateIndex => $_getBF(14);
  @$pb.TagNumber(15)
  set lostUpdateIndex($core.bool v) { $_setBool(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasLostUpdateIndex() => $_has(14);
  @$pb.TagNumber(15)
  void clearLostUpdateIndex() => clearField(15);

  @$pb.TagNumber(16)
  $fixnum.Int64 get lastFromDate => $_getI64(15);
  @$pb.TagNumber(16)
  set lastFromDate($fixnum.Int64 v) { $_setInt64(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasLastFromDate() => $_has(15);
  @$pb.TagNumber(16)
  void clearLastFromDate() => clearField(16);

  @$pb.TagNumber(17)
  $core.List<MeterEstimate> get estimateMonths => $_getList(16);

  @$pb.TagNumber(18)
  $core.List<MeterEstimate> get estimateDays => $_getList(17);

  @$pb.TagNumber(19)
  Device get device => $_getN(18);
  @$pb.TagNumber(19)
  set device(Device v) { setField(19, v); }
  @$pb.TagNumber(19)
  $core.bool hasDevice() => $_has(18);
  @$pb.TagNumber(19)
  void clearDevice() => clearField(19);
  @$pb.TagNumber(19)
  Device ensureDevice() => $_ensure(18);

  @$pb.TagNumber(20)
  $core.double get lastMetricIndex => $_getN(19);
  @$pb.TagNumber(20)
  set lastMetricIndex($core.double v) { $_setFloat(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasLastMetricIndex() => $_has(19);
  @$pb.TagNumber(20)
  void clearLastMetricIndex() => clearField(20);
}

class MeterIndex extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MeterIndex', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serialNumber', protoName: 'serialNumber')
    ..e<TypeMeter>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: TypeMeter.ElectricMeter, valueOf: TypeMeter.valueOf, enumValues: TypeMeter.values)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'metric', $pb.PbFieldType.OF)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hour', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  MeterIndex._() : super();
  factory MeterIndex({
    $core.String? serialNumber,
    TypeMeter? type,
    $core.double? metric,
    $core.int? hour,
  }) {
    final _result = create();
    if (serialNumber != null) {
      _result.serialNumber = serialNumber;
    }
    if (type != null) {
      _result.type = type;
    }
    if (metric != null) {
      _result.metric = metric;
    }
    if (hour != null) {
      _result.hour = hour;
    }
    return _result;
  }
  factory MeterIndex.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MeterIndex.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MeterIndex clone() => MeterIndex()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MeterIndex copyWith(void Function(MeterIndex) updates) => super.copyWith((message) => updates(message as MeterIndex)) as MeterIndex; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MeterIndex create() => MeterIndex._();
  MeterIndex createEmptyInstance() => create();
  static $pb.PbList<MeterIndex> createRepeated() => $pb.PbList<MeterIndex>();
  @$core.pragma('dart2js:noInline')
  static MeterIndex getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MeterIndex>(create);
  static MeterIndex? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serialNumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set serialNumber($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSerialNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearSerialNumber() => clearField(1);

  @$pb.TagNumber(2)
  TypeMeter get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(TypeMeter v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get metric => $_getN(2);
  @$pb.TagNumber(3)
  set metric($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMetric() => $_has(2);
  @$pb.TagNumber(3)
  void clearMetric() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get hour => $_getIZ(3);
  @$pb.TagNumber(4)
  set hour($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHour() => $_has(3);
  @$pb.TagNumber(4)
  void clearHour() => clearField(4);
}

class MeterEstimate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MeterEstimate', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serialNumber', protoName: 'serialNumber')
    ..e<TypeMeter>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: TypeMeter.ElectricMeter, valueOf: TypeMeter.valueOf, enumValues: TypeMeter.values)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'month', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'estimate', $pb.PbFieldType.OU3)
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'consume', $pb.PbFieldType.OF)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'year', $pb.PbFieldType.OU3)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'day', $pb.PbFieldType.OU3)
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hour', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  MeterEstimate._() : super();
  factory MeterEstimate({
    $core.String? serialNumber,
    TypeMeter? type,
    $core.int? month,
    $core.int? estimate,
    $core.double? consume,
    $core.int? year,
    $core.int? day,
    $core.int? hour,
  }) {
    final _result = create();
    if (serialNumber != null) {
      _result.serialNumber = serialNumber;
    }
    if (type != null) {
      _result.type = type;
    }
    if (month != null) {
      _result.month = month;
    }
    if (estimate != null) {
      _result.estimate = estimate;
    }
    if (consume != null) {
      _result.consume = consume;
    }
    if (year != null) {
      _result.year = year;
    }
    if (day != null) {
      _result.day = day;
    }
    if (hour != null) {
      _result.hour = hour;
    }
    return _result;
  }
  factory MeterEstimate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MeterEstimate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MeterEstimate clone() => MeterEstimate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MeterEstimate copyWith(void Function(MeterEstimate) updates) => super.copyWith((message) => updates(message as MeterEstimate)) as MeterEstimate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MeterEstimate create() => MeterEstimate._();
  MeterEstimate createEmptyInstance() => create();
  static $pb.PbList<MeterEstimate> createRepeated() => $pb.PbList<MeterEstimate>();
  @$core.pragma('dart2js:noInline')
  static MeterEstimate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MeterEstimate>(create);
  static MeterEstimate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serialNumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set serialNumber($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSerialNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearSerialNumber() => clearField(1);

  @$pb.TagNumber(2)
  TypeMeter get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(TypeMeter v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get month => $_getIZ(2);
  @$pb.TagNumber(3)
  set month($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMonth() => $_has(2);
  @$pb.TagNumber(3)
  void clearMonth() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get estimate => $_getIZ(3);
  @$pb.TagNumber(4)
  set estimate($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEstimate() => $_has(3);
  @$pb.TagNumber(4)
  void clearEstimate() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get consume => $_getN(4);
  @$pb.TagNumber(5)
  set consume($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasConsume() => $_has(4);
  @$pb.TagNumber(5)
  void clearConsume() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get year => $_getIZ(5);
  @$pb.TagNumber(6)
  set year($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasYear() => $_has(5);
  @$pb.TagNumber(6)
  void clearYear() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get day => $_getIZ(6);
  @$pb.TagNumber(7)
  set day($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDay() => $_has(6);
  @$pb.TagNumber(7)
  void clearDay() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get hour => $_getIZ(7);
  @$pb.TagNumber(8)
  set hour($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasHour() => $_has(7);
  @$pb.TagNumber(8)
  void clearHour() => clearField(8);
}

class ActiveTime extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ActiveTime', createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'enableFullTime', protoName: 'enableFullTime')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'enableStart', $pb.PbFieldType.OU3, protoName: 'enableStart')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'enableEnd', $pb.PbFieldType.OU3, protoName: 'enableEnd')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'enableDayMap', $pb.PbFieldType.OU3, protoName: 'enableDayMap')
    ..hasRequiredFields = false
  ;

  ActiveTime._() : super();
  factory ActiveTime({
    $core.bool? enableFullTime,
    $core.int? enableStart,
    $core.int? enableEnd,
    $core.int? enableDayMap,
  }) {
    final _result = create();
    if (enableFullTime != null) {
      _result.enableFullTime = enableFullTime;
    }
    if (enableStart != null) {
      _result.enableStart = enableStart;
    }
    if (enableEnd != null) {
      _result.enableEnd = enableEnd;
    }
    if (enableDayMap != null) {
      _result.enableDayMap = enableDayMap;
    }
    return _result;
  }
  factory ActiveTime.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActiveTime.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActiveTime clone() => ActiveTime()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActiveTime copyWith(void Function(ActiveTime) updates) => super.copyWith((message) => updates(message as ActiveTime)) as ActiveTime; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ActiveTime create() => ActiveTime._();
  ActiveTime createEmptyInstance() => create();
  static $pb.PbList<ActiveTime> createRepeated() => $pb.PbList<ActiveTime>();
  @$core.pragma('dart2js:noInline')
  static ActiveTime getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActiveTime>(create);
  static ActiveTime? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enableFullTime => $_getBF(0);
  @$pb.TagNumber(1)
  set enableFullTime($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnableFullTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnableFullTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get enableStart => $_getIZ(1);
  @$pb.TagNumber(2)
  set enableStart($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEnableStart() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnableStart() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get enableEnd => $_getIZ(2);
  @$pb.TagNumber(3)
  set enableEnd($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEnableEnd() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnableEnd() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get enableDayMap => $_getIZ(3);
  @$pb.TagNumber(4)
  set enableDayMap($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEnableDayMap() => $_has(3);
  @$pb.TagNumber(4)
  void clearEnableDayMap() => clearField(4);
}

class Scene extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Scene', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'homeId', protoName: 'homeId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nameEn', protoName: 'nameEn')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favorite')
    ..e<ConditionScene>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'condition', $pb.PbFieldType.OE, defaultOrMaker: ConditionScene.AutoCondition, valueOf: ConditionScene.valueOf, enumValues: ConditionScene.values)
    ..aOM<Switcher>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcherCondition', protoName: 'switcherCondition', subBuilder: Switcher.create)
    ..e<PowerState>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: PowerState.Off, valueOf: PowerState.valueOf, enumValues: PowerState.values)
    ..pc<SceneSwitcherAction>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneSwitcherActions', $pb.PbFieldType.PM, protoName: 'sceneSwitcherActions', subBuilder: SceneSwitcherAction.create)
    ..pc<SceneCurtainSwitcherAction>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainSwitcherActions', $pb.PbFieldType.PM, protoName: 'curtainSwitcherActions', subBuilder: SceneCurtainSwitcherAction.create)
    ..pc<SceneAirConditionerAction>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'airConditionerActions', $pb.PbFieldType.PM, protoName: 'airConditionerActions', subBuilder: SceneAirConditionerAction.create)
    ..pc<SceneRemoteAction>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneRemoteActions', $pb.PbFieldType.PM, protoName: 'sceneRemoteActions', subBuilder: SceneRemoteAction.create)
    ..pc<SceneMotionAction>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneMotionActions', $pb.PbFieldType.PM, protoName: 'sceneMotionActions', subBuilder: SceneMotionAction.create)
    ..a<$core.int>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OU3)
    ..aOB(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'confirmed')
    ..aOM<Motion>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'motionCondition', protoName: 'motionCondition', subBuilder: Motion.create)
    ..aOM<ActiveTime>(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'activeTime', protoName: 'activeTime', subBuilder: ActiveTime.create)
    ..aOB(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isDisable', protoName: 'isDisable')
    ..aOS(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'actionListIcon', protoName: 'actionListIcon')
    ..aOM<Schedule>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'schedule', subBuilder: Schedule.create)
    ..pc<SceneLedDriverAction>(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneLedDriverActions', $pb.PbFieldType.PM, protoName: 'sceneLedDriverActions', subBuilder: SceneLedDriverAction.create)
    ..aOM<Button>(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buttonCondition', protoName: 'buttonCondition', subBuilder: Button.create)
    ..aOM<LedDriver>(24, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ledDriverCondition', protoName: 'ledDriverCondition', subBuilder: LedDriver.create)
    ..aOM<EnvironmentSensor>(25, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'environmentSensorsCondition', protoName: 'environmentSensorsCondition', subBuilder: EnvironmentSensor.create)
    ..pc<SceneCurtainAction>(26, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainActions', $pb.PbFieldType.PM, protoName: 'curtainActions', subBuilder: SceneCurtainAction.create)
    ..hasRequiredFields = false
  ;

  Scene._() : super();
  factory Scene({
    $core.String? id,
    $core.String? homeId,
    $core.String? name,
    $core.String? nameEn,
    $core.String? icon,
    $core.bool? favorite,
    ConditionScene? condition,
    Switcher? switcherCondition,
    PowerState? powerState,
    $core.Iterable<SceneSwitcherAction>? sceneSwitcherActions,
    $core.Iterable<SceneCurtainSwitcherAction>? curtainSwitcherActions,
    $core.Iterable<SceneAirConditionerAction>? airConditionerActions,
    $core.Iterable<SceneRemoteAction>? sceneRemoteActions,
    $core.Iterable<SceneMotionAction>? sceneMotionActions,
    $core.int? type,
    $core.bool? confirmed,
    Motion? motionCondition,
    ActiveTime? activeTime,
    $core.bool? isDisable,
    $core.String? actionListIcon,
    Schedule? schedule,
    $core.Iterable<SceneLedDriverAction>? sceneLedDriverActions,
    Button? buttonCondition,
    LedDriver? ledDriverCondition,
    EnvironmentSensor? environmentSensorsCondition,
    $core.Iterable<SceneCurtainAction>? curtainActions,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (homeId != null) {
      _result.homeId = homeId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (nameEn != null) {
      _result.nameEn = nameEn;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (favorite != null) {
      _result.favorite = favorite;
    }
    if (condition != null) {
      _result.condition = condition;
    }
    if (switcherCondition != null) {
      _result.switcherCondition = switcherCondition;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (sceneSwitcherActions != null) {
      _result.sceneSwitcherActions.addAll(sceneSwitcherActions);
    }
    if (curtainSwitcherActions != null) {
      _result.curtainSwitcherActions.addAll(curtainSwitcherActions);
    }
    if (airConditionerActions != null) {
      _result.airConditionerActions.addAll(airConditionerActions);
    }
    if (sceneRemoteActions != null) {
      _result.sceneRemoteActions.addAll(sceneRemoteActions);
    }
    if (sceneMotionActions != null) {
      _result.sceneMotionActions.addAll(sceneMotionActions);
    }
    if (type != null) {
      _result.type = type;
    }
    if (confirmed != null) {
      _result.confirmed = confirmed;
    }
    if (motionCondition != null) {
      _result.motionCondition = motionCondition;
    }
    if (activeTime != null) {
      _result.activeTime = activeTime;
    }
    if (isDisable != null) {
      _result.isDisable = isDisable;
    }
    if (actionListIcon != null) {
      _result.actionListIcon = actionListIcon;
    }
    if (schedule != null) {
      _result.schedule = schedule;
    }
    if (sceneLedDriverActions != null) {
      _result.sceneLedDriverActions.addAll(sceneLedDriverActions);
    }
    if (buttonCondition != null) {
      _result.buttonCondition = buttonCondition;
    }
    if (ledDriverCondition != null) {
      _result.ledDriverCondition = ledDriverCondition;
    }
    if (environmentSensorsCondition != null) {
      _result.environmentSensorsCondition = environmentSensorsCondition;
    }
    if (curtainActions != null) {
      _result.curtainActions.addAll(curtainActions);
    }
    return _result;
  }
  factory Scene.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Scene.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Scene clone() => Scene()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Scene copyWith(void Function(Scene) updates) => super.copyWith((message) => updates(message as Scene)) as Scene; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Scene create() => Scene._();
  Scene createEmptyInstance() => create();
  static $pb.PbList<Scene> createRepeated() => $pb.PbList<Scene>();
  @$core.pragma('dart2js:noInline')
  static Scene getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Scene>(create);
  static Scene? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get homeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set homeId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHomeId() => $_has(1);
  @$pb.TagNumber(2)
  void clearHomeId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get nameEn => $_getSZ(3);
  @$pb.TagNumber(4)
  set nameEn($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNameEn() => $_has(3);
  @$pb.TagNumber(4)
  void clearNameEn() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get favorite => $_getBF(5);
  @$pb.TagNumber(6)
  set favorite($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFavorite() => $_has(5);
  @$pb.TagNumber(6)
  void clearFavorite() => clearField(6);

  @$pb.TagNumber(7)
  ConditionScene get condition => $_getN(6);
  @$pb.TagNumber(7)
  set condition(ConditionScene v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCondition() => $_has(6);
  @$pb.TagNumber(7)
  void clearCondition() => clearField(7);

  @$pb.TagNumber(8)
  Switcher get switcherCondition => $_getN(7);
  @$pb.TagNumber(8)
  set switcherCondition(Switcher v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasSwitcherCondition() => $_has(7);
  @$pb.TagNumber(8)
  void clearSwitcherCondition() => clearField(8);
  @$pb.TagNumber(8)
  Switcher ensureSwitcherCondition() => $_ensure(7);

  @$pb.TagNumber(9)
  PowerState get powerState => $_getN(8);
  @$pb.TagNumber(9)
  set powerState(PowerState v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasPowerState() => $_has(8);
  @$pb.TagNumber(9)
  void clearPowerState() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<SceneSwitcherAction> get sceneSwitcherActions => $_getList(9);

  @$pb.TagNumber(11)
  $core.List<SceneCurtainSwitcherAction> get curtainSwitcherActions => $_getList(10);

  @$pb.TagNumber(12)
  $core.List<SceneAirConditionerAction> get airConditionerActions => $_getList(11);

  @$pb.TagNumber(13)
  $core.List<SceneRemoteAction> get sceneRemoteActions => $_getList(12);

  @$pb.TagNumber(14)
  $core.List<SceneMotionAction> get sceneMotionActions => $_getList(13);

  @$pb.TagNumber(15)
  $core.int get type => $_getIZ(14);
  @$pb.TagNumber(15)
  set type($core.int v) { $_setUnsignedInt32(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasType() => $_has(14);
  @$pb.TagNumber(15)
  void clearType() => clearField(15);

  @$pb.TagNumber(16)
  $core.bool get confirmed => $_getBF(15);
  @$pb.TagNumber(16)
  set confirmed($core.bool v) { $_setBool(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasConfirmed() => $_has(15);
  @$pb.TagNumber(16)
  void clearConfirmed() => clearField(16);

  @$pb.TagNumber(17)
  Motion get motionCondition => $_getN(16);
  @$pb.TagNumber(17)
  set motionCondition(Motion v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasMotionCondition() => $_has(16);
  @$pb.TagNumber(17)
  void clearMotionCondition() => clearField(17);
  @$pb.TagNumber(17)
  Motion ensureMotionCondition() => $_ensure(16);

  @$pb.TagNumber(18)
  ActiveTime get activeTime => $_getN(17);
  @$pb.TagNumber(18)
  set activeTime(ActiveTime v) { setField(18, v); }
  @$pb.TagNumber(18)
  $core.bool hasActiveTime() => $_has(17);
  @$pb.TagNumber(18)
  void clearActiveTime() => clearField(18);
  @$pb.TagNumber(18)
  ActiveTime ensureActiveTime() => $_ensure(17);

  @$pb.TagNumber(19)
  $core.bool get isDisable => $_getBF(18);
  @$pb.TagNumber(19)
  set isDisable($core.bool v) { $_setBool(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasIsDisable() => $_has(18);
  @$pb.TagNumber(19)
  void clearIsDisable() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get actionListIcon => $_getSZ(19);
  @$pb.TagNumber(20)
  set actionListIcon($core.String v) { $_setString(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasActionListIcon() => $_has(19);
  @$pb.TagNumber(20)
  void clearActionListIcon() => clearField(20);

  @$pb.TagNumber(21)
  Schedule get schedule => $_getN(20);
  @$pb.TagNumber(21)
  set schedule(Schedule v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasSchedule() => $_has(20);
  @$pb.TagNumber(21)
  void clearSchedule() => clearField(21);
  @$pb.TagNumber(21)
  Schedule ensureSchedule() => $_ensure(20);

  @$pb.TagNumber(22)
  $core.List<SceneLedDriverAction> get sceneLedDriverActions => $_getList(21);

  @$pb.TagNumber(23)
  Button get buttonCondition => $_getN(22);
  @$pb.TagNumber(23)
  set buttonCondition(Button v) { setField(23, v); }
  @$pb.TagNumber(23)
  $core.bool hasButtonCondition() => $_has(22);
  @$pb.TagNumber(23)
  void clearButtonCondition() => clearField(23);
  @$pb.TagNumber(23)
  Button ensureButtonCondition() => $_ensure(22);

  @$pb.TagNumber(24)
  LedDriver get ledDriverCondition => $_getN(23);
  @$pb.TagNumber(24)
  set ledDriverCondition(LedDriver v) { setField(24, v); }
  @$pb.TagNumber(24)
  $core.bool hasLedDriverCondition() => $_has(23);
  @$pb.TagNumber(24)
  void clearLedDriverCondition() => clearField(24);
  @$pb.TagNumber(24)
  LedDriver ensureLedDriverCondition() => $_ensure(23);

  @$pb.TagNumber(25)
  EnvironmentSensor get environmentSensorsCondition => $_getN(24);
  @$pb.TagNumber(25)
  set environmentSensorsCondition(EnvironmentSensor v) { setField(25, v); }
  @$pb.TagNumber(25)
  $core.bool hasEnvironmentSensorsCondition() => $_has(24);
  @$pb.TagNumber(25)
  void clearEnvironmentSensorsCondition() => clearField(25);
  @$pb.TagNumber(25)
  EnvironmentSensor ensureEnvironmentSensorsCondition() => $_ensure(24);

  @$pb.TagNumber(26)
  $core.List<SceneCurtainAction> get curtainActions => $_getList(25);
}

class SceneSwitcherAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SceneSwitcherAction', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneId', protoName: 'sceneId')
    ..aOM<Switcher>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcher', subBuilder: Switcher.create)
    ..e<PowerState>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: PowerState.Off, valueOf: PowerState.valueOf, enumValues: PowerState.values)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  SceneSwitcherAction._() : super();
  factory SceneSwitcherAction({
    $core.String? id,
    $core.String? sceneId,
    Switcher? switcher,
    PowerState? powerState,
    $core.int? order,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (sceneId != null) {
      _result.sceneId = sceneId;
    }
    if (switcher != null) {
      _result.switcher = switcher;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (order != null) {
      _result.order = order;
    }
    return _result;
  }
  factory SceneSwitcherAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SceneSwitcherAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SceneSwitcherAction clone() => SceneSwitcherAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SceneSwitcherAction copyWith(void Function(SceneSwitcherAction) updates) => super.copyWith((message) => updates(message as SceneSwitcherAction)) as SceneSwitcherAction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SceneSwitcherAction create() => SceneSwitcherAction._();
  SceneSwitcherAction createEmptyInstance() => create();
  static $pb.PbList<SceneSwitcherAction> createRepeated() => $pb.PbList<SceneSwitcherAction>();
  @$core.pragma('dart2js:noInline')
  static SceneSwitcherAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SceneSwitcherAction>(create);
  static SceneSwitcherAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sceneId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sceneId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSceneId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSceneId() => clearField(2);

  @$pb.TagNumber(3)
  Switcher get switcher => $_getN(2);
  @$pb.TagNumber(3)
  set switcher(Switcher v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSwitcher() => $_has(2);
  @$pb.TagNumber(3)
  void clearSwitcher() => clearField(3);
  @$pb.TagNumber(3)
  Switcher ensureSwitcher() => $_ensure(2);

  @$pb.TagNumber(4)
  PowerState get powerState => $_getN(3);
  @$pb.TagNumber(4)
  set powerState(PowerState v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPowerState() => $_has(3);
  @$pb.TagNumber(4)
  void clearPowerState() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get order => $_getIZ(4);
  @$pb.TagNumber(5)
  set order($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOrder() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrder() => clearField(5);
}

class SceneAirConditionerAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SceneAirConditionerAction', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneId', protoName: 'sceneId')
    ..aOM<Remote>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remote', subBuilder: Remote.create)
    ..e<PowerState>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: PowerState.Off, valueOf: PowerState.valueOf, enumValues: PowerState.values)
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'temperature', $pb.PbFieldType.OF)
    ..e<ModeAc>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mode', $pb.PbFieldType.OE, defaultOrMaker: ModeAc.AutoMode, valueOf: ModeAc.valueOf, enumValues: ModeAc.values)
    ..e<SwingAc>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'swing', $pb.PbFieldType.OE, defaultOrMaker: SwingAc.AutoSwing, valueOf: SwingAc.valueOf, enumValues: SwingAc.values)
    ..e<FanAc>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fan', $pb.PbFieldType.OE, defaultOrMaker: FanAc.AutoFan, valueOf: FanAc.valueOf, enumValues: FanAc.values)
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  SceneAirConditionerAction._() : super();
  factory SceneAirConditionerAction({
    $core.String? id,
    $core.String? sceneId,
    Remote? remote,
    PowerState? powerState,
    $core.double? temperature,
    ModeAc? mode,
    SwingAc? swing,
    FanAc? fan,
    $core.int? order,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (sceneId != null) {
      _result.sceneId = sceneId;
    }
    if (remote != null) {
      _result.remote = remote;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (temperature != null) {
      _result.temperature = temperature;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    if (swing != null) {
      _result.swing = swing;
    }
    if (fan != null) {
      _result.fan = fan;
    }
    if (order != null) {
      _result.order = order;
    }
    return _result;
  }
  factory SceneAirConditionerAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SceneAirConditionerAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SceneAirConditionerAction clone() => SceneAirConditionerAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SceneAirConditionerAction copyWith(void Function(SceneAirConditionerAction) updates) => super.copyWith((message) => updates(message as SceneAirConditionerAction)) as SceneAirConditionerAction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SceneAirConditionerAction create() => SceneAirConditionerAction._();
  SceneAirConditionerAction createEmptyInstance() => create();
  static $pb.PbList<SceneAirConditionerAction> createRepeated() => $pb.PbList<SceneAirConditionerAction>();
  @$core.pragma('dart2js:noInline')
  static SceneAirConditionerAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SceneAirConditionerAction>(create);
  static SceneAirConditionerAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sceneId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sceneId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSceneId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSceneId() => clearField(2);

  @$pb.TagNumber(3)
  Remote get remote => $_getN(2);
  @$pb.TagNumber(3)
  set remote(Remote v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRemote() => $_has(2);
  @$pb.TagNumber(3)
  void clearRemote() => clearField(3);
  @$pb.TagNumber(3)
  Remote ensureRemote() => $_ensure(2);

  @$pb.TagNumber(4)
  PowerState get powerState => $_getN(3);
  @$pb.TagNumber(4)
  set powerState(PowerState v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPowerState() => $_has(3);
  @$pb.TagNumber(4)
  void clearPowerState() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get temperature => $_getN(4);
  @$pb.TagNumber(5)
  set temperature($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTemperature() => $_has(4);
  @$pb.TagNumber(5)
  void clearTemperature() => clearField(5);

  @$pb.TagNumber(6)
  ModeAc get mode => $_getN(5);
  @$pb.TagNumber(6)
  set mode(ModeAc v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasMode() => $_has(5);
  @$pb.TagNumber(6)
  void clearMode() => clearField(6);

  @$pb.TagNumber(7)
  SwingAc get swing => $_getN(6);
  @$pb.TagNumber(7)
  set swing(SwingAc v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasSwing() => $_has(6);
  @$pb.TagNumber(7)
  void clearSwing() => clearField(7);

  @$pb.TagNumber(8)
  FanAc get fan => $_getN(7);
  @$pb.TagNumber(8)
  set fan(FanAc v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasFan() => $_has(7);
  @$pb.TagNumber(8)
  void clearFan() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get order => $_getIZ(8);
  @$pb.TagNumber(9)
  set order($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasOrder() => $_has(8);
  @$pb.TagNumber(9)
  void clearOrder() => clearField(9);
}

class SceneCurtainSwitcherAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SceneCurtainSwitcherAction', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneId', protoName: 'sceneId')
    ..aOM<CurtainSwitcher>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainSwitcher', protoName: 'curtainSwitcher', subBuilder: CurtainSwitcher.create)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percentIn', $pb.PbFieldType.OU3, protoName: 'percentIn')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percentOut', $pb.PbFieldType.OU3, protoName: 'percentOut')
    ..hasRequiredFields = false
  ;

  SceneCurtainSwitcherAction._() : super();
  factory SceneCurtainSwitcherAction({
    $core.String? id,
    $core.String? sceneId,
    CurtainSwitcher? curtainSwitcher,
    $core.int? percentIn,
    $core.int? percentOut,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (sceneId != null) {
      _result.sceneId = sceneId;
    }
    if (curtainSwitcher != null) {
      _result.curtainSwitcher = curtainSwitcher;
    }
    if (percentIn != null) {
      _result.percentIn = percentIn;
    }
    if (percentOut != null) {
      _result.percentOut = percentOut;
    }
    return _result;
  }
  factory SceneCurtainSwitcherAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SceneCurtainSwitcherAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SceneCurtainSwitcherAction clone() => SceneCurtainSwitcherAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SceneCurtainSwitcherAction copyWith(void Function(SceneCurtainSwitcherAction) updates) => super.copyWith((message) => updates(message as SceneCurtainSwitcherAction)) as SceneCurtainSwitcherAction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SceneCurtainSwitcherAction create() => SceneCurtainSwitcherAction._();
  SceneCurtainSwitcherAction createEmptyInstance() => create();
  static $pb.PbList<SceneCurtainSwitcherAction> createRepeated() => $pb.PbList<SceneCurtainSwitcherAction>();
  @$core.pragma('dart2js:noInline')
  static SceneCurtainSwitcherAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SceneCurtainSwitcherAction>(create);
  static SceneCurtainSwitcherAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sceneId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sceneId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSceneId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSceneId() => clearField(2);

  @$pb.TagNumber(3)
  CurtainSwitcher get curtainSwitcher => $_getN(2);
  @$pb.TagNumber(3)
  set curtainSwitcher(CurtainSwitcher v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCurtainSwitcher() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurtainSwitcher() => clearField(3);
  @$pb.TagNumber(3)
  CurtainSwitcher ensureCurtainSwitcher() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get percentIn => $_getIZ(3);
  @$pb.TagNumber(4)
  set percentIn($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPercentIn() => $_has(3);
  @$pb.TagNumber(4)
  void clearPercentIn() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get percentOut => $_getIZ(4);
  @$pb.TagNumber(5)
  set percentOut($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPercentOut() => $_has(4);
  @$pb.TagNumber(5)
  void clearPercentOut() => clearField(5);
}

class SceneCurtainAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SceneCurtainAction', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneId', protoName: 'sceneId')
    ..aOM<Curtain>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtain', subBuilder: Curtain.create)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percent', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  SceneCurtainAction._() : super();
  factory SceneCurtainAction({
    $core.String? id,
    $core.String? sceneId,
    Curtain? curtain,
    $core.int? percent,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (sceneId != null) {
      _result.sceneId = sceneId;
    }
    if (curtain != null) {
      _result.curtain = curtain;
    }
    if (percent != null) {
      _result.percent = percent;
    }
    return _result;
  }
  factory SceneCurtainAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SceneCurtainAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SceneCurtainAction clone() => SceneCurtainAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SceneCurtainAction copyWith(void Function(SceneCurtainAction) updates) => super.copyWith((message) => updates(message as SceneCurtainAction)) as SceneCurtainAction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SceneCurtainAction create() => SceneCurtainAction._();
  SceneCurtainAction createEmptyInstance() => create();
  static $pb.PbList<SceneCurtainAction> createRepeated() => $pb.PbList<SceneCurtainAction>();
  @$core.pragma('dart2js:noInline')
  static SceneCurtainAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SceneCurtainAction>(create);
  static SceneCurtainAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sceneId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sceneId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSceneId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSceneId() => clearField(2);

  @$pb.TagNumber(3)
  Curtain get curtain => $_getN(2);
  @$pb.TagNumber(3)
  set curtain(Curtain v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCurtain() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurtain() => clearField(3);
  @$pb.TagNumber(3)
  Curtain ensureCurtain() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get percent => $_getIZ(3);
  @$pb.TagNumber(4)
  set percent($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPercent() => $_has(3);
  @$pb.TagNumber(4)
  void clearPercent() => clearField(4);
}

class SceneRemoteAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SceneRemoteAction', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneId', protoName: 'sceneId')
    ..aOM<Remote>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'remote', subBuilder: Remote.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'RemoteLibraryCmdId', protoName: 'RemoteLibraryCmdId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'RemoteMultiLibraryCmdId', protoName: 'RemoteMultiLibraryCmdId')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'delay', $pb.PbFieldType.OU3)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order', $pb.PbFieldType.OU3)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  SceneRemoteAction._() : super();
  factory SceneRemoteAction({
    $core.String? id,
    $core.String? sceneId,
    Remote? remote,
    $core.String? remoteLibraryCmdId,
    $core.String? remoteMultiLibraryCmdId,
    $core.int? delay,
    $core.int? order,
    $core.String? name,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (sceneId != null) {
      _result.sceneId = sceneId;
    }
    if (remote != null) {
      _result.remote = remote;
    }
    if (remoteLibraryCmdId != null) {
      _result.remoteLibraryCmdId = remoteLibraryCmdId;
    }
    if (remoteMultiLibraryCmdId != null) {
      _result.remoteMultiLibraryCmdId = remoteMultiLibraryCmdId;
    }
    if (delay != null) {
      _result.delay = delay;
    }
    if (order != null) {
      _result.order = order;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory SceneRemoteAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SceneRemoteAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SceneRemoteAction clone() => SceneRemoteAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SceneRemoteAction copyWith(void Function(SceneRemoteAction) updates) => super.copyWith((message) => updates(message as SceneRemoteAction)) as SceneRemoteAction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SceneRemoteAction create() => SceneRemoteAction._();
  SceneRemoteAction createEmptyInstance() => create();
  static $pb.PbList<SceneRemoteAction> createRepeated() => $pb.PbList<SceneRemoteAction>();
  @$core.pragma('dart2js:noInline')
  static SceneRemoteAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SceneRemoteAction>(create);
  static SceneRemoteAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sceneId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sceneId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSceneId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSceneId() => clearField(2);

  @$pb.TagNumber(3)
  Remote get remote => $_getN(2);
  @$pb.TagNumber(3)
  set remote(Remote v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRemote() => $_has(2);
  @$pb.TagNumber(3)
  void clearRemote() => clearField(3);
  @$pb.TagNumber(3)
  Remote ensureRemote() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get remoteLibraryCmdId => $_getSZ(3);
  @$pb.TagNumber(4)
  set remoteLibraryCmdId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRemoteLibraryCmdId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRemoteLibraryCmdId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get remoteMultiLibraryCmdId => $_getSZ(4);
  @$pb.TagNumber(5)
  set remoteMultiLibraryCmdId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRemoteMultiLibraryCmdId() => $_has(4);
  @$pb.TagNumber(5)
  void clearRemoteMultiLibraryCmdId() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get delay => $_getIZ(5);
  @$pb.TagNumber(6)
  set delay($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDelay() => $_has(5);
  @$pb.TagNumber(6)
  void clearDelay() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get order => $_getIZ(6);
  @$pb.TagNumber(7)
  set order($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOrder() => $_has(6);
  @$pb.TagNumber(7)
  void clearOrder() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get name => $_getSZ(7);
  @$pb.TagNumber(8)
  set name($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasName() => $_has(7);
  @$pb.TagNumber(8)
  void clearName() => clearField(8);
}

class SceneMotionAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SceneMotionAction', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneId', protoName: 'sceneId')
    ..aOM<Motion>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'motion', subBuilder: Motion.create)
    ..e<MotionState>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: MotionState.MotionNone, valueOf: MotionState.valueOf, enumValues: MotionState.values)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  SceneMotionAction._() : super();
  factory SceneMotionAction({
    $core.String? id,
    $core.String? sceneId,
    Motion? motion,
    MotionState? state,
    $core.int? order,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (sceneId != null) {
      _result.sceneId = sceneId;
    }
    if (motion != null) {
      _result.motion = motion;
    }
    if (state != null) {
      _result.state = state;
    }
    if (order != null) {
      _result.order = order;
    }
    return _result;
  }
  factory SceneMotionAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SceneMotionAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SceneMotionAction clone() => SceneMotionAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SceneMotionAction copyWith(void Function(SceneMotionAction) updates) => super.copyWith((message) => updates(message as SceneMotionAction)) as SceneMotionAction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SceneMotionAction create() => SceneMotionAction._();
  SceneMotionAction createEmptyInstance() => create();
  static $pb.PbList<SceneMotionAction> createRepeated() => $pb.PbList<SceneMotionAction>();
  @$core.pragma('dart2js:noInline')
  static SceneMotionAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SceneMotionAction>(create);
  static SceneMotionAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sceneId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sceneId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSceneId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSceneId() => clearField(2);

  @$pb.TagNumber(3)
  Motion get motion => $_getN(2);
  @$pb.TagNumber(3)
  set motion(Motion v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasMotion() => $_has(2);
  @$pb.TagNumber(3)
  void clearMotion() => clearField(3);
  @$pb.TagNumber(3)
  Motion ensureMotion() => $_ensure(2);

  @$pb.TagNumber(4)
  MotionState get state => $_getN(3);
  @$pb.TagNumber(4)
  set state(MotionState v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasState() => $_has(3);
  @$pb.TagNumber(4)
  void clearState() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get order => $_getIZ(4);
  @$pb.TagNumber(5)
  set order($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOrder() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrder() => clearField(5);
}

class SceneLedDriverAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SceneLedDriverAction', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneId', protoName: 'sceneId')
    ..aOM<LedDriver>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ledDriver', protoName: 'ledDriver', subBuilder: LedDriver.create)
    ..e<PowerState>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: PowerState.Off, valueOf: PowerState.valueOf, enumValues: PowerState.values)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'brightnessPercent', $pb.PbFieldType.O3, protoName: 'brightnessPercent')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  SceneLedDriverAction._() : super();
  factory SceneLedDriverAction({
    $core.String? id,
    $core.String? sceneId,
    LedDriver? ledDriver,
    PowerState? powerState,
    $core.int? brightnessPercent,
    $core.String? icon,
    $core.int? order,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (sceneId != null) {
      _result.sceneId = sceneId;
    }
    if (ledDriver != null) {
      _result.ledDriver = ledDriver;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (brightnessPercent != null) {
      _result.brightnessPercent = brightnessPercent;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (order != null) {
      _result.order = order;
    }
    return _result;
  }
  factory SceneLedDriverAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SceneLedDriverAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SceneLedDriverAction clone() => SceneLedDriverAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SceneLedDriverAction copyWith(void Function(SceneLedDriverAction) updates) => super.copyWith((message) => updates(message as SceneLedDriverAction)) as SceneLedDriverAction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SceneLedDriverAction create() => SceneLedDriverAction._();
  SceneLedDriverAction createEmptyInstance() => create();
  static $pb.PbList<SceneLedDriverAction> createRepeated() => $pb.PbList<SceneLedDriverAction>();
  @$core.pragma('dart2js:noInline')
  static SceneLedDriverAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SceneLedDriverAction>(create);
  static SceneLedDriverAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sceneId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sceneId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSceneId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSceneId() => clearField(2);

  @$pb.TagNumber(3)
  LedDriver get ledDriver => $_getN(2);
  @$pb.TagNumber(3)
  set ledDriver(LedDriver v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasLedDriver() => $_has(2);
  @$pb.TagNumber(3)
  void clearLedDriver() => clearField(3);
  @$pb.TagNumber(3)
  LedDriver ensureLedDriver() => $_ensure(2);

  @$pb.TagNumber(4)
  PowerState get powerState => $_getN(3);
  @$pb.TagNumber(4)
  set powerState(PowerState v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPowerState() => $_has(3);
  @$pb.TagNumber(4)
  void clearPowerState() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get brightnessPercent => $_getIZ(4);
  @$pb.TagNumber(5)
  set brightnessPercent($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBrightnessPercent() => $_has(4);
  @$pb.TagNumber(5)
  void clearBrightnessPercent() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get icon => $_getSZ(5);
  @$pb.TagNumber(6)
  set icon($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearIcon() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get order => $_getIZ(6);
  @$pb.TagNumber(7)
  set order($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOrder() => $_has(6);
  @$pb.TagNumber(7)
  void clearOrder() => clearField(7);
}

class SceneButtonAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SceneButtonAction', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sceneId', protoName: 'sceneId')
    ..aOM<Button>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'button', subBuilder: Button.create)
    ..e<ButtonState>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buttonState', $pb.PbFieldType.OE, protoName: 'buttonState', defaultOrMaker: ButtonState.Nothing, valueOf: ButtonState.valueOf, enumValues: ButtonState.values)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  SceneButtonAction._() : super();
  factory SceneButtonAction({
    $core.String? id,
    $core.String? sceneId,
    Button? button,
    ButtonState? buttonState,
    $core.int? order,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (sceneId != null) {
      _result.sceneId = sceneId;
    }
    if (button != null) {
      _result.button = button;
    }
    if (buttonState != null) {
      _result.buttonState = buttonState;
    }
    if (order != null) {
      _result.order = order;
    }
    return _result;
  }
  factory SceneButtonAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SceneButtonAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SceneButtonAction clone() => SceneButtonAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SceneButtonAction copyWith(void Function(SceneButtonAction) updates) => super.copyWith((message) => updates(message as SceneButtonAction)) as SceneButtonAction; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SceneButtonAction create() => SceneButtonAction._();
  SceneButtonAction createEmptyInstance() => create();
  static $pb.PbList<SceneButtonAction> createRepeated() => $pb.PbList<SceneButtonAction>();
  @$core.pragma('dart2js:noInline')
  static SceneButtonAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SceneButtonAction>(create);
  static SceneButtonAction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sceneId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sceneId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSceneId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSceneId() => clearField(2);

  @$pb.TagNumber(3)
  Button get button => $_getN(2);
  @$pb.TagNumber(3)
  set button(Button v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasButton() => $_has(2);
  @$pb.TagNumber(3)
  void clearButton() => clearField(3);
  @$pb.TagNumber(3)
  Button ensureButton() => $_ensure(2);

  @$pb.TagNumber(4)
  ButtonState get buttonState => $_getN(3);
  @$pb.TagNumber(4)
  set buttonState(ButtonState v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasButtonState() => $_has(3);
  @$pb.TagNumber(4)
  void clearButtonState() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get order => $_getIZ(4);
  @$pb.TagNumber(5)
  set order($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOrder() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrder() => clearField(5);
}

class RemoteCommand extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RemoteCommand', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'RemoteLibraryCmdId', protoName: 'RemoteLibraryCmdId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'RemoteMultiLibraryCmdId', protoName: 'RemoteMultiLibraryCmdId')
    ..hasRequiredFields = false
  ;

  RemoteCommand._() : super();
  factory RemoteCommand({
    $core.String? name,
    $core.String? remoteLibraryCmdId,
    $core.String? remoteMultiLibraryCmdId,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (remoteLibraryCmdId != null) {
      _result.remoteLibraryCmdId = remoteLibraryCmdId;
    }
    if (remoteMultiLibraryCmdId != null) {
      _result.remoteMultiLibraryCmdId = remoteMultiLibraryCmdId;
    }
    return _result;
  }
  factory RemoteCommand.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoteCommand.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoteCommand clone() => RemoteCommand()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoteCommand copyWith(void Function(RemoteCommand) updates) => super.copyWith((message) => updates(message as RemoteCommand)) as RemoteCommand; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemoteCommand create() => RemoteCommand._();
  RemoteCommand createEmptyInstance() => create();
  static $pb.PbList<RemoteCommand> createRepeated() => $pb.PbList<RemoteCommand>();
  @$core.pragma('dart2js:noInline')
  static RemoteCommand getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoteCommand>(create);
  static RemoteCommand? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get remoteLibraryCmdId => $_getSZ(1);
  @$pb.TagNumber(2)
  set remoteLibraryCmdId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRemoteLibraryCmdId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemoteLibraryCmdId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get remoteMultiLibraryCmdId => $_getSZ(2);
  @$pb.TagNumber(3)
  set remoteMultiLibraryCmdId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRemoteMultiLibraryCmdId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRemoteMultiLibraryCmdId() => clearField(3);
}

class StatusCode extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StatusCode', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code', $pb.PbFieldType.OU3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  StatusCode._() : super();
  factory StatusCode({
    $core.int? code,
    $core.String? message,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory StatusCode.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StatusCode.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StatusCode clone() => StatusCode()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StatusCode copyWith(void Function(StatusCode) updates) => super.copyWith((message) => updates(message as StatusCode)) as StatusCode; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StatusCode create() => StatusCode._();
  StatusCode createEmptyInstance() => create();
  static $pb.PbList<StatusCode> createRepeated() => $pb.PbList<StatusCode>();
  @$core.pragma('dart2js:noInline')
  static StatusCode getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StatusCode>(create);
  static StatusCode? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class DeviceInScene extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeviceInScene', createEmptyInstance: create)
    ..aOM<Switcher>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'switcher', subBuilder: Switcher.create)
    ..aOM<Motion>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'motion', subBuilder: Motion.create)
    ..aOM<LedDriver>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ledDriver', protoName: 'ledDriver', subBuilder: LedDriver.create)
    ..hasRequiredFields = false
  ;

  DeviceInScene._() : super();
  factory DeviceInScene({
    Switcher? switcher,
    Motion? motion,
    LedDriver? ledDriver,
  }) {
    final _result = create();
    if (switcher != null) {
      _result.switcher = switcher;
    }
    if (motion != null) {
      _result.motion = motion;
    }
    if (ledDriver != null) {
      _result.ledDriver = ledDriver;
    }
    return _result;
  }
  factory DeviceInScene.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeviceInScene.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeviceInScene clone() => DeviceInScene()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeviceInScene copyWith(void Function(DeviceInScene) updates) => super.copyWith((message) => updates(message as DeviceInScene)) as DeviceInScene; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeviceInScene create() => DeviceInScene._();
  DeviceInScene createEmptyInstance() => create();
  static $pb.PbList<DeviceInScene> createRepeated() => $pb.PbList<DeviceInScene>();
  @$core.pragma('dart2js:noInline')
  static DeviceInScene getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeviceInScene>(create);
  static DeviceInScene? _defaultInstance;

  @$pb.TagNumber(1)
  Switcher get switcher => $_getN(0);
  @$pb.TagNumber(1)
  set switcher(Switcher v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSwitcher() => $_has(0);
  @$pb.TagNumber(1)
  void clearSwitcher() => clearField(1);
  @$pb.TagNumber(1)
  Switcher ensureSwitcher() => $_ensure(0);

  @$pb.TagNumber(2)
  Motion get motion => $_getN(1);
  @$pb.TagNumber(2)
  set motion(Motion v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMotion() => $_has(1);
  @$pb.TagNumber(2)
  void clearMotion() => clearField(2);
  @$pb.TagNumber(2)
  Motion ensureMotion() => $_ensure(1);

  @$pb.TagNumber(3)
  LedDriver get ledDriver => $_getN(2);
  @$pb.TagNumber(3)
  set ledDriver(LedDriver v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasLedDriver() => $_has(2);
  @$pb.TagNumber(3)
  void clearLedDriver() => clearField(3);
  @$pb.TagNumber(3)
  LedDriver ensureLedDriver() => $_ensure(2);
}

class CurtainSwitcherState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CurtainSwitcherState', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percentIn', $pb.PbFieldType.OU3, protoName: 'percentIn')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percentOut', $pb.PbFieldType.OU3, protoName: 'percentOut')
    ..hasRequiredFields = false
  ;

  CurtainSwitcherState._() : super();
  factory CurtainSwitcherState({
    $core.int? percentIn,
    $core.int? percentOut,
  }) {
    final _result = create();
    if (percentIn != null) {
      _result.percentIn = percentIn;
    }
    if (percentOut != null) {
      _result.percentOut = percentOut;
    }
    return _result;
  }
  factory CurtainSwitcherState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CurtainSwitcherState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CurtainSwitcherState clone() => CurtainSwitcherState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CurtainSwitcherState copyWith(void Function(CurtainSwitcherState) updates) => super.copyWith((message) => updates(message as CurtainSwitcherState)) as CurtainSwitcherState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CurtainSwitcherState create() => CurtainSwitcherState._();
  CurtainSwitcherState createEmptyInstance() => create();
  static $pb.PbList<CurtainSwitcherState> createRepeated() => $pb.PbList<CurtainSwitcherState>();
  @$core.pragma('dart2js:noInline')
  static CurtainSwitcherState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CurtainSwitcherState>(create);
  static CurtainSwitcherState? _defaultInstance;

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
}

class CurtainState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CurtainState', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percent', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  CurtainState._() : super();
  factory CurtainState({
    $core.int? percent,
  }) {
    final _result = create();
    if (percent != null) {
      _result.percent = percent;
    }
    return _result;
  }
  factory CurtainState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CurtainState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CurtainState clone() => CurtainState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CurtainState copyWith(void Function(CurtainState) updates) => super.copyWith((message) => updates(message as CurtainState)) as CurtainState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CurtainState create() => CurtainState._();
  CurtainState createEmptyInstance() => create();
  static $pb.PbList<CurtainState> createRepeated() => $pb.PbList<CurtainState>();
  @$core.pragma('dart2js:noInline')
  static CurtainState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CurtainState>(create);
  static CurtainState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get percent => $_getIZ(0);
  @$pb.TagNumber(1)
  set percent($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPercent() => $_has(0);
  @$pb.TagNumber(1)
  void clearPercent() => clearField(1);
}

enum DeviceTriggerScene_ControlState {
  powerState, 
  motionState, 
  buttonState, 
  brightnessPercent, 
  environmentValue, 
  curtainSwitcherState, 
  airConditionerState, 
  curtainState, 
  notSet
}

class DeviceTriggerScene extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, DeviceTriggerScene_ControlState> _DeviceTriggerScene_ControlStateByTag = {
    4 : DeviceTriggerScene_ControlState.powerState,
    5 : DeviceTriggerScene_ControlState.motionState,
    6 : DeviceTriggerScene_ControlState.buttonState,
    7 : DeviceTriggerScene_ControlState.brightnessPercent,
    8 : DeviceTriggerScene_ControlState.environmentValue,
    9 : DeviceTriggerScene_ControlState.curtainSwitcherState,
    10 : DeviceTriggerScene_ControlState.airConditionerState,
    11 : DeviceTriggerScene_ControlState.curtainState,
    0 : DeviceTriggerScene_ControlState.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeviceTriggerScene', createEmptyInstance: create)
    ..oo(0, [4, 5, 6, 7, 8, 9, 10, 11])
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hardwareId', protoName: 'hardwareId')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceIndex', $pb.PbFieldType.OU3, protoName: 'deviceIndex')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupControl', $pb.PbFieldType.OU3, protoName: 'groupControl')
    ..e<PowerState>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'powerState', $pb.PbFieldType.OE, protoName: 'powerState', defaultOrMaker: PowerState.Off, valueOf: PowerState.valueOf, enumValues: PowerState.values)
    ..e<MotionState>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'motionState', $pb.PbFieldType.OE, protoName: 'motionState', defaultOrMaker: MotionState.MotionNone, valueOf: MotionState.valueOf, enumValues: MotionState.values)
    ..e<ButtonState>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buttonState', $pb.PbFieldType.OE, protoName: 'buttonState', defaultOrMaker: ButtonState.Nothing, valueOf: ButtonState.valueOf, enumValues: ButtonState.values)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'brightnessPercent', $pb.PbFieldType.O3, protoName: 'brightnessPercent')
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'environmentValue', $pb.PbFieldType.OF, protoName: 'environmentValue')
    ..aOM<CurtainSwitcherState>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainSwitcherState', protoName: 'curtainSwitcherState', subBuilder: CurtainSwitcherState.create)
    ..aOM<AirConditionerState>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'airConditionerState', protoName: 'airConditionerState', subBuilder: AirConditionerState.create)
    ..aOM<CurtainState>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'curtainState', protoName: 'curtainState', subBuilder: CurtainState.create)
    ..hasRequiredFields = false
  ;

  DeviceTriggerScene._() : super();
  factory DeviceTriggerScene({
    $core.String? hardwareId,
    $core.int? deviceIndex,
    $core.int? groupControl,
    PowerState? powerState,
    MotionState? motionState,
    ButtonState? buttonState,
    $core.int? brightnessPercent,
    $core.double? environmentValue,
    CurtainSwitcherState? curtainSwitcherState,
    AirConditionerState? airConditionerState,
    CurtainState? curtainState,
  }) {
    final _result = create();
    if (hardwareId != null) {
      _result.hardwareId = hardwareId;
    }
    if (deviceIndex != null) {
      _result.deviceIndex = deviceIndex;
    }
    if (groupControl != null) {
      _result.groupControl = groupControl;
    }
    if (powerState != null) {
      _result.powerState = powerState;
    }
    if (motionState != null) {
      _result.motionState = motionState;
    }
    if (buttonState != null) {
      _result.buttonState = buttonState;
    }
    if (brightnessPercent != null) {
      _result.brightnessPercent = brightnessPercent;
    }
    if (environmentValue != null) {
      _result.environmentValue = environmentValue;
    }
    if (curtainSwitcherState != null) {
      _result.curtainSwitcherState = curtainSwitcherState;
    }
    if (airConditionerState != null) {
      _result.airConditionerState = airConditionerState;
    }
    if (curtainState != null) {
      _result.curtainState = curtainState;
    }
    return _result;
  }
  factory DeviceTriggerScene.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeviceTriggerScene.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeviceTriggerScene clone() => DeviceTriggerScene()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeviceTriggerScene copyWith(void Function(DeviceTriggerScene) updates) => super.copyWith((message) => updates(message as DeviceTriggerScene)) as DeviceTriggerScene; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeviceTriggerScene create() => DeviceTriggerScene._();
  DeviceTriggerScene createEmptyInstance() => create();
  static $pb.PbList<DeviceTriggerScene> createRepeated() => $pb.PbList<DeviceTriggerScene>();
  @$core.pragma('dart2js:noInline')
  static DeviceTriggerScene getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeviceTriggerScene>(create);
  static DeviceTriggerScene? _defaultInstance;

  DeviceTriggerScene_ControlState whichControlState() => _DeviceTriggerScene_ControlStateByTag[$_whichOneof(0)]!;
  void clearControlState() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get hardwareId => $_getSZ(0);
  @$pb.TagNumber(1)
  set hardwareId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHardwareId() => $_has(0);
  @$pb.TagNumber(1)
  void clearHardwareId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get deviceIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set deviceIndex($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDeviceIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceIndex() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get groupControl => $_getIZ(2);
  @$pb.TagNumber(3)
  set groupControl($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGroupControl() => $_has(2);
  @$pb.TagNumber(3)
  void clearGroupControl() => clearField(3);

  @$pb.TagNumber(4)
  PowerState get powerState => $_getN(3);
  @$pb.TagNumber(4)
  set powerState(PowerState v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPowerState() => $_has(3);
  @$pb.TagNumber(4)
  void clearPowerState() => clearField(4);

  @$pb.TagNumber(5)
  MotionState get motionState => $_getN(4);
  @$pb.TagNumber(5)
  set motionState(MotionState v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasMotionState() => $_has(4);
  @$pb.TagNumber(5)
  void clearMotionState() => clearField(5);

  @$pb.TagNumber(6)
  ButtonState get buttonState => $_getN(5);
  @$pb.TagNumber(6)
  set buttonState(ButtonState v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasButtonState() => $_has(5);
  @$pb.TagNumber(6)
  void clearButtonState() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get brightnessPercent => $_getIZ(6);
  @$pb.TagNumber(7)
  set brightnessPercent($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasBrightnessPercent() => $_has(6);
  @$pb.TagNumber(7)
  void clearBrightnessPercent() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get environmentValue => $_getN(7);
  @$pb.TagNumber(8)
  set environmentValue($core.double v) { $_setFloat(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasEnvironmentValue() => $_has(7);
  @$pb.TagNumber(8)
  void clearEnvironmentValue() => clearField(8);

  @$pb.TagNumber(9)
  CurtainSwitcherState get curtainSwitcherState => $_getN(8);
  @$pb.TagNumber(9)
  set curtainSwitcherState(CurtainSwitcherState v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasCurtainSwitcherState() => $_has(8);
  @$pb.TagNumber(9)
  void clearCurtainSwitcherState() => clearField(9);
  @$pb.TagNumber(9)
  CurtainSwitcherState ensureCurtainSwitcherState() => $_ensure(8);

  @$pb.TagNumber(10)
  AirConditionerState get airConditionerState => $_getN(9);
  @$pb.TagNumber(10)
  set airConditionerState(AirConditionerState v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasAirConditionerState() => $_has(9);
  @$pb.TagNumber(10)
  void clearAirConditionerState() => clearField(10);
  @$pb.TagNumber(10)
  AirConditionerState ensureAirConditionerState() => $_ensure(9);

  @$pb.TagNumber(11)
  CurtainState get curtainState => $_getN(10);
  @$pb.TagNumber(11)
  set curtainState(CurtainState v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasCurtainState() => $_has(10);
  @$pb.TagNumber(11)
  void clearCurtainState() => clearField(11);
  @$pb.TagNumber(11)
  CurtainState ensureCurtainState() => $_ensure(10);
}

class EnvironmentSensorReport extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EnvironmentSensorReport', createEmptyInstance: create)
    ..e<EnvironmentSensorType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: EnvironmentSensorType.Unknow, valueOf: EnvironmentSensorType.valueOf, enumValues: EnvironmentSensorType.values)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  EnvironmentSensorReport._() : super();
  factory EnvironmentSensorReport({
    EnvironmentSensorType? type,
    $core.double? value,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory EnvironmentSensorReport.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EnvironmentSensorReport.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EnvironmentSensorReport clone() => EnvironmentSensorReport()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EnvironmentSensorReport copyWith(void Function(EnvironmentSensorReport) updates) => super.copyWith((message) => updates(message as EnvironmentSensorReport)) as EnvironmentSensorReport; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EnvironmentSensorReport create() => EnvironmentSensorReport._();
  EnvironmentSensorReport createEmptyInstance() => create();
  static $pb.PbList<EnvironmentSensorReport> createRepeated() => $pb.PbList<EnvironmentSensorReport>();
  @$core.pragma('dart2js:noInline')
  static EnvironmentSensorReport getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EnvironmentSensorReport>(create);
  static EnvironmentSensorReport? _defaultInstance;

  @$pb.TagNumber(1)
  EnvironmentSensorType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(EnvironmentSensorType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class EnvironmentSensor extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EnvironmentSensor', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nameEn', protoName: 'nameEn')
    ..pc<EnvironmentSensorReport>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'report', $pb.PbFieldType.PM, subBuilder: EnvironmentSensorReport.create)
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favorite')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order', $pb.PbFieldType.OU3)
    ..aOM<Device>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'device', subBuilder: Device.create)
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'index', $pb.PbFieldType.OU3)
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'battery', $pb.PbFieldType.OU3)
    ..aOM<Room>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'room', subBuilder: Room.create)
    ..aOB(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'showHome', protoName: 'showHome')
    ..e<MotionSensorType>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: MotionSensorType.MotionSensor, valueOf: MotionSensorType.valueOf, enumValues: MotionSensorType.values)
    ..hasRequiredFields = false
  ;

  EnvironmentSensor._() : super();
  factory EnvironmentSensor({
    $core.String? id,
    $core.String? icon,
    $core.String? name,
    $core.String? nameEn,
    $core.Iterable<EnvironmentSensorReport>? report,
    $core.bool? favorite,
    $core.int? order,
    Device? device,
    $core.int? index,
    $core.int? battery,
    Room? room,
    $core.bool? showHome,
    MotionSensorType? type,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (nameEn != null) {
      _result.nameEn = nameEn;
    }
    if (report != null) {
      _result.report.addAll(report);
    }
    if (favorite != null) {
      _result.favorite = favorite;
    }
    if (order != null) {
      _result.order = order;
    }
    if (device != null) {
      _result.device = device;
    }
    if (index != null) {
      _result.index = index;
    }
    if (battery != null) {
      _result.battery = battery;
    }
    if (room != null) {
      _result.room = room;
    }
    if (showHome != null) {
      _result.showHome = showHome;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory EnvironmentSensor.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EnvironmentSensor.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EnvironmentSensor clone() => EnvironmentSensor()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EnvironmentSensor copyWith(void Function(EnvironmentSensor) updates) => super.copyWith((message) => updates(message as EnvironmentSensor)) as EnvironmentSensor; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EnvironmentSensor create() => EnvironmentSensor._();
  EnvironmentSensor createEmptyInstance() => create();
  static $pb.PbList<EnvironmentSensor> createRepeated() => $pb.PbList<EnvironmentSensor>();
  @$core.pragma('dart2js:noInline')
  static EnvironmentSensor getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EnvironmentSensor>(create);
  static EnvironmentSensor? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get nameEn => $_getSZ(3);
  @$pb.TagNumber(4)
  set nameEn($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNameEn() => $_has(3);
  @$pb.TagNumber(4)
  void clearNameEn() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<EnvironmentSensorReport> get report => $_getList(4);

  @$pb.TagNumber(6)
  $core.bool get favorite => $_getBF(5);
  @$pb.TagNumber(6)
  set favorite($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFavorite() => $_has(5);
  @$pb.TagNumber(6)
  void clearFavorite() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get order => $_getIZ(6);
  @$pb.TagNumber(7)
  set order($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOrder() => $_has(6);
  @$pb.TagNumber(7)
  void clearOrder() => clearField(7);

  @$pb.TagNumber(8)
  Device get device => $_getN(7);
  @$pb.TagNumber(8)
  set device(Device v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasDevice() => $_has(7);
  @$pb.TagNumber(8)
  void clearDevice() => clearField(8);
  @$pb.TagNumber(8)
  Device ensureDevice() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.int get index => $_getIZ(8);
  @$pb.TagNumber(9)
  set index($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIndex() => $_has(8);
  @$pb.TagNumber(9)
  void clearIndex() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get battery => $_getIZ(9);
  @$pb.TagNumber(10)
  set battery($core.int v) { $_setUnsignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasBattery() => $_has(9);
  @$pb.TagNumber(10)
  void clearBattery() => clearField(10);

  @$pb.TagNumber(11)
  Room get room => $_getN(10);
  @$pb.TagNumber(11)
  set room(Room v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasRoom() => $_has(10);
  @$pb.TagNumber(11)
  void clearRoom() => clearField(11);
  @$pb.TagNumber(11)
  Room ensureRoom() => $_ensure(10);

  @$pb.TagNumber(12)
  $core.bool get showHome => $_getBF(11);
  @$pb.TagNumber(12)
  set showHome($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasShowHome() => $_has(11);
  @$pb.TagNumber(12)
  void clearShowHome() => clearField(12);

  @$pb.TagNumber(13)
  MotionSensorType get type => $_getN(12);
  @$pb.TagNumber(13)
  set type(MotionSensorType v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasType() => $_has(12);
  @$pb.TagNumber(13)
  void clearType() => clearField(13);
}

class SmartPlug extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SmartPlug', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'icon')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nameEn', protoName: 'nameEn')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'index', $pb.PbFieldType.OU3)
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'favorite')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'order', $pb.PbFieldType.OU3)
    ..aOM<Device>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'device', subBuilder: Device.create)
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amp', $pb.PbFieldType.OF)
    ..a<$core.double>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'power', $pb.PbFieldType.OF)
    ..a<$core.double>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'volt', $pb.PbFieldType.OF)
    ..aOM<Room>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'room', subBuilder: Room.create)
    ..aOB(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'showHome', protoName: 'showHome')
    ..hasRequiredFields = false
  ;

  SmartPlug._() : super();
  factory SmartPlug({
    $core.String? id,
    $core.String? icon,
    $core.String? name,
    $core.String? nameEn,
    $core.int? index,
    $core.bool? favorite,
    $core.int? order,
    Device? device,
    $core.double? amp,
    $core.double? power,
    $core.double? volt,
    Room? room,
    $core.bool? showHome,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (icon != null) {
      _result.icon = icon;
    }
    if (name != null) {
      _result.name = name;
    }
    if (nameEn != null) {
      _result.nameEn = nameEn;
    }
    if (index != null) {
      _result.index = index;
    }
    if (favorite != null) {
      _result.favorite = favorite;
    }
    if (order != null) {
      _result.order = order;
    }
    if (device != null) {
      _result.device = device;
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
    if (room != null) {
      _result.room = room;
    }
    if (showHome != null) {
      _result.showHome = showHome;
    }
    return _result;
  }
  factory SmartPlug.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SmartPlug.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SmartPlug clone() => SmartPlug()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SmartPlug copyWith(void Function(SmartPlug) updates) => super.copyWith((message) => updates(message as SmartPlug)) as SmartPlug; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SmartPlug create() => SmartPlug._();
  SmartPlug createEmptyInstance() => create();
  static $pb.PbList<SmartPlug> createRepeated() => $pb.PbList<SmartPlug>();
  @$core.pragma('dart2js:noInline')
  static SmartPlug getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SmartPlug>(create);
  static SmartPlug? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get icon => $_getSZ(1);
  @$pb.TagNumber(2)
  set icon($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIcon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIcon() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get nameEn => $_getSZ(3);
  @$pb.TagNumber(4)
  set nameEn($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNameEn() => $_has(3);
  @$pb.TagNumber(4)
  void clearNameEn() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get index => $_getIZ(4);
  @$pb.TagNumber(5)
  set index($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIndex() => $_has(4);
  @$pb.TagNumber(5)
  void clearIndex() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get favorite => $_getBF(5);
  @$pb.TagNumber(6)
  set favorite($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFavorite() => $_has(5);
  @$pb.TagNumber(6)
  void clearFavorite() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get order => $_getIZ(6);
  @$pb.TagNumber(7)
  set order($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOrder() => $_has(6);
  @$pb.TagNumber(7)
  void clearOrder() => clearField(7);

  @$pb.TagNumber(8)
  Device get device => $_getN(7);
  @$pb.TagNumber(8)
  set device(Device v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasDevice() => $_has(7);
  @$pb.TagNumber(8)
  void clearDevice() => clearField(8);
  @$pb.TagNumber(8)
  Device ensureDevice() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.double get amp => $_getN(8);
  @$pb.TagNumber(9)
  set amp($core.double v) { $_setFloat(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasAmp() => $_has(8);
  @$pb.TagNumber(9)
  void clearAmp() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get power => $_getN(9);
  @$pb.TagNumber(10)
  set power($core.double v) { $_setFloat(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasPower() => $_has(9);
  @$pb.TagNumber(10)
  void clearPower() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get volt => $_getN(10);
  @$pb.TagNumber(11)
  set volt($core.double v) { $_setFloat(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasVolt() => $_has(10);
  @$pb.TagNumber(11)
  void clearVolt() => clearField(11);

  @$pb.TagNumber(12)
  Room get room => $_getN(11);
  @$pb.TagNumber(12)
  set room(Room v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasRoom() => $_has(11);
  @$pb.TagNumber(12)
  void clearRoom() => clearField(12);
  @$pb.TagNumber(12)
  Room ensureRoom() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.bool get showHome => $_getBF(12);
  @$pb.TagNumber(13)
  set showHome($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasShowHome() => $_has(12);
  @$pb.TagNumber(13)
  void clearShowHome() => clearField(13);
}

class UserSetting extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserSetting', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'defaultHomeId', protoName: 'defaultHomeId')
    ..hasRequiredFields = false
  ;

  UserSetting._() : super();
  factory UserSetting({
    $core.String? defaultHomeId,
  }) {
    final _result = create();
    if (defaultHomeId != null) {
      _result.defaultHomeId = defaultHomeId;
    }
    return _result;
  }
  factory UserSetting.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserSetting.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserSetting clone() => UserSetting()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserSetting copyWith(void Function(UserSetting) updates) => super.copyWith((message) => updates(message as UserSetting)) as UserSetting; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserSetting create() => UserSetting._();
  UserSetting createEmptyInstance() => create();
  static $pb.PbList<UserSetting> createRepeated() => $pb.PbList<UserSetting>();
  @$core.pragma('dart2js:noInline')
  static UserSetting getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserSetting>(create);
  static UserSetting? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get defaultHomeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set defaultHomeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDefaultHomeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDefaultHomeId() => clearField(1);
}

class FileUploadForm extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FileUploadForm', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'image', $pb.PbFieldType.OY)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sizeInByte', $pb.PbFieldType.OU3, protoName: 'sizeInByte')
    ..hasRequiredFields = false
  ;

  FileUploadForm._() : super();
  factory FileUploadForm({
    $core.String? name,
    $core.List<$core.int>? image,
    $core.int? sizeInByte,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (image != null) {
      _result.image = image;
    }
    if (sizeInByte != null) {
      _result.sizeInByte = sizeInByte;
    }
    return _result;
  }
  factory FileUploadForm.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileUploadForm.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileUploadForm clone() => FileUploadForm()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileUploadForm copyWith(void Function(FileUploadForm) updates) => super.copyWith((message) => updates(message as FileUploadForm)) as FileUploadForm; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FileUploadForm create() => FileUploadForm._();
  FileUploadForm createEmptyInstance() => create();
  static $pb.PbList<FileUploadForm> createRepeated() => $pb.PbList<FileUploadForm>();
  @$core.pragma('dart2js:noInline')
  static FileUploadForm getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileUploadForm>(create);
  static FileUploadForm? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get image => $_getN(1);
  @$pb.TagNumber(2)
  set image($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get sizeInByte => $_getIZ(2);
  @$pb.TagNumber(3)
  set sizeInByte($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSizeInByte() => $_has(2);
  @$pb.TagNumber(3)
  void clearSizeInByte() => clearField(3);
}

