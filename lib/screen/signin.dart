import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/screen/main_shop.dart';
import 'package:ecommerce/screen/main_user.dart';
import 'package:ecommerce/utility/my_style.dart';
import 'package:ecommerce/widget/normal_dialog.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String username , password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: MyStyle().primaryColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyStyle().showLogo(),
              MyStyle().mySizeBox(),
              MyStyle().showTitle('Friend Shop'),
              SizedBox(height: 50,),
              emailForm(),
              MyStyle().mySizeBox(),
              passwordForm(),
              SizedBox(height: 50,),
              loginForm(),
              MyStyle().mySizeBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailForm() {
    return Container(
      width: 280,
      child: TextField(
        onChanged: (value){
           username = value.trim();
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: MyStyle().primaryColor,
            ),
            labelStyle: TextStyle(color: MyStyle().primaryColor),
            labelText: 'Email',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().primaryColor),
            )),
      ),
    );
  }

  Widget passwordForm() {
    return Container(
      width: 280,
      child: TextField(
        onChanged: (value){
          password = value.trim();
        },
        obscureText: true,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: MyStyle().primaryColor,
            ),
            labelStyle: TextStyle(color: MyStyle().primaryColor),
            labelText: 'Password',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().primaryColor),
            )),
      ),
    );
  }


  Widget loginForm() {
    return Container(
      width: 280,
      height: 50,
      child: RaisedButton(
        onPressed: () {
          if(username == null ||
              username.isEmpty ||
              password == null ||
              password.isEmpty){

                normalDialog(context, 'ກະລຸນາຕື່ມໃສ່ບ່ອນຫວ່າງໃຫ້ຄົບ!');

          }else{
            checkAuthen();

          }
        },
        color: MyStyle().primaryColor,
        textColor: Colors.white,
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Future <void> checkAuthen()async{

    String url = 'http://192.168.137.1/ecommerc/getUserWhereUser.php?isAdd=true&username=$username';

    try {

      Response response = await Dio().get(url);
      print('res = $response');

      var result = json.decode(response.data);
      print('result = $result');

      for (var map in result) {
        userModels usermodel = userModels.fromJson(map);
        if(password == usermodel.password){

          var chooseType = usermodel.chooseType;

          if(chooseType == 'User'){
            //method
            routeToService(MainUser());


          }else if(chooseType == 'Shop'){
            //method
            routeToService(MainShop());

          }else{
            normalDialog(context, 'Error!');
          }


        }else{

          normalDialog(context, 'ລະຫັດທີ່ທ່ານໃສ່ຜິດ!');

        }
        
      }
      
    } catch (e) {
    }

     
  }

  void routeToService( Widget myWidget) {
    MaterialPageRoute route = MaterialPageRoute(builder: (context)=> myWidget,);
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

}


