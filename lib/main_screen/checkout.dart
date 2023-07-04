import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  final String foodName;
  final String foodPrice;
  int quantity;
  final String restoName;
  final String foodImage;

  CheckoutPage({
    required this.foodName,
    required this.foodPrice,
    required this.quantity, 
    required this.restoName, 
    required this.foodImage, 
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
    int quantity = widget.quantity;
    int dfee = 10000;
    int sfee = 5000;
    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(children: [
          Container(
            width: 280,
            child: Text(widget.restoName, style: TextStyle(color: Colors.black),),
          ),

          CircleAvatar(
          radius: 10,
          backgroundColor: Colors.orange,
          child: Icon(Icons.thumb_up, color: Colors.white,size: 16,),
          )

        ],)
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Delivery location',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: 200,

                              child: Text('Golf Lake Residence Cluster Victoria Hills 2',
                              overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 35,),
                        Column(
                          children: [
                            SizedBox(height: 12,),
                            TextButton(
                          onPressed: () {}, 
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Color.fromARGB(255, 60, 140, 63))
                              )
                            )
                          ),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Text('Change location', style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 60, 140, 63)),),
                            )
                          ),
                          ],
                        )
                    ],
                    ),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {}, 
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.grey)
                              )
                            )
                          ),
                          child: Container(
                            margin: EdgeInsets.only(left: 0, right: 5),
                            child: Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.black, size: 18,),
                                Text('  Add address details', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                              ],
                            )
                            )
                          ),
                          SizedBox(width: 15,),
                          TextButton(
                          onPressed: () {}, 
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.grey)
                              )
                            )
                          ),
                          child: Container(
                            margin: EdgeInsets.only(left: 0, right: 5),
                            child: Row(
                              children: [
                                Icon(Icons.description, color: Colors.black, size: 18,),
                                Text('  Notes', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                              ],
                            )
                            )
                          ),
                      ],
                    )

                  ],
                ),
              ),
            ),

            SizedBox(height: 15,),

            Container(
              color: Colors.white,
              child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.foodName, style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text(widget.foodPrice),
                          SizedBox(height: 40,),
                          TextButton(
                          onPressed: () {}, 
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.grey)
                              )
                            )
                          ),
                          child: Container(
                            margin: EdgeInsets.only(left: 0, right: 5),
                            child: Row(
                              children: [
                                Icon(Icons.description, color: Colors.black, size: 18,),
                                Text('  Notes', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                              ],
                            )
                            )
                          ),

                        ],
                      ),

                      Container(
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                widget.foodImage,
                                fit: BoxFit.cover,
                              ),

                            ),
                            ),
                            SizedBox(height: 5,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 30,
                                  child: IconButton(
                                    splashRadius: 30,
                                    // color: Colors.red,
                                    onPressed: () {quantity -= 1;},
                                    icon: Icon(Icons.remove_circle_outline),
                                  ),
                                ),
                                SizedBox(width: 15,),
                                Text(
                                  '$quantity',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(width: 5,),
                                Container(
                                  width: 30,
                                  child: IconButton(
                                    splashRadius: 30,
                                  onPressed: () {quantity += 1;},
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    // color: Colors.red,
                                  ),
                                ),
                                )
                              ],
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(color: Colors.black, thickness: 0,),
                  SizedBox(height: 5,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Need Anything else?', style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Text('Add other dishes, if you want.')
                        ],
                      ),
                      SizedBox(width: 97,),
                      TextButton(
                          onPressed: () {}, 
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Color.fromARGB(255, 60, 140, 63))
                              )
                            )
                          ),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Text('Add more', style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 60, 140, 63)),),
                            )
                          ),
                    ],
                  ),
                  Divider(color: Colors.black,),
                ],
              ),
            ),
            ),
            SizedBox(height: 20,),

            Container(
              width:MediaQuery.of(context).size.width, 
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Text('Payment summary', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Price' , style: TextStyle(fontSize: 15)),
                        Text(widget.foodPrice, style: TextStyle(fontSize: 15))
                      ],
                    ),

                    SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Delivery fee', style: TextStyle(fontSize: 15)),
                        Text('10.000', style: TextStyle(fontSize: 15))
                      ],
                    ),

                    SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Service and other fees', style: TextStyle(fontSize: 15)),
                        Text('5.000', style: TextStyle(fontSize: 15))
                      ],
                    ),

                    SizedBox(height: 10,),

                    Divider(color: Colors.black,),

                    SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total payment', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        Text('45.000', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                      ],
                    ),

                    SizedBox(height: 15,),



                  ],
                ),
              )
            )
          ],
        ),
      ),





      // body: Padding(
      //   padding: EdgeInsets.all(16.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [
      //       Text(
      //         'Order Summary',
      //         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      //       ),
      //       SizedBox(height: 16.0),
      //       ListTile(
      //         leading: Icon(Icons.shopping_cart),
      //         title: Text(widget.foodName),
      //         subtitle: Text('Price: Rp. ${widget.foodPrice}'),
      //         trailing: Text('Qty: ${widget.quantity}'),
      //       ),
      //       SizedBox(height: 16.0),
      //       TextField(
      //         controller: noteController,
      //         decoration: InputDecoration(
      //           labelText: 'Note',
      //           border: OutlineInputBorder(),
      //         ),
      //       ),

      //       Divider(),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             'Total:',
      //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //           ),
      //           Text(
      //             'Rp. $totalPrice',
      //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //           ),
      //         ],
      //       ),
            
      //       SizedBox(height: 16.0),
      //       ElevatedButton(
      //         onPressed: () {
      //           showPaymentDialog(context);
      //         },
      //         child: Text('Select Payment Method'),
      //       ),
      //       SizedBox(height: 16.0),
      //       Text(
      //         'Payment Method: $paymentMethod',
      //         style: TextStyle(fontSize: 14),
      //       ),
      //       SizedBox(height: 16.0),
      //       ElevatedButton(
      //         onPressed: () {
      //           // ignore: unused_local_variable
      //           String note = noteController.text;
      //           // Logic for placing the order with the selected payment method and note
      //         },
      //         child: Text('Place Order'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
