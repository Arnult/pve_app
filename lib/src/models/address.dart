import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

enum AddressValidationError { empty }

@JsonSerializable()
@HiveType(typeId: 1)
class Address {
  @HiveField(0)
  final String? host;

  @HiveField(1)
  final int? port;

  Address({required this.host, required this.port});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
