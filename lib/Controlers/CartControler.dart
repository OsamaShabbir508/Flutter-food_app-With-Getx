import 'package:flutter/cupertino.dart';
import 'package:food_app/Models/Cart.dart';
import 'package:food_app/Models/Food.dart';
import 'package:food_app/Models/Order.dart';
import 'package:get/get.dart';
import 'package:food_app/Controlers/Food.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartController extends GetxController {
  FoodControler c = Get.put(FoodControler());
  var cartList = [].obs;
  var orderList = [].obs;
  var isCartEmpty = true.obs;
  var isPlaceOrder = false.obs;
  var isfetchOrder = false.obs;
  var grandTotal = 0.0.obs;
  void fetchOrder() async {
    isfetchOrder.value = true;
    orderList.value = [];
    final response = await http.get(
      'https://foodapp-747a6-default-rtdb.firebaseio.com/order.json',
    );
    final resBody = json.decode(response.body) as Map<String, dynamic>;

    resBody.forEach((key, value) {
      List<Cart> f = [];
      //  print(value['item']);
      value['item'].forEach((item) {
        var i = new Cart(
            itemid: item['itemid'],
            name: item['name'],
            category: item['category'],
            count: int.parse(item['count']),
            id: '',
            duration: double.parse(item['duaration']),
            imageUrl: item['imageUrl'],
            price: double.parse(item['price']),
            rating: 0);

        f.add(i);

        // print(item['name']);
      });

      final order = Order(
        id: key,
        date: value['date'],
        total: value['total'],
        food: f,
      );
      orderList.add(order);
    });

    isfetchOrder.value = false;
    isfetchOrder.refresh();

    // print(response.body);
  }

  void sendOrder() async {
    isPlaceOrder.value = true;
    final response = await http.post(
      'https://foodapp-747a6-default-rtdb.firebaseio.com/order.json',
      body: json.encode({
        'date': DateTime.now().toIso8601String(),
        'total': grandTotal.value.toString(),
        'item': cartList
            .map((element) => {
                  'itemid': element.itemid.toString(),
                  'name': element.name.toString(),
                  'category': element.category.toString(),
                  'imageUrl': element.imageUrl.toString(),
                  'price': element.price.toString(),
                  'duaration': element.duration.toString(),
                  'count': element.count.toString(),
                })
            .toList()
      }),
    );
    isPlaceOrder.value = false;
    isPlaceOrder.refresh();
    // print(response.body);
  }

  addCart() {
    if (c.addedTocart.length > 0) {
      isCartEmpty.value = false;
      cartList.value = [];

      c.addedTocart.forEach((element) {
        c.foodToShow.forEach((items) {
          if (items.id == element) {
            final item = Cart(
                itemid: items.id,
                imageUrl: items.imageUrl,
                name: items.name,
                duration: items.duration,
                category: items.category,
                price: items.price,
                rating: items.rating,
                count: 1);
            cartList.add(item);
          }
        });
      });
    } else {
      print('addcart krny pr cart list empty hai');
    }
  }

  removeOneitemFromCartandenabledCartNowButton(String id) {
    print('raised butt');
    c.foodToShow.forEach((element) {
      if (element.id == id) {
        element.isAddedTocart = false;
        c.foodToShow.refresh();
      }
    });
  }

  emptyCart() {
    c.addedTocart.value = [];
    isCartEmpty.value = true;
    // isCartEmpty.refresh();
  }
}
