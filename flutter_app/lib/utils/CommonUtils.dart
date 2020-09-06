import 'package:fluttertoast/fluttertoast.dart';


class CommonUtils {


  static toast(String msg) {
    Fluttertoast.showToast(msg: msg, fontSize: 14);
  }


}
