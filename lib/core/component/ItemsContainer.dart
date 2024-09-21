import 'package:flutter/material.dart';

class Itemscontainer extends StatelessWidget {
  const Itemscontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('محتويات سلة العميل', style: TextStyle(fontSize: 12)),
          SizedBox(height: 10),
          // PhotoListView(), // todo
        ],
      ),
    );
  }
}
