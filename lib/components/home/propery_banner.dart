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
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(4.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("ویژگی های چاپ $type",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, right: 4.0, bottom: 4.0),
              child: Text(this.time,
                  style: TextStyle(color: Theme.of(context).primaryColor)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Text(this.money,
                  style: TextStyle(color: Theme.of(context).primaryColor)),
            )
          ],
        ));
  }
}
