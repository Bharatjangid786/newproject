import 'package:flutter/material.dart';
import 'package:newproject/models/plants.dart';
import 'package:newproject/screens/cart.dart';
import 'package:provider/provider.dart';

import '../constraint.dart';

class PlantDetailsPage extends StatefulWidget {
  final Plant plant;

  PlantDetailsPage({required this.plant});

  @override
  State<PlantDetailsPage> createState() => _PlantDetailsPageState();
}

class _PlantDetailsPageState extends State<PlantDetailsPage> {
  // List<Plant> favorites = [];
  bool _isAddedToCart = false;

  @override
  Widget build(BuildContext context) {
    final List<Plant> plants = Provider.of<List<Plant>>(context);
    final Cart cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor:
                Color.fromARGB(255, 166, 228, 167).withOpacity(0.5)),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  heightFactor: 0.6,
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('${widget.plant.imageURL}'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(children: [
                          Row(
                            children: [Text("size")],
                          ),
                          Row(
                            children: [
                              Text(
                                ' ${widget.plant.size}',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 74, 122, 75),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Row(
                            children: const [
                              Text(
                                "humidity",
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                ' ${widget.plant.humidity}',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 74, 122, 75),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Row(
                            children: [Text("Temperature")],
                          ),
                          Row(
                            children: [
                              Text(
                                ' ${widget.plant.temperature}',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 74, 122, 75),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          )
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 330,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 74, 122, 75).withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            ' ${widget.plant.plantName}',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 74, 122, 75),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            ' ${widget.plant.rating}',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 74, 122, 75),
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Constants.primaryColor,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            ' \$${widget.plant.price}',
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 100, 96, 96)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 8, 10, 0),
                        child: Container(
                          child: Text(
                            ' ${widget.plant.decription}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 74, 122, 75),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 74, 122, 75)
                                    .withOpacity(0.5),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100.0),
                                )),
                            child: IconButton(
                              icon: _isAddedToCart
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    )
                                  : Icon(
                                      Icons.shopping_cart,
                                      color: Colors.white,
                                    ),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('item added to cart'),
                                  ),
                                );
                                if (!_isAddedToCart) {
                                  cart.add(widget.plant);
                                  setState(() {
                                    _isAddedToCart = true;
                                  });
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              width: 230.0,
                              height: 50.0,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 74, 122, 75),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'BUY NOW',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
