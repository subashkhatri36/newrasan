import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:rasan/core/constant/strings.dart';
import 'package:rasan/core/enum/enums.dart';
import 'package:rasan/data/data_provider/authentication.dart';
import 'package:rasan/data/model/auth/auth_model.dart';
import 'package:rasan/data/repositories/auth_repositories.dart';
import 'package:get/get.dart';

abstract class AuthController {
  Future<Either<String, String>> userLogin({@required AuthModel authModel});
  Future<Either<String, String>> userRegister({@required AuthModel authModel});
  Future<Either<String, String>> userForgetPassword(
      {@required String emailAddress});
  Future<Either<String, String>> userGoogleSignIn();
  bool checkEmail(String email);
  String checkPassword(String password);
  void userLogic({
    BuildContext context,
    List<TextEditingController> controller,
    AuthenticateType authenticateType,
    GlobalKey<FormState> formkey,
  });
  Future<void> signOut();
}

class UserAuthController extends GetxController implements AuthController {
  RxBool isloading = false.obs;
  Authentication authRepositories = AuthRepositories();
  UserAuthController();

  @override
  bool checkEmail(String email) {
    String pattern =
        r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(email);
  }

  @override
  String checkPassword(String password) {
    if (password.length < 5)
      return "Password too short.";
    else
      return null;
  }

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
  Future<Either<String, String>> userLogin({AuthModel authModel}) async {
    return await authRepositories.logIn(authModel: authModel);
  }

  @override
  Future<Either<String, String>> userRegister({AuthModel authModel}) async {
    return await authRepositories.register(authModel: authModel);
  }

  @override
  void userLogic(
      {BuildContext context,
      List<TextEditingController> controller,
      AuthenticateType authenticateType,
      GlobalKey<FormState> formkey}) async {
    if (formkey.currentState.validate()) {
      Get.find<UserAuthController>().isloading.value = true;
      //validated the condiitions.....
      if (authenticateType == AuthenticateType.LogIn) {
        //Login herer

        Either<String, String> value = await userLogin(
            authModel: new AuthModel(
                emailAddress: controller[0].text,
                password: controller[1].text));

        value.fold((l) {
          defaultAlertDialog(context, l, Strings.failed);
        }, (r) {
          Get.find<UserAuthController>().isloading.value = false;
          Navigator.of(context).pushReplacementNamed('/home');
        });
      } else {
        //register here

        Either<String, String> value = await userRegister(
            authModel: new AuthModel(
                emailAddress: controller[0].text,
                password: controller[1].text));

        value.fold((l) {
          defaultAlertDialog(context, l, Strings.failed);
        }, (r) {
          Get.find<UserAuthController>().isloading.value = false;
          Navigator.of(context).pushReplacementNamed('/home');
        });
      }
    } else {
      defaultAlertDialog(context, Strings.errorMessage, Strings.failed);
      //validate

    }
  }

  Future defaultAlertDialog(BuildContext context, String value, String title) {
    return Get.defaultDialog(
        title: title,
        middleText: value,
        confirm: ElevatedButton(
          onPressed: () {
            Get.find<UserAuthController>().isloading.value = false;
            Navigator.pop(context, true);
          },
          child: Text('Ok'),
        ));
  }

  @override
  Future<void> signOut() async {
    await authRepositories.signOut();
  }
}
