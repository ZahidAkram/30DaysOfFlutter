import 'package:firstproject/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl4.bold.color(MyTheme.darkBlueishColor).make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}