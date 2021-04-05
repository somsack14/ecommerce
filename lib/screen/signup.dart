import 'package:dio/dio.dart';
import 'package:ecommerce/utility/my_style.dart';
import 'package:ecommerce/widget/normal_dialog.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String chooseType, username, email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: MyStyle().primaryColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyStyle().mySizeBox(),
              MyStyle().showLogo(),
              MyStyle().mySizeBox(),
              MyStyle().showTitle('Friend Shop'),
              MyStyle().mySizeBox(),
              usernameForm(),
              MyStyle().mySizeBox(),
              emailForm(),
              MyStyle().mySizeBox(),
              passwordForm(),
              MyStyle().mySizeBox(),
              MyStyle().showTitleH2('ເລືອກຮູບແບບຜູ້ສະໝັກ :'),
              MyStyle().mySizeBox(),
              userRadio(),
              adminRadio(),
              MyStyle().mySizeBox(),
              loginForm(),
              MyStyle().mySizeBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget userRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                  hoverColor: MyStyle().primaryColor,
                  activeColor: MyStyle().primaryColor,
                  value: 'User',
                  groupValue: chooseType,
                  onChanged: (value) {
                    setState(() {
                      chooseType = value;
                    });
                  },
                ),
                Text(
                  'ຜູ້ຊື້',
                  style: TextStyle(color: MyStyle().primaryColor),
                )
              ],
            ),
          ),
        ],
      );

  Widget adminRadio() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          width: 250.0,
          child: Row(
            children: <Widget>[
              Radio(
                value: 'Shop',
                focusColor: MyStyle().primaryColor,
                activeColor: MyStyle().primaryColor,
                groupValue: chooseType,
                onChanged: (value) {
                  setState(() {
                    chooseType = value;
                  });
                },
              ),
              Text(
                'ຜູ້ຂາຍ',
                style: TextStyle(color: MyStyle().primaryColor),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget loginForm() {
    return Container(
      width: 280,
      height: 50,
      child: RaisedButton(
        onPressed: () {
          print(
              ' username = $username , email = $email , password = $password ,chooseType = $chooseType');

          if (username == null ||
              username.isEmpty ||
              email == null ||
              email.isEmpty ||
              password == null ||
              password.isEmpty) {

               print('have space');
               normalDialog(context, 'ກະລຸນາຕື່ມໃສ່ບ່ອນຫວ່າງໃຫ້ຄົບ!');

              }
              else if (chooseType == null){
                normalDialog(context, 'ກະລຸນາເລືອກຮູບແບບຜູ້ສະໝັກ !');
              }
              else{
                // if not fail connect
                checkUserThread();
              }
              
        },
        color: MyStyle().primaryColor,
        textColor: Colors.white,
        child: Text(
          'Register',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );

    


  }
  //check user in database

  Future <Null> checkUserThread()async{
    String url = 'http://192.168.137.1/ecommerc/getUserWhereUser.php?isAdd=true&username=$username';

    try {

      Response response = await Dio().get(url);
    if(response.toString() == 'null'){
      registerThread();
    }else{
      normalDialog(context, '$username ນີ້ມີຄົນໃຊ້ແລ້ວ!');

    }
      
    } catch (e) {
    }

  }

  //insert value dio
  Future <Null> registerThread()async{

    String url = 'http://192.168.137.1/ecommerc/addData.php?isAdd=true&username=$username&email=$email&password=$password&chooseType=$chooseType';

    try {
      //insert value to database

      Response response = await Dio().get(url);
      print(' res = $response');

      //if insert success go to home page
      if(response.toString() == 'true'){
        Navigator.pop(context);
        
      }else{
        normalDialog(context, 'ກະລຸນາລອງໃໝ່!');
      }
    } catch (e) {

    }
      
  }


  Widget usernameForm() {
    return Container(
      width: 280,
      child: TextField(
        cursorColor: MyStyle().primaryColor,
        onChanged: (value) {
          username = value.trim();
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.person,
              color: MyStyle().primaryColor,
            ),
            labelStyle: TextStyle(color: MyStyle().primaryColor),
            labelText: 'Username',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().primaryColor),
            )),
      ),
    );
  }

  Widget emailForm() {
    return Container(
      width: 280,
      child: TextField(
        cursorColor: MyStyle().primaryColor,
        onChanged: (value) {
          email = value.trim();
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
        cursorColor: MyStyle().primaryColor,
        onChanged: (value) {
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
}
