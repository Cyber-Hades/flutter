import 'package:flutter/material.dart';
import 'package:task1/rootscreen/rootscreen.dart';
import 'package:task1/view/auth/login.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define responsive sizes and font sizes
    final double avatarSize = screenWidth * 0.25; // 25% of screen width
    final double nameFontSize = screenWidth * 0.065; // approx 18-25 for typical phones
    final double dobFontSize = screenWidth * 0.04; // smaller font for DOB
    final double sectionTitleFontSize = screenWidth * 0.04;
    final double listTileFontSize = screenWidth * 0.045;
    final double notificationBadgeFontSize = screenWidth * 0.035;
    final double appBarHeight = screenHeight * 0.08;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
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
                      iconSize: screenWidth * 0.07,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const RootScreen()));
                      },
                      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: nameFontSize,
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
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.015),
            Center(
              child: ClipOval(
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQUGFewLGLBNfPMLcAHwdSwiQyoczL7VoCow&s",
                  width: avatarSize,
                  height: avatarSize,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Center(
              child: Column(
                children: [
                  Text(
                    "Jane Doe",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: nameFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.003),
                  Text(
                    "9 May 1998",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: dobFontSize,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.04),

            // Notifications
            ListTile(
              leading: Icon(Icons.notifications, size: screenWidth * 0.07),
              title: Text(
                "Notifications",
                style: TextStyle(fontSize: listTileFontSize),
              ),
              trailing: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03,
                  vertical: screenHeight * 0.005,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "3",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: notificationBadgeFontSize,
                  ),
                ),
              ),
              onTap: () {},
            ),

            // Password Update
            ListTile(
              leading: Icon(Icons.lock, size: screenWidth * 0.07),
              title: Text(
                "Password Update",
                style: TextStyle(fontSize: listTileFontSize),
              ),
              trailing: Icon(Icons.chevron_right, size: screenWidth * 0.07),
              onTap: () {},
            ),

            // Section: Geography
            Padding(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.04, screenHeight * 0.02, 0, screenHeight * 0.01),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Geography".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: sectionTitleFontSize,
                  ),
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.location_on, size: screenWidth * 0.07),
              title: Text(
                "Change location",
                style: TextStyle(fontSize: listTileFontSize),
              ),
              trailing: Icon(Icons.chevron_right, size: screenWidth * 0.07),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.language, size: screenWidth * 0.07),
              title: Text(
                "Change language",
                style: TextStyle(fontSize: listTileFontSize),
              ),
              trailing: Icon(Icons.chevron_right, size: screenWidth * 0.07),
              onTap: () {},
            ),

            // Section: Membership
            Padding(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.04, screenHeight * 0.02, 0, screenHeight * 0.01),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Membership".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: sectionTitleFontSize,
                  ),
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.card_giftcard, size: screenWidth * 0.07),
              title: Text(
                "Loyalty Cards",
                style: TextStyle(fontSize: listTileFontSize),
              ),
              trailing: Icon(Icons.chevron_right, size: screenWidth * 0.07),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.verified_user, size: screenWidth * 0.07),
              title: Text(
                "Membership",
                style: TextStyle(fontSize: listTileFontSize),
              ),
              trailing: Icon(Icons.chevron_right, size: screenWidth * 0.07),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.file_copy, size: screenWidth * 0.07),
              title: Text(
                "Certificates",
                style: TextStyle(fontSize: listTileFontSize),
              ),
              trailing: Icon(Icons.chevron_right, size: screenWidth * 0.07),
              onTap: () {},
            ),
            SizedBox(height: screenHeight * 0.03), // some space before bottom button
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: Size(double.infinity, screenHeight * 0.09),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: Text(
              "Log out",
              style: TextStyle(
                color: Colors.white,
                fontSize: listTileFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
