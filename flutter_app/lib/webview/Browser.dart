import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import '../helper/index.dart' as helper;

class Browser extends StatefulWidget {
  String url;
  String title;

  Browser({this.url, this.title});

  @override
  _BrowserState createState() => _BrowserState();
}

class _BrowserState extends State<Browser> {
  dynamic _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    JavascriptChannel _toastJavascriptChannel(BuildContext context) {
      return JavascriptChannel(
          name: 'Toaster',
          onMessageReceived: (JavascriptMessage message) {
            print(message);
            Fluttertoast.showToast(
                msg: message.message
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          new WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                _controller = controller;
              },
              /**
               * 当 url 带有 'm=webview'，则打开新的webview
               */
              navigationDelegate: (NavigationRequest request) {
                // print('navigationDelegate: ${request.url}');
                // if(request.url.indexOf('m=webview') > -1) {
                //   String _url = helper.addUrlParam(request.url.replaceAll('&m=webview', ''));
                //   Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                //     return Browser(
                //         title: ' ',
                //         url: _url
                //     );
                //   }));
                //   return NavigationDecision.prevent;
                // }

                return NavigationDecision.navigate;
              },
              onPageFinished: (url) {
                // 设置标题
                _controller.evaluateJavascript("document.title").then((result){
                  print(result);
                  setState(() {
                    widget.title = result;
                  });
                });

                // var a = '123';
                // print(a+1);

                // 测试flutter 调用我页面的方法
                // _controller.evaluateJavascript("callJSFunc();").then((result){
                //   // print('callJSFunc has called: $result');
                // });
              },
              javascriptChannels: <JavascriptChannel>[ //javascriptChannels这个是api提供的互调的方法，
                _toastJavascriptChannel(context),
              ].toSet()
          )
        ],
      ),
    );
  }
}