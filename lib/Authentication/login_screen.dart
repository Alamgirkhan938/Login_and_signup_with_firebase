import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:untitled1/Authentication/signup_screen.dart';
import 'package:untitled1/Screen/home_screen.dart';
import 'package:untitled1/Utils/utils.dart';
import 'package:untitled1/Widget/custom_facebokbutton.dart';
import 'package:untitled1/Widget/custom_textbutton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  // firebase reference
  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  // Login  function
  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.toString())
        .then((value) {
      Fluttertoast.showToast(
          msg: 'Login Successfully',
          textColor: Colors.white,
          backgroundColor: Colors.green,
          gravity: ToastGravity.TOP);
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (context) => HomeScreen()));
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().fluttertoast(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                // 1st Container

                Container(
                  width: double.maxFinite,
                  height: height * .200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // SingUp and SignIn Button

                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                          TextButton(
                              onPressed: () {
                                Get.to(SignUpScreen());
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 70,
                          right: 220,
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
                          "Welcome Back !",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1),
                        ),

                        SizedBox(
                          height: height * 0.020,
                        ),
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
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                    hintStyle:
                                        const TextStyle(color: Colors.black),
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
                        // first TextFrom

                        SizedBox(
                          height: height * 0.040,
                        ),

                        // Text Button

                        CustomTextbutton(
                            text: "Sign In",
                            loading: loading,
                            onpressed: () {
                              if (_formKey.currentState!.validate()) {
                                login();
                              }
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
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
        ),
      ),
    );
  }
}
