import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:untitled1/Authentication/login_screen.dart';
import 'package:untitled1/Utils/utils.dart';
import 'package:untitled1/Widget/custom_facebokbutton.dart';
import 'package:untitled1/Widget/custom_textbutton.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void SignUp() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      _auth
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.toString())
          .then((value) {
        Fluttertoast.showToast(
            msg: 'Signup Successfully and now login',
            textColor: Colors.white,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.green,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP);
        setState(() {
          loading = false;
        });
        Navigator.push(context, CupertinoPageRoute(builder: (context)=>LoginScreen()));
      }).onError((error, stackTrace) {
        Utils().fluttertoast(error.toString());
        setState(() {
          loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: height * .200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                      TextButton(
                          onPressed: () {
                            Get.to(SignUpScreen());
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 220,
                      right: 70,
                    ),
                    child: Divider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
              decoration: const BoxDecoration(
                  color: Color(0xff2e4053),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(40))),
            ),

            // 2nd Container

            Container(
              height: height * .650,
              width: double.maxFinite,
              decoration: const BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      "Create an Account",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1),
                    ),

                    SizedBox(
                      height: height * 0.020,
                    ),

                    // textFormfields

                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hintText: "Email",
                                  hintStyle:
                                      const TextStyle(color: Colors.black),
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 3))),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Password";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: height * 0.020,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              controller: passwordController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: "Password",
                                hintStyle: const TextStyle(color: Colors.black),
                                filled: true,
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 3),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Password";
                                }
                                return null;
                              },
                            ),
                          ],
                        )),

                    SizedBox(
                      height: height * 0.040,
                    ),
                    // Text Button
                    CustomTextbutton(
                        loading: loading,
                        text: "Sign Up",
                        onpressed: () {
                          SignUp();
                        }),
                    SizedBox(
                      height: height * 0.020,
                    ),
                    // Text
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.200,
                            height: height * 0.001,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Text(
                            "Or sign in with",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Container(
                            width: width * 0.200,
                            height: height * 0.001,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.030,
                    ),
                    // facebook and login button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CustomFacebookbutton(
                              onpressed: () {},
                              textcolor: Colors.black,
                              text: "Google",
                              image: "assets/google.png",
                              color: Colors.white),
                          Spacer(),
                          CustomFacebookbutton(
                              onpressed: () {},
                              textcolor: Colors.white,
                              text: "Facebook",
                              image: "assets/facebook.png",
                              color: Color(0xff2e4053)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            Container(
              height: height * .097,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  color: Color(0xff2e4053),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25))),
            ),
          ],
        ),
      ),
    );
  }
}
