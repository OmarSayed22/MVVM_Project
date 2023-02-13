import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_advanced/application/app_preferences.dart';
import 'package:flutter_advanced/application/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String applicationJson = "application/json";
const String contentType = "Content-Type";
const String accept = "accept";
const String authorization = "authorization";
const String defaultLanguage = "language";

class DioFactory {
  final AppPreferences _appPreferences;

  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    String appLanguage = await _appPreferences.getAppLanguage();
    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      authorization: Constants.kToken,
      defaultLanguage: appLanguage,
    };
    Dio dio = Dio();

    dio.options = BaseOptions(
        baseUrl: Constants.kBaseUrl,
        sendTimeout: Constants.kTimeout,
        receiveTimeout: Constants.kTimeout,
        connectTimeout: Constants.kTimeout,
        headers: headers);
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }
}
