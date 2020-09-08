import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_app/layout/ListViewExample.dart';
import 'package:flutter_app/navigation/PageB.dart';
import 'package:flutter_app/navigation/constants.dart';
import 'package:flutter_app/navigation/Arguments.dart';
import 'package:flutter_app/http/dioExample.dart';
import 'package:flutter_app/utils/CommonUtils.dart';

void main() {
  runApp(new MaterialApp(
    title: "页面跳转",
    // onGenerateRoute: generateRoute,
    initialRoute: homeRoute,
    home: MyAppHomePage(),
    routes: {
      feedRoute: (context) => MyPage(
            title: feedRoute,
          ),
      aboutRoute: (context) => MyPage(
            title: aboutRoute,
          ),
      dioExample:(context) => DioExamplePage(),
      layoutListView: (context) => ListViewPage()
    },
    // routes: <String, WidgetBuilder>{
    //   '/a': (BuildContext context) => MyPage(title: 'PageA a'),
    // },
  ));
}


// Route generateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case homeRoute:
//       return MaterialPageRoute(builder: (_) => MyAppHomePage());
//     case feedRoute:
//       return MaterialPageRoute(builder: (_) => MyPage(title: feedRoute));
//     case aboutRoute:
//       // final ScreenArguments args = settings.arguments;
//       // print(args);
//       return MaterialPageRoute(builder: (_) => MyPage(title: aboutRoute));
//     case dioExample:
//       return MaterialPageRoute(builder: (_) => DioExamplePage());
//     default:
//       return MaterialPageRoute(
//           builder: (_) => Scaffold(
//                 body: Center(
//                     child: Text('No route defined for ${settings.name}')),
//               ));
//   }
// }

class MyAppHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('页面A')),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('点击Fab跳转最简单的页面'),
              Divider(),
              _buildBodyElements(context),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _toSimplestPage(context),
        tooltip: 'Update Text',
        child: new Icon(Icons.update),
      ),
    );
  }

  Widget _buildBodyElements(BuildContext context) {
    List<PageData> pages = List.of([
      PageData(url: feedRoute, desc: "点击跳转$feedRoute",payLoad:ScreenArguments(title:'feed',message:'message')),
      PageData(url: aboutRoute, desc: "点击跳转$aboutRoute",payLoad:ScreenArguments(title:'message',message:'message')),
      PageData(url: dioExample, desc: "点击跳转$dioExample",payLoad:ScreenArguments(title:'dioExample',message:'dioExample')),
      PageData(url: layoutListView, desc: "点击跳转$layoutListView",payLoad:ScreenArguments(title:'layoutListView',message:'layoutListView')),
    ]);
    var card = Card(
      child: Column(
        children: pages.map((p) {
          return Column(
              children: [
                ListTile(
                  title: Text(
                    p.desc,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                    leading: new Icon(
                      Icons.restaurant_menu,
                      color: Colors.blue[500],
                    ),
                  onTap: () => {
                    _toPageWithParams(context, p.url, p.payLoad)
                  },
                ),
                Divider()
              ],
          );
        }).toList()
        ,
      ),
    );
    return card;
  }

  void _toPageWithParams(BuildContext context, String path, ScreenArguments params) {
    CommonUtils.toast('跳转到 $path');
    Navigator.pushNamed(context, path,
        arguments: params);
  }

  void _toSimplestPage(BuildContext context) {
    print('ready to go to Simple Page');
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return SimpleScaffoldPage();
        },
      ),
    );
  }
}
