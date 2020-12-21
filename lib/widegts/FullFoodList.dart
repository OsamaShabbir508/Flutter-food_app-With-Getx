import 'package:flutter/material.dart';
import 'package:food_app/Controlers/CartControler.dart';
import 'package:get/get.dart';
import 'package:food_app/Controlers/Food.dart';
import 'package:google_fonts/google_fonts.dart';

class FullFoodList extends StatelessWidget {
  final FoodControler c = Get.put(FoodControler());
  final CartController crt = Get.put(CartController());
  fetch() async {
    if (c.getFood().length > 0) {
      print('food list p=bhari hui');
    } else {
      await c.fetchAndSetFood();
    }
  }

  @override
  Widget build(BuildContext context) {
    fetch();
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'All Foods You Love!',
            style: GoogleFonts.prozaLibre(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade300
          // Color.fromRGBO(128, 128, 128, .1),
          ),
      backgroundColor: Color.fromRGBO(253, 253, 252, .99),
      body: Container(
          //height: 320,
          color: Colors.grey.shade300,
          child: Obx(() {
            return ListView.builder(
                itemCount: c.foodToShow.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 298,
                    margin: EdgeInsets.all(10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(20),
                            height: 200,
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(14),
                                  width: 220,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.network(
                                      c.foodToShow[index].imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    bottom: 0,
                                    width: 300,
                                    child: Container(
                                      //   margin: EdgeInsets.all(3),
                                      height: 60,
                                      // width: 3500,
                                      color: Colors.black54,

                                      child: Row(
                                        // mainAxisAlignment:
                                        //   MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(5),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  c.foodToShow[index].name,
                                                  style: GoogleFonts.ranchers(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                                // Text(foodItem.rating.toString())
                                                Row(children: [
                                                  for (var i = 0;
                                                      i <
                                                          c.foodToShow[index]
                                                              .rating
                                                              .toInt();
                                                      i++)
                                                    Icon(
                                                      Icons.star,
                                                      size: 15,
                                                      color: Colors.blue,
                                                    ),
                                                ])
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 40,
                                          ),
                                          Container(
                                            child: Text(
                                              'Rs: ' +
                                                  c.foodToShow[index].price
                                                      .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.orange),
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FittedBox(
                                fit: BoxFit.cover,
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.category,
                                      size: 20,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      c.foodToShow[index].category,
                                      style: TextStyle(color: Colors.orange),
                                    )
                                  ],
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.cover,
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      size: 20,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      c.foodToShow[index].duration.toString() +
                                          ' mins',
                                      style: TextStyle(color: Colors.orange),
                                    )
                                  ],
                                ),
                              ),
                              Obx(
                                () {
                                  return c.foodToShow[index].isAddedTocart ==
                                          false
                                      ? RaisedButton(
                                          child: Text(
                                            'Cart Now!',
                                            style: TextStyle(
                                              color: Colors.orange[600],
                                            ),
                                          ),
                                          onPressed: () {
                                            c.foodToShow[index].isAddedTocart =
                                                true;
                                            crt.grandTotal.value +=
                                                c.foodToShow[index].price;

                                            c.addToCart(c.foodToShow[index].id);
                                            c.foodToShow.refresh();
                                            crt.cartList.refresh();
                                            print(c.foodToShow[index].id);
                                          })
                                      : Text(
                                          'Added To Cart',
                                          style: TextStyle(color: Colors.blue),
                                        );
                                },
                              )

                              // Obx(() {
                              //   return InkWell(
                              //     onTap: () {
                              //       print(foodItem.isAddedTocart.toString());
                              //       foodItem.isAddedTocart = true;
                              //       print(foodItem.isAddedTocart.toString());
                              //     },
                              //     child: Obx(() {
                              //       return Text(
                              //           foodItem.isAddedTocart.toString());
                              //     }),
                              //   );
                              // }),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          })),
    );
  }
}
