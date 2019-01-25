import 'package:flutter/material.dart';

class PropertyBanner extends StatelessWidget {
  final type;
  final time;
  final money;

  PropertyBanner(
      {@required this.type, @required this.time, @required this.money});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,

          border: Border(
            right: BorderSide(width: 4.0, color: Theme.of(context).primaryColor),
          ),

          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.0785), blurRadius: 5, offset: Offset(1, 1))
          ]
        ),
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
        margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("ویژگی های چاپ $type",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            Padding(
              padding:
                  const EdgeInsets.only(top: 16.0, right: 4.0, bottom: 8.0),
              child: Text(this.time,
                  style: TextStyle(color: Colors.black54)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Text(this.money,
                  style: TextStyle(color: Colors.black54)),
            )
          ],
        ));
  }
}
