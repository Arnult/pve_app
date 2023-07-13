// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Version _$VersionFromJson(Map<String, dynamic> json) => Version(
      release: json['release'] as String,
      repoid: json['repoid'] as String,
      version: json['version'] as String,
    );

Map<String, dynamic> _$VersionToJson(Version instance) => <String, dynamic>{
      'release': instance.release,
      'repoid': instance.repoid,
      'version': instance.version,
    };
