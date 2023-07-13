import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket.g.dart';

@JsonSerializable()
class TicketRequest {
  final String username;
  final String password;

  const TicketRequest({
    required this.username,
    required this.password,
  });

  factory TicketRequest.fromJson(Map<String, dynamic> json) =>
      _$TicketRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TicketRequestToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 0)
class Ticket {
  const Ticket(
      {required this.ticket,
      required this.csrfPreventionToken,
      required this.username,
      required this.cap});

  @HiveField(0)
  final String? ticket;
  @JsonKey(name: 'CSRFPreventionToken')
  @HiveField(1)
  final String? csrfPreventionToken;
  @HiveField(2)
  final String? username;
  @HiveField(3)
  final Map<String, dynamic>? cap;

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  Map<String, dynamic> toJson() => _$TicketToJson(this);

  static const empty =
      Ticket(ticket: "", csrfPreventionToken: "", username: "", cap: null);
}
