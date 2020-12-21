import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:food_app/Controlers/BottomNavBarControler.dart';
import 'package:food_app/Models/Order.dart';
import 'package:food_app/screen/Mainscreen.dart';
import 'package:food_app/widegts/OrderPage.dart';
import 'package:food_app/widegts/cartpage.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  PageController _pageController = PageController();
  // int _currentIndex = 0;
  BottomNavBarControler c = Get.put(BottomNavBarControler());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              c.bottomControler.value = index;
            },
            children: <Widget>[
              MainScreen(),
              Cartpage(),
              // Container(
              //   color: Colors.red,
              // ),
              OrderPage(),
              Container(
                color: Colors.blue,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: c.bottomControler.value,
          onItemSelected: (index) {
            c.bottomControler.value = index;
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(title: Text('Home'), icon: Icon(Icons.home)),
            BottomNavyBarItem(
                title: Text('Cart'),
                icon: Icon(Icons.add_shopping_cart_outlined)),
            BottomNavyBarItem(
                title: Text('Orders'), icon: Icon(Icons.favorite_border)),
            BottomNavyBarItem(title: Text('Profile'), icon: Icon(Icons.person)),
          ],
        ),
      );
    });
  }
}
