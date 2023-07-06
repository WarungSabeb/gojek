import 'package:drift/drift.dart';

class User extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 100)();
  TextColumn get address => text().withLength(max: 100)();
  TextColumn get email => text().withLength(max: 100)();
  TextColumn get phone => text().withLength(max: 100)();
}
