import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:rasan/data/model/auth/auth_model.dart';

abstract class Authentication {
  Future<Either<String, String>> logIn({@required AuthModel authModel});
  Future<Either<String, String>> register({@required AuthModel authModel});
  Future<Either<String, String>> googleLogInandRegistration();
  Future<Either<String, String>> forgetPassword({@required String email});

  Future<bool> signOut();
}
