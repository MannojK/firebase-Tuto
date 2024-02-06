

import 'package:firebaes_tuto/Example/auth_screen.dart';
import 'package:firebaes_tuto/Example/home_screen.dart';
import 'package:firebaes_tuto/Example/login_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const HomeScreen();
              } else {
                return  const AuthScreen();
              }
            }));
  }
}
