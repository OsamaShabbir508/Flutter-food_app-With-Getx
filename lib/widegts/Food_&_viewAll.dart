import 'package:flutter/material.dart';
import 'package:food_app/widegts/FullFoodList.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class FoodViewAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Mostly Liked !',
                  style: GoogleFonts.doHyeon(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () {
                  Get.to(FullFoodList());
                },
                child: Text('View All',
                    style: GoogleFonts.doHyeon(
                        fontSize: 20, color: Colors.orange[400])),
              )
            ],
          )
        ],
      ),
    );
  }
}
