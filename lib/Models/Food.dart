class Food {
  final String id;
  final String name;
  final String imageUrl;
  final String category;
  final double price;
  final double duration;
  final double rating;
  bool isAddedTocart;
  Food(
      {this.id,
      this.name,
      this.imageUrl,
      this.category,
      this.price,
      this.duration,
      this.rating,
      this.isAddedTocart});
}
