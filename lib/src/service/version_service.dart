import 'package:pve_app/src/api/api.dart';
import 'package:pve_app/src/models/version.dart';

import '../http.dart';

Future<Version> version(String host, int port) async {
  var uri = Uri(scheme: protocol, host: host, port: port, path: versionUri);
  final response = await dio.get(uri.toString());
  Version version = Version.fromJson(response.data['data']);
  return Future(() => version);
}
