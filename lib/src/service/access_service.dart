import '../api/api.dart';
import '../http.dart';
import '../models/ticket.dart';

Future<Ticket> ticket(String host, int port, Map<String, dynamic> data) async {
  var uri = Uri(scheme: protocol, host: host, port: port, path: ticketUri);
  final response = await dio.post(uri.toString(), data: data);
  Ticket ticket = Ticket.fromJson(response.data['data']);
  setHeader('Cookie',"PVEAuthCookie=${ticket.ticket}");
  return Future(() => ticket);
}
