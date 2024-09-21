import 'package:flutter/material.dart';

Positioned CompanyProfilePage(
    {required String companyName, required String src}) {
  return Positioned(
    child: Column(
      children: [
        Container(
          width: 146,
          height: 146,
          decoration:
              BoxDecoration(color: Color(0xFF3873D6), shape: BoxShape.circle),
        ),
        Positioned(
          child: Container(
            height: 194,
            width: 355,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(38),
                color: Colors.white,
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
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  companyName,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Color(0xFF3873D6),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Color(0xFF3873D6),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Color(0xFF3873D6),
                        shape: BoxShape.circle,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
