import 'package:dartz/dartz.dart';
import 'package:rasan/data/data_provider/authentication.dart';
import 'package:rasan/data/model/auth/auth_model.dart';

class AuthRepositories implements Authentication {
  @override
  Future<Either<String, String>> forgetPassword({String email}) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> googleLogInandRegistration() {
    // TODO: implement googleLogInandRegistration
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> logIn({AuthModel authModel}) {
    // TODO: implement logIn
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> register({AuthModel authModel}) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
