import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screen/BottomNavBar.dart';
import 'package:get/get.dart';

class SignInControler extends GetxController {
  RxString email = "".obs;
  RxString password = "".obs;
  var ispresent = false.obs;
  var isLoading = false.obs;
  var _list = [
    {'email': 'osama@osama.com', 'pass': '123456'},
    {'email': 'saad@saad.com', 'pass': '123456'}
  ].obs;
  isPresent() {
    isLoading.value = true;
    isLoading.refresh();
    Future.delayed(Duration(seconds: 3), () {
      isLoading.value = false;
      isLoading.refresh();
      print(email.value + password.value);
      print(ispresent.value);

      _list.forEach((element) {
        if (element['email'] == email.value) {
          if (element['pass'] == password.value) {
            ispresent.value = true;
            print(ispresent.value);
          }
        }
      });
      if (ispresent.value == true) {
        Future.delayed(Duration(seconds: 1), () {
          Get.snackbar('', 'Logged In',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Color.fromRGBO(255, 140, 0, .5),
              colorText: Colors.red,
              messageText: Center(
                child: Text(
                  'Logged In',
                  style: TextStyle(fontSize: 15),
                ),
              ));
        });

        ispresent.value = false;
        Get.to(BottomNavBar());
      } else {
        Get.snackbar('', 'Logged In',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color.fromRGBO(255, 140, 0, .5),
            colorText: Colors.red,
            messageText: Center(
              child: Text(
                'Email Not Found',
                style: TextStyle(fontSize: 15),
              ),
            ));
      }
    });
  }
}
