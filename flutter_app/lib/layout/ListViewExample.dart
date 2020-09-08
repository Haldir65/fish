import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title = 'ListViewPage';
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            _titleWidget(),
            _listView(1),
            Divider(
              thickness: 30,
              color: Colors.red,
              height: 30,
            ),
            _listView(2),
          ],
        ));
  }

  _titleWidget() {
    return Container(
      color: Colors.grey,
      alignment: Alignment.center,
      child: Text("标题"),
      height: 50,
    );
  }

  _listView(int flex) {
    var datas = List.generate(100, (index) {
      return "item ${index + 1}";
    });
    return Expanded(
      flex: flex,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 40,
            child: Text("${datas[index]}"),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
          );
        },
        itemCount: datas.length,
      ),
    );
  }
}
