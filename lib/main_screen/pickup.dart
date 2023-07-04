import 'package:flutter/material.dart';
import 'package:gojek/data/resto_data.dart';
import 'package:gojek/main_screen/Gofood.dart';
import 'package:gojek/main_screen/address.dart';
import 'package:gojek/main_screen/checkout.dart';
import 'package:gojek/main_screen/history.dart';
import 'package:gojek/main_screen/pencarian.dart';
import 'package:gojek/main_screen/promos.dart';
import 'package:gojek/widget/main_screen_widget.dart';
import 'package:gojek/main_screen/menu.dart';

class PickupPage extends StatefulWidget {
  PickupPage({Key? key}) : super(key: key);

  @override
  State<PickupPage> createState() => PickupPageState();
}

class PickupPageState extends State<PickupPage> {
  int _selectedIndex = 1;
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
    var gridView = GridView.count(
      shrinkWrap: true,
      crossAxisCount: 1,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      crossAxisSpacing: 25,
      children: [

        PickupCardWidget(
          iconAssets: 'assets/images/icon/Near.jpg',
          iconTitle: 'Near Me',
          routeName: 'menu',
          onPressed: () {
            // print('Near Me button clicked');
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => MenuPage()),
            // );
          }, 
        ),
        PickupCardWidget(
          iconAssets: 'assets/images/icon/Yummy.jpg',
          iconTitle: 'Yummy Dinner',
          routeName: '',
          onPressed: () {},
        ),
        PickupCardWidget(
          iconAssets: 'assets/images/icon/Promo.jpg',
          iconTitle: 'Pasti Ada Promo',
          routeName: '',
          onPressed: () {},
        ),
        PickupCardWidget(
          iconAssets: 'assets/images/icon/Best.jpg',
          iconTitle: 'Best Sellers',
          routeName: '',
          onPressed: () {},
        ),

        PickupCardWidget(
          iconAssets: 'assets/images/icon/Bestoran.jpg',
          iconTitle: 'Bestoran 6.6',
          routeName: '',
          onPressed: () {},
        ),
        PickupCardWidget(
          iconAssets: 'assets/images/icon/Budget.jpg',
          iconTitle: 'Budget Meal',
          routeName: '',
          onPressed: () {},
        ),
        PickupCardWidget(
          iconAssets: 'assets/images/icon/Juara.jpg',
          iconTitle: 'Juara Lokal\n   Jakarta',
          routeName: '',
          onPressed: () {},
        ),
        PickupCardWidget(
          iconAssets: 'assets/images/icon/Healthy.jpg',
          iconTitle: 'Healthy Food',
          routeName: '',
          onPressed: () {},
        ),
      ],
    );

    var gridView2 = GridView.count(
      shrinkWrap: true,
      crossAxisCount: 1,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      crossAxisSpacing: 25,
      children: [

        CuisinesCardWidget(
          iconAssets: 'assets/images/icon/Beverages.jpg',
          iconTitle: 'Beverages',
          routeName: '',
          onPressed: () {
          }, 
        ),
        CuisinesCardWidget(
          iconAssets: 'assets/images/icon/Snacks.jpg',
          iconTitle: 'Snacks',
          routeName: '',
          onPressed: () {
          }, 
        ),
        CuisinesCardWidget(
          iconAssets: 'assets/images/icon/Sweets.jpg',
          iconTitle: 'Sweets',
          routeName: '',
          onPressed: () {
          }, 
        ),
        CuisinesCardWidget(
          iconAssets: 'assets/images/icon/Rice.jpg',
          iconTitle: 'Rice',
          routeName: '',
          onPressed: () {
          }, 
        ),
        CuisinesCardWidget(
          iconAssets: 'assets/images/icon/Chicken.jpg',
          iconTitle: 'Chicken & duck',
          routeName: '',
          onPressed: () {
          }, 
        ),
        CuisinesCardWidget(
          iconAssets: 'assets/images/icon/Fast.jpg',
          iconTitle: 'Fast food',
          routeName: '',
          onPressed: () {
          }, 
        ),
        CuisinesCardWidget(
          iconAssets: 'assets/images/icon/Bakery.jpg',
          iconTitle: 'Bakery',
          routeName: '',
          onPressed: () {
          }, 
        ),
        CuisinesCardWidget(
          iconAssets: 'assets/images/icon/Japanese.jpg',
          iconTitle: 'Japanese',
          routeName: '',
          onPressed: () {
          }, 
        ),
        CuisinesCardWidget(
          iconAssets: 'assets/images/icon/Bakso.jpg',
          iconTitle: 'Bakso & soto',
          routeName: '',
          onPressed: () {
          }, 
        ),


      ],
    );

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
                    const Text(
                            'Categories for GoFood Pickup',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                    SizedBox(height: 10,),
                    Container(
                      height: 140,
                      child: gridView,
                    ),
                    const Text(
                            'Cuisines for GoFood Pickup',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                    SizedBox(height: 10,),
                    Container(
                      height: 140,
                      child: gridView2,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Strict safety measures',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Pickup restos prioritizing order safety.',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 10),
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
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
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
        currentIndex: 1,
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
