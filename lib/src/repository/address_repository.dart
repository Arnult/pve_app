import 'package:hive/hive.dart';

import '../models/address.dart';

class AddressRepository {
  static const String t = 'address';
  static const String index = 'address_index';

  Future<void> saveAddress(Address address) {
    return Hive.box(t).put(index, address);
  }

  Address? getAddress() {
    return Hive.box(t).get(index);
  }

  Future<void> deleteAddress() {
    return Hive.box(t).delete(index);
  }
}
