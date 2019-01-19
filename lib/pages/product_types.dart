import 'package:flutter/material.dart';

class ProductTypes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text("تقویم رو میزی"),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          itemCount: 3,
          itemBuilder: (context, index) {
            return ProductTypeCard();
          }),
    );
  }
}

class ProductTypeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          ClipRRect(
              borderRadius: new BorderRadius.all(Radius.circular(4.0)),
              child: Image(
                  image: AssetImage("assets/images/sample.jpg"),
                  fit: BoxFit.cover)),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(4.0), bottomLeft: Radius.circular(4.0))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("تقویم رومیزی 14x15", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text("5 روز کاری", style: TextStyle(color: Colors.black38))
                  ],
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text("سفارش", style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                      ),
                      Icon(Icons.keyboard_arrow_left, color: Theme.of(context).primaryColor),
                    ],
                  ),
                  color: Colors.white,
                  shape: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
