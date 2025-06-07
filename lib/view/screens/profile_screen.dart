import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:task1/rootscreen/rootscreen.dart';
import 'package:task1/view/auth/login.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
        PreferredSize(
        preferredSize: const Size.fromHeight(58),// Custom height
        child:AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xfff9ecd7),
        flexibleSpace: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              children: [
                IconButton(onPressed: (){Navigator.push(
                    context, MaterialPageRoute(builder: (context) => RootScreen()));}, icon: Icon(Icons.arrow_back_ios_new)
                ),

              ],
            ),
            Center(
              child: Text("Profile",
                  style: TextStyle
                    (color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold
                  )
              ),
            )
          ],
        )
    ),
      ),
        ),
      body: SingleChildScrollView(
        child: Column(
          children:[
            SizedBox(height: 10,),
            Center(
            child: ClipOval(
              child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQUGFewLGLBNfPMLcAHwdSwiQyoczL7VoCow&s",
                width: 100,height: 100,fit: BoxFit.cover),
            ),
          ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: 5,),
                  Text("Jane Doe",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                  Text("9 May 1998",style: TextStyle(color: Colors.black,fontSize: 15),)
                ],
              ),
            ),
            SizedBox(height: 30),

            // Notifications
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notifications"),
              trailing: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text("3", style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
              onTap: () {},
            ),

            // Password Update
            ListTile(
              leading: Icon(Icons.lock),
              title: Text("Password Update"),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),

            // Section: Geography
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 0, 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Geography".toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
              ),
            ),

            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Change location"),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text("Change language"),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),

            // Section: Membership
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 0, 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Membership".toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
              ),
            ),

            ListTile(
              leading: Icon(Icons.card_giftcard),
              title: Text("Loyalty Cards"),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text("Membership"),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.file_copy),
              title: Text("Certificates"),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),

          ]

        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: Size.fromHeight(50),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Text("Log out", style: TextStyle(color: Colors.white,fontSize: 16)),
          ),
        ),
      ),

    );
  }
}
