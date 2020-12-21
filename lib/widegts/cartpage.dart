import 'package:flutter/material.dart';
import 'package:food_app/Controlers/CartControler.dart';
import 'package:food_app/Controlers/Food.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Cartpage extends StatelessWidget {
  final CartController c = Get.put(CartController());
  final FoodControler f = Get.put(FoodControler());
  before() {
    if (f.addedTocart.length > 0) {
      print('cart m hia value');
      c.addCart();
    } else {
      print('else m aaya');
      print(c.isCartEmpty.value);
      if (c.isCartEmpty.value == true) {
        print('else k if m aaya');

        c.addCart();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // final FoodControler c = Get.put(FoodControler());

    before();

    return Scaffold(
      body: Obx(
        () => c.isCartEmpty.value == false
            ? Column(
                children: [
                  Container(
                    height: 420,
                    child: ListView.builder(
                      itemCount: c.cartList.length,
                      itemBuilder: (context, index) {
                        // c.grandTotal.value += c.cartList[index].price;
                        //     c.grandTotal.refresh();
                        return Container(
                          height: 200,
                          margin: EdgeInsets.all(5),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: Color.fromRGBO(248, 248, 248, .99),
                            elevation: 15,
                            margin: EdgeInsets.all(4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(15),
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Colors.grey.shade500,
                                          style: BorderStyle.solid,
                                          width: 2)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (c.cartList[index].count < 25) {
                                            c.cartList[index].count += 1;
                                            c.grandTotal +=
                                                c.cartList[index].price;
                                            c.grandTotal.refresh();
                                            c.cartList.refresh();
                                          }
                                        },
                                        child: Icon(
                                          Icons.keyboard_arrow_up,
                                          size: 50,
                                          color: Colors.orange,
                                        ),
                                      ),
                                      Obx(() {
                                        return Text(
                                          c.cartList[index].count.toString(),
                                          style: TextStyle(fontSize: 20),
                                        );
                                      }),
                                      InkWell(
                                        onTap: () {
                                          if (c.cartList[index].count > 1) {
                                            c.cartList[index].count--;
                                            c.grandTotal = c.grandTotal -
                                                c.cartList[index].price;
                                            c.grandTotal.refresh();
                                            c.cartList.refresh();
                                          }
                                        },
                                        child: Icon(
                                          Icons.keyboard_arrow_down,
                                          size: 50,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 25, left: 3, right: 8),
                                  height: 130,
                                  width: 100,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 90,
                                        margin: EdgeInsets.only(bottom: 7),
                                        child: ClipOval(
                                          child: Image.network(
                                              c.cartList[index].imageUrl,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text('Rs:',
                                              style: TextStyle(
                                                color: Colors.red[600],
                                              )),
                                          Text(
                                              c.cartList[index].price
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.red[600],
                                              )),
                                          Obx(() {
                                            return Text(
                                                'x' +
                                                    c.cartList[index].count
                                                        .toString(),
                                                style: TextStyle(
                                                  color: Colors.red[600],
                                                ));
                                          })
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        c.cartList[index].name,
                                        style: GoogleFonts.indieFlower(
                                            color: Colors.orange, fontSize: 16),
                                      ),
                                      Text(
                                        c.cartList[index].rating.toString() +
                                            ' rating',
                                        style: GoogleFonts.indieFlower(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 15, left: 15, right: 8),
                                  child: InkWell(
                                    onTap: () {
                                      if (c.cartList[index].count > 1) {
                                        c.grandTotal = c.grandTotal -
                                            (c.cartList[index].price *
                                                c.cartList[index].count);
                                        c.grandTotal.refresh();
                                      } else {
                                        c.grandTotal = c.grandTotal -
                                            c.cartList[index].price;
                                        c.grandTotal.refresh();
                                      }
                                      f.addedTocart.removeWhere((element) =>
                                          element == c.cartList[index].itemid);
                                      // c.grandTotal = c.grandTotal -
                                      //     c.cartList[index].price;
                                      // c.grandTotal.refresh();
                                      c.removeOneitemFromCartandenabledCartNowButton(
                                          c.cartList[index].itemid);
                                      c.cartList.removeWhere((element) =>
                                          element.itemid ==
                                          c.cartList[index].itemid);

                                      print(c.cartList.length.toString());

                                      if (c.cartList.length == 0) {
                                        //  c.cartList.value = [];
                                        c.emptyCart();
                                        c.isCartEmpty.refresh();
                                      }
                                      c.cartList.refresh();
                                    },
                                    child: Icon(Icons.cancel),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 140,
                    width: 250,
                    child: ListView.builder(
                        itemCount: c.cartList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 200,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      c.cartList[index].name + ':  ',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                        (c.cartList[index].count *
                                                c.cartList[index].price)
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                                Divider(
                                  color: Colors.red,
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  Container(
                    width: 300,
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          margin: EdgeInsets.only(left: 5, right: 10),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              'Total: ' + c.grandTotal.value.toString(),
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        RaisedButton(
                            color: Colors.blue,
                            elevation: 14,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: c.isPlaceOrder.value == false
                                ? Text('Proceed To CheckOut',
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13))
                                : CircularProgressIndicator(
                                    backgroundColor: Colors.red,
                                  ),
                            onPressed: () async {
                              await c.sendOrder();

                              c.cartList.value = [];
                              f.foodToShow.forEach((element) {
                                element.isAddedTocart = false;
                              });
                              f.addedTocart.value = [];
                              c.cartList.refresh();
                              f.foodToShow.refresh();
                              f.addedTocart.refresh();
                              c.isCartEmpty.value = true;
                              c.grandTotal.value = 0;
                            }),
                      ],
                    ),
                  )
                ],
              )
            : Center(
                child: Text('Noting in The Cart Yet!',
                    style: GoogleFonts.indieFlower(
                        fontSize: 40, color: Colors.red)),
              ),
      ),
    );
  }
}
