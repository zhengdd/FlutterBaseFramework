import 'package:flutter_base_framework/json/JsonModel.dart';

class UserModel extends JsonModel {
  String name;
  int age;
  int sex;

  @override
  void bind(Map<String, dynamic> jMap) {
    // TODO: implement bind
    name = jMap["name"];
    age = jMap["age"];
    sex = jMap["sex"];
  }
}
