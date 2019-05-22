import 'package:flutter_base_framework/exts/CallBack.dart';
import 'package:flutter_base_framework/http/HttpUtil.dart';
import 'package:flutter_base_framework/viewmodel/UserViewModel.dart';

class UserDao {
  static void login(
      String name, String pwd, Act2<int, UserViewModel> callback) {
    Map<String, Object> params = new Map<String, Object>();
    params.addAll({"name": name, "pwd": pwd});
    HttpUtil.post("/login", params, (code, data) {
      UserViewModel vm = new UserViewModel();
      vm.fromJson(data);
      if (callback != null) {
        callback(vm.code, vm);
      }
    });
  }
}
