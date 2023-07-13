import 'package:hive_flutter/hive_flutter.dart';

import '../models/models.dart';

class Repository {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TicketAdapter());
    Hive.registerAdapter(AddressAdapter());
    await Hive.openBox('ticket');
    await Hive.openBox('address');
  }
}
