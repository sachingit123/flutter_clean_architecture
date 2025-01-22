// ignore_for_file: empty_catches

import 'dart:convert';
import 'dart:developer';
import 'package:ecom/core/constants/app_urls.dart';
import 'package:ecom/features/users/domain/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/failures.dart';

abstract class UsersApiRemoteRepository {
  Future<List<UserModel>> getUsers();
  // Future<AddBookingModel> addBooking(
  //     {required AddBookingRequest addBookingRequest});
}

class UsersApiRemoteRepositoryImpl implements UsersApiRemoteRepository {
  final http.Client httpClient;
  UsersApiRemoteRepositoryImpl({required this.httpClient});

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      log('get-users');
      var headers = {"Content-Type": "application/json"};
      final url = Uri.parse(AppUrl.userApi);
      final response = await httpClient.get(url, headers: headers);
      if (response.statusCode == 200) {
        final decodedBody = json.decode(response.body.toString());
        log("UsersResponse = $decodedBody");
        // return UserModel.fromJson(decodedBody);
        return userModelFromJson(response.body.toString());
      } else {
        log('Something went wrong with getusers: ${response.statusCode}');
        throw const ServerFailure(errorMessage: 'Server Failed');
      }
    } catch (e, st) {
      debugPrint('getUsers exception : $e StackTrace : $st');
      throw const ServerFailure(errorMessage: 'Server Failed');
    }
  }

  // @override
  // Future<AddBookingModel> addBooking(
  //     {required AddBookingRequest addBookingRequest}) async {
  //   var data = jsonEncode(addBookingRequest.toJson());
  //   debugPrint('AddBookingModel Data: $data');
  //   var headers = {
  //     "Content-Type": "application/json",
  //     "calling_entity": "WEB_UI"
  //   };
  //   final url = Uri.parse(
  //       'https://partnerapi.megmo.in/partner-service/booking/addBooking/v2');
  //   final response = await httpClient.post(url,
  //       headers: headers, body: jsonEncode(addBookingRequest.toJson()));
  //   // debugPrint('response code: ${response.statusCode}');
  //   debugPrint('response body: ${response.body}');
  //   if (response.statusCode == 200) {
  //     final decodedBody = json.decode(response.body);
  //     log(decodedBody.toString());
  //     return AddBookingModel.fromJson(decodedBody);
  //   } else {
  //     throw const ServerFailure(errorMessage: 'Server Failed');
  //   }
  // }
}
