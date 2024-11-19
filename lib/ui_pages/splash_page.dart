import 'dart:async';

import 'package:expense/data/local_data/dbhelper.dart';
import 'package:expense/ui_pages/bottomnav_page.dart';
import 'package:expense/ui_pages/login_page.dart';
import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget{
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), ()async{
      SharedPreferences pref =await SharedPreferences.getInstance();
      int isCheck =  pref.getInt(DBhelper.UID_KEY)??0;
      Widget navTo = LoginPage();
      if(isCheck>0){
        navTo=BottomNavPage();
      }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => navTo,));

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Welcome To Expense",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),),
    );
  }
}