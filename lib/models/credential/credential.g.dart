// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CredentialImpl _$$CredentialImplFromJson(Map<String, dynamic> json) =>
    _$CredentialImpl(
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      barangay: json['barangay'] as String?,
      email: json['email'] as String,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$CredentialImplToJson(_$CredentialImpl instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'barangay': instance.barangay,
      'email': instance.email,
      'password': instance.password,
    };
