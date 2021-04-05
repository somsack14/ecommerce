

import 'package:ecommerce/screen/signin.dart';
import 'package:ecommerce/screen/signup.dart';
import 'package:ecommerce/utility/my_style.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _signInMenu() {
      return ListTile(
        leading: Icon(Icons.login_outlined,),
        title: Text('Login'),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SignIn()));
        },
      );
    }
    Widget _signUpMenu() {
  return ListTile(
    leading: Icon(Icons.person),
    title: Text('Sign Up'),
    onTap: (){
      Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUp()));
    },
  );
}

Widget showHeader() {
  return UserAccountsDrawerHeader(
    decoration: BoxDecoration(
      color: MyStyle().primaryColor,
    ),
    accountName: Text("Guest"),
    accountEmail: Text("Please login"),
  );
}

    Drawer _showDrawer() {
  return Drawer(
    child: ListView(
      children: [
        showHeader(),
        _signInMenu(),
        _signUpMenu(),
      ],
    ),
  );
}

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().primaryColor,
        title: Center(child: Text('Ecommerce'),),
        actions: [
          Padding(padding: EdgeInsets.all(10),
          child: Icon(Icons.settings),),
        ],
      ),
      drawer: _showDrawer(),
    );
  }
}




