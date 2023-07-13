import 'package:pve_app/src/log.dart';
import 'package:pve_app/src/service/version_service.dart';
import 'package:test/test.dart';


import '../models/ticket.dart';
import 'access_service.dart';

void main() {
  test('ticket', () async {
    var req = const TicketRequest(username: "root@pam", password: "123456");
    var data = req.toJson();
    try {
      await ticket('192.168.31.195', 8006, data);
      var v = await version('192.168.31.195', 8006);
      logger.i(v.toJson());
    } catch (e) {
      logger.e(e);
    }
  });
}