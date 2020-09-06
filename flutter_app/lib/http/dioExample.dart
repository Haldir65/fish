//
// https://pub.flutter-io.cn/packages/dio


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class DioExamplePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    String title = 'dio';
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: ListView(
        children:[
          Text('This is SubPage $title'),
          Divider(),
          DioConatiner(),
        ]
      ),
    );
  }

}

class DioConatiner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
   return DioState();
  }
}

class DioState extends State<DioConatiner>{

  void getHttp() async {
    try {
      String dataURL = "https://jsonplaceholder.typicode.com/posts";
      Response response = await Dio().get(dataURL);
      print(response);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getHttp();
  }


  @override
  Widget build(BuildContext context) {
   return Center(
     child: Text('sample stateful '),
   );
  }
}