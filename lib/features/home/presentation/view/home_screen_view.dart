import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../view model/home_controller.dart';
import '../widgets/BottomNavigationBar.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            extendBodyBehindAppBar: true,
            body: Stack(
              children: [
                controller.pages[controller.currentPage],
                const Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: HomeBottomNavigationBar()),
              ],
            ),
          );
        });
  }
}
