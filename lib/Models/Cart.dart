import 'package:get/get.dart';

class Cart {
  final String id;
  final String itemid;
  final String name;
  final String imageUrl;
  final String category;
  final double price;
  final double duration;
  final double rating;
  int count = 0;
  Cart(
      {this.id,
      this.itemid,
      this.name,
      this.imageUrl,
      this.category,
      this.price,
      this.duration,
      this.rating,
      this.count});
}
