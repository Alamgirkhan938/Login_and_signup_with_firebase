import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Authentication/verify_code.dart';
import 'package:untitled1/Utils/utils.dart';
import 'package:untitled1/Widget/custom_textbutton.dart';

class LoginWithPhoneNo extends StatefulWidget {
  const LoginWithPhoneNo({super.key});

  @override
  State<LoginWithPhoneNo> createState() => _LoginWithPhoneNoState();
}

class _LoginWithPhoneNoState extends State<LoginWithPhoneNo> {
  bool loading = false;
  final phoneNoController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Login With Phone Number"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: phoneNoController,
              decoration: InputDecoration(hintText: '+92 432 556 444 666'),
            ),
            SizedBox(
              height: 50,
            ),
            CustomTextbutton(
                text: 'Login',
                onpressed: () {
                  auth.verifyPhoneNumber(
                      phoneNumber: phoneNoController.text,
                      verificationCompleted: (_) {},
                      verificationFailed: (e) {
                        Utils().fluttertoast(e.toString());
                      },
                      codeSent: (String verificationId, int? token) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyCode(
                                      verificationId: verificationId,
                                    )));
                      },
                      codeAutoRetrievalTimeout: (e) {
                        Utils().fluttertoast(e.toString());
                      });
                })
          ],
        ),
      ),
    );
  }
}
