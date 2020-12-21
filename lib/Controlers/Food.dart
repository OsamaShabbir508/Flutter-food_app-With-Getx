import 'package:flutter/gestures.dart';
import 'package:food_app/Models/Food.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as hhtp;
import 'dart:convert';

class FoodControler extends GetxController {
  RxList<dynamic> _food = [].obs;
  var foodToShow = [].obs;
  var addedTocart = [].obs;
  void addToCart(String foodId) {
    //addedTocart.add(foodId);
    foodToShow.forEach((element) {
      if (element.id == foodId) {
        if (addedTocart.contains(foodId) == false) {
          print('item added');
          addedTocart.add(foodId);
        } else {
          print('item phly se hai');
        }
      }
      //addedTocart.contains(element)
      // addedTocart.add(element);
    });
  }

  List<dynamic> getFood() {
    return _food;
  }

  void fetchAndSetFood() async {
    _food.value = [];

    var res = await hhtp
        .get('https://foodapp-747a6-default-rtdb.firebaseio.com/food.json');
    final resBody = json.decode(res.body) as Map<String, dynamic>;
    // resBody.map((key, value) {
    //   print(value['name']);
    // });
    //  final List<dynamic> items = [];
    resBody.forEach((key, value) {
      final item = Food(
          id: key,
          name: value['name'],
          imageUrl: value['imageUrl'],
          category: value['category'],
          duration: value['duration'].toDouble(),
          price: value['price'].toDouble(),
          rating: value['rating'].toDouble(),
          isAddedTocart: false);
      _food.add(item);
      // items.add(Categories(
      //     id: key,
      //     name: value['name'],
      //     imageUrl: value['imageUrl'],
      //     type: value['type']));

      // print(value['name']);
    });
    foodToShow.value = _food;
    // _category = items;

    // print(_category.length);

    // _category.map((element) {
    //   print(element);
    // });
  }
}
