import 'package:flutter/material.dart';
import 'package:mobile/components/pages/products/product_type_card.dart';
import 'package:mobile/components/snackbar/app_snackbar.dart';
import 'package:mobile/service/api/api_service.dart';

class ProductTypesScreen extends StatelessWidget {
  final productId;
  final productName;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ProductTypesScreen({@required this.productId, @required this.productName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(this.productName),
      ),
      body: FutureBuilder(
          future: ApiService().fetchSubProducts(this.productId),
          builder: (context, snapshot) {
            if (snapshot.hasError)
              AppSnackbar.show(_scaffoldKey, snapshot.error.toString(), 7);
            return snapshot.hasData
                ? SubProductsList(
                    response: snapshot.data,
                    scaffoldKey: _scaffoldKey,
                    productId: this.productId)
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class SubProductsList extends StatefulWidget {
  final response;
  final scaffoldKey;
  final productId;

  SubProductsList({this.response, this.scaffoldKey, this.productId});

  @override
  _SubProductsListState createState() => _SubProductsListState();
}

class _SubProductsListState extends State<SubProductsList> {
  ScrollController _scrollController = ScrollController();
  List<dynamic> products;
  int _currentPage;
  int _totalPage;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    products = widget.response["data"];
    _totalPage = widget.response["meta"]["last_page"];
    _currentPage = widget.response["meta"]["current_page"];

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent -
              _scrollController.position.pixels <=
          200) {
        if (_currentPage <= _totalPage && !_isLoading) {
          setState(() {
            this._isLoading = true;
          });
          _getProducts();
        }
      }
    });
  }

  _getProducts() async {
    try {
      final response = await ApiService()
          .fetchSubProducts(widget.productId, page: _currentPage + 1);

      products.addAll(response["data"]);

      setState(() {
        this._currentPage++;
        this._isLoading = false;
      });
    } catch (e) {
      AppSnackbar.show(widget.scaffoldKey, e.toString(), 7);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
        itemCount: products != null ? products.length : 0,
        itemBuilder: (context, index) {
          return ProductTypeCard(product: products[index]);
        });
  }
}
