import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../constraint.dart';
import '../models/plants.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

var total = 0;

class _CartPageState extends State<CartPage> {
  var _razorpay = Razorpay();
  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }
  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);

    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
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
            ],
          ),
          SingleChildScrollView(
            child: Container(
              color: Colors.white,
              height: 450,
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
                        setState(() {
                          total = total - item.price;
                        });
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Constants.primaryColor,
                height: 50,
                width: 200, // Set the width to your desired value
                child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Order:",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white, // Change text color to white
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "\$${total}",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white, // Change text color to white
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    var options = {
                      'key': 'rzp_test_Wd9LIcrl0tb30v',
                      'amount': 1 * 100, //in the smallest currency sub-unit.
                      'name': 'Plants',

                      'description': 'Orders Plants',
                      'timeout': 60, // in seconds
                      "recurring": 1
                    };
                    _razorpay.open(options);
                    print(options);
                  },
                ),
              ),
            ],
          )
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
    total = plant.price + total;
    notifyListeners();
  }

  void remove(Plant plant) {
    _items.remove(plant);
    notifyListeners();
  }
}
