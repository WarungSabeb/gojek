import 'package:drift/drift.dart';

class Menu extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get restaurantID => integer()();
  IntColumn get productID => integer()();
}
