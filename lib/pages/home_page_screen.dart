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

  TabController _tabController;
  SliverAppBar _appBar;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);

    _appBar = SliverAppBar(
      pinned: true,
      floating: true,
      title: Text("چاپ"),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerLayout(),
        backgroundColor: Theme.of(context).backgroundColor,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[_appBar];
          },
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              OffsetProductsView(),
              DigitalProductsView()
            ],
          )
        ));
  }
}
