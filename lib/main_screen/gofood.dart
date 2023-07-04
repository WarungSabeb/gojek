import 'package:flutter/material.dart';
import 'package:gojek/data/resto_data.dart';
import 'package:gojek/main_screen/address.dart';
import 'package:gojek/main_screen/checkout.dart';
import 'package:gojek/main_screen/history.dart';
import 'package:gojek/main_screen/promos.dart';
import 'package:gojek/model/resto_model.dart';
import 'package:gojek/widget/main_screen_widget.dart';
import 'package:gojek/main_screen/menu.dart';
import 'package:gojek/main_screen/pickup.dart';
import 'package:gojek/main_screen/pencarian.dart';



class gofood extends StatefulWidget {
  gofood({Key? key}) : super(key: key);

  @override
  _gofoodState createState() => _gofoodState();
}

class _gofoodState extends State<gofood> {
  int _selectedIndex = 0;
   double _verticalPadding = 10.0;
   double _horizontalPadding = 10.0;

  final String _alamat = "Home";

  void _onTappedBottomNav(int index) {
    List menuBottomNav = [gofood(), PickupPage(), PencarianPage(), PromosPage(), HistoryPage(),];
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
      crossAxisCount: 2,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      crossAxisSpacing: 30,
      children: [
        IconCardWidget(
          iconAssets: 'assets/images/icon/Near.jpg',
          iconTitle: 'Near Me',
          routeName: 'menu',
          onPressed: () {
            print('Near Me button clicked');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuPage()),
            );
          },
        ),
        IconCardWidget(
          iconAssets: 'assets/images/icon/Yummy.jpg',
          iconTitle: 'Yummy Dinner', routeName: '', onPressed: () {  },
        ),
        IconCardWidget(
          iconAssets: 'assets/images/icon/Promo.jpg',
          iconTitle: 'Pasti Ada Promo', routeName: '', onPressed: () {  },
        ),
        IconCardWidget(
          iconAssets: 'assets/images/icon/Best.jpg',
          iconTitle: 'Best Sellers', routeName: '', onPressed: () {  },
        ),
        IconCardWidget(
          iconAssets: 'assets/images/icon/Bestoran.jpg',
          iconTitle: 'Bestoran 6.6', routeName: '', onPressed: () {  },
        ),
        IconCardWidget(
          iconAssets: 'assets/images/icon/Budget.jpg',
          iconTitle: 'Budget Meal', routeName: '', onPressed: () {  },
        ),
        IconCardWidget(
          iconAssets: 'assets/images/icon/Juara.jpg',
          iconTitle: 'Juara Lokal Jakarta', routeName: '', onPressed: () {  },
        ),
        IconCardWidget(
          iconAssets: 'assets/images/icon/Healthy.jpg',
          iconTitle: 'Healthy Food', routeName: '', onPressed: () {  },
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // this for header
          buildHeader(),
          const SizedBox(
            height: 10,
          ),
          // to call search box
          SearchBox(
            paddingVertical: _verticalPadding,
            paddingHorizontal: _horizontalPadding,
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // call banner handler
                    const BannerWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 300,
                      child: gridView,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Your foodprints!',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Reorder what you had last time. Easy.',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
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
                                  penilai: resto.restoJudges,
                                  restoImage: resto.restoImage,
                                  resto: resto,
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Near me',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Tasty eat',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 15),
                         
                          // Tampilan Restoran
                            ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: restoDataList.length,
                              itemBuilder: (context, index) {
                                final RestoModel resto = restoDataList[index];
                                return UniversalContent(
                                  jarakResto: resto.restoDistance,
                                  rating: resto.restoRating,
                                  categoryResto: resto.restoCategory.join(", "),
                                  restoPlace: resto.restoLocation,
                                  restoName: resto.restoName,
                                  restoImage: resto.restoImage,
                                  estMin: resto.estMinimum,
                                  estMax: resto.estMaximum,
                                  resto: resto,
                                );
                              },
                            ),
                        ],
                      ),
                    )
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
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Pickup',

          ),
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
        currentIndex: 0,
        selectedItemColor: Colors.green,
        onTap: _onTappedBottomNav,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,

      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: _verticalPadding,
        horizontal: _horizontalPadding,
      ),
      child: Row(
        children: [
          Icon(
            Icons.location_pin,
            color: Colors.green,
            size: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _alamat,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Yogyakarta',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.grey,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
