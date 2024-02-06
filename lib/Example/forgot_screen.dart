import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class forgotScreen extends StatefulWidget {
  const forgotScreen({super.key});

  @override
  State<forgotScreen> createState() => _forgotScreenState();
}

class _forgotScreenState extends State<forgotScreen> {
  final _emailController = TextEditingController();

  Future ResetPassword() async{
    
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: _emailController.text.trim());
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text('Password reset link sent! '),
        );
      });
  }

  @override 
  void dispose(){
    super.dispose();
    _emailController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Reset Your password',
          style: GoogleFonts.openSans(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Enter your Email to reset your password ',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15.0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.orange.shade200),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Colors.grey,
                hintText: 'Enter your Email',
              ),
            ),
          ),
          SizedBox(height: 15,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red[400],
              onPrimary: Colors.white,
              elevation: 10,
              shadowColor: Colors.red[400],
            ),
            onPressed: (){
ResetPassword();

          }, child: Text('Reset Password'))
        ]),
      ),
    );
  }
}
