import 'package:drift/drift.dart';

class Order extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get driverID => integer()();
  IntColumn get userID => integer()();
  IntColumn get restaurantID => integer()();
  TextColumn get deliveryAddress => text().withLength(max: 100)();
  TextColumn get restaurantAddress => text().withLength(max: 100)();
  IntColumn get price => integer()();
  TextColumn get restaurant => text().withLength(max: 100)();
  TextColumn get restaurantIMG => text().withLength(max: 100)();
  TextColumn get orderedItem => text().withLength(max: 100)();
  DateTimeColumn get orderTime => dateTime()();
}
