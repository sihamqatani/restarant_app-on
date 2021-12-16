class CartModel {
  late String name;
  late String image;
  dynamic price;
  dynamic counter;
  CartModel(
      {required this.name, required this.image, this.price, this.counter});
  CartModel.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    image = json['name'];
    price = json['price'];
    counter = json['counter'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'counter': counter,
    };
  }
}
