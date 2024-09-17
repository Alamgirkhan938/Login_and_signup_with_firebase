import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled1/Authentication/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen=SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: height * .30,
              width: double.maxFinite,
              child: Image.asset("assets/database.png"),
            ),
          ),
          SizedBox(height: height*.030,),
          Text(
            "Hi FireBase",
            style: TextStyle(
                letterSpacing: 2,
                wordSpacing: 2,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          )
        ],
      ),
    );
  }
}
