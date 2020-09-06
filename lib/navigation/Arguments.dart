class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments({this.title, this.message});

  @override
  String toString() {
    return 'title = $title message = $message';
  }
}


class PageData {
  String url;
  String desc;
  ScreenArguments payLoad;

  PageData({this.url,this.desc,this.payLoad});

}