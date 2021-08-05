// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    first_name: json['first_name'] as String,
    last_name: json['last_name'] as String,
    phone_number: json['phone_number'] as String,
    username: json['username'] as String,
    password: json['password'] as String,
    confirm_password: json['confirm_password'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'phone_number': instance.phone_number,
      'username': instance.username,
      'password': instance.password,
      'confirm_password': instance.confirm_password,
    };

UserCreatedSuccessResponse _$UserCreatedSuccessResponseFromJson(
    Map<String, dynamic> json) {
  return UserCreatedSuccessResponse(
    user_id: json['user_id'] as String,
  );
}

Map<String, dynamic> _$UserCreatedSuccessResponseToJson(
        UserCreatedSuccessResponse instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
    };

FailedErrorResponse _$FailedErrorResponseFromJson(Map<String, dynamic> json) {
  return FailedErrorResponse(
    status: json['status'] as String,
    data: Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FailedErrorResponseToJson(
        FailedErrorResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    code: json['code'] as int,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

Verify _$VerifyFromJson(Map<String, dynamic> json) {
  return Verify(
    phone_number: json['phone_number'] as String,
    pin: json['pin'] as String,
  );
}

Map<String, dynamic> _$VerifyToJson(Verify instance) => <String, dynamic>{
      'phone_number': instance.phone_number,
      'pin': instance.pin,
    };

OTPRequestData _$OTPRequestDataFromJson(Map<String, dynamic> json) {
  return OTPRequestData(
    phone_number: json['phone_number'] as String,
  );
}

Map<String, dynamic> _$OTPRequestDataToJson(OTPRequestData instance) =>
    <String, dynamic>{
      'phone_number': instance.phone_number,
    };
