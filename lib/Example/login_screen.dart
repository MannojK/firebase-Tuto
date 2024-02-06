import 'dart:developer';

import 'package:firebaes_tuto/Example/forgot_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showRegisterpage;
  const LoginScreen({
    super.key,
    required this.showRegisterpage,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 305.0,
                width: devicewidth,
                // **** BACKGROUND IMAGE
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/bg.jpg"), fit: BoxFit.fill)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 160),

                      // *** SIGN IN TO YOUR ACCOUNT

                      child: Text(
                        'Sign in to your ',
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 34),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Text(
                        ' Account ',
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 34),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('Sign in to your account ',
                          style: TextStyle(color: Colors.grey, fontSize: 14)),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),

              // **** EMAIL

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.teal.shade300)),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.teal.shade700)),
                    hintText: 'Email',
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // **** PASSWORD

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.teal.shade300)),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.teal.shade700)),
                    hintText: 'Password',
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              // ****   FORGOT PASSWORD
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const forgotScreen();
                        }));
                      },
                      child: Text(
                        'forgot password ?',
                        style: TextStyle(
                          color: Colors.blue[300],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              // ***** LOGIN BUTTON
              MaterialButton(
                color: const Color.fromRGBO(192, 232, 98, 1),
                minWidth: 369,
                height: 50,
                onPressed: () {
                  setState(() {
                    signIn();
                  });
                },
                child: Text(
                  'Login',
                  style: GoogleFonts.openSans(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //  ****  DIVIDER

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Divider(
                      indent: 20.0,
                      endIndent: 10.0,
                      thickness: 1,
                    ),
                  ),
                  Text(
                    "Or Login with",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 10.0,
                      endIndent: 20.0,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // *** GOOGLE
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 29),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/search.png',
                            cacheWidth: 10,
                            height: 10,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            ' Google ',
                            style: GoogleFonts.openSans(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 19,
                  ),
//***  FACEBOOK  */
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 29),
                      // padding values are vertical is 10, horizonal is 29
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/facebook.png',
                            cacheWidth: 10,
                            height: 10,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            ' facebook',
                            style: GoogleFonts.openSans(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have a  account? "),
                    GestureDetector(
                      onTap: widget.showRegisterpage,
                      child: const Text(
                        'Register ',
                        style: TextStyle(
                            color: Color.fromARGB(255, 20, 168, 96),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
