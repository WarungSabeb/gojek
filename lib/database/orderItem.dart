import 'package:drift/drift.dart';

class OrderItem extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get productID => integer()();
  IntColumn get orderID => integer()();
  IntColumn get quantity => integer()();
}
