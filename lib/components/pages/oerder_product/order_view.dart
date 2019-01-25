import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mobile/components/button/rounded_button.dart';

class OrderView extends StatefulWidget {
  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  List _payeh = ["منو یک", "منو دو", "منو سه"];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentPayeh;

  @override
  void initState() {
    _dropDownMenuItems = _getDropDownMenuItems(_payeh);
//    _currentPayeh = _dropDownMenuItems[0].value;

    super.initState();
  }

  List<DropdownMenuItem<String>> _getDropDownMenuItems(List items) {
    List<DropdownMenuItem<String>> _items = List();
    for (String item in items) {
      _items.add(DropdownMenuItem(value: item, child: Text(item)));
    }
    return _items;
  }

  Swiper _imageSlider = Swiper(
    itemBuilder: (BuildContext context, int index) {
      return new Image.network(
        "http://via.placeholder.com/350x150",
        fit: BoxFit.fill,
      );
    },
    itemCount: 3,
    pagination: new SwiperPagination(),
    control: null,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: size.width,
            height: 250,
            child: _imageSlider,
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            child: Text("انتخاب کنید"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            child: DropdownButtonFormField(
              value: _currentPayeh,
              items: _dropDownMenuItems,
              onChanged: changedDropDownItem,
              decoration: InputDecoration(
                  labelText: "پایه",
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38)),
                  hasFloatingPlaceholder: true),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                width: size.width,
                child: Chip(label: Text("مجموع قیمت 253,250 تومان")),
              )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            child: Container(
              width: size.width,
              child: RoundedButton(
                  color: Colors.blue, text: "ثبت سفارش", onPressed: () {}),
            ),
          )
        ],
      ),
    );
  }

  void changedDropDownItem(String selected) {
    setState(() {
      _currentPayeh = selected;
    });
  }
}
