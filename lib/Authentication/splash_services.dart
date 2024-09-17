import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/Authentication/login_screen.dart';
import 'package:untitled1/Screen/home_screen.dart';

class SplashServices {
  void isLogin(BuildContext context) {

    //instance provide firebaseAuthentication instance
    final auth=FirebaseAuth.instance;

    // user is login or not
    final user=auth.currentUser;

    if(user!=null){
      Timer(
          Duration(seconds: 5),
              () => Navigator.push(
              context, CupertinoPageRoute(builder: (context) => HomeScreen())));

    }else{
      Timer(
          Duration(seconds: 5),
              () => Navigator.push(
              context, CupertinoPageRoute(builder: (context) => LoginScreen())));
    }



  }
}
