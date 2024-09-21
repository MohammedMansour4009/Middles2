import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Column CardView(
    {required String src,
    required String text,
    required VoidCallback? onPressed}) {
  return Column(
    children: [
      GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 140,
          height: 155,
          decoration: BoxDecoration(
            color: Colors.white, // Background color
            borderRadius: BorderRadius.circular(18.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                // Shadow color with opacity
                spreadRadius: 2,
                // Spread radius of the shadow
                blurRadius: 4,
                // Blur radius of the shadow
                offset: Offset(0, 2), // Offset of the shadow
              ),
            ],
          ),
          child: Image(
            width: 98,
            height: 98,
            image: AssetImage(src),
            alignment: Alignment.center,
          ),
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Cairo"),
        ),
      )
    ],
  );
}
