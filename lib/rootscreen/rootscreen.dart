import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:task1/cloth_screen/coats.dart';
import 'package:task1/view/screens/cart_screen.dart';
import 'package:task1/view/screens/category_screen.dart';
import 'package:task1/view/screens/feed_screen.dart';
import 'package:task1/view/screens/myorders_screen.dart';
import 'package:task1/view/screens/profile_screen.dart';
import 'package:task1/view/screens/wishlist_screen.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  late stt.SpeechToText _speech =stt.SpeechToText();
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  Future<void> _openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      print("Image Path: ${image.path}");
    }
  }

  Future<void> _startListening() async {
    bool available = await _speech.initialize();
    if (available) {
      setState(() => _isListening = true);
      _speech.listen(onResult: (val) {
        setState(() {
          _searchController.text = val.recognizedWords;
        });
      });
    } else {
      print("The user has denied the use of speech recognition.");
    }
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _showOrdersSubList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50), // Custom height
        child:
            //Appbar
            AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          elevation: 0,
          backgroundColor: Colors.deepOrange.shade200,
          //menu Icon
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          //Title
          title: const Text(
            "Hello, Let's Shop",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          actions: [
            //Shopping Cart
            IconButton(
              icon: const Icon(Iconsax.shopping_cart, color: Colors.black),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
            ),

            //Heart Icon
            IconButton(
              icon: const Icon(Iconsax.heart, color: Colors.red),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WishlistScreen()));
              },
            ),
          ],
        ),
      ),
      //Drawer
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            // Drawer Header with Image + Name
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.white),
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQUGFewLGLBNfPMLcAHwdSwiQyoczL7VoCow&s'),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'XyberWeb',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // Expanded List
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildTile(
                    icon: Icons.home_filled,
                    title: 'Dashboard',
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  _buildTile(
                    icon: Iconsax.box,
                    title: 'Orders',
                    onTap: () {
                      setState(() {
                        _showOrdersSubList = !_showOrdersSubList;
                      });
                    },
                    trailing: Icon(
                      _showOrdersSubList
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                  ),

                  // Sublist: Only show if toggled
                  if (_showOrdersSubList)
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        children: [
                          _buildSubTile(
                            title: 'Order List',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyOrdersScreen(),
                                  ));
                            },
                          ),
                          _buildSubTile(
                            title: 'Recent Orders',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),

                  _buildTile(
                    icon: Iconsax.box_add,
                    title: 'Products',
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryScreen(),
                          ));
                    },
                  ),
                  _buildTile(
                    icon: Icons.headset_mic_sharp,
                    title: 'Customer',
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  _buildTile(
                    icon: Iconsax.wallet,
                    title: 'Buyer',
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ));
                    },
                  ),
                  _buildTile(
                    icon: Iconsax.book_copy,
                    title: 'Invoices',
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                ],
              ),
            ),

            // Footer
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: const [
                  Text('Version 1.0.0', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 4),
                  Text('Powered by XyberWeb',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          //color: Colors.white,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //Search bar and icons
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search for clothes, brands...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.camera_alt, color: Colors.black),
                      onPressed: _openCamera,
                    ),
                    IconButton(
                      icon: Icon(Icons.mic, color: Colors.black),
                      onPressed: _startListening,
                    ),
                  ],
                ),
              ),
            ),

            //Sliding images
            CarouselSlider(
              items: [
                //1st Image of Slider
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://t3.ftcdn.net/jpg/04/91/02/60/360_F_491026081_fgVXSXQLfNA7eDERd17vWFcKFs1UJVbV.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //2nd Image of Slider
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://media.istockphoto.com/id/178378746/photo/happy-man-pushing-a-shopping-cart.jpg?s=612x612&w=0&k=20&c=SNuvrh9z-Zr1vamvQ-ueOs-q4N38n3OafGGn6kETMYk="),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //3rd Image of Slider
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://poweradspy.com/wp-content/uploads/2022/03/What-is-eCommerce-Advertising.webp"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              //Slider Container properties
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),

            const SizedBox(height: 16),

            //COD container
            Container(
              color: Colors.white,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //COD
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.green.shade600,
                          child:
                              Icon(Iconsax.wallet, color: Colors.green.shade50),
                        ),
                        SizedBox(width: 8),
                        Text("Cash on\nDelivery",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    //Free Delivery
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.orange.shade600,
                          child:
                              Icon(Iconsax.truck, color: Colors.orange.shade50),
                        ),
                        SizedBox(width: 8),
                        Text("Free Delivery\nFree Returns",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    //Lowest Price
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.yellow.shade600,
                          child:
                              Icon(Iconsax.tag, color: Colors.yellow.shade50),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text("Lowest\nPrice",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 24),

            // "Shop by Category" Title Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Shop by Category",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      )),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryScreen()));
                    },
                    child: const Text(
                      'View All',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),

            // GridView for categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  // Each grid item

                  //Coats and jackets
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Coats()));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.network(
                              'https://d1fufvy4xao6k9.cloudfront.net/images/blog/posts/2023/09/small_278a3411_1__23_.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.7),
                                    Colors.transparent,
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(0.5), // shadow color
                                    blurRadius: 30, // soften the shadow
                                    offset:
                                        Offset(0, -4), // position of the shadow
                                  ),
                                ],
                              ),
                              padding:
                                  EdgeInsets.only(bottom: 8, left: 8, right: 8),
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Coats and Jackets",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Mens Fashion
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Coats()));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.network(
                              'https://www.india.com/wp-content/uploads/2024/05/Mens-fashion.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(1.0),
                                    Colors.transparent,
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(0.5), // shadow color
                                    blurRadius: 30, //often the shadow
                                    offset:
                                        Offset(0, -4), // position of the shadow
                                  ),
                                ],
                              ),
                              padding:
                                  EdgeInsets.only(bottom: 8, left: 8, right: 8),
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Men's Fashion",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Shirts
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Coats()));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.network(
                              'https://assets.ajio.com/medias/sys_master/root/20240507/mdc0/663a557116fd2c6e6af0ef6f/-473Wx593H-467293008-brown-MODEL.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(1.0),
                                    Colors.transparent,
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(0.2), // shadow color
                                    blurRadius: 20, //
                                    offset:
                                        Offset(0, -4), // position of the shadow
                                  ),
                                ],
                              ),
                              padding:
                                  EdgeInsets.only(bottom: 8, left: 8, right: 8),
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Shirts",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Watches
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Coats()));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.network(
                              'https://media.istockphoto.com/id/533714204/photo/businessman-checking-time-from-watch.jpg?s=612x612&w=0&k=20&c=bJN94WW68Rw8uEogp3GKtBYnhcrNFNnf1SkWb0KDvGo=',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.7),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                              padding:
                                  EdgeInsets.only(bottom: 8, left: 8, right: 8),
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Watches",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Shoes
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Coats()));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.network(
                              'https://baccabucci.com/cdn/shop/products/MG_5242.jpg?v=1633514122',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            height: 50, // height of shadow box
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.7),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                              padding:
                                  EdgeInsets.only(bottom: 8, left: 8, right: 8),
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Shoes",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Bags
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Coats()));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.network(
                              'https://i.etsystatic.com/15746647/r/il/f132f9/5628677542/il_1080xN.5628677542_lh9m.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.7),
                                    Colors.transparent,
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(0.8), // shadow color
                                    blurRadius: 10, // soften the shadow
                                    offset:
                                        Offset(0, -4), // position of the shadow
                                  ),
                                ],
                              ),
                              padding:
                                  EdgeInsets.only(bottom: 8, left: 8, right: 8),
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "Bags",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),

      //Bottom
      bottomNavigationBar: Container(
        height: 72,
        decoration: BoxDecoration(
          color: Colors.deepOrange.shade50,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),

        //Icons
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Home
            Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RootScreen()));
                  },
                  icon: const Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                Text("Home"),
              ],
            ),

            //Category
            Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryScreen()));
                  },
                  icon: const Icon(
                    Iconsax.category,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                Text("Category")
              ],
            ),

            //Feed
            // Column(
            //   children: [
            //     IconButton(
            //       enableFeedback: false,
            //       onPressed: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => FeedScreen()));
            //       },
            //       icon: const Icon(
            //         Iconsax.activity,
            //         color: Colors.black,
            //         size: 30,
            //       ),
            //     ),
            //     Text("Feed")
            //   ],
            // ),

            //My Orders
            Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyOrdersScreen()));
                  },
                  icon: const Icon(
                    Iconsax.box,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                Text("My Orders")
              ],
            ),

            //Profile
            Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  },
                  icon: const Icon(
                    Iconsax.profile_2user,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                Text("Profile")
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<SpeechToText>('_speech', _speech));
  }
}

Widget _buildTile({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
  Widget? trailing,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    child: ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      trailing: trailing,
      onTap: onTap,
    ),
  );
}

Widget _buildSubTile({
  required String title,
  required VoidCallback onTap,
}) {
  return ListTile(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        const Icon(Icons.chevron_right, size: 18),
      ],
    ),
    contentPadding: const EdgeInsets.only(left: 16, right: 16),
    onTap: onTap,
  );
}
