import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'package:rasan/core/constant/default_value.dart';
import 'package:rasan/core/constant/strings.dart';
import 'package:rasan/core/enum/enums.dart';
import 'package:rasan/logic/auth/auth_controller.dart';
import 'package:rasan/presentation/Pages/authpage/widget/log_and_register_button.dart';

class AuthenticatePage extends StatelessWidget {
  final TextEditingController emailtextEditingController =
      TextEditingController();
  final TextEditingController passwordtextEditingController =
      TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final AuthController authController = UserAuthController();
  final _userAuthController = Get.find<UserAuthController>();

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
                      onTap: () {
                        //close Icons
                      },
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
                //Logo
                Image.asset(
                  'assets/images/logo.PNG',
                  width: 200,
                  height: 200,
                ),

                SizedBox(height: Defaults.defaultfontsize),
                //email address
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return authController.checkEmail(value)
                        ? null
                        : "not Valid Email";
                  },
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.emailAddress,
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
                //password
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return authController.checkPassword(value);
                  },
                  cursorColor: Colors.white,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: passwordtextEditingController,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                  decoration: InputDecoration(
                    errorStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                    hintText: Strings.password,
                    hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                    border: buildOutlineInputBorder(context),
                    enabledBorder: buildOutlineInputBorder(context),
                  ),
                ),
                SizedBox(height: Defaults.defaultfontsize),

                Obx(() => _userAuthController.isloading.value
                    ? CircularProgressIndicator()
                    : Text('')),

                // GetX<UserAuthController>(builder: (controller) {
                //   return Text(controller.isloading.toString());
                // }),

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

                //Buttons
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
}
