import 'package:ecommerce/utility/my_style.dart';
import 'package:flutter/material.dart';

Future<void> normalDialog(BuildContext context, String message) async {
  return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Center(child: Text(message)),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('OK',style: TextStyle(color: MyStyle().primaryColor),),
                ),
              ],
            )
          ],
        );
      });
}
