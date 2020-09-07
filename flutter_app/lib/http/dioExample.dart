//
// https://pub.flutter-io.cn/packages/dio


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/http/Post.dart';


class DioExamplePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    String title = 'dio';
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          Text('This is SubPage $title',style: TextStyle(),textAlign: TextAlign.center),
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

  final _posts =  [Post(userId:10,id:1,title:"fiurts",body:"hey")];


  void getHttp() async {
    try {
      String dataURL = "https://jsonplaceholder.typicode.com/posts";
      Response response = await Dio().get(dataURL);
      print(response);
      setState(() {
        _posts.clear();
        for(Map i in response.data){
          _posts.add(Post.fromJson(i));
        }
      });
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
     return Column(
     children:
         _posts.map((e) => ListTile(
           title: Text(e.title),
           onTap: () => {
             print(e.body)
           },
           subtitle: Text(e.body),
         )).take(10).toList(),

   );
  }
}