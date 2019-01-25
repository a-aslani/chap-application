import 'package:flutter/material.dart';
import 'package:mobile/components/drawer_layout.dart';
import 'package:mobile/pages/digital_products_view.dart';
import 'package:mobile/pages/offset_products_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("چاپ"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
//            IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: "چاپ آفست",
              ),
              Tab(
                text: "چاپ دیجیتال",
              ),
            ],
            controller: _tabController,
          ),
        ),
        drawer: DrawerLayout(),
        backgroundColor: Theme.of(context).backgroundColor,
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            OffsetProductsView(scaffoldKey: _scaffoldKey),
            DigitalProductsView(scaffoldKey: _scaffoldKey)
          ],
        ));
  }
}
