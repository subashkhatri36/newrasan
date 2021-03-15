import 'dart:convert';

import 'package:flutter/foundation.dart';

class AuthModel {
  final String emailAddress;
  final String password;

  AuthModel({
    @required this.emailAddress,
    @required this.password,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthModel &&
        other.emailAddress == emailAddress &&
        other.password == password;
  }

  @override
  int get hashCode => emailAddress.hashCode ^ password.hashCode;

  @override
  String toString() =>
      'AuthModel(emailAddress: $emailAddress, password: $password)';

  Map<String, dynamic> toMap() {
    return {
      'emailAddress': emailAddress,
      'password': password,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      emailAddress: map['emailAddress'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source));
}
