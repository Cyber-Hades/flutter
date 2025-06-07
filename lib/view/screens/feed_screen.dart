import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:task1/rootscreen/rootscreen.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final promoImages = [
      "https://emotive.io/assets/blog/online-advertising-ecommerce.jpeg",
      "https://emotive.io/assets/blog/online-advertising-ecommerce.jpeg",
      "https://emotive.io/assets/blog/online-advertising-ecommerce.jpeg",
    ];

    final categories = [
      {'icon': Icons.watch, 'label': 'Watches'},
      {'icon': Icons.chair, 'label': 'Furniture'},
      {'icon': Icons.headphones, 'label': 'Audio'},
      {'icon': Icons.phone_iphone, 'label': 'Phones'},
      {'icon': Icons.laptop, 'label': 'Laptops'},
      {'icon': Icons.tv, 'label': 'TVs'},
      {'icon': Icons.book, 'label': 'Books'},
      {'icon': Icons.more_horiz, 'label': 'More'},
    ];

    final flashSales = [
      {'name': 'Smart Watch', 'price': '₹1999', 'img': 'https://media.istockphoto.com/id/486993228/photo/smart-watch.jpg?s=612x612&w=0&k=20&c=dVKA7YSTjnhzYAoYcxDwGEuV18QV-K-YuZCABnjt8pE='},
      {'name': 'Wireless Earbuds', 'price': '₹999', 'img': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxE2ieyJmZPE9lA1UY6VCqaNlj7pdkQLY4BA&s'},
    ];

    final recommended = [
      {'name': 'Backpack', 'price': '₹799', 'img': 'https://img.freepik.com/free-psd/stylish-orange-backpack-trendy-travel-bag_84443-43930.jpg?semt=ais_hybrid&w=740'},
      {'name': 'Sunglasses', 'price': '₹499', 'img': 'https://img.freepik.com/free-psd/elegant-black-gold-sunglasses-stylish-accessory_191095-79382.jpg?semt=ais_items_boosted&w=740'},
      {'name': 'Sneakers', 'price': '₹1499', 'img': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG-BGUQPQQHTcFy0khno6vmkEi3ZET1pE4vw&s'},
    ];

    return Scaffold(
        appBar:  AppBar(
          backgroundColor: const Color(0xfff9ecd7),
          elevation: 1,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RootScreen()),
              );
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          ),
          title: const Text(
            "Feed",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Banners
                Container(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: CarouselSlider(
                    items: promoImages.map((url) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(url, fit: BoxFit.cover, width: double.infinity),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      enlargeCenterPage: true,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Categories
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text("Top Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    physics: const NeverScrollableScrollPhysics(),
                    children: categories.map((cat) {
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.grey.shade200,
                            child: Icon(cat['icon'] as IconData, size: 24, color: Colors.black),
                          ),
                          const SizedBox(height: 6),
                          Text(cat['label'] as String, style: const TextStyle(fontSize: 12)),
                        ],
                      );
                    }).toList(),
                  ),
                ),

                // Flash Sale
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text("Flash Sale", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: flashSales.length,
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      final item = flashSales[index];
                      return Container(
                        width: 140,
                        margin: const EdgeInsets.only(right: 12),
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                child: Image.network(item['img']!, height:70,width: double.infinity, fit: BoxFit.cover),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 4),
                                    Text(item['price']!, style: const TextStyle(color: Colors.red)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Recommended
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text("Recommended for You", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: recommended.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 3 / 4,
                    ),
                    itemBuilder: (context, index) {
                      final item = recommended[index];
                      return Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                              child: Image.network(item['img']!, height: 120, width: double.infinity, fit: BoxFit.cover),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 4),
                                  Text(item['price']!, style: const TextStyle(color: Colors.black54)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            ),
        );
    }
}
