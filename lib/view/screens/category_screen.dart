import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:task1/rootscreen/rootscreen.dart';
import 'package:task1/view/screens/myorders_screen.dart';
import 'package:task1/view/screens/profile_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Decide how many columns for GridView based on screen width
    int gridCount = 2; // default
    if (screenWidth >= 600) {
      gridCount = 3;
    }
    if (screenWidth >= 900) {
      gridCount = 4;
    }

    // Adjust padding dynamically
    double gridPadding = screenWidth * 0.03;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xfff9ecd7),
          automaticallyImplyLeading: false,
          elevation: 1,
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RootScreen()));
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          title: const Text(
            "Categories",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(children: [
          const TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.blue,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
            tabs: [
              Tab(text: 'Male'),
              Tab(text: 'Female'),
              Tab(text: 'Kids'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                // Male Tab
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: gridCount,
                  padding: EdgeInsets.all(gridPadding),
                  crossAxisSpacing: gridPadding,
                  mainAxisSpacing: gridPadding,
                  children: const [
                    CardView(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc1pETQZMQdxe6B0W0XVA9gk5MJX7KoX1TPA&s',
                      description: 'Shirts',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D',
                      description: 'Shoes',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                          'https://t4.ftcdn.net/jpg/01/86/85/71/360_F_186857190_s4dfc0wfT6jcEcr7e3vzrFuUdysg6Gpp.jpg',
                      description: 'Watches',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmvBcPGK3gZ-WuM5hosqkb9EDS3a7xU3jr7Q&s',
                      description: 'Jackets',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc1pETQZMQdxe6B0W0XVA9gk5MJX7KoX1TPA&s',
                      description: 'Shirts',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXN8ZW58MHx8MHx8fDA%3D',
                      description: 'Shoes',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                          'https://t4.ftcdn.net/jpg/01/86/85/71/360_F_186857190_s4dfc0wfT6jcEcr7e3vzrFuUdysg6Gpp.jpg',
                      description: 'Watches',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmvBcPGK3gZ-WuM5hosqkb9EDS3a7xU3jr7Q&s',
                      description: 'Jackets',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                  ],
                ),

                // Female Tab
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: gridCount,
                  padding: EdgeInsets.all(gridPadding),
                  crossAxisSpacing: gridPadding,
                  mainAxisSpacing: gridPadding,
                  children: const [
                    CardView(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTigc0gHHHKVT4YVSzNBJ0Wfj7KMl0KbxeEPg&s',
                      description: 'Dresses',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                          'https://plus.unsplash.com/premium_photo-1676234844384-82e1830af724?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aGVlbHN8ZW58MHx8MHx8fDA%3D',
                      description: 'Heels',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                          'https://images.unsplash.com/photo-1682745230951-8a5aa9a474a0?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aGFuZGJhZ3xlbnwwfHwwfHx8MA%3D%3D',
                      description: 'Bags',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                          'https://img.freepik.com/free-photo/portrait-hindu-bride-traditional-red-sari-with-golden-acce_8353-8861.jpg?semt=ais_hybrid&w=740',
                      description: 'Jewelry',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTigc0gHHHKVT4YVSzNBJ0Wfj7KMl0KbxeEPg&s',
                      description: 'Dresses',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                          'https://plus.unsplash.com/premium_photo-1676234844384-82e1830af724?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aGVlbHN8ZW58MHx8MHx8fDA%3D',
                      description: 'Heels',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                          'https://images.unsplash.com/photo-1682745230951-8a5aa9a474a0?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aGFuZGJhZ3xlbnwwfHwwfHx8MA%3D%3D',
                      description: 'Bags',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                          'https://img.freepik.com/free-photo/portrait-hindu-bride-traditional-red-sari-with-golden-acce_8353-8861.jpg?semt=ais_hybrid&w=740',
                      description: 'Jewelry',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                  ],
                ),

                // Kids Tab
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: gridCount,
                  padding: EdgeInsets.all(gridPadding),
                  crossAxisSpacing: gridPadding,
                  mainAxisSpacing: gridPadding,
                  children: const [
                    CardView(
                      imageUrl:
                          'https://img.freepik.com/free-photo/front-view-cute-child-boy-white-t-shirt-yellow-jeans-holding-green-skateboard-blue-floor_179666-1008.jpg?semt=ais_hybrid&w=740',
                      description: 'T-Shirts',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9E_eOxKxAIoSzXqSniV3eeX9KICw76lS6Fw&s',
                      description: 'Toys',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                          'https://static.vecteezy.com/system/resources/thumbnails/026/442/540/small/sports-shoes-for-kids-generative-ai-photo.jpg',
                      description: 'Shoes',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                          'https://atlas-content-cdn.pixelsquid.com/stock-images/childrens-books-hardcover-book-4GMB1WA-600.jpg',
                      description: 'Books',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                          'https://img.freepik.com/free-photo/front-view-cute-child-boy-white-t-shirt-yellow-jeans-holding-green-skateboard-blue-floor_179666-1008.jpg?semt=ais_hybrid&w=740',
                      description: 'T-Shirts',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9E_eOxKxAIoSzXqSniV3eeX9KICw76lS6Fw&s',
                      description: 'Toys',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                          'https://static.vecteezy.com/system/resources/thumbnails/026/442/540/small/sports-shoes-for-kids-generative-ai-photo.jpg',
                      description: 'Shoes',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                          'https://atlas-content-cdn.pixelsquid.com/stock-images/childrens-books-hardcover-book-4GMB1WA-600.jpg',
                      description: 'Books',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class CardView extends StatefulWidget {
  final String imageUrl;
  final String description;
  final double price;
  final double rating;
  final int reviewCount;

  const CardView({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviewCount,
  });

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust font sizes and icon sizes based on screen width
    double priceFontSize = screenWidth < 350 ? 14 : 16;
    double descriptionFontSize = screenWidth < 350 ? 12 : 14;
    double ratingFontSize = screenWidth < 350 ? 12 : 14;
    double iconSize = screenWidth < 350 ? 14 : 16;
    double heartIconSize = screenWidth < 350 ? 20 : 24;

    return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.white,
                      size: heartIconSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$${widget.price.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: priceFontSize),
                    ),
                    Text(
                      widget.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: descriptionFontSize),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, size: iconSize, color: Colors.orange),
                        const SizedBox(width: 4),
                        Text(
                          "${widget.rating} (${widget.reviewCount} Reviews)",
                          style: TextStyle(fontSize: ratingFontSize),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // SizedBox(
                    //   width: double.infinity,
                    //   height: 36,
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //
                    //       ScaffoldMessenger.of(context).showSnackBar(
                    //         SnackBar(
                    //           content:
                    //               Text('${widget.description} added to cart.'),
                    //         ),
                    //       );
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(8)),
                    //     ),
                    //     child: const Text(
                    //       'Add to Cart',
                    //       style: TextStyle(fontWeight: FontWeight.bold),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ))
        ]));
  }
}
