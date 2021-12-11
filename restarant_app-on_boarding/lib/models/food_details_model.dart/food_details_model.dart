class FoodDetails {
  late String name;
  late String imageUrl;
  dynamic noRating;
  dynamic price;

  FoodDetails({
    required this.name,
    required this.imageUrl,
    this.noRating,
    this.price,
  });
  FoodDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
    noRating = json['norating'];
    price = json['price'];
  }
}
