import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:rasan/core/constant/default_value.dart';
import 'package:rasan/core/constant/strings.dart';
import 'package:rasan/core/enum/enums.dart';
import 'package:rasan/data/model/auth/auth_failure.dart';
import 'package:rasan/logic/auth/auth_controller.dart';
import 'package:rasan/presentation/Pages/authpage/widget/log_and_register_button.dart';
import 'package:get/get.dart';

class AuthenticatePage extends StatefulWidget {
  @override
  _AuthenticatePageState createState() => _AuthenticatePageState();
}

class _AuthenticatePageState extends State<AuthenticatePage> {
  TextEditingController emailtextEditingController;
  TextEditingController passwordtextEditingController;
  bool isverify = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    emailtextEditingController = TextEditingController();
    passwordtextEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Container(
              padding: EdgeInsets.all(Defaults.defaultPadding),
              child: Column(children: [
                SizedBox(height: Defaults.defaultfontsize * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding:
                            const EdgeInsets.all(Defaults.defaultfontsize / 2),
                        child: Icon(
                          Icons.close,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Defaults.defaultfontsize),
                Image.asset(
                  'assets/images/logo.PNG',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: Defaults.defaultfontsize),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    AuthFailure authFailure = new AuthFailure();
                    if (value.length < 6) {
                      return "Must be valid Email";
                    } else if (!authFailure.incorrectEmail(value)) {
                      return "Incorrect Email Address.";
                    } else {
                      return null;
                    }
                  },
                  controller: emailtextEditingController,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                  decoration: InputDecoration(
                    errorStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                    hintText: Strings.email,
                    hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                    border: buildOutlineInputBorder(context),
                    enabledBorder: buildOutlineInputBorder(context),
                  ),
                ),
                SizedBox(height: Defaults.defaultfontsize),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (_) => passwordtextEditingController.text.isEmpty
                      ? "Enter valid Password"
                      : null,
                  onChanged: (value) {
                    if (value.length < 5) {}
                  },
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: passwordtextEditingController,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                  decoration: InputDecoration(
                    errorText:
                        isverify ? 'Error please fill it correctly.' : null,
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                    hintText: Strings.password,
                    hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                    border: buildOutlineInputBorder(context),
                    enabledBorder: buildOutlineInputBorder(context),
                  ),
                ),
                SizedBox(height: Defaults.defaultfontsize),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child: Text(
                          Strings.forgetPassword,
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white),
                        )),
                  ],
                ),
                SizedBox(height: Defaults.defaultfontsize * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildLogInRegistration(
                      context: context,
                      controller: [
                        emailtextEditingController,
                        passwordtextEditingController
                      ],
                      authenticateType: AuthenticateType.LogIn,
                      formkey: formkey,
                    ),
                    buildLogInRegistration(
                      context: context,
                      controller: [
                        emailtextEditingController,
                        passwordtextEditingController
                      ],
                      authenticateType: AuthenticateType.Register,
                      formkey: formkey,
                    ),
                  ],
                )
              ]),
            ),
          ),
        ));
  }

  OutlineInputBorder buildOutlineInputBorder(BuildContext context) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
        borderRadius: BorderRadius.circular(Defaults.defaultfontsize));
  }

  @override
  void dispose() {
    emailtextEditingController.dispose();
    passwordtextEditingController.dispose();
    super.dispose();
  }
}
