import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:way_app/src/models/user.dart' show FailedErrorResponse, Data;

part 'login.g.dart';

const serverUrl = 'https://c4d80e42328e.ngrok.io';

@JsonSerializable()
class Login {
  Login({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$LoginToJson(this);

  final String username;
  final String password;
}

@JsonSerializable()
class LoginResponse {
  LoginResponse({
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  final String token;
}

class Resp {
  Resp({required this.code, required this.message, required this.token});

  int code = 0;
  String message = '';
  String token = '';
}

Future<Resp> login(String username, String password) async {
  const loginURL = serverUrl + '/users/login';
  var resp = Resp(code: 0, message: '', token: '');

  if (username == '' || password == ''){
    resp = Resp(code: 0, message: 'username or password not provided', token: '');
    return resp;
  }

  print('making req===========================');
  http.Response? response;

  var loginData = Login(username: username, password: password);

  try {
    response =
    await http.post(Uri.parse(loginURL), body: json.encode(loginData));
  } catch (e) {
    resp = Resp(code: 0, message: e.toString(), token: '');
  }

  try{
    if (response!.statusCode == 200) {

      resp = Resp(
          code: response.statusCode,
          token: LoginResponse.fromJson(json.decode(response.body)).token,
          message: '');
    } else if (response.statusCode == 500) {
      var failedErrorResponse =
      FailedErrorResponse.fromJson(json.decode(response.body));

      resp = Resp(
          code: failedErrorResponse.data.code,
          token: '',
          message: failedErrorResponse.data.message);
    } else if (response.statusCode == 400) {
      var failedErrorResponse =
      FailedErrorResponse.fromJson(json.decode(response.body));

      resp = Resp(
          code: failedErrorResponse.data.code,
          token: '',
          message: failedErrorResponse.data.message);
    } else {
      var failedErrorResponse = FailedErrorResponse(
          status: 'Failed',
          data: Data(code: 0, message: 'unable to reach server'));

      resp = Resp(
          code: failedErrorResponse.data.code,
          token: '',
          message: failedErrorResponse.data.message);
    }

  } catch (e) {
    print(e.toString());
    resp = Resp(code: 0, message: 'an error has occurred! check your internet connection and try again', token: '');
  }

  return resp;
}