import 'package:firstproject/models/catalog.dart';
import 'package:firstproject/widgets/drawer.dart';
import 'dart:convert';
import 'package:firstproject/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final int days=30;

final String name="Islamabad";

@override
  void initState() {
    super.initState();
    loadData();
  }
  loadData() async {
            await Future.delayed(Duration(seconds: 5));
            final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
            final decodeData= jsonDecode(catalogJson);
            var productData = decodeData["products"];
            CatalogModel.items = List.from(productData)
                .map<Item>((item) => Item.fromMap(item)).toList();
            setState(() {});
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Catalog app",
          textScaleFactor: 1.5,
          style: TextStyle(fontWeight: FontWeight.bold)
        ),
      ),
      drawer: MyDrawer(),
      body:Padding(
    padding: const EdgeInsets.all(16.0),
    child:(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)? ListView.builder(itemCount: CatalogModel.items.length,
      itemBuilder:(context, index){
        return ItemWidget(item: CatalogModel.items[index] ,);
      },):Center(child: CircularProgressIndicator(),)
    )
    );
  }
}
