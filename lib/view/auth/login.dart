import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:task1/main.dart';
import 'package:task1/rootscreen/rootscreen.dart';
import 'package:task1/view/auth/forget_password.dart';
import 'package:task1/view/auth/signup.dart';
import 'package:task1/view/splash_screen/splashscreen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _handleLogin() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    print('Email: $email');
    print('Password: $password');
    }

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
                  fit: BoxFit.contain,
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

                // Login with Apple
                // SizedBox(
                //   width: double.infinity,
                //   height: 50,
                //   child: ElevatedButton.icon(
                //     onPressed: () {
                //       // Your logic
                //     },
                //     icon: Icon(Icons.apple),
                //     label: Text("Login with Apple"),
                //     style: ElevatedButton.styleFrom(
                //         backgroundColor: Colors.white, // Button color
                //         foregroundColor: Colors.black,       // Text/icon color
                //         shape: RoundedRectangleBorder(
                //             ),
                //         ),
                //   )
                // ),
                //
                // const SizedBox(height: 10),
                //
                // // Login with Google
                // SizedBox(
                //   width: double.infinity,
                //   height: 50,
                //   child: ElevatedButton.icon(
                //     onPressed: () {
                //       // Your logic
                //     },
                //     icon: Icon(Icons.g_mobiledata),
                //     label: Text("Login with Google"),
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.white, // Button color
                //       foregroundColor: Colors.black,       // Text/icon color
                //       shape: RoundedRectangleBorder(
                //       ),
                //     ),
                //   )
                // ),
                //
                // const SizedBox(height: 10),
                //
                // const Text("or with continue with email", style: TextStyle(color: Colors.grey)),
                // const SizedBox(height: 10),

                // Email field
                TextField(
                  controller: _emailController,
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
                  controller: _passwordController,
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => ForgetPassword()));
                  }, child: const Text('Forgot password?',
                    style: TextStyle(color: Colors.grey, fontSize: 12,),
                  ),
                  ),
                ),
                const SizedBox(height: 10),

                // Login button
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
                    onPressed: () async {
                      _handleLogin();
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => RootScreen()));
                    },
                    child: const Text("Login"),
                  ),
                ),

                const SizedBox(height: 10),
                const Text.rich(
                  TextSpan(
                    text: 'By logging in, you agree to our ',
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