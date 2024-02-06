import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;

  //  ***  document IDs 
  List<String> docIDs = [];

  // **** get docIDs
  
Future getDocId() async{
await FirebaseFirestore.instance.collection('users').get().then((snapshot) => snapshot.docs.forEach((document) {
  print(document.reference);
  docIDs.add(document.reference.id);
}));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Signed in as :  ${user?.email}'),
          SizedBox(
            height: 15,
          ),
          Center(
            child: MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.orange,
              child: Text('Sign Out '),
            ),
          )
        ],
      ),
    );
  }
}
