import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constraint.dart';
import '../models/plants.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);
  
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: 50,
            width: 340,
            child: Text(
              "Cart",
              style: TextStyle(
                  backgroundColor: Colors.white,
                  fontSize: 30,
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              color: Colors.white,
              height: 560,
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item = cart.items.toList()[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Dismissible(
                      key: Key(item.plantName),
                      direction: DismissDirection.horizontal,
                      onDismissed: (direction) {
                        cart.remove(item);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Constants.primaryColor.withOpacity(.2),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ListTile(
                          trailing: Text(
                            "\$${item.price}",
                            style: TextStyle(
                                color: Constants.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          leading: Image.asset(item.imageURL),
                          onTap: () {},
                          title: Text(item.category),
                          subtitle: Text(
                            Plant.plantList[index].plantName,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Cart extends ChangeNotifier {
  final Set<Plant> _items = {};

  Set<Plant> get items => _items;

  void add(Plant plant) {
    _items.add(plant);
    notifyListeners();
  }

  void remove(Plant plant) {
    _items.remove(plant);
    notifyListeners();
  }
}
