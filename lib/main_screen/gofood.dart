// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:gojek/data/resto_data.dart';
import 'package:gojek/model/resto_model.dart';
import 'package:gojek/widget/main_screen_widget.dart';

class gofood extends StatefulWidget {
  gofood({Key? key}) : super(key: key);

  @override
  _gofoodState createState() => _gofoodState();
}

class _gofoodState extends State<gofood> {
  int _selectedIndex = 0;
  var _verticalPadding = 10.0;
  var _horizontalPadding = 10.0;

  final String _alamat = "Home";

  void _onTappedBottomNav(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });

    }
  }

  @override
  Widget build(BuildContext context) {
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
                      child: 
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        crossAxisSpacing: 30,
                        // mainAxisSpacing: 50,
                        children: [
                                const IconCardWidget(
                                  iconAssets: 'assets/images/icon/Near.jpg',
                                  iconTitle: 'Near Me',
                                ),
  
                                const IconCardWidget(
                                  iconAssets: 'assets/images/icon/Yummy.jpg',
                                  iconTitle: 'Yummy Dinner',
                                ),

                                const IconCardWidget(
                                  iconAssets: 'assets/images/icon/Promo.jpg',
                                  iconTitle: 'Pasti Ada Promo',
                                ),

                                const IconCardWidget(
                                  iconAssets: 'assets/images/icon/Best.jpg',
                                  iconTitle: 'Best Sellers',
                                ),

                                const IconCardWidget(
                                  iconAssets: 'assets/images/icon/Bestoran.jpg',
                                  iconTitle: 'Bestoran 6.6',
                                ),
  
                                const IconCardWidget(
                                  iconAssets: 'assets/images/icon/Budget.jpg',
                                  iconTitle: 'Budget Meal',
                                ),

                                const IconCardWidget(
                                  iconAssets: 'assets/images/icon/Juara.jpg',
                                  iconTitle: 'Juara Lokal Jakarta',
                                ),

                                const IconCardWidget(
                                  iconAssets: 'assets/images/icon/Healthy.jpg',
                                  iconTitle: 'Healthy Food',
                                ),
                        ]
                      ),
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
                            'Tasty eats',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 15),
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
                                estMin: resto.estMinimum,
                                estMax: resto.estMaximum,
                                resto: resto,
                              );
                            },
                          )
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
        currentIndex: _selectedIndex,
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
            IconButton(
              icon : new Icon(Icons.close),
              color: Colors.black45,
              // size: 25, 
              onPressed: () {
                Navigator.pop(context);
                },
            ),
            const SizedBox(
              width: 15,
            ),
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
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Icon(
              Icons.favorite_sharp,
              color: Colors.black45,
              size: 25,
            )
          ],
        ),
      ),
    );
  }
}
