import 'package:flutter/material.dart';
import 'package:rasan/core/constant/default_value.dart';
import 'package:rasan/core/constant/strings.dart';
import 'package:rasan/core/enum/enums.dart';
import 'package:rasan/core/theme/app_theme.dart';

Material buildLogInRegistration({
  BuildContext context,
  List<TextEditingController> controller,
  AuthenticateType authenticateType,
  GlobalKey<FormState> formkey,
}) {
  return Material(
    child: InkWell(
      onTap: () {
        if (authenticateType == AuthenticateType.LogIn) {
          if (formkey.currentState.validate()) {
            print("Validated");
          } else {
            print("Not Validated");
          }
          //sign in code is here...
          // AuthController controller = UserAuthController();
          /// controller.userRegister(
          //    authModel: AuthModel(emailAddress: 'abc', password: 'abc'));
        } else {
          //register code is here..
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.height * .2,
        padding: EdgeInsets.all(Defaults.defaultPadding),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1.5,
                  blurRadius: 1.0,
                  color: Colors.black26,
                  offset: Offset(2.0, 3.0))
            ],
            color: AppTheme.lightBtnColor,
            borderRadius:
                BorderRadius.all(Radius.circular(Defaults.defaultfontsize))),
        child: Text(
          authenticateType == AuthenticateType.LogIn
              ? Strings.logIn
              : Strings.register,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    ),
    color: Colors.transparent,
  );
}
