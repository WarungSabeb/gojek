import 'package:flutter/material.dart';

import 'package:gojek/main_screen/menu.dart';
import 'package:gojek/widget/main_screen_widget.dart';


class PencarianPage extends StatefulWidget {
  const PencarianPage({Key? key}) : super(key: key);

  @override
  _PencarianPageState createState() => _PencarianPageState();
}

class _PencarianPageState extends State<PencarianPage> {
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
    var gridView = GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      crossAxisSpacing: 30,
      children: [
        const Text(
          'Eksplor aneka Kuliner',
          
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
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
          iconTitle: 'Yummy Dinner',
          routeName: '',
          onPressed: () {},
        ),
        IconCardWidget(
          iconAssets: 'assets/images/icon/Promo.jpg',
          iconTitle: 'Pasti Ada Promo',
          routeName: '',
          onPressed: () {},
        ),
        IconCardWidget(
          iconAssets: 'assets/images/icon/Best.jpg',
          iconTitle: 'Best Sellers',
          routeName: '',
          onPressed: () {},
        ),
        
       
        IconCardWidget(
          iconAssets: 'assets/images/icon/Bestoran.jpg',
          iconTitle: 'Bestoran 6.6',
          routeName: '',
          onPressed: () {},
        ),
        IconCardWidget(
          iconAssets: 'assets/images/icon/Budget.jpg',
          iconTitle: 'Budget Meal',
          routeName: '',
          onPressed: () {},
        ),
        IconCardWidget(
          iconAssets: 'assets/images/icon/Juara.jpg',
          iconTitle: 'Juara Lokal Jakarta',
          routeName: '',
          onPressed: () {},
        ),
        IconCardWidget(
          iconAssets: 'assets/images/icon/Healthy.jpg',
          iconTitle: 'Healthy Food',
          routeName: '',
          onPressed: () {},
        ),
        IconCardWidget(
          iconAssets: 'assets/images/icon/Bestoran.jpg',
          iconTitle: 'Bestoran 6.6',
          routeName: '',
          onPressed: () {},
        ),
        IconCardWidget(
          iconAssets: 'assets/images/icon/Budget.jpg',
          iconTitle: 'Budget Meal',
          routeName: '',
          onPressed: () {},
        ),
        IconCardWidget(
          iconAssets: 'assets/images/icon/Juara.jpg',
          iconTitle: 'Juara Lokal Jakarta',
          routeName: '',
          onPressed: () {},
        ),
        IconCardWidget(
          iconAssets: 'assets/images/icon/Healthy.jpg',
          iconTitle: 'Healthy Food',
          routeName: '',
          onPressed: () {},
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
            height: 30,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 300,
                      child: gridView,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         
                         
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
              icon: Icon(Icons.close),
              color: Colors.black45,
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
