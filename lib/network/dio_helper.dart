import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.malkanat.co/api/',
        receiveDataWhenStatusError: true,
        headers: {
          //'content_Type':'application/json'
          'lang': 'en',
        },
      ),
    );
  }

  static Future<Response> getData({
    @required String url,
     Map<String, dynamic> query,
     int id ,
    String lang = 'ar',
    String token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
    };
    return await dio.get(url, queryParameters: query);
  }

  static postData({
    @required String url,
    Map<String, dynamic> query,
    @required Map<String, dynamic> data,
    String lang = 'ar',
    String token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
    };
    return await dio.post(url, queryParameters: query, data: data);
  }
}
