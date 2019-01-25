import 'package:flutter/material.dart';
import 'package:mobile/components/text/large_text.dart';
import 'package:mobile/service/prefs.dart';

class DrawerLayout extends StatefulWidget {
  @override
  DrawerLayoutState createState() {
    return new DrawerLayoutState();
  }
}

class DrawerLayoutState extends State<DrawerLayout> {

  int basketCount = 0;
  static String fullName = "در حال دریافت اطلاعات ...";

  getFullNameFromPrefs() async {
    final nameAndFamily = await getFullName();
    setState(() {
      fullName = nameAndFamily;
    });
  }

  @override
  void initState() {
    super.initState();
    getFullNameFromPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Container(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: LargeText(text: fullName, color: Colors.white),
              ),
            ),
            margin: const EdgeInsets.only(bottom: 0),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("خانه"),
            onTap: () {
              Navigator.of(context).popAndPushNamed("/home");
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.view_list),
            title: Text("لیست دسته بندی ها"),
            onTap: () {},
          ),
          Divider(height: 0),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("سبد خرید"),
            trailing: Chip(label: Text(this.basketCount.toString())),
            onTap: () {},
          ),
          Divider(height: 0),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("تنظیمات"),
            onTap: () {},
          ),ListTile(
            leading: Icon(Icons.highlight_off),
            title: Text("خروج"),
            onTap: () {
              logout();
              Navigator.of(context).pushReplacementNamed("/login");
            },
          ),
        ],
      ),
    );
  }
}
