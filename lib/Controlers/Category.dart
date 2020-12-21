import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:food_app/Models/Ctegory.dart';
import 'package:http/http.dart' as hhtp;
import 'dart:convert';

class CategoryControler extends GetxController {
  RxList<dynamic> _category = [].obs;
  void fetchAndSetCategory() async {
    _category.value = [];

    var res = await hhtp
        .get('https://foodapp-747a6-default-rtdb.firebaseio.com/category.json');
    final resBody = json.decode(res.body) as Map<String, dynamic>;
    // resBody.map((key, value) {
    //   print(value['name']);
    // });
    //  final List<dynamic> items = [];
    resBody.forEach((key, value) {
      final item = Categories(
          id: key,
          name: value['name'],
          imageUrl: value['imageUrl'],
          type: value['type']);
      _category.add(item);
      // items.add(Categories(
      //     id: key,
      //     name: value['name'],
      //     imageUrl: value['imageUrl'],
      //     type: value['type']));

      // print(value['name']);
    });

    // _category = items;

    // print(_category.length);

    // _category.map((element) {
    //   print(element);
    // });
  }

  List<dynamic> getCategory() {
    // _category.forEach((element) {
    //   print(element.name);
    // });
    // print(_category.length);
    return _category;
  }
}
