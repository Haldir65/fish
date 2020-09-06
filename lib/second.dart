import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  // Widget子类中的字段往往都会定义为"final"

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      margin: const EdgeInsets.only(left: 0,top: 20),
      decoration: new BoxDecoration(color: Colors.lightGreen[500], borderRadius: new BorderRadius.circular(5.0),),
      // Row 是水平方向的线性布局（linear layout）
      child: new Row(
        //列表项的类型是 <Widget>
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.room_service),
            tooltip: 'Navigation menu',
            onPressed: () =>  print('MyTitle was tapped! ${title.toString()}'), // null 会禁用 button
          ),
          // Expanded expands its child to fill the available space.
          new Expanded(
            child: title,
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material 是UI呈现的“一张纸”
    return new Material(
      // Column is 垂直方向的线性布局.
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              '可以传值',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
            child: new Center(
              child: new Text('Hello, there!'),
            ),
          ),
          new Row(
            children: [
              new Text("hey row!",textAlign: TextAlign.center,),
              new Counter ()
            ],
          ),
          new FloatingActionButton(
            tooltip: 'Add', // used by assistive technologies
            child: new Icon(Icons.add),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
      return new Text('Count: $count');
  }
}

class CountIncrementor extends StatelessWidget {

  CountIncrementor({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context ) {
    return new RaisedButton(onPressed: onPressed,child: new Text('Increment'));
  }
}

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _CounterState();
}

class _CounterState extends State<Counter>{
  int _counter = 0;


  void _increment(){
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      new CountIncrementor(onPressed: _increment,),
      new CounterDisplay(count: _counter,)
    ],);
  }

}



void main() {
  runApp(new MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: new MyScaffold(),
  ));
}