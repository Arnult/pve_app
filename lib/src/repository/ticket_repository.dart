import 'package:hive/hive.dart';

import '../models/models.dart';

class TicketRepository {
  static const String t = 'ticket';
  static const String index = 'ticket_index';

  Future<void> saveTicket(Ticket ticket) {
    return Hive.box(t).put(index, ticket);
  }

  Ticket? getTicket() {
    return Hive.box(t).get(index);
  }

  Future<void> deleteTicket() {
    return Hive.box(t).delete(index);
  }
}
