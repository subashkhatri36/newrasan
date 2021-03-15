import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:get/state_manager.dart';
import 'package:rasan/data/model/auth/auth_model.dart';
import 'package:rasan/data/repositories/auth_repositories.dart';

abstract class AuthController {
  Future<Either<String, String>> userLogin({@required AuthModel authModel});
  Future<Either<String, String>> userRegister({@required AuthModel authModel});
  Future<Either<String, String>> userForgetPassword(
      {@required String emailAddress});
  Future<Either<String, String>> userGoogleSignIn();
}
/*
///String pattern =
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";
  RegExp regExp = new RegExp(pattern);

  return regExp.hasMatch(value);

*/

class UserAuthController extends GetxController implements AuthController {
  AuthRepositories authRepositories;
  UserAuthController();

  @override
  Future<Either<String, String>> userForgetPassword({String emailAddress}) {
    // TODO: implement userForgetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> userGoogleSignIn() {
    // TODO: implement userGoogleSignIn
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> userLogin({AuthModel authModel}) {
    return authRepositories.logIn(authModel: authModel);
  }

  @override
  Future<Either<String, String>> userRegister({AuthModel authModel}) {
    return authRepositories.register(authModel: authModel);
  }
}
