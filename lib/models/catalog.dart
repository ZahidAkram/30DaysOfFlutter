import 'dart:convert';

class CatalogModel{
  static final catModel= CatalogModel._internal();
  CatalogModel._internal();
  factory CatalogModel()=> catModel;
  static List<Item> items=[];

  //get item by id
 Item getById( id) =>
     items.firstWhere((element) => element.id = id, orElse: null);

// get by position
  Item getByPosition(int pos) => items[pos];
}
class Item{
  int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;


  Item({required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image});
  Item copyWith(
  {
        required int id,
    required String name,
    required String desc,
    required String color,
    required String image,
    required num price,
}
      )
  {
    return Item(
        id:id,
        name: name,
        desc: desc,
        price: price,
        color: color,
        image: image
    );
  }

  Map<String,dynamic> toMap(){
    return {
      "id":id,
    "name":name,
    "desc":desc,
    "price":price,
    "color":color,
    "image":image
  };
  }
  factory Item.fromMap(Map<String,dynamic> map){

    return Item(id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );

  }
   String toJson()=> json.encode(toMap());
  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString()
  {
    return 'Item(id:$id, name:$name, desc:$desc, price:$price, color:$color, image:$image)';
  }

}
