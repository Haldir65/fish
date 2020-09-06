import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Lake Town',
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              new Text(
                'In Switzerland',
                style: new TextStyle(color: Colors.grey[500]),
              )
            ],
          )),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41')
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'Call'),
          _buildButtonColumn(color, Icons.near_me, 'Route'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    return MaterialApp(
      title: "flutter Lake",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fllutter Lake'),
        ),
        body: ListView(
          children: [
            _buildEvenDistributeImageRows(),
            _build_cardWithShadow(),
            _buildImageSection(),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      ),
    );
  }
}

Widget _buildImageSection() {
  Image img = Image.asset('images/lake.jpg',
      width: 600, height: 240, fit: BoxFit.cover);
  return GestureDetector(
    onTap: () => {print('click on this image')},
    child: img,
  );
}

Widget _buildEvenDistributeImageRows() {
  List<String> imgAssest = [
    'images/lake.jpg',
    'images/lake.jpg',
    'images/lake.jpg'
  ];
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: imgAssest
          .map((e) => Image.asset(e, width: 100, height: 100))
          .toList());
}

Widget _build_cardWithShadow() {
  var card = Card(
    child: Column(
      children: [
        ListTile(
          title: new Text('1625 Main Street',
              style: new TextStyle(fontWeight: FontWeight.w500)),
          subtitle: new Text('My City, CA 99984'),
          leading: new Icon(
            Icons.restaurant_menu,
            color: Colors.blue[500],
          ),
        ),
        new Divider(),
        new ListTile(
          title: new Text('(408) 555-1212',
              style: new TextStyle(fontWeight: FontWeight.w500)),
          leading: new Icon(
            Icons.contact_phone,
            color: Colors.blue[500],
          ),
        ),
        new ListTile(
          title: new Text('costa@example.com'),
          leading: new Icon(
            Icons.contact_mail,
            color: Colors.blue[500],
          ),
        ),
      ],
    ),
  );
  return card;
}

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: color),
        ),
      )
    ],
  );
}

Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
);

void main() {
  runApp(new MyApp());
}
