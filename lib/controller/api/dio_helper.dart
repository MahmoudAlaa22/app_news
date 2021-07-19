import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'api.dart';

class DioHelper{
  static Dio dio;
  static init(){
    dio=Dio(
        BaseOptions(
          baseUrl: API.url,
          receiveDataWhenStatusError: true
        )
    );
  }
  static Future<Response> getData({
    @required  String category,
  }) async
  {
    return await dio.get(
      API.path,
      queryParameters: {
        'country':'eg',
        'category':category,
        'apiKey':API.apiKey,
      },
    );
  }
  static Future<Response> getDataOfSearch({
    @required  String value,
  }) async
  {
    return await dio.get(
      API.path,
      queryParameters: {
        'q':value,
        'apiKey':API.apiKey,
      },
    );
  }
}