import 'package:dio/dio.dart';
import 'package:mobile/service/prefs.dart';
import 'package:mobile/constants/api.dart';
import 'dart:async';

class ApiService {

  static String userToken = "";

  Dio apiAuth() {
    Options options = new Options(
        baseUrl: "http://192.168.1.2:8000/api/",
        connectTimeout: 10000,
        receiveTimeout: 6000,
        headers: {
          AUTHORIZATION: BEARER + userToken,
          "Accept": "application/json"
        });
    return new Dio(options);
  }

  Dio api() {
    Options options = new Options(
        baseUrl: "http://192.168.1.2:8000/api/",
        connectTimeout: 10000,
        receiveTimeout: 6000,
        headers: {"Accept": "application/json"});
    return new Dio(options);
  }

  removeUserToken() {
    userToken = "";
  }

  setUserToken(String token) {
    saveApiToken(token);
    userToken = token;
  }

  Future<Map<String, dynamic>> fetchUser() async {
    try {
      final token = await apiToken();
      setUserToken(token);
      final response = await api().get("v1/user",
          options: Options(headers: {AUTHORIZATION: BEARER + token, "Accept": "application/json"}));
      return response.data["data"];
    } on DioError catch (e) {
      if (e.response.statusCode == 401) {
        throw Exception("توکن شناسایی معتبر نمیباشد");
      } else {
        throw Exception(e.message);
      }
    }
  }

  Future<Map<String, dynamic>> sendPhoneNumber(String phoneNumber) async {
    try {
      final response =  await api().post("v1/start", data: {"phone_number": phoneNumber});
      return response.data["data"];
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Map<String, dynamic>> sendVerifyCode(String phoneNumber, String verifyCode) async {

    try {
      final response = await api().post("v1/verify/$phoneNumber", data: {"verify_code": verifyCode});

      setUserToken(response.data["data"]["api_token"]);

      return response.data;
    } on DioError catch (e) {
      if (e.response.statusCode == 401) {
        throw Exception(e.response.data["data"]["message"]);
      } else {
        throw Exception(e.message);
      }
    }
  }

  Future<Map<String, dynamic>> recode(String phoneNumber) async {

    try {

      final response = await api().get("v1/recode/$phoneNumber");
      return response.data["data"];

    } on DioError catch(e) {
      throw Exception(e.message);
    }
  }

  Future<Map<String, dynamic>> register(String name, String family) async {

    try {
      final response = await apiAuth().post("v1/register", data: {"name": name, "family": family});
      setFullName(name, family);
      return response.data["data"];
    } on DioError catch(e) {
      throw Exception(e.message);
    }
  }

  Future<Map<String, dynamic>> fetchAllProducts(String type,{int page: 1}) async {

    try {

      final response = await api().get("v1/products/$type?page=$page");

      return response.data;

    } on DioError catch(e) {

      throw Exception(e.message);

    }
  }

  Future<Map<String, dynamic>> fetchSubProducts(int productId, {int page: 1}) async {

    try {

      final response = await api().get("v1/sub-products/$productId?page=$page");

      return response.data;

    } on DioError catch(e) {
      throw Exception(e.message);
    }
  }
}
