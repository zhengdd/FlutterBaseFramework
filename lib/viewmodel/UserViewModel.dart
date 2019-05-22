import 'package:flutter_base_framework/json/JsonViewModel.dart';
import 'package:flutter_base_framework/model/UserModel.dart';

class UserViewModel extends JsonViewModel<UserModel> {

  @override
  void bind(Map<String, dynamic> jMap) {
    // TODO: implement bind
    data = new UserModel();
    data.bind(jMap);
  }
}
