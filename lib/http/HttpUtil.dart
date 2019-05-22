import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_base_framework/exts/CallBack.dart';
import 'package:flutter_base_framework/http/DioUtil.dart';
import 'package:flutter_base_framework/utils/ConnectUtil.dart';
import 'package:flutter_base_framework/utils/LogUtil.dart';

import '../Config.dart';

class HttpUtil {
  static String errorMsg = "{\"code\":0,\"msg\":\"数据访问错误，请检查\"}";
  static String errorNet = "{\"code\":19,\"msg\":\"网络错误，请检查网络情况\"}";

  static Map<String, dynamic> mheaders;

  static Future get(String path, Act2<int, String> callback) {
    _doHttp(path, "GET", callback);
  }

  static Future post(
      String path, Map<String, dynamic> params, Act2<int, String> callback) {
    _doHttp(path, "POST", callback, queryParameters: params);
  }

  static Future _doHttp(
    String path,
    String method,
    Act2<int, String> callback, {
    data,
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> handers,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    LogUtil.d("HttpUtil", "Path:" + Config.BaseUrl + path + " method:" +
        method);
    Options options = _checkOptions(method, null);
    //可以通过mheaders配置公共head
    mheaders = new Map<String, dynamic>();
    if (handers != null) {
      mheaders.addAll(handers);
    }
    options.headers = mheaders;

    ConnectUtil.isConnect((val) async {
      if (val) {
        try {
          Response<String> response =
              await DioUtil.getInstance().getDio().request(
                    path,
                    data: data,
                    options: options,
                    queryParameters: queryParameters,
                    cancelToken: cancelToken,
                    onSendProgress: onSendProgress,
                    onReceiveProgress: onReceiveProgress,
                  );
          final code = response.statusCode;
          final strJson = response.data.toString();
          LogUtil.d("HttpUtil", "code:" + code.toString() + " outdata:" + data);
          if (strJson != null && strJson != "") {
            if (code != 200) {
              callback(0, errorMsg);
            } else {
              callback(code, strJson);
            }
          } else {
            callback(0, errorMsg);
          }
        } catch (e) {
          LogUtil.e("HttpUtil", e.toString());
          callback(0, errorMsg);
        }
      } else {
        callback(19, errorNet);
      }
    });
  }

  static Options _checkOptions(method, options) {
    if (options == null) {
      options = new Options();
    }
    options.method = method;
    return options;
  }
}
