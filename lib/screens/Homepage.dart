import 'package:flutter/material.dart';
import 'package:newproject/screens/plant_details_page.dart';
import 'package:provider/provider.dart';
import '../constraint.dart';
import '../models/plants.dart';
import 'cart.dart';
import 'fav_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isAddedTofav = false;
  int selectedIndex = 0;
  int selectedInd = 0;
  int selectedIndex1 = 0;
  List<Plant> favorites = [];
  Set<String> uniqueCategories =
      Set<String>.from(Plant.plantList.map((plant) => plant.category));
  Set<Plant> _cart = {};

  @override
  Widget build(BuildContext context) {
    final List<Plant> plants = Provider.of<List<Plant>>(context);
    final Cart cart = Provider.of<Cart>(context);
    final Fav fav = Provider.of<Fav>(context);
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     "Home",
        //     style: TextStyle(color: Colors.grey, fontSize: 30),
        //   ),
        //   actions: <Widget>[
        //     IconButton(
        //       color: Colors.grey,
        //       icon: Icon(Icons.favorite),
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => FavoritesPage(favorites: favorites),
        //           ),
        //         );
        //       },
        //     ),
        //     IconButton(
        //       icon: Icon(
        //         Icons.shopping_cart,
        //         color: Colors.grey,
        //       ),
        //       onPressed: () {
        //         ScaffoldMessenger.of(context).showSnackBar(
        //           SnackBar(
        //             content: Text('item added to cart'),
        //           ),
        //         );
        //         Navigator.of(context).push(
        //           MaterialPageRoute(builder: (context) => CartPage()),
        //         );
        //       },
        //     ),
        //     IconButton(
        //       icon: Icon(Icons.notifications),
        //       color: Colors.grey,
        //       onPressed: () {},
        //     ),
        //   ],
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        // ),
        body: SingleChildScrollView(
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 235, 235, 235),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const TextField(
            decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                border: InputBorder.none),
          ),
        ),
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: uniqueCategories.length,
            itemBuilder: (BuildContext context, int index) {
              String category = uniqueCategories.elementAt(index);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex1 = index;
                    });
                  },
                  child: Container(
                    child: Text(
                      '$category',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: selectedIndex1 == index
                            ? FontWeight.bold
                            : FontWeight.w300,
                        color: selectedIndex1 == index
                            ? Constants.primaryColor
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Plant.plantList.length,
            itemBuilder: (BuildContext context, int index) {
              final plant = Plant.plantList[index];
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   selectedIndex = index;
                        // }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlantDetailsPage(
                              plant: Plant.plantList[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Constants.primaryColor.withOpacity(.6),
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: AssetImage(
                                '${Plant.plantList[index].imageURL}'),
                          ),
                        ),
                        width: 250,
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: _isAddedTofav
                                    ? Icon(
                                        Icons.favorite_border,
                                        color: Colors.red,
                                      )
                                    : Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                      ),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('item added to Favriote'),
                                    ),
                                  );
                                  if (!_isAddedTofav) {
                                    fav.add(Plant.plantList[index]);
                                    setState(() {
                                      _isAddedTofav = true;
                                    });
                                  }
                                },
                              ),
                              // IconButton(
                              //   iconSize: 30,
                              //   color: Colors.white,
                              //   icon: favorites.contains(plant)
                              //       ? Icon(
                              //           Icons.favorite,
                              //           color: Colors.red,
                              //         )
                              //       : Icon(Icons.favorite_border),
                              //   onPressed: () {
                              //     setState(() {
                              //       if (favorites.contains(plant)) {
                              //         favorites.remove(plant);
                              //       } else {
                              //         favorites.add(plant);
                              //       }
                              //       print(widget);
                              //     });
                              //   },
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 130,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${Plant.plantList[index].category}',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: selectedIndex == index
                                        ? FontWeight.bold
                                        : FontWeight.w300,
                                    color: selectedIndex == index
                                        ? Constants.primaryColor
                                        : Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${Plant.plantList[index].plantName}',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: selectedIndex == index
                                        ? Constants.primaryColor
                                        : Colors.white),
                              ),
                              Text(
                                '\$${Plant.plantList[index].price}',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: selectedIndex == index
                                        ? Constants.primaryColor
                                        : Colors.white),
                              ),
                            ],
                          )
                        ]),
                      )));
            },
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text("New Plants ",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        Container(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: Plant.plantList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 179, 247, 197),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ListTile(
                      trailing: Text(
                        "\$${Plant.plantList[index].price}",
                        style: TextStyle(
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      leading: Image.asset(Plant.plantList[index].imageURL),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PlantDetailsPage(plant: Plant.plantList[index]),
                          ),
                        );
                      },
                      title: Text(Plant.plantList[index].category),
                      subtitle: Text(
                        Plant.plantList[index].plantName,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ]),
    ));
  }
}
