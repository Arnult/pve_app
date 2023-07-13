// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TicketAdapter extends TypeAdapter<Ticket> {
  @override
  final int typeId = 0;

  @override
  Ticket read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ticket(
      ticket: fields[0] as String?,
      csrfPreventionToken: fields[1] as String?,
      username: fields[2] as String?,
      cap: (fields[3] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Ticket obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.ticket)
      ..writeByte(1)
      ..write(obj.csrfPreventionToken)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.cap);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TicketAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketRequest _$TicketRequestFromJson(Map<String, dynamic> json) =>
    TicketRequest(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$TicketRequestToJson(TicketRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket(
      ticket: json['ticket'] as String?,
      csrfPreventionToken: json['CSRFPreventionToken'] as String?,
      username: json['username'] as String?,
      cap: json['cap'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'ticket': instance.ticket,
      'CSRFPreventionToken': instance.csrfPreventionToken,
      'username': instance.username,
      'cap': instance.cap,
    };
