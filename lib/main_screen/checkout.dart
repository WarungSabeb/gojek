import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final oCcy = NumberFormat("#,##0", "en_US");

class CheckoutPage extends StatefulWidget {
  final String foodName;
  final int foodPrice;
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
  int totalPrice = 0;
  int dfee = 10000;
  int sfee = 5000;
  TextEditingController noteController = TextEditingController();
  String paymentMethod = 'Cash';

  @override
  void initState() {
    super.initState();
    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    int price = widget.foodPrice;
    totalPrice = price * widget.quantity;
  }

  void _incrementQuantity() {
  setState(() {
    widget.quantity++;
    totalPrice = widget.foodPrice * widget.quantity;
  });
}

void _decrementQuantity() {
  setState(() {
    if (widget.quantity > 0) {
      widget.quantity--;
      totalPrice = widget.foodPrice * widget.quantity;
    }
  });
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

  Widget cartOrder(String name, int price, String image, int quantity) {
    return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(name, style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 10,),
                              Text('Rp ${oCcy.format(price)}'),
                              
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
                                    image,
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
                                        onPressed: _decrementQuantity,
                                        icon: Icon(Icons.remove_circle_outline),
                                      ),
                                    ),
                                    SizedBox(width: 15,),
                                    Text(
                                      quantity.toString(),
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(width: 5,),
                                    Container(
                                      width: 30,
                                      child: IconButton(
                                        splashRadius: 30,
                                      onPressed: _incrementQuantity,
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
                      );
    }

  @override
  Widget build(BuildContext context) {
    
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [

          Container(
            height:MediaQuery.of(context).size.height - 180,
            child: SingleChildScrollView(
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
                      cartOrder(widget.foodName, widget.foodPrice, widget.foodImage, widget.quantity),
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
                            Text('${oCcy.format(totalPrice)}', style: TextStyle(fontSize: 15))
                          ],
                        ),

                        SizedBox(height: 10,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Delivery fee', style: TextStyle(fontSize: 15)),
                            Text('${oCcy.format(dfee)}', style: TextStyle(fontSize: 15))
                          ],
                        ),

                        SizedBox(height: 10,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Service and other fees', style: TextStyle(fontSize: 15)),
                            Text('${oCcy.format(sfee)}', style: TextStyle(fontSize: 15))
                          ],
                        ),

                        SizedBox(height: 10,),

                        Divider(color: Colors.black,),

                        SizedBox(height: 10,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total payment', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                            Text('${oCcy.format(totalPrice + dfee + sfee)}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                          ],
                        ),

                        SizedBox(height: 15,),



                      ],
                    ),
                  )
                ),

              ],
            ),
          ),
          ),
          
          // SizedBox(height: 20,),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.money),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cash'),
                          Text('${oCcy.format(totalPrice + dfee + sfee)}', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      )
                        ],
                      ),

                      TextButton(onPressed: () {}, 
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white),),
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Color.fromARGB(255, 74, 74, 74),
                        child: Icon(Icons.more_horiz, size: 20,),
                      )),

                      

                    ],
                  ),
                  TextButton(
                              onPressed: () {}, 
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 60, 140, 63)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Color.fromARGB(255, 60, 140, 63))
                                  )
                                )
                              ),
                              child: Container(
                                width:MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                  children: [
                                    Text('Place Delivery order', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                                  ],
                                )
                                )
                              ),

                ],
              ),
            )
          )
        ],
      )
    );
  }
}
