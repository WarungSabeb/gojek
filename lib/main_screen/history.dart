import 'package:flutter/material.dart';
import 'package:gojek/data/resto_data.dart';
import 'package:gojek/main_screen/Gofood.dart';
import 'package:gojek/main_screen/address.dart';
import 'package:gojek/main_screen/checkout.dart';
import 'package:gojek/main_screen/pencarian.dart';
import 'package:gojek/main_screen/pickup.dart';
import 'package:gojek/main_screen/menu.dart';
import 'package:gojek/main_screen/promos.dart';
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
      PromosPage(),
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

  Widget historyTile(String resto, int price, String image, String date, String desc, int item) {
    return Container(
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
                                  child: Image.asset(image, fit: BoxFit.cover),
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
                                        child: Text(resto,
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
                                      Text(date, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),),
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
                                    child: Text(desc,
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

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(price.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        Text('$item item',
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
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    child: Text('Reorder', style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 60, 140, 63)),),
                                  )
                                  ),
                              ],
                            ),
                          ),
                          
                          SizedBox(height: 10,)
                        ],
                      ),
                    );
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

                    historyTile(
                      'Warung Bu Djito', 
                      97500, 
                      'assets/images/kuliner/ayam.jpg', 
                      '12 Jan 2023, 14:17', 
                      '1 Sate Ayam, 1 Nasi Kuning Komplit, 1 Ayam Geprek Bu Djito, 1 Lalapan Bu Djito (Ayam)', 
                      4)

                    
                    

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
