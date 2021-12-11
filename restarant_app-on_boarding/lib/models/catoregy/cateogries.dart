class Cateogries {
  late String id;
  
 late  String image;
  late String name;

  Cateogries( this.id,this.image,this.name);
  Cateogries.fromJson(Map<String,dynamic>json){
    id=json['id'];
   
    image=json['image'];
     name=json['name'];
  }

  

}
