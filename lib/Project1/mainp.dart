import 'package:firebaes_tuto/Project1/authp.dart';
import 'package:firebaes_tuto/Project1/home.dart';
import 'package:firebaes_tuto/Project1/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class mainp extends StatefulWidget {
  const mainp({super.key});

  @override
  State<mainp> createState() => _mainpState();
}

class _mainpState extends State<mainp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
        if (snapshot.hasData) {
          return home();
        } else {
          return authp();
        }
      }),
    );
  }
}
