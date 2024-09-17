import 'dart:ui';

import 'package:flutter/material.dart';

class CustomFacebookbutton extends StatelessWidget {
 final String text, image;
 final Color color,textcolor;
 final VoidCallback onpressed;

  CustomFacebookbutton(
      {super.key,
        required this.onpressed,
        required this.textcolor,
      required this.text,
      required this.image,
      required this.color});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(onTap: onpressed,
      child: Container(
        height: height * 0.070,
        width: width * .400,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.grey, width: 2),
        ),
        child: Row(
          children: [
            SizedBox(
              width: width * 0.02,
            ),
            Container(
              height: height * .045,
              width: width * .095,
              child: Image.asset(
                image,
                scale: 2,
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Text(
              text,
              style: TextStyle(
                  color: textcolor, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
