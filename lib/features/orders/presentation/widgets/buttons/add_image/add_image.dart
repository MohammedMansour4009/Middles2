import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';

class AddImage extends StatelessWidget {
  const AddImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: ShapeDecoration(
          shadows: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 1,
              offset: Offset(0, 0.02),
            ),
          ],
          color: kSecondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('ادخل صورة الطلبية',
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                  Text(
                    'صورة الطلبية مهمة لمعرفة سعر طلب المنتجات',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
              width: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: const CircleBorder(),
                ),
                onPressed: () {},
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    'assets/plus.png',
                    color: Colors.white,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
