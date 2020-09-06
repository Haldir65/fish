import 'package:flutter/material.dart';
import 'package:flutter_app/navigation/Arguments.dart';


class MyPage extends StatelessWidget {
  MyPage({this.title});
  final String title ;


  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    // print('=======');
    // print(args);
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Center(
        child: Text('This is SubPage $title'),
      ),
    );
  }
}

class SimpleScaffoldPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Page')),
      body: Center(
        child: FlatButton(
          child: Text('POP'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
