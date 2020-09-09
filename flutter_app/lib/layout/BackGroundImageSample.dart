import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const pageData = {
  "discountStatus": 2,
  "subscribeStatus": "0",
  "title": "限时免费",
  "subTitle": "活动时间9月1日-9月30日",
  "packageList": [
    {
      "id": 23,
      "desc": "月度订阅",
      "dealPrice": 10,
      "originPrice": 50,
      "recommand": 1
    },
    {
      "id": 33,
      "desc": "半年订阅",
      "dealPrice": 56,
      "originPrice": 280,
      "recommand": 0
    },
    {
      "id": 56,
      "desc": "年度订阅",
      "dealPrice": 108,
      "originPrice": 540,
      "recommand": 0
    }
  ]
};

class BackGroundImage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BackGroundState();
}

class BackGroundState extends State<BackGroundImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('img as bg'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[_buildHeader()],
    );
  }

  Widget _buildHeader() {
    return new Container(
      height: 160.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/lake.jpg"), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // alignment: WrapAlignment.center,
        // crossAxisAlignment: WrapCrossAlignment.center,
        // runSpacing: 9.0,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('批量管理功能',
                  style: TextStyle(
                      fontSize: 16.0, color: Color.fromRGBO(234, 200, 134, 1)))
            ],
          ),
          Wrap(
            runSpacing: 9.0,
            alignment: WrapAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('${pageData['title']}',
                      style: TextStyle(
                          fontSize: 38.0,
                          color: Color.fromRGBO(234, 200, 134, 1)))
                ],
              ),
              //自定义圆角
              ClipRRect(
                  borderRadius: BorderRadius.circular(12.5),
                  child: Container(
                      height: 25.0,
                      width: 190.0,
                      color: Color.fromRGBO(234, 200, 134, 1),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '${pageData['subTitle']}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(113, 80, 24, 1)),
                            )
                          ])))
            ],
          )
        ],
      ),
    );
  }
}
