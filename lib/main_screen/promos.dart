import 'package:flutter/material.dart';
import 'package:gojek/data/resto_data.dart';
import 'package:gojek/main_screen/Gofood.dart';
import 'package:gojek/main_screen/history.dart';
import 'package:gojek/main_screen/pencarian.dart';
import 'package:gojek/main_screen/pickup.dart';
import 'package:gojek/widget/main_screen_widget.dart';

class PromosPage extends StatefulWidget {
  PromosPage({Key? key}) : super(key: key);

  @override
  State<PromosPage> createState() => PromosPageState();
}

class PromosPageState extends State<PromosPage> {
  int _selectedIndex = 3;
  var _verticalPadding = 10.0;
  var _horizontalPadding = 10.0;

  final String _alamat = "Home";

  void _onTappedBottomNav(int index) {
    // ignore: unused_local_variable
    List menuBottomNav = [
      gofood(),
      PickupPage(),
      PencarianPage(),
      PromosPage(),
      HistoryPage(),
    ];
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });

      Navigator.push(context, MaterialPageRoute(builder: (context)=> menuBottomNav.elementAt(index)));
    }
  }

  @override
  Widget build(BuildContext context) {

    const bottomNavigationBarItem = BottomNavigationBarItem(
      icon: Icon(Icons.shopping_bag),
      label: 'Pickup',
    );
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          buildHeader(),
          const SizedBox(height: 30),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // const SizedBox(height: 20),
                    Text('Top-rated by other foodies', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5),
                    Text('Sponsored', style: TextStyle(fontSize: 15,),),
                    const SizedBox(height: 15),

                          Container(
                            height: 170,
                            width: 700,
                            child: GridView.count(
                              scrollDirection: Axis.horizontal,
                              crossAxisCount: 1,
                              crossAxisSpacing:
                                  MediaQuery.of(context).size.width * 0.01,
                              mainAxisSpacing:
                                  MediaQuery.of(context).size.width * 0.01,
                              children: restoDataList
                                  .where((rec) => rec.isRecommended)
                                  .toList()
                                  .map((resto) {
                                return RestoCardMarkotop(
                                  restoName: resto.restoName,
                                  rating: resto.restoRating,
                                  restoImage: resto.restoImage,
                                  penilai: resto.restoJudges,
                                  resto: resto,
                                );
                              }).toList(),
                            ),
                          ),

                          SizedBox(height: 20),
                          Text('Promo hunters, assemble!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                          SizedBox(height: 20),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [

                                Container(
                                  height: 85,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 45, 135, 48),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 15,),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        height: 40,
                                        width: 100,
                                        child: Text('Save up to 60%',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 2,),

                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              'View restos',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white
                                              ),
                                            ),
                                            Icon(
                                              Icons.navigate_next,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                            
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                SizedBox(width: 10,),

                                Container(
                                  height: 85,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 203, 106, 1),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 15,),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        height: 40,
                                        width: 100,
                                        child: Text('Min. order up to 40k',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 2,),

                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              'View restos',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white
                                              ),
                                            ),
                                            Icon(
                                              Icons.navigate_next,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                            
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                SizedBox(width: 10,),

                                Container(
                                  height: 85,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 52, 139, 179),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 15,),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        height: 40,
                                        width: 100,
                                        child: Text('Delivery discounts',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 2,),

                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              'View restos',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white
                                              ),
                                            ),
                                            Icon(
                                              Icons.navigate_next,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                            
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 30,),
                          const BannerWidget(),
                  ],
                ),
              ),
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
        currentIndex: 3,
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

            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Your location',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Icon(
                        Icons.expand_more,
                        color: Colors.red,
                        size: 18,
                      ),
                    ],
                  ),
                  Text(
                    _alamat,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15),

          ],
        ),
      ),
    );
  }
}
