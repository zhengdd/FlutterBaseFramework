import 'package:dio/dio.dart';
import 'package:flutter_base_framework/Config.dart';

class DioUtil {
  static DioUtil _instance;
  static BaseOptions baseOptions;
  Dio _dio;

  DioUtil() {
    if (baseOptions == null) {
      baseOptions = new BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 3000,
        baseUrl: Config.BaseUrl,
      );
    }

    _dio = new Dio(baseOptions);
  }

  static void init(BaseOptions options) {
    if (options != null) {
      baseOptions = options;
    }
  }

  static DioUtil getInstance() {
    if (_instance == null) {
      _instance = new DioUtil();
    }

    return _instance;
  }

  Dio getDio() {
    return _dio;
  }
}
