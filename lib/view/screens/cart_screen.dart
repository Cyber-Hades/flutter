import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:task1/rootscreen/rootscreen.dart';
import 'category_screen.dart';
import 'myorders_screen.dart';
import 'profile_screen.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int shirtQty = 1;
  int shirtPrice = 200;
  bool isItemInCart = true;

  int get totalPrice => shirtQty * shirtPrice;
  int discount = 50;
  int handlingCharge = 20;
  int shippingCost = 30;

  int get payableAmount => totalPrice - discount + handlingCharge + shippingCost;
  @override
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(58),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xfff9ecd7),
          flexibleSpace: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => RootScreen()));
                        },
                        icon: Icon(Icons.arrow_back_ios_new)),
                  ],
                ),
                Center(
                  child: Text(
                    "Cart",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavBar(context, screenWidth),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Show only if item is in cart
            if (isItemInCart)
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc1pETQZMQdxe6B0W0XVA9gk5MJX7KoX1TPA&s",
                          width: screenWidth * 0.2,
                          height: screenWidth * 0.2,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Classic White Shirt",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth * 0.045)),
                            const SizedBox(height: 4),
                            const Text(
                              "Cotton, Regular Fit",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (shirtQty > 1) shirtQty--;
                                    });
                                  },
                                  icon:
                                  const Icon(Icons.remove_circle_outline),
                                  splashRadius: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    border:
                                    Border.all(color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(shirtQty.toString(),
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.04)),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      shirtQty++;
                                    });
                                  },
                                  icon: const Icon(Icons.add_circle_outline),
                                  splashRadius: 20,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "₹${shirtQty * shirtPrice}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.045),
                          ),
                          const SizedBox(height: 4),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isItemInCart = false;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade200,
                              ),
                              child: const Icon(Icons.close, size: 12),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(Icons.local_offer, color: Colors.red),
                  const SizedBox(width: 10),
                  Expanded(child: Text("Avail Offers / Coupons")),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
            const SizedBox(height: 20),
            buildPriceRow("Price", "₹$totalPrice"),
            buildPriceRow("Discount", "- ₹$discount"),
            buildPriceRow("Handling Charge", "₹$handlingCharge"),
            buildPriceRow("Shipping Cost", "₹$shippingCost"),
            const Divider(),
            buildPriceRow("Payable Amount", "₹$payableAmount",
                isBold: true, color: Colors.green),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(double.infinity, screenHeight * 0.06),
              ),
              child: Text(
                "Add Delivery Address",
                style: TextStyle(
                    fontSize: screenWidth * 0.045, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildPriceRow(String title, String value,
      {bool isBold = false, Color? color}) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: TextStyle(fontWeight: isBold ? FontWeight.bold : null)),
              Text(value,
                  style: TextStyle(
                      fontWeight: isBold ? FontWeight.bold : null, color: color)),
            ],
            ),
        );
    }
}
Widget buildBottomNavBar(BuildContext context, double screenWidth) {
  return Container(
    height: 72,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildNavItem(context, Icons.home, "Home", () => RootScreen()),
        buildNavItem(context, Iconsax.category, "Category", () => CategoryScreen()),
        buildNavItem(context, Iconsax.box, "My Orders", () => MyOrdersScreen()),
        buildNavItem(context, Iconsax.profile_2user, "Profile", () => ProfileScreen()),
      ],
    ),
  );
}

Widget buildNavItem(BuildContext context, IconData icon, String label, Widget Function() page) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(
        enableFeedback: false,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page()));
        },
        icon: Icon(icon, color: Colors.black, size: 26),
      ),
      Text(label, style: const TextStyle(fontSize: 12)),
    ],
  );
}



