import 'package:crypto_app/src/core/services/connectivity_service.dart';
import 'package:crypto_app/src/pages/favorite/favorite_page.dart';
import 'package:crypto_app/src/pages/home/home_page.dart';
import 'package:crypto_app/src/pages/no_connection/no_connection_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final connectivityService = Get.find<ConnectivityService>();

    return Obx(() {
      if (!connectivityService.isConnected.value) {
        return const NoConnectionPage();
      }

      return SafeArea(
        top: false,
        child: Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: const [
              HomePage(),
              FavoritePage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
                pageController.jumpToPage(index);
              });
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: "Favoritos",
              ),
            ],
          ),
        ),
      );
    });
  }
}
