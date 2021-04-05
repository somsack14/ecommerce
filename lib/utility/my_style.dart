

import 'package:flutter/material.dart';

class MyStyle{

  //Title
  Widget showTitle(String title){
    return Text(title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blueGrey[400]),);
  }
  //Title h2
  Widget showTitleH2(String title){
    return Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold ,color: Colors.blueGrey[400] ),);
  }

  //SizedBox
  Widget mySizeBox(){
    return SizedBox(width: 20,height: 20,);
  }


  // color
  Color darkColor = Colors.blue.shade800;
  Color primaryColor = Colors.blueGrey[400];

  // show waiting loadding...
  Widget showProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  // show image url
  Container showImage(){
     return Container(
       child: Image.network("https://media3.s-nbcnews.com/j/newscms/2019_41/3047866/191010-japan-stalker-mc-1121_06b4c20bbf96a51dc8663f334404a899.fit-760w.JPG"),
     );
  }

  Widget showLogo() {
  return Container(
      width: 120, height: 120, child: Image.asset('images/logo.png'));
  }

  MyStyle();

}