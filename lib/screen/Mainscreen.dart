import 'package:flutter/material.dart';
import 'package:food_app/widegts/FoodList.dart';
import 'package:food_app/widegts/Food_&_viewAll.dart';
import 'package:food_app/widegts/MainScreenHeader.dart';
import 'package:food_app/widegts/categoryList.dart';
import 'package:food_app/widegts/searchBar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainScreen extends StatelessWidget {
  void server1() async {
    print('hhhhhhhhhhhhhh');
    var res = await http.post(
      'https://foodapp-747a6-default-rtdb.firebaseio.com/food.json',
      body: json.encode({
        'name': 'Karahi-Gosht',
        'imageUrl':
            'https://www.pngitem.com/pimgs/m/15-152282_transparent-mutton-png-chicken-karahi-png-png-download.png',
        'category': 'Karahi Gost',
        'price': 160,
        'duration': 10,
        'rating': 4,
      }),
    );
    print(json.decode(res.body));
    // print(json.decode(res.body));
  }

  // void server() async {
  //   print('aagya');
  //   var res = await http.get(
  //     'https://foodapp-747a6-default-rtdb.firebaseio.com/category.json',
  //   );
  //   print(json.decode(res.body));
  //   // print(json.decode(res.body));
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(width);
    print(height);
    //server1();

    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, .99),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              MainHeader(),
              CategoryList(),
              SearchBar(),
              FoodViewAll(),
              FoodList(),
            ],
          ),
        ),
      ),
    );
  }
}
