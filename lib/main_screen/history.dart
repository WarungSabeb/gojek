import 'package:flutter/material.dart';
import 'package:gojek/data/resto_data.dart';
import 'package:gojek/main_screen/Gofood.dart';
import 'package:gojek/main_screen/address.dart';
import 'package:gojek/main_screen/checkout.dart';
import 'package:gojek/main_screen/pencarian.dart';
import 'package:gojek/main_screen/pickup.dart';
import 'package:gojek/main_screen/menu.dart';
import 'package:gojek/theme.dart';
import 'package:gojek/widget/main_screen_widget.dart';


class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int _selectedIndex = 4;
  var _verticalPadding = 10.0;
  var _horizontalPadding = 10.0;

  final String _alamat = "Home";

      List menuBottomNav = [
      gofood(),
      PickupPage(),
      PencarianPage(),
      CheckoutPage(foodName: 'food', foodPrice: '15000', quantity: 1),
      HistoryPage(),
    ];

  void _onTappedBottomNav(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
    }

  Navigator.push(context, MaterialPageRoute(builder: (context)=> menuBottomNav.elementAt(index)));
  }

  @override
  Widget build(BuildContext context) {

    const bottomNavigationBarItem = BottomNavigationBarItem(
      icon: Icon(Icons.shopping_bag),
      label: 'Pickup',
    );
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      body: Column(
        children: [
          // this for header
          Container(
            color: Colors.white,
            child: Column(
              children: [
                buildHeader(),
                SizedBox(height: 15,)
              ],
            )),

              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // SizedBox(height: 100,),

                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 15,),
                              Container(
                                height: 80,
                                child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(48),
                                  child: Image.asset('assets/images/kuliner/ayam.jpg', fit: BoxFit.cover),
                                ),
                              ),
                              ),
                              SizedBox(width: 15,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 230,
                                        child: Text('Warung Bu Djito',
                                          style: TextStyle(
                                            fontSize: 18, 
                                            fontWeight: FontWeight.bold, 
                                            overflow: TextOverflow.ellipsis), 
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: red,
                                        child: Icon(Icons.thumb_up, color: Colors.white,size: 16,),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5,),

                                  Row(
                                    children: [
                                      Text('14 Jan 2023, 17:20', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),),
                                      SizedBox(width: 10,),
                                      Icon(Icons.circle, size: 3,color: Colors.grey,),
                                      SizedBox(width: 10,),
                                      Text('Completed', style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 60, 140, 63), fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    height: 50,
                                    width: 235,
                                    child: Text('1 Sate Ayam, 1 Nasi Kuning Komplit, 1 Ayam Geprek Bu Djito, 1 Lalapan Bu Djito (Ayam)',
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 14,
                                        overflow: TextOverflow.ellipsis
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Divider(color: Colors.black, indent: 15, endIndent: 15,),
                          SizedBox(height: 5,),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 15,),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('97.500',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      Text('4 item',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    // color: Colors.grey,
                                    fontSize: 12
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Icon(Icons.circle, size: 3,color: Colors.grey,),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(width: 5,),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                                // width: 75,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 178, 255, 200),
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                child: Text('Saved 86k',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 60, 140, 63), 
                                  fontWeight: FontWeight.bold,

                                ),),
                              ),

                              SizedBox(width: 135,),

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
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text('Reorder', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
                                )
                                ),
                            ],
                          ),
                          
                          SizedBox(height: 10,)
                        ],
                      ),
                    ),

                    SizedBox(height: 10,),

                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 15,),
                              Container(
                                height: 80,
                                child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(48),
                                  child: Image.asset('assets/images/kuliner/ayam.jpg', fit: BoxFit.cover),
                                ),
                              ),
                              ),
                              SizedBox(width: 15,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 230,
                                        child: Text('Warung Bu Djito',
                                          style: TextStyle(
                                            fontSize: 18, 
                                            fontWeight: FontWeight.bold, 
                                            overflow: TextOverflow.ellipsis), 
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor: red,
                                        child: Icon(Icons.thumb_up, color: Colors.white,size: 16,),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5,),

                                  Row(
                                    children: [
                                      Text('12 Jan 2023, 14:17', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),),
                                      SizedBox(width: 10,),
                                      Icon(Icons.circle, size: 3,color: Colors.grey,),
                                      SizedBox(width: 10,),
                                      Text('Completed', style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 60, 140, 63), fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    height: 50,
                                    width: 235,
                                    child: Text('1 Sate Ayam, 1 Nasi Kuning Komplit, 1 Ayam Geprek Bu Djito, 1 Lalapan Bu Djito (Ayam)',
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 14,
                                        overflow: TextOverflow.ellipsis
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Divider(color: Colors.black, indent: 15, endIndent: 15,),
                          SizedBox(height: 5,),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 15,),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('97.500',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      Text('4 item',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    // color: Colors.grey,
                                    fontSize: 12
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Icon(Icons.circle, size: 3,color: Colors.grey,),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(width: 5,),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                                // width: 75,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 178, 255, 200),
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                child: Text('Saved 86k',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 60, 140, 63), 
                                  fontWeight: FontWeight.bold,

                                ),),
                              ),

                              SizedBox(width: 135,),

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
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text('Reorder', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
                                )
                                ),
                            ],
                          ),
                          
                          SizedBox(height: 10,)
                        ],
                      ),
                    ),

                    
                    

                  ],

            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          bottomNavigationBarItem,
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.percent),
            label: 'Promos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'History',
          ),
        ],
        currentIndex: 4,
        selectedItemColor: Colors.green,
        onTap: _onTappedBottomNav,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
      ),
    );
  }

  SafeArea buildHeader() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: _verticalPadding,
          left: _horizontalPadding,
          right: _horizontalPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            const SizedBox(
              width: 15,
              height: 35,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'History',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
