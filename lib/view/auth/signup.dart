import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task1/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:task1/rootscreen/rootscreen.dart';
import 'package:task1/view/auth/login.dart';
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = const Color(0xFFF6F6F6);
    final Color buttonColor = const Color(0xFFBDF42A); // Light green
    final Color borderColor = Colors.grey.shade300;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset("assets/images/logos.png",
                  width: 150, // resize as needed
                  fit: BoxFit.cover,
                ),
                const Text(
                  'Welcome to E-commerce',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Sign up or login bellow to manage your\nproject, task, and productivity',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),

                // Tab
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    }, child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold)),),
                    const SizedBox(width: 16),
                    TextButton(onPressed: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => SignupScreen()));
                    }, child: Text("Sign Up", style: TextStyle(color: Colors.grey.shade600)),)

                  ],
                ),
                const SizedBox(height: 20),

                // Signup with Apple
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Your logic
                      },
                      icon: Icon(Icons.apple),
                      label: Text("Sign up with Apple"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Button color
                        foregroundColor: Colors.black,       // Text/icon color
                        shape: RoundedRectangleBorder(
                        ),
                      ),
                    )
                ),

                const SizedBox(height: 10),

                // Signup with Google
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Your logic
                      },
                      icon: Icon(Icons.g_mobiledata),
                      label: Text("Sign up with Google"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Button color
                        foregroundColor: Colors.black,       // Text/icon color
                        shape: RoundedRectangleBorder(
                        ),
                      ),
                    )
                ),

                const SizedBox(height: 10),

                const Text("or with continue with email", style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 10),

                // Email field
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),

                // Password field
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: const Icon(Icons.visibility),
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),

                // Confirm Password field
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: const Icon(Icons.visibility),
                    hintText: 'Re-enter your password',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                // Signup button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => RootScreen()));
                    },
                    child: const Text("Sign up"),
                  ),
                ),

                const SizedBox(height: 10),
                const Text.rich(
                  TextSpan(
                    text: 'By signing up, you agree to our ',
                    children: [
                      TextSpan(
                          text: 'Terms of service',
                          style: TextStyle(color: Colors.blue)),
                      TextSpan(text: ' and '),
                      TextSpan(
                          text: 'Privacy policy',
                          style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
