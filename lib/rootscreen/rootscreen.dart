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
  late stt.SpeechToText _speech = stt.SpeechToText();
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
    bool available = await _speech.initialize(
      onStatus: (status) {
        print('Speech status: $status');
        if (status == 'done' || status == 'notListening') {
          setState(() => _isListening = false);
          _speech.stop();
        }
      },
      onError: (error) {
        print('Speech error: $error');
        setState(() => _isListening = false);
      },
    );

    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (val) {
          setState(() {
            _searchController.text = val.recognizedWords;
          });
        },
      );
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
        preferredSize: Size.fromHeight(
            MediaQuery.of(context).size.height * 0.07), // ~50 on average device
        child: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          elevation: 0,
          backgroundColor: Colors.deepOrange.shade200,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu,
                    color: Colors.black,
                    size: MediaQuery.of(context).size.width * 0.06),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Text(
            "Hello, Let's Shop",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.width * 0.045,
            ),
          ),
          actions: [
            //Cart
            IconButton(
              icon: Icon(Iconsax.shopping_cart,
                  color: Colors.black,
                  size: MediaQuery.of(context).size.width * 0.06),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
            ),
            //Wishlist
            IconButton(
              icon: Icon(Iconsax.heart,
                  color: Colors.red,
                  size: MediaQuery.of(context).size.width * 0.06),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WishlistScreen()));
              },
            ),
          ],
        ),
      ),
      // Drawer
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.white),
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.08,
                    backgroundImage: const NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQUGFewLGLBNfPMLcAHwdSwiQyoczL7VoCow&s',
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    'XyberWeb',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Main List Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildTile(
                    icon: Icons.home_filled,
                    title: 'Dashboard',
                    trailing: Icon(Icons.chevron_right,
                        size: MediaQuery.of(context).size.width * 0.05),
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
                      size: MediaQuery.of(context).size.width * 0.05,
                    ),
                  ),
                  if (_showOrdersSubList)
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.08),
                      child: Column(
                        children: [
                          _buildSubTile(
                            title: 'Order List',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyOrdersScreen()));
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
                    trailing: Icon(Icons.chevron_right,
                        size: MediaQuery.of(context).size.width * 0.05),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryScreen()));
                    },
                  ),
                  _buildTile(
                    icon: Icons.headset_mic_sharp,
                    title: 'Customer',
                    trailing: Icon(Icons.chevron_right,
                        size: MediaQuery.of(context).size.width * 0.05),
                    onTap: () {},
                  ),
                  _buildTile(
                    icon: Iconsax.wallet,
                    title: 'Buyer',
                    trailing: Icon(Icons.chevron_right,
                        size: MediaQuery.of(context).size.width * 0.05),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()));
                    },
                  ),
                  _buildTile(
                    icon: Iconsax.book_copy,
                    title: 'Invoices',
                    trailing: Icon(Icons.chevron_right,
                        size: MediaQuery.of(context).size.width * 0.05),
                    onTap: () {},
                  ),
                ],
              ),
            ),

            // Footer
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Column(
                children: [
                  Text('Version 1.0.0',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: MediaQuery.of(context).size.width * 0.035)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                  Text('Powered by XyberWeb',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: MediaQuery.of(context).size.width * 0.035)),
                ],
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Search bar and icons
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: MediaQuery.of(context).size.height * 0.015,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.03),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: MediaQuery.of(context).size.width * 0.06,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search for clothes, brands...',
                          hintStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                        size: MediaQuery.of(context).size.width * 0.06,
                      ),
                      onPressed: _openCamera,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.mic,
                        color: Colors.black,
                        size: MediaQuery.of(context).size.width * 0.06,
                      ),
                      onPressed: _startListening,
                    ),
                  ],
                ),
              ),
            ),
            // CarouselSlider
            CarouselSlider(
              items: [
                for (final imageUrl in [
                  "https://t3.ftcdn.net/jpg/04/91/02/60/360_F_491026081_fgVXSXQLfNA7eDERd17vWFcKFs1UJVbV.jpg",
                  "https://media.istockphoto.com/id/178378746/photo/happy-man-pushing-a-shopping-cart.jpg?s=612x612&w=0&k=20&c=SNuvrh9z-Zr1vamvQ-ueOs-q4N38n3OafGGn6kETMYk=",
                  "https://poweradspy.com/wp-content/uploads/2022/03/What-is-eCommerce-Advertising.webp",
                ])
                  Container(
                    margin: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.02),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.25,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            // COD, Free Delivery, Lowest Price Row
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.09, // ~70
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildFeatureIcon(
                      context,
                      icon: Iconsax.wallet,
                      color: Colors.green.shade600,
                      iconColor: Colors.green.shade50,
                      label: "Cash on\nDelivery",
                    ),
                    _buildFeatureIcon(
                      context,
                      icon: Iconsax.truck,
                      color: Colors.orange.shade600,
                      iconColor: Colors.orange.shade50,
                      label: "Free Delivery\nFree Returns",
                    ),
                    _buildFeatureIcon(
                      context,
                      icon: Iconsax.tag,
                      color: Colors.yellow.shade600,
                      iconColor: Colors.yellow.shade50,
                      label: "Lowest\nPrice",
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

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
                  categoryItem(
                    context: context,
                    imageUrl:
                        'https://d1fufvy4xao6k9.cloudfront.net/images/blog/posts/2023/09/small_278a3411_1__23_.jpg',
                    label: "Coats and Jackets",
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Coats()));
                    },
                  ),
                  categoryItem(
                    context: context,
                    imageUrl:
                        'https://www.india.com/wp-content/uploads/2024/05/Mens-fashion.png',
                    label: "Men's Fashion",
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Coats()));
                    },
                  ),
                  categoryItem(
                    context: context,
                    imageUrl:
                        'https://assets.ajio.com/medias/sys_master/root/20240507/mdc0/663a557116fd2c6e6af0ef6f/-473Wx593H-467293008-brown-MODEL.jpg',
                    label: "Shirts",
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Coats()));
                    },
                  ),
                  categoryItem(
                    context: context,
                    imageUrl:
                        'https://media.istockphoto.com/id/533714204/photo/businessman-checking-time-from-watch.jpg?s=612x612&w=0&k=20&c=bJN94WW68Rw8uEogp3GKtBYnhcrNFNnf1SkWb0KDvGo=',
                    label: "Watches",
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Coats()));
                    },
                  ),
                  categoryItem(
                    context: context,
                    imageUrl:
                        'https://baccabucci.com/cdn/shop/products/MG_5242.jpg?v=1633514122',
                    label: "Shoes",
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Coats()));
                    },
                  ),
                  categoryItem(
                    context: context,
                    imageUrl:
                        'https://i.etsystatic.com/15746647/r/il/f132f9/5628677542/il_1080xN.5628677542_lh9m.jpg',
                    label: "Bags",
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Coats()));
                    },
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),

      //Bottom
      bottomNavigationBar: Container(
        height:
            MediaQuery.of(context).size.height * 0.09, // ~72 on average phone
        decoration: BoxDecoration(
          color: Colors.deepOrange.shade50,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.05),
            topRight: Radius.circular(MediaQuery.of(context).size.width * 0.05),
          ),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Home
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RootScreen()),
                    );
                  },
                  icon: Icon(
                    Icons.home,
                    color: Colors.black,
                    size: MediaQuery.of(context).size.width * 0.07,
                  ),
                ),
                Text(
                  "Home",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035),
                ),
              ],
            ),

            // Category
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CategoryScreen()),
                    );
                  },
                  icon: Icon(
                    Iconsax.category,
                    color: Colors.black,
                    size: MediaQuery.of(context).size.width * 0.07,
                  ),
                ),
                Text(
                  "Category",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035),
                ),
              ],
            ),

            // My Orders
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyOrdersScreen()),
                    );
                  },
                  icon: Icon(
                    Iconsax.box,
                    color: Colors.black,
                    size: MediaQuery.of(context).size.width * 0.07,
                  ),
                ),
                Text(
                  "My Orders",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035),
                ),
              ],
            ),

            // Profile
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  icon: Icon(
                    Iconsax.profile_2user,
                    color: Colors.black,
                    size: MediaQuery.of(context).size.width * 0.07,
                  ),
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035),
                ),
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

Widget _buildFeatureIcon(BuildContext context,
    {required IconData icon,
    required Color color,
    required Color iconColor,
    required String label}) {
  return Row(
    children: [
      CircleAvatar(
        radius: MediaQuery.of(context).size.width * 0.05, // ~20
        backgroundColor: color,
        child: Icon(icon,
            color: iconColor, size: MediaQuery.of(context).size.width * 0.05),
      ),
      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
      Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.03,
        ),
      ),
    ],
  );
}

Widget categoryItem({
  required BuildContext context,
  required String imageUrl,
  required String label,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              imageUrl,
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
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 20,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              padding: EdgeInsets.only(bottom: 8, left: 8, right: 8),
              alignment: Alignment.bottomCenter,
              child: Text(
                label,
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
  );
}
