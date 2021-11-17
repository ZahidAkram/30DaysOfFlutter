import 'package:firstproject/models/catalog.dart';

class CartModel{
  //catalog model
  late CatalogModel _catalog;
  //collection of IDs
  final List<int> _itemIds=[];
  //get catalog
  CatalogModel get catalog => _catalog;
  set catalog(CatalogModel  newCatalog){
    assert(newCatalog!= null);
    _catalog = newCatalog;
  }
  //get items in the cart
List<Item> get items => _itemIds.map((id)=> _catalog.getById(id)).toList();

  //Get total price
 num get TotalPrice => items.fold(0, (total,current) => total+current.price);

 //Add Items

void add(Item item){
  _itemIds.add(item.id);
}

//Remove Items

void remove(Item item){
  _itemIds.remove(item.id);

}
}