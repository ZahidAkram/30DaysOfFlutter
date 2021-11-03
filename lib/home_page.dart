import 'package:firstproject/models/catalog.dart';
import 'package:firstproject/widgets/drawer.dart';
import 'dart:convert';
import 'package:firstproject/widgets/item_widget.dart';
import 'package:flutter/cupertino.dart';
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
            await Future.delayed(Duration(seconds: 10));
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
        title: const Text("Catalog app",
          textScaleFactor: 1.5,
          style: TextStyle(fontWeight: FontWeight.bold)
        ),
      ),

      body:Padding(
    padding: const EdgeInsets.all(16.0),
    child:(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)?
    GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
    crossAxisSpacing: 16),
      itemBuilder: (context , index){
      final item= CatalogModel.items[index];
             return Card(
               clipBehavior: Clip.antiAlias,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                 child: GridTile(
                     header: Container(
                         child: Text(item.name,
                           style: TextStyle(color: Colors.white),
                           ),
                     padding: const EdgeInsets.all(12),
                     decoration: const BoxDecoration(
                       color: Colors.deepPurple,
                     ),),
                     child: Image.network(item.image),
                   footer: Text(item.price.toString()),
                 ));
      },
      itemCount: CatalogModel.items.length,)
        :const Center(
      child: CircularProgressIndicator(),
    )
    ),
        drawer: const MyDrawer(),
    );
  }
}
