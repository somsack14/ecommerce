import 'package:ecommerce/utility/my_style.dart';
import 'package:flutter/material.dart';


class MainShop extends StatefulWidget {
  MainShop({Key key}) : super(key: key);

  @override
  _MainShopState createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {

  bool isSelectedElevator = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(child: Text("MainShop")),
        backgroundColor: MyStyle().primaryColor,
      ),
      body: Container(
        child: FilterChip(
          label: Text('Select'),
          selected: isSelectedElevator,
        onSelected: (value) {
          setState(() {
            isSelectedElevator = !isSelectedElevator;
          });
        },

        ),
      ),
    );
  }
}