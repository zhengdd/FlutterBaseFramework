import 'package:connectivity/connectivity.dart';
import 'package:flutter_base_framework/exts/CallBack.dart';

class ConnectUtil {
  static void isConnect(Act1<bool> callback) async {
    bool isconnect = false;
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      isconnect = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      isconnect = true;
    }

    if (callback != null) {
      callback(isconnect);
    }
  }
}
