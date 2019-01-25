import 'package:flutter/material.dart';
import 'package:mobile/pages/product_types_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mobile/constants/config.dart';

class ProductCard extends StatelessWidget {
  final product;

  ProductCard({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.0785), blurRadius: 5, offset: Offset(1, 1))
          ]
      ),
      child: Card(
        margin: const EdgeInsets.all(0),
        elevation: 0,
        shape: OutlineInputBorder(borderSide: BorderSide.none),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Directionality(
                    textDirection: TextDirection.rtl,
                    child: ProductTypesScreen(productId: this.product["id"], productName: this.product["name"]))));
          },
          child: Row(
            children: <Widget>[
              CachedNetworkImage(
                  imageUrl: BASE_URL + this.product["image"],
                  placeholder: Image(
                      image: AssetImage("assets/images/placeholder.png")),
                  errorWidget: Icon(Icons.error),
                  height: 120,
                  width: 170,
                  fit: BoxFit.cover),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(this.product["name"],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text(this.product["working_time"],
                            style: TextStyle(color: Colors.black38)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
