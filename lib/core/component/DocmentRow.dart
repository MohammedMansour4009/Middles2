import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container documentRow(
    {required String name,
    required String phonNumber,
    required String companyName}) {
  return Container(
    width: 339,
    height: 59,
    decoration: const BoxDecoration(
      color: Colors.white,
      border: Border(
        top: BorderSide(
          color: Color(0xFF2F377B), // Border color
          width: 1.0, // Border width
        ),
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: 44,
          height: 44,
          decoration: const BoxDecoration(
            color: Color(0xFF3873D6),
            shape: BoxShape.circle,
            border: Border(
              top: BorderSide(
                color: Colors.blue, // Border color
                width: 1.0, // Border width
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 17),
          child: Text(name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              )),
        ),
        Container(
          margin: const EdgeInsets.only(left: 17),
          child: Text(phonNumber,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              )),
        ),
        Container(
          margin: const EdgeInsets.only(left: 17),
          child: Text(companyName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              )),
        ),
      ],
    ),
  );
}
