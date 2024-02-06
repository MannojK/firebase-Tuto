import 'package:firebaes_tuto/Auth/auth_page.dart';
import 'package:firebaes_tuto/Example/main_screen.dart';
import 'package:firebaes_tuto/Example/register_screen.dart';
import 'package:firebaes_tuto/firebase_options.dart';
import 'package:firebaes_tuto/loginpage.dart';
import 'package:firebaes_tuto/Auth/mainpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
  
     
      home:MainScreen(),
    );
  }
}
