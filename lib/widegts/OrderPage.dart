import 'package:flutter/material.dart';
import 'package:food_app/Controlers/CartControler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderPage extends StatelessWidget {
  final CartController c = Get.put(CartController());
  Future<void> fetchAndset() async {
    await c.fetchOrder();
  }

  @override
  Widget build(BuildContext context) {
    fetchAndset();
    return Scaffold(
        backgroundColor: Color.fromRGBO(248, 248, 248, .99),
        body: Obx(() {
          return c.isfetchOrder.value == false
              ? Column(
                  children: [
                    SizedBox(height: 100),
                    Container(
                      alignment: Alignment.center,
                      child: Center(
                        child: Text(
                          'Your Placed Orders! ',
                          style: GoogleFonts.vollkorn(
                              color: Colors.red, fontSize: 40),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: 450,
                      width: 350,
                      child: ListView.builder(
                          itemCount: c.orderList.length,
                          itemBuilder: (context, index) {
                            return Container(
                                //  color: Color.fromRGBO(248, 248, 248, .99),
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text('Order# ' + index.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Date Created: ',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        ),
                                        Text(
                                          c.orderList[index].date.toString(),
                                          style:
                                              TextStyle(color: Colors.orange),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Items',
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 20),
                                        ),
                                        Container(
                                          height: 140,
                                          margin: EdgeInsets.all(10),
                                          color:
                                              Color.fromRGBO(248, 248, 248, .8),
                                          child: ListView.builder(
                                              itemCount: c
                                                  .orderList[index].food.length,
                                              itemBuilder: (context, ii) {
                                                return Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('Name: '),
                                                        Text(c.orderList[index]
                                                            .food[ii].name)
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('Prcie: '),
                                                        Text(c.orderList[index]
                                                            .food[ii].price
                                                            .toString())
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('Count '),
                                                        Text(c.orderList[index]
                                                            .food[ii].count
                                                            .toString())
                                                      ],
                                                    ),
                                                    Divider(
                                                      color: Colors.orange,
                                                    )
                                                  ],
                                                );
                                              }),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Total',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 15),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              c.orderList[index].total
                                                  .toString(),
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ));
                          }),
                    ),
                  ],
                )
              : Center(child: CircularProgressIndicator());
        }));
  }
}
