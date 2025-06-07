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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double padding = screenWidth * 0.03; // 3% of screen width
    final double imageSize = screenWidth * 0.2; // 20% of width for image size
    final double iconSize = screenWidth * 0.05; // 5% width for icon
    final double fontSizeTitle = screenWidth * 0.045; // ~16 for 360px width
    final double fontSizeSubtitle = screenWidth * 0.035; // ~12.5 for 360px width
    final double fontSizePrice = screenWidth * 0.045;
    final double buttonHeight = screenHeight * 0.07; // button height relative to height

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.08), // 8% height
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
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new, size: iconSize),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    "Wishlist",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: fontSizeTitle,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(padding),
        children: [
          if (isItemInWishlist)
            Card(
              elevation: 3,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(padding)),
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(padding / 2),
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc1pETQZMQdxe6B0W0XVA9gk5MJX7KoX1TPA&s",
                        width: imageSize,
                        height: imageSize,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: padding),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Classic White Shirt",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: fontSizeTitle,
                            ),
                          ),
                          SizedBox(height: padding / 3),
                          Text(
                            "Cotton, Regular Fit",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: fontSizeSubtitle,
                            ),
                          ),
                          SizedBox(height: padding / 2),
                          Text(
                            "₹$shirtPrice",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: fontSizePrice,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isItemInWishlist = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(padding / 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red.shade50,
                        ),
                        child: Icon(
                          Icons.favorite,
                          size: iconSize,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          SizedBox(height: padding * 2),

          Container(
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(padding),
            ),
            child: Row(
              children: [
                Icon(Icons.local_offer, color: Colors.red, size: iconSize),
                SizedBox(width: padding),
                Expanded(
                    child: Text(
                      "Avail Offers / Coupons",
                      style: TextStyle(fontSize: fontSizeSubtitle),
                    )),
                Icon(Icons.arrow_forward_ios, size: iconSize * 0.7),
              ],
            ),
          ),

          SizedBox(height: padding * 2),

          buildPriceRow("Price", "₹$shirtPrice", fontSize: fontSizeSubtitle),
          buildPriceRow("Discount", "- ₹$discount", fontSize: fontSizeSubtitle),
          buildPriceRow("Handling Charge", "₹$handlingCharge", fontSize: fontSizeSubtitle),
          buildPriceRow("Shipping Cost", "₹$shippingCost", fontSize: fontSizeSubtitle),
          Divider(),
          buildPriceRow(
            "Wishlist Value",
            "₹$wishlistTotal",
            isBold: true,
            color: Colors.green,
            fontSize: fontSizeTitle,
          ),

          SizedBox(height: padding * 2),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartScreen()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              minimumSize: Size(double.infinity, buttonHeight),
            ),
            child: Text(
              "Go to Cart",
              style: TextStyle(fontSize: fontSizeTitle, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPriceRow(String title, String value,
      {bool isBold = false, Color? color, double? fontSize}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : null,
              fontSize: fontSize,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : null,
              color: color,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
