import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  final String foodName;
  final String foodPrice;
  final int quantity;

  CheckoutPage({
    required this.foodName,
    required this.foodPrice,
    required this.quantity, 
  });

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  double totalPrice = 0.0;
  TextEditingController noteController = TextEditingController();
  String paymentMethod = 'Cash';

  @override
  void initState() {
    super.initState();
    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    double price = double.parse(widget.foodPrice);
    totalPrice = price * widget.quantity;
  }

  void showPaymentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Method'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile(
                title: Text('Cash'),
                value: 'Cash',
                groupValue: paymentMethod,
                onChanged: (value) {
                  setState(() {
                    paymentMethod = value.toString();
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: Text('Credit Card'),
                value: 'Credit Card',
                groupValue: paymentMethod,
                onChanged: (value) {
                  setState(() {
                    paymentMethod = value.toString();
                  });
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: Text('Bank Transfer'),
                value: 'Bank Transfer',
                groupValue: paymentMethod,
                onChanged: (value) {
                  setState(() {
                    paymentMethod = value.toString();
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
              title: Text(widget.foodName),
              subtitle: Text('Price: Rp. ${widget.foodPrice}'),
              trailing: Text('Qty: ${widget.quantity}'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: noteController,
              decoration: InputDecoration(
                labelText: 'Note',
                border: OutlineInputBorder(),
              ),
            ),

            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp. $totalPrice',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                showPaymentDialog(context);
              },
              child: Text('Select Payment Method'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Payment Method: $paymentMethod',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // ignore: unused_local_variable
                String note = noteController.text;
                // Logic for placing the order with the selected payment method and note
              },
              child: Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
