//
// https://pub.flutter-io.cn/packages/dio

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/http/Album.dart';
import 'package:flutter_app/http/Post.dart';

class DioExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'dio';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(children: [
        Text('This is SubPage $title',
            style: TextStyle(), textAlign: TextAlign.center),
        Divider(),
        DioConatiner(),
      ]),
    );
  }
}

class DioConatiner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DioState();
  }
}

class DioState extends State<DioConatiner> {
  final _posts = [Post(userId: 10, id: 1, title: "fiurts", body: "hey")];
  final _albums = [
    Album(albumId: 1, id: 1, title: 'rock', url: 'bai', thumbnailUrl: '1')
  ];

  void _getHttp() async {
    try {
      String dataURL = "https://jsonplaceholder.typicode.com/posts";
      Response response = await Dio().get(dataURL);
      // print(response);
      setState(() {
        _posts.clear();
        for (Map i in response.data) {
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
    // _getHttp();
    _loadJsonPictureFromDisk();
    // var datas = List.generate(100, (index) {
    //   return "item ${index + 1}";
    // });
    // datas.forEach((element) {
    //   print(element);
    // });
  }

  void _loadJsonPictureFromDisk() async {
    // _loadFromAsset();
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/posts.json");
    final jsonResult = json.decode(data);
    setState(() {
      _albums.clear();
      for (Map i in jsonResult) {
        _albums.add(Album.fromJson(i));
      }
      print(_albums[0].thumbnailUrl);
    });
  }

  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString("assets/posts.json");
  }

  Future parseJson() async {
    String jsonString = await _loadFromAsset();
    final jsonResponse = jsonDecode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _albums
          .map((e) => ListTile(
              title: Text(e.title),
              onTap: () => {print(e.thumbnailUrl)},
              subtitle: Container(
                color: Colors.blueGrey,
                child:_buildImageBoxes(e)
                ,
              )))
          .take(20)
          .toList(),
    );
  }
}

Widget _buildImageBoxes(Album a) {
  // return Text(a.title);
  return Row(
    children: [
      Expanded(flex: 3, child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("SubTitleHeading",textHeightBehavior: TextHeightBehavior(
              applyHeightToFirstAscent: true
          ),),
          Text(a.url,textHeightBehavior: TextHeightBehavior(
              applyHeightToFirstAscent: true
          ),)
        ],
      )),
      Expanded(flex: 1, child: Image.asset('images/lake.jpg',width: 100,height: 100,))
    ],
  );
}
