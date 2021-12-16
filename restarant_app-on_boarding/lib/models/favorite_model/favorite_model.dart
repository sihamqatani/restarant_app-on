class FavoriteModel {
  late String name;
  late String image;
  dynamic noRating;
  dynamic price;
  String? description;
  bool isPopular = false;
  bool isVisible = false;

  FavoriteModel(
      {required this.name,
      required this.image,
      this.noRating,
      this.price,
      this.description,
      required this.isPopular,
      required this.isVisible});
  FavoriteModelfromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    noRating = json['noRating'];
    price = json['price'];
    description = json['description'];
    isPopular = json['isPopular'];
    isVisible = json['isVisible'];
  }
}
