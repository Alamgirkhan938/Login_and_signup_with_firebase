import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextbutton extends StatelessWidget {
final  String text;
bool loading;
final  VoidCallback onpressed;
  CustomTextbutton({super.key, required this.text,required this.onpressed,this.loading=false});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff2e4053),
      borderRadius: BorderRadius.circular(30),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(100, 5, 100, 5),
        child: TextButton(
          onPressed: onpressed,
          child:loading?CupertinoActivityIndicator(color: Colors.white,radius: 20,animating: true,): Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
