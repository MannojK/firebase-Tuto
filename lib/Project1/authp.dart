import 'package:firebaes_tuto/loginpage.dart';
import 'package:firebaes_tuto/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class authp extends StatefulWidget {
  const authp({super.key});

  @override
  State<authp> createState() => _authpState();
}

class _authpState extends State<authp> {
  @override
  bool showLoginPage = true;
  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterpage: toggleScreens);
    } else {
      return RegisterPage(showLoginPage: toggleScreens);
    }
  }
}
