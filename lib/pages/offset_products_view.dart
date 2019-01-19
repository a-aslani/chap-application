import 'package:flutter/material.dart';
import 'package:mobile/components/pages/home/product_card.dart';
import 'package:mobile/components/pages/home/propery_banner.dart';

class OffsetProductsView extends StatefulWidget {
  @override
  _OffsetProductsViewState createState() => _OffsetProductsViewState();
}

class _OffsetProductsViewState extends State<OffsetProductsView> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      padding: const EdgeInsets.only(top: 8.0),
      itemCount: 7,
      itemBuilder: (context, index) {
        if(index == 0) {
          return PropertyBanner(type: "آفست", time: "زمان زیاد", money: "به صرفه در تیراژ بالا");
        }
        return ProductCard();
      },
    );
  }
}
