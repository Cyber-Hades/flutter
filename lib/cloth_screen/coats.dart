import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:task1/rootscreen/rootscreen.dart';
class Coats extends StatelessWidget {
  const Coats({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar:
        //Appbar
        AppBar(
          backgroundColor: Color(0xfff9ecd7),
          automaticallyImplyLeading: false,
          elevation: 1,
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RootScreen()));
              },
              icon: Icon(Icons.arrow_back_ios_new)),
          title: const Text(
            "Coats and Jackets",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),

        body: Column(children: [
          //Tabs
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
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(8),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: const [
                    CardView(
                      imageUrl:
                      'https://assets.myntassets.com/w_412,q_60,dpr_2,fl_progressive/assets/images/2025/APRIL/23/EXXXen0w_681c15a4ecde49d788eaf1f234d1b455.jpg',
                      description: 'Coats',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                      'https://assets.myntassets.com/w_412,q_60,dpr_2,fl_progressive/assets/images/2024/NOVEMBER/28/kZXkrVOH_e597f94b58d74d298164c16f6e618cb7.jpg',
                      description: 'Jackets',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                      'https://m.media-amazon.com/images/I/61tyZpT2COL._AC_UY1100_.jpg',
                      description: 'Coats',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                      'https://devotedstore.com/cdn/shop/files/DVT04111_1.jpg?v=1741216811&width=1080',
                      description: 'Jackets',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                      'https://assets.myntassets.com/w_412,q_60,dpr_2,fl_progressive/assets/images/2025/APRIL/23/EXXXen0w_681c15a4ecde49d788eaf1f234d1b455.jpg',
                      description: 'Coats',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                      'https://assets.myntassets.com/w_412,q_60,dpr_2,fl_progressive/assets/images/2024/NOVEMBER/28/kZXkrVOH_e597f94b58d74d298164c16f6e618cb7.jpg',
                      description: 'Jackets',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                      'https://m.media-amazon.com/images/I/61tyZpT2COL._AC_UY1100_.jpg',
                      description: 'Coats',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                      'https://devotedstore.com/cdn/shop/files/DVT04111_1.jpg?v=1741216811&width=1080',
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
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(8),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: const [
                    CardView(
                      imageUrl:
                      'https://images-cdn.ubuy.co.in/635bcdadf4f8bc21cc0b1437-prinxy-coats-black-friday-clearance.jpg',
                      description: 'Coats',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                      'https://contents.mediadecathlon.com/p2688009/77008052fc9a71bd08f1b25a769c5673/p2688009.jpg',
                      description: 'Jackets',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                      'https://imagescdn.vanheusenindia.com/img/app/product/3/39828839-16497047.jpg?auto=format&w=390',
                      description: 'Coats',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                      'https://levi.in/cdn/shop/files/002V90000_2.jpg?v=1734021526&width=1445',
                      description: 'Jackets',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                      'https://images-cdn.ubuy.co.in/635bcdadf4f8bc21cc0b1437-prinxy-coats-black-friday-clearance.jpg',
                      description: 'Coats',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                      'https://contents.mediadecathlon.com/p2688009/77008052fc9a71bd08f1b25a769c5673/p2688009.jpg',
                      description: 'Jackets',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                      'https://imagescdn.vanheusenindia.com/img/app/product/3/39828839-16497047.jpg?auto=format&w=390',
                      description: 'Coats',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                      'https://levi.in/cdn/shop/files/002V90000_2.jpg?v=1734021526&width=1445',
                      description: 'Jackets',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                  ],
                ),

                // Kids Tab
                 GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(8),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: const [
                    CardView(
                      imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS49PP5OQXNz5n4mCl6_PVwsSyFdUkPZzMtEg&s',
                      description: 'Coats',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnUGYRSenxlG2z4ImiiyFHuPjyyuBkbyDkoA&s',
                      description: 'Jackets',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjAJkgOSrIML90MI-oqsa5qfuFLAsxtzsDsg&s',
                      description: 'Coats',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1iSziw2DjYA9tiMV-fAusEWQ9Nnhhh7c37w&s',
                      description: 'Jackets',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS49PP5OQXNz5n4mCl6_PVwsSyFdUkPZzMtEg&s',
                      description: 'Coats',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnUGYRSenxlG2z4ImiiyFHuPjyyuBkbyDkoA&s',
                      description: 'Jackets',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjAJkgOSrIML90MI-oqsa5qfuFLAsxtzsDsg&s',
                      description: 'Coats',
                      price: 30.0,
                      rating: 4.2,
                      reviewCount: 12,
                    ),
                    CardView(
                      imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1iSziw2DjYA9tiMV-fAusEWQ9Nnhhh7c37w&s',
                      description: 'Jackets',
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

        // bottomNavigationBar: Container(
        //   height: 72,
        //   decoration: BoxDecoration(
        //     color: Color(0xfffdf4e0),
        //     borderRadius: const BorderRadius.only(
        //       topLeft: Radius.circular(20),
        //       topRight: Radius.circular(20),
        //     ),
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       Column(
        //         children: [
        //           IconButton(
        //             enableFeedback: false,
        //             onPressed: () {
        //               Navigator.push(
        //                   context, MaterialPageRoute(builder: (context) => RootScreen()));
        //             },
        //             icon: const Icon(
        //               Icons.home,
        //               color: Colors.black,
        //               size: 30,
        //             ),
        //           ),
        //           Text("Home"),
        //         ],
        //       ),
        //       Column(
        //         children: [
        //           IconButton(
        //             enableFeedback: false,
        //             onPressed: () {
        //               Navigator.push(
        //                   context, MaterialPageRoute(builder: (context) => CategoryScreen()));
        //             },
        //             icon: const Icon(
        //               Iconsax.category,
        //               color: Colors.black,
        //               size: 30,
        //             ),
        //           ),
        //           Text("Category")
        //         ],
        //       ),
        //       Column(
        //         children: [
        //           IconButton(
        //             enableFeedback: false,
        //             onPressed: () {},
        //             icon: const Icon(
        //               Iconsax.activity,
        //               color: Colors.black,
        //               size: 30,
        //             ),
        //           ),
        //           Text("Feed")
        //         ],
        //       ),
        //       Column(
        //         children: [
        //           IconButton(
        //             enableFeedback: false,
        //             onPressed: () {
        //               Navigator.push(
        //                   context, MaterialPageRoute(builder: (context) => MyordersScreen()));
        //             },
        //             icon: const Icon(
        //               Iconsax.box,
        //               color: Colors.black,
        //               size: 30,
        //             ),
        //           ),
        //           Text("My Orders")
        //         ],
        //       ),
        //       Column(
        //         children: [
        //           IconButton(
        //             enableFeedback: false,
        //             onPressed: () {
        //               Navigator.push(
        //                   context, MaterialPageRoute(builder: (context) => ProfileScreen()));
        //             },
        //             icon: const Icon(
        //               Iconsax.profile_2user,
        //               color: Colors.black,
        //               size: 30,
        //             ),
        //           ),
        //           Text("Profile")
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
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
    return Card(
      //clipBehavior: Clip.antiAliasWithSaveLayer,
      //semanticContainer: true,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          // Image with heart icon
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
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Description
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$${widget.price.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    widget.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.orange),
                      const SizedBox(width: 4),
                      Text("${widget.rating} (${widget.reviewCount} Reviews)"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
