import 'package:firstproject/models/cart.dart';
import 'package:firstproject/models/catalog.dart';
import 'package:firstproject/pages/home_detail_page.dart';
import 'package:firstproject/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../home_page.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context,index){
        final catalog= CatalogModel.items[index];
        return InkWell(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(
                builder: (context)=>HomeDetailPage(
                    catalog: catalog),
            )),
            child: CatalogItem(catalog: catalog),

        );
      },
    );
  }
}
class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) :
        assert(catalog!=null),
        super(key: key);

// _AddToCart(catalog: catalog),
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image,)),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:MainAxisAlignment.center ,
            children: [
              catalog.name.text.xl.color(context.accentColor).bold.make(),
              catalog.desc.text.make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  _AddToCart(catalog: catalog),
                ],
              ) .pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
final Item catalog;
const _AddToCart({required this.catalog,
});
  @override
  State<_AddToCart> createState() => _AddToCartState();


}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(onPressed: (){
      isAdded = isAdded.toggle();
      final _catalog= CatalogModel();
      final _cart= CartModel();
      _cart.catalog=_catalog;
      _cart.add(widget.catalog);
      setState(() {});
    },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(const StadiumBorder())
        ),
        child: isAdded? const Icon(Icons.done): "Add to cart".text.make());
  }
}