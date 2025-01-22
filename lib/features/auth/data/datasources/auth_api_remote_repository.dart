import 'dart:convert';
import 'package:ecom/core/error/failures.dart';
import 'package:ecom/features/auth/data/entity/auth_request.dart';
import 'package:ecom/features/auth/domain/model/login_model.dart';
import 'package:ecom/features/auth/domain/model/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class AuthApiRemoteRepository {
  Future<SignUpModel> signUpWithApi({required AuthRequest authRequest});
  Future<LoginModel> loginWithApi({required AuthRequest authRequest});
}

class AuthApiRemoteDataSourceImpl implements AuthApiRemoteRepository {
  final http.Client httpClient;

  AuthApiRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<SignUpModel> signUpWithApi({required AuthRequest authRequest}) async {
    try {
      var headers = {"Content-Type": "application/json"};
      var body = {"email": authRequest.email, "password": authRequest.password};
      final url = Uri.parse('https://reqres.in/api/register');
      final response =
          await httpClient.post(url, headers: headers, body: jsonEncode(body));
      debugPrint('response.body => ${response.body}');
      debugPrint('response.statusCode => ${response.statusCode}');
      if (response.statusCode == 200) {
        return signUpModelFromJson(response.body.toString());
      } else {
        throw const ServerFailure(errorMessage: "Server Error");
      }
    } catch (e, st) {
      debugPrint('SignupUser exception : $e StackTrace : $st');
      throw const ServerFailure(errorMessage: 'Server Failed');
    }
  }

  @override
  Future<LoginModel> loginWithApi({required AuthRequest authRequest}) async {
    try {
      var headers = {"Content-Type": "application/json"};
      var body = {"email": authRequest.email, "password": authRequest.password};
      final url = Uri.parse('https://reqres.in/api/login');
      final response =
          await httpClient.post(url, headers: headers, body: jsonEncode(body));
      debugPrint('response.body => ${response.body}');
      debugPrint('response.statusCode => ${response.statusCode}');
      if (response.statusCode == 200) {
        return loginModelFromJson(response.body.toString());
      } else {
        throw const ServerFailure(errorMessage: "Server Error");
      }
    } catch (e, st) {
      debugPrint('SignupUser exception : $e StackTrace : $st');
      throw const ServerFailure(errorMessage: 'Server Failed');
    }
  }

  // @override
  // Future<SignUpModel> loginWithApi({required LogInRequest logInRequest}) async {
  //   var headers = {
  //     "Content-Type": "application/json",
  //     "calling_entity": "WEB_UI"
  //   };
  //   var body = {"email": logInRequest.email, "password": logInRequest.password};
  //   final url =
  //       Uri.parse('https://partnerapi.megmo.in/partner-service/login/login/v2');
  //   final response =
  //       await httpClient.post(url, headers: headers, body: jsonEncode(body));
  //   final decodedBody = json.decode(response.body);
  //   if (response.statusCode == 200) {
  //     log(decodedBody.toString());
  //     return AuthModel.fromJson(decodedBody);
  //   } else {
  //     log(decodedBody['message']);
  //     throw ServerFailure(errorMessage: decodedBody['message']);
  //   }
  // }
}
