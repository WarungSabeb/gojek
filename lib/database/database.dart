import 'dart:io';

import 'package:drift/drift.dart';
// These imports are used to open the database
import 'package:drift/native.dart';
import 'package:gojek/database/driver.dart';
import 'package:gojek/database/menu.dart';
import 'package:gojek/database/order.dart';
import 'package:gojek/database/ordered.dart';
import 'package:gojek/database/orderItem.dart';
import 'package:gojek/database/product.dart';
import 'package:gojek/database/restaurant.dart';
import 'package:gojek/database/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DriftDatabase(
  // relative import for the drift file. Drift also supports `package:`
  // imports
  tables: [Driver, Menu, Order, OrderItem, Product, Restaurant, User],
)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  

  @override
  int get schemaVersion => 1;

  Future<List> get allOrderEntries => select(order).get();

Future<List<OrderData>> getAllOrders() {
    final orderQuery = select(order);
    return orderQuery.get();
  }
Future<void> deleteAllOrders() async {
  await delete(order).go();
}



}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}