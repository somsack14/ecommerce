import 'package:ecommerce/utility/my_style.dart';
import 'package:flutter/material.dart';

class MainUser extends StatefulWidget {
  MainUser({Key key}) : super(key: key);

  @override
  _MainUserState createState() => _MainUserState();
}

class _MainUserState extends State<MainUser> {
  bool isSelectedElevator = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("MainUser")),
        backgroundColor: MyStyle().primaryColor,
      ),
      body: Container(
        child: FilterChip(
          label: Text('Select'),
          tooltip: 'FiterChip',
          selected: isSelectedElevator,
        onSelected: (value) {
          setState(() {
            isSelectedElevator = value;
            if(isSelectedElevator == true){
              print('sadsa');
            }else{
              print("object");
            }
          });
        },

        ),
      ),
    );
  }
}