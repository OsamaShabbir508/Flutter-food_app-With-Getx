import 'package:food_app/Models/Cart.dart';

class Order {
  final String id;
  final String total;
  final String date;

  final List<Cart> food;

  Order({this.id, this.total, this.food, this.date});
}
