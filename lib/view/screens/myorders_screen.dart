import 'package:flutter/material.dart';
import 'package:task1/rootscreen/rootscreen.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //CompleteOrder
    final List<Map<String, String>> completedOrders = [
      {'name': 'Shirt', 'orderId': 'C123'},
      {'name': 'Shoes', 'orderId': 'C124'},
      {'name': 'Cap', 'orderId': 'C125'},
      {'name': 'Jeans', 'orderId': 'C126'},
    ];

    //CancelOrder
    final List<Map<String, String>> cancelledOrders = [
      {'name': 'Watch', 'orderId': 'X101'},
      {'name': 'Jacket', 'orderId': 'X102'},
      {'name': 'Bag', 'orderId': 'X103'},
    ];

    //RequestedOrder
    final List<Map<String, String>> requestedOrders = [
      {'name': 'T-shirt', 'orderId': 'R200'},
      {'name': 'Hat', 'orderId': 'R201'},
      {'name': 'Belt', 'orderId': 'R202'},
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xfff9ecd7),
          elevation: 1,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RootScreen()),
              );
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          ),
          title: const Text(
            "Orders",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            const TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.blue,
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              unselectedLabelStyle:
              TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
              tabs: [
                Tab(text: 'Completed'),
                Tab(text: 'Cancelled'),
                Tab(text: 'Requested'),
              ],
            ),
            
            Expanded(
              child:
              TabBarView(
                children: [
                  buildOrderList(completedOrders, "Completed", Colors.green),
                  buildOrderList(cancelledOrders, "Cancelled", Colors.red),
                  buildOrderList(requestedOrders, "Requested", Colors.orange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOrderList(
      List<Map<String, String>> orders, String status, Color statusColor) {
    return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final order = orders[index];
          final name = order['name'] ?? 'Unknown';
          final orderId = order['orderId'] ?? 'N/A';

          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              leading: CircleAvatar(
                backgroundColor: statusColor.withOpacity(0.1),
                child: Icon(Icons.shopping_bag, color: statusColor),
              ),
              title: Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text("Order ID: $orderId"),
                  const SizedBox(height: 2),
                  //Status
                  Text(
                    "Status: $status",
                    style: TextStyle(color: statusColor),
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          );
          },
        );
    }
}
