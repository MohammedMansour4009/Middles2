import 'package:flutter/material.dart';

Container searchBar({required String hint}) {
  return Container(
    margin: const EdgeInsets.only(left: 27, right: 27, bottom: 26),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: const Color(0xFF73B8F7), width: 3),
      // Border color
      borderRadius: BorderRadius.circular(8.0), // Rounded corners
    ),
    child: Row(
      children: [
          Container(
              margin: EdgeInsets.only(top: 15,left: 5),
              child: Image.asset("assets/ic_search.png")),
        TextField(
          decoration: InputDecoration(
            hintStyle: const TextStyle(color: Colors.grey,fontFamily: "Cairo"),
            hintText: hint,
            border: InputBorder.none, // Remove the default border
            contentPadding:
            const EdgeInsets.all(16.0), // Padding inside the text field
          ),
        ),
      ],
    ),
  );
}
