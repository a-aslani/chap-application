import 'package:flutter/material.dart';
import 'package:mobile/components/pages/home/product_card.dart';
import 'package:mobile/components/pages/home/propery_banner.dart';
import 'package:mobile/components/snackbar/app_snackbar.dart';
import 'package:mobile/service/api/api_service.dart';

class OffsetProductsView extends StatefulWidget {
  final scaffoldKey;

  OffsetProductsView({@required this.scaffoldKey});

  @override
  _OffsetProductsViewState createState() => _OffsetProductsViewState();
}

class _OffsetProductsViewState extends State<OffsetProductsView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: ApiService().fetchAllProducts('offset'),
      builder: (context, snapshot) {
        if (snapshot.hasError)
          AppSnackbar.show(widget.scaffoldKey, snapshot.error.toString(), 7);
        return snapshot.hasData
            ? ProductsList(
                response: snapshot.data, scaffoldKey: widget.scaffoldKey)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}

class ProductsList extends StatefulWidget {
  final Map<String, dynamic> response;
  final scaffoldKey;

  ProductsList({this.response, this.scaffoldKey});

  @override
  ProductsListState createState() {
    return new ProductsListState();
  }
}

class ProductsListState extends State<ProductsList> {
  List<dynamic> products;
  ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  int _totalPage;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    products = widget.response["data"];
    _totalPage = widget.response["meta"]["last_page"];
    _scrollController.addListener(() {

      if (_scrollController.position.maxScrollExtent -
          _scrollController.position.pixels <=
          200) {
        if(_currentPage <= _totalPage && !_isLoading) {
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

      final response = await ApiService().fetchAllProducts('offset', page: _currentPage + 1);

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
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      itemCount: products != null ? products.length + 1 : 0,
      itemBuilder: (context, index) {

        if (index == 0) {
          return PropertyBanner(
              type: "آفست", time: "زمان زیاد", money: "به صرفه در تیراژ بالا");
        }

        return ProductCard(product: products[index - 1]);
      },
    );
  }
}
