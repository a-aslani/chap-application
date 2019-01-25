import 'package:flutter/material.dart';
import 'package:mobile/components/pages/oerder_product/order_view.dart';

class OrderProductScreen extends StatefulWidget {
  @override
  _OrderProductScreenState createState() => _OrderProductScreenState();
}

class _OrderProductScreenState extends State<OrderProductScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  SliverAppBar _appBar;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _appBar = SliverAppBar(
        pinned: true,
        floating: true,
        titleSpacing: 0,
        title: Text("اسم محصول"),
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
              text: "سفارش",
            ),
            Tab(
              text: "توضیحات",
            ),
            Tab(
              text: "قالب های آماده",
            ),
          ],
          controller: _tabController,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[_appBar];
          },
          body: TabBarView(controller: _tabController, children: <Widget>[
            OrderView(),

          ])),
    );
  }
}
