import 'package:flutter/material.dart';
import 'package:mobile/components/home/product_card.dart';
import 'package:mobile/components/home/propery_banner.dart';

class DigitalProductsView extends StatefulWidget {
  @override
  _DigitalProductsViewState createState() => _DigitalProductsViewState();
}

class _DigitalProductsViewState extends State<DigitalProductsView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8.0),
      itemCount: 5,
      itemBuilder: (context, index) {
        if(index == 0) {
          return PropertyBanner(type: "دیجیتال", time: "زمان کم", money: "به صرفه در تیراژ پایین");
        }
        return ProductCard();
      },
    );
  }
}
