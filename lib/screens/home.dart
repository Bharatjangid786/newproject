import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:newproject/constraint.dart';
import 'package:newproject/screens/profile_page.dart';
import 'package:newproject/screens/scanner_page.dart';
import '../models/plants.dart';
import 'Homepage.dart';
import 'cart.dart';
import 'fav_page.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   int _pageIndex = 0;
//   List<Widget> _widgetOptions = [
//     HomePage(),
//     ScannerPage(),
//     ProfilePage()
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: _widgetOptions.elementAt(_pageIndex),
//         bottomNavigationBar: CurvedNavigationBar(
//           animationCurve: Curves.easeInOut,
//           backgroundColor: Constants.primaryColor,
//           height: 60,
//           index: _pageIndex,
//           animationDuration: Duration(milliseconds: 600),
//           items: <Widget>[
//             Icon(
//               Icons.home,
//             ),

//             Icon(
//               Icons.qr_code_scanner,
//             ),

//             Icon(
//               Icons.person,
//             ),
//           ],
//           onTap: (index) {
//             setState(() {
//               _pageIndex = index;
//             });
//           },
//         ));
//   }
// }

// final controller = PageController(initialPage: 0);
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pageIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    FavoritesPage(),
    CartPage(),
    ScannerPage(),
    ProfilePage(),
  ];
  int selectedIndex = 0;
  int selectedInd = 0;
  int selectedIndex1 = 0;
  List<Plant> favorites = [];
  Set<String> uniqueCategories =
      Set<String>.from(Plant.plantList.map((plant) => plant.category));
  Set<Plant> _cart = {};
  // List<Plant> favorites = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Plant App",
          style: TextStyle(color: Colors.grey, fontSize: 30),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.grey,
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _pages[_pageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Constants.primaryColor,
        height: 50,
        items: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home),
              Text('Home'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite),
              Text('Favorite'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart),
              Text('cart'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.qr_code),
              Text('Scan'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person),
              Text('Profile'),
            ],
          ),
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}
