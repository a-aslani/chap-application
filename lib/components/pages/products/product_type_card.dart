import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/constants/config.dart';
import 'package:mobile/pages/order_product_screen.dart';

class ProductTypeCard extends StatelessWidget {

  final product;

  ProductTypeCard({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.0785), blurRadius: 5, offset: Offset(1, 1))
      ]),
      child: Card(
        margin: const EdgeInsets.all(0),
        elevation: 0,
        shape: OutlineInputBorder(borderSide: BorderSide.none),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Directionality(textDirection: TextDirection.rtl, child: OrderProductScreen())));
          },
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CachedNetworkImage(
                      imageUrl: BASE_URL + this.product["image"],
                      placeholder: Image(
                          image: AssetImage("assets/images/placeholder.png")),
                      errorWidget: Icon(Icons.error),
                      height: 120,
                      fit: BoxFit.cover),
                  Expanded(
                    child: Container(
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
                            child: Column(children: <Widget>[
                              Text(this.product["name"],
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 8),
                              Text(this.product["working_time"],
                                  style: TextStyle(
                                      color: Colors.black38, fontSize: 12)),
                            ]),
                          ),
                          Column(
                            children: <Widget>[
                              Chip(
                                  label: Text(this.product["min_price"],
                                      style: TextStyle(fontSize: 12, color: Colors.white)), backgroundColor: Colors.blue),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Divider(height: 2),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                    child: Text(this.product["description"] != null ? this.product["description"] : "", style: TextStyle(color: Colors.black54, fontSize: 13)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}