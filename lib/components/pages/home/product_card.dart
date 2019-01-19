import 'package:flutter/material.dart';
import 'package:mobile/pages/product_types_screen.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Directionality(textDirection: TextDirection.rtl, child: ProductTypesScreen())));
        },
        child: Row(
          children: <Widget>[
            ClipRRect(
                borderRadius: new BorderRadius.only(topRight: Radius.circular(4.0), bottomRight: Radius.circular(4.0)),
                child: Image(
                    image: AssetImage("assets/images/sample.jpg"),
                    height: 120,
                    width: 170,
                    fit: BoxFit.cover)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("تقویم رومیزی", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text("5 روز کاری", style: TextStyle(color: Colors.black38)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
