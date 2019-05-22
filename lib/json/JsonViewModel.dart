import 'package:flutter_base_framework/json/JsonModel.dart';
import 'dart:convert';

abstract class JsonViewModel<T extends JsonModel> extends JsonModel {
  int code;
  String msg;
  T data;

  void fromJson(String data) {
    Map<String, dynamic> jMap = json.decode(data);
    code = jMap["code"];
    msg = jMap["msg"];
    if (jMap.containsKey("data")) {
      bind(jMap["data"]);
    }
  }
}

