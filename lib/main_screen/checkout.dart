import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  final String foodName;
  final String foodPrice;
  final int quantity;

  CheckoutPage({
    required this.foodName,
    required this.foodPrice,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    int totalPrice = int.tryParse(foodPrice) ?? 0;
    int itemQuantity = quantity ;
    int subtotal = totalPrice * itemQuantity;

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Order Summary',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text(foodName),
              subtitle: Text('Price: \$${totalPrice * itemQuantity}'),
              trailing: Text('Qty: $itemQuantity'),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${subtotal}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Logic for placing the order
              },
              child: Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
