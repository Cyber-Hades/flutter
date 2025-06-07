import 'package:flutter/material.dart';
import 'package:task1/rootscreen/rootscreen.dart';
import 'package:task1/view/screens/cart_screen.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  bool isItemInWishlist = true;

  final int shirtPrice = 200;
  final int discount = 50;
  final int handlingCharge = 20;
  final int shippingCost = 30;

  int get wishlistTotal => shirtPrice - discount + handlingCharge + shippingCost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(58),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xfff9ecd7),
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
                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ],
                ),
                const Center(
                  child: Text(
                    "Wishlist",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Wishlist item card
            if (isItemInWishlist)
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Shirt Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc1pETQZMQdxe6B0W0XVA9gk5MJX7KoX1TPA&s",
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Info and Heart Icon
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Classic White Shirt",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Cotton, Regular Fit",
                              style: TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "₹$shirtPrice",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Remove from Wishlist Icon
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isItemInWishlist = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red.shade50,
                          ),
                          child: const Icon(
                            Icons.favorite,
                            size: 20,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            const SizedBox(height: 20),

            // Offers Container
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: const [
                  Icon(Icons.local_offer, color: Colors.red),
                  SizedBox(width: 10),
                  Expanded(child: Text("Avail Offers / Coupons")),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Wishlist Pricing Details
            buildPriceRow("Price", "₹$shirtPrice"),
            buildPriceRow("Discount", "- ₹$discount"),
            buildPriceRow("Handling Charge", "₹$handlingCharge"),
            buildPriceRow("Shipping Cost", "₹$shippingCost"),
            const Divider(),
            buildPriceRow(
              "Wishlist Value",
              "₹$wishlistTotal",
              isBold: true,
              color: Colors.green,
            ),
            const SizedBox(height: 20),

            // Go to Cart Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CartScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Go to Cart",
                style: TextStyle(fontSize: 16, color: Colors.white),
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
