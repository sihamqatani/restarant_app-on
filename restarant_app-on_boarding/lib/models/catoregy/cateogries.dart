class Cateogries {
  late String id;
  late String docId;

  late String image;
  late String name;

  Cateogries(this.id, this.docId, this.image, this.name);
  Cateogries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    docId = json['docId'];

    image = json['image'];
    name = json['name'];
  }
}
