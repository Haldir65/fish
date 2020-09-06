import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventBusDemoPage extends StatelessWidget {
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

class EventSubView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EventState();
}

class EventState extends State<EventSubView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [Text('sample')],
    );
  }
}
