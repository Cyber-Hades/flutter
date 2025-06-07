import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:task1/view/auth/forget_password.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:task1/view/auth/login.dart';
class Verification extends StatelessWidget {
  const Verification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xfff9ecd7),
        flexibleSpace: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Text("Verification",
                      style: TextStyle
                        (color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold
                      )
                  ),

                )
              ],
            )
        ),
      ),
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: const Text(
                        'Enter Verification Code',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topCenter,
                      child: OtpTextField(
                          numberOfFields: 5,
                          borderColor: Color(0xFF512DA8),
                          showFieldAsBox: true,
                          onCodeChanged: (String code) {
                          },
                          // onSubmit: (String verificationCode){
                          //   showDialog(
                          //       context: context,
                          //       builder: (context){
                          //         return AlertDialog(
                          //           title: Text("Verification Code"),
                          //           content: Text('Code entered is $verificationCode'),
                          //
                          //         );
                          //       }
                          //   );
                          // },
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(onPressed: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => ForgetPassword()));
                          }, child: const Text("If you didn't receive a code.",
                            style: TextStyle(color: Colors.grey, fontSize: 12,),
                          ),
                          ),
                        ),
                        TextButton(onPressed: (){}, child: const Text('Resend',
                          style: TextStyle(color: Colors.red, fontSize: 12,),
                        ),)
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFBDF42A),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                        child: const Text("Send"),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text("or", style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 2),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.facebook)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.g_mobiledata)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.apple)),

                        ]
                    ),
                    const SizedBox(height: 40),
                    const Text("Do you have an account ?", style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                        child: const Text("Sign up"),
                      ),
                    ),

                  ]
              ),
            ),
          )

      ),

    );
  }
}
