import 'package:flutter/material.dart';
import 'package:gojek/data/resto_data.dart';
import 'package:gojek/main_screen/Gofood.dart';
import 'package:gojek/main_screen/address.dart';
import 'package:gojek/main_screen/checkout.dart';
import 'package:gojek/main_screen/history.dart';
import 'package:gojek/main_screen/pickup.dart';
import 'package:gojek/main_screen/menu.dart';
import 'package:gojek/widget/main_screen_widget.dart';


class PencarianPage extends StatefulWidget {
  const PencarianPage({Key? key}) : super(key: key);

  @override
  _PencarianPageState createState() => _PencarianPageState();
}

class _PencarianPageState extends State<PencarianPage> {
  int _selectedIndex = 2;
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
    var gridView = GridView.count(
      shrinkWrap: true,
      crossAxisCount: 7,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,

      crossAxisSpacing: 40,
      children: [
        SearchCardWidget(
          iconAssets: 'assets/images/icon/Beverages.jpg',
          iconTitle: 'Beverages',
          routeName: '',
          onPressed: () {
          }, 
        ),
        SearchCardWidget(
          iconAssets: 'assets/images/icon/Snacks.jpg',
          iconTitle: 'Snacks',
          routeName: '',
          onPressed: () {
          }, 
        ),
        SearchCardWidget(
          iconAssets: 'assets/images/icon/Sweets.jpg',
          iconTitle: 'Sweets',
          routeName: '',
          onPressed: () {
          }, 
        ),
        SearchCardWidget(
          iconAssets: 'assets/images/icon/Rice.jpg',
          iconTitle: 'Rice',
          routeName: '',
          onPressed: () {
          }, 
        ),
        SearchCardWidget(
          iconAssets: 'assets/images/icon/Chicken.jpg',
          iconTitle: 'Chicken & duck',
          routeName: '',
          onPressed: () {
          }, 
        ),
        SearchCardWidget(
          iconAssets: 'assets/images/icon/Fast.jpg',
          iconTitle: 'Fast food',
          routeName: '',
          onPressed: () {
          }, 
        ),
        SearchCardWidget(
          iconAssets: 'assets/images/icon/Bakery.jpg',
          iconTitle: 'Bakery',
          routeName: '',
          onPressed: () {
          }, 
        ),
        SearchCardWidget(
          iconAssets: 'assets/images/icon/Japanese.jpg',
          iconTitle: 'Japanese',
          routeName: '',
          onPressed: () {
          }, 
        ),
        SearchCardWidget(
          iconAssets: 'assets/images/icon/Bakso.jpg',
          iconTitle: 'Bakso & soto',
          routeName: '',
          onPressed: () {
          }, 
        ),
        SearchCardWidget(
          iconAssets: 'assets/images/icon/Noodles.jpg',
          iconTitle: 'Noodles',
          routeName: '',
          onPressed: () {
          }, 
        ),
        SearchCardWidget(
          iconAssets: 'assets/images/icon/Korean.jpg',
          iconTitle: 'Korean',
          routeName: '',
          onPressed: () {
          }, 
        ),
        SearchCardWidget(
          iconAssets: 'assets/images/icon/Coffee.jpg',
          iconTitle: 'Coffee',
          routeName: '',
          onPressed: () {
          }, 
        ),
        SearchCardWidget(
          iconAssets: 'assets/images/icon/Martabak.jpg',
          iconTitle: 'Martabak',
          routeName: '',
          onPressed: () {
          }, 
        ),
        SearchCardWidget(
          iconAssets: 'assets/images/icon/Pizza.jpg',
          iconTitle: 'Pizza & pasta',
          routeName: '',
          onPressed: () {
          }, 
        ),
        SearchCardWidget(
          iconAssets: 'assets/images/icon/Chinese.jpg',
          iconTitle: 'Chinese',
          routeName: '',
          onPressed: () {
          }, 
        ),
        SearchCardWidget(
          iconAssets: 'assets/images/icon/Sate.jpg',
          iconTitle: 'Sate',
          routeName: '',
          onPressed: () {
          }, 
        ),
        SearchCardWidget(
          iconAssets: 'assets/images/icon/Western.jpg',
          iconTitle: 'Western',
          routeName: '',
          onPressed: () {
          }, 
        ),
        SearchCardWidget(
          iconAssets: 'assets/images/icon/Seafood.jpg',
          iconTitle: 'Seafood',
          routeName: '',
          onPressed: () {
          }, 
        ),
        SearchCardWidget(
          iconAssets: 'assets/images/icon/Middle.jpg',
          iconTitle: 'Middle Eastern',
          routeName: '',
          onPressed: () {
          }, 
        ),
        SearchCardWidget(
          iconAssets: 'assets/images/icon/Thai.jpg',
          iconTitle: 'Thai',
          routeName: '',
          onPressed: () {
          }, 
        ),
        SearchCardWidget(
          iconAssets: 'assets/images/icon/Indian.jpg',
          iconTitle: 'Indian',
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
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Divider(color: Colors.black,),
                    const SizedBox(height: 15),
                    Text("Restos you've searched", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    // const SizedBox(height: 5),
                    // Text('Sponsored', style: TextStyle(fontSize: 16,),),
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
                    const SizedBox(height: 20),
                    Divider(color: Colors.black,),



                    const SizedBox(height: 20),
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
                    const SizedBox(height: 20),
                    Divider(color: Colors.black,),
                    const SizedBox(height: 20),
                    Text('Explore by cuisine', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 15),
                    Container(
                      height: 1170,
                      child: gridView,
                    ),
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
        currentIndex: 2,
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
              height: 45,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'Search',
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
