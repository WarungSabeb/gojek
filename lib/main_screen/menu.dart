import 'package:flutter/material.dart';
import 'package:gojek/data/resto_data.dart';
import 'package:gojek/model/resto_model.dart';
import 'package:gojek/widget/main_screen_widget.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _onTappedBottomNav;
    int _selectedIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Near Me'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Restoran Terdekat',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              SizedBox(height: 16),
              ListTile(
                leading: Image.asset(
                  'assets/images/banner/1-banner.jpg',
                  width: 48,
                  height: 48,
                ),
                title: Text('Food Option 1'),
                onTap: () {
                  // Add your logic here for handling food option 1
                },
              ),
             
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
              ),
            ],
          ),
        ),
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
}
