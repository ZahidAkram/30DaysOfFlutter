import 'package:firstproject/models/catalog.dart';
import 'package:firstproject/widgets/home_widgets/catalog_header.dart';
import 'package:firstproject/widgets/home_widgets/catalog_list.dart';
import 'dart:convert';
import 'package:firstproject/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_widgets/catalog_header.dart';
import 'home_widgets/catalog_list.dart';


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
            await Future.delayed(const Duration(seconds: 10));
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

      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                        const CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                const CatalogList().py16().expand()
              else
                  const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      )

    );
  }
}





