import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    required this.first_name,
    required this.last_name,
    required this.phone_number,
    required this.username,
    required this.password,
    required this.confirm_password,
  });

  Map<String, dynamic> toJson() => _$UserToJson(this);

  final String first_name;
  final String last_name;
  final String phone_number;
  final String username;
  final String password;
  final String confirm_password;
}

@JsonSerializable()
class UserCreatedSuccessResponse {
  UserCreatedSuccessResponse({required this.user_id});

  factory UserCreatedSuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$UserCreatedSuccessResponseFromJson(json);

  String user_id;
}

@JsonSerializable()
class FailedErrorResponse {
  FailedErrorResponse({required this.status, required this.data});

  factory FailedErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$FailedErrorResponseFromJson(json);

  String status;
  Data data;
}

@JsonSerializable()
class Data {
  Data({required this.code, required this.message});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  int code;
  String message;
}

class Resp {
  Resp({required this.code, required this.message, required this.userId});

  int code = 0;
  String message = '';
  String userId = '';
}

Future<Resp> createUser(String firstName, String lastName, String phoneNumber,
    String username, String password, String confirmPassword) async {
  const createUserURL = 'https://9b9be08e9eb3.ngrok.io/users';
  var resp = Resp(code: 0, message: '', userId: '');

  print('making req==================================================');
  http.Response? response;

  var user = User(
      first_name: firstName,
      last_name: lastName,
      phone_number: phoneNumber,
      username: username,
      password: password,
      confirm_password: confirmPassword);

  try {
    response =
        await http.post(Uri.parse(createUserURL), body: json.encode(user));
  } catch (e) {
    resp = Resp(code: 0, message: e.toString(), userId: '');
  }

  try{
    if (response!.statusCode == 200) {
      resp = Resp(
          code: response.statusCode,
          userId: UserCreatedSuccessResponse.fromJson(json.decode(response.body))
              .user_id,
          message: '');
    } else if (response.statusCode == 500) {
      var failedErrorResponse =
      FailedErrorResponse.fromJson(json.decode(response.body));

      resp = Resp(
          code: failedErrorResponse.data.code,
          userId: '',
          message: 'an error has occurred on the server');
    } else if (response.statusCode == 400) {
      var failedErrorResponse =
      FailedErrorResponse.fromJson(json.decode(response.body));

      resp = Resp(
          code: failedErrorResponse.data.code,
          userId: '',
          message: failedErrorResponse.data.message);
    } else {
      var failedErrorResponse = FailedErrorResponse(
          status: 'Failed',
          data: Data(code: 0, message: 'unable to reach server'));

      resp = Resp(
          code: failedErrorResponse.data.code,
          userId: '',
          message: failedErrorResponse.data.message);
    }

  } catch (e) {
    print(e.toString());
    resp = Resp(code: 0, message: 'an error has occurred! check your internet connection and try again', userId: '');
  }

  return resp;
}
