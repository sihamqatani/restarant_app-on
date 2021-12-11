class Cateorgy {
 
  late String name;
  late  String imageUrl;

  Cateorgy(this.name,this.imageUrl,);
  Cateorgy.fromJson(Map<dynamic,dynamic>json){
     name=json['name'];
   
    imageUrl=json['imageUrl'];
    
  }

  

}
