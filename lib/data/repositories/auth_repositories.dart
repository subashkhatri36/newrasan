import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/utils.dart';
import 'package:rasan/data/data_provider/authentication.dart';
import 'package:rasan/data/model/auth/auth_failure.dart';
import 'package:rasan/data/model/auth/auth_model.dart';
import 'package:get/get.dart';
import 'package:rasan/logic/firebase_controller.dart';

class AuthRepositories implements Authentication {
  //final FirebaseUser _user;

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
  Future<Either<String, String>> logIn({AuthModel authModel}) async {
    try {
      Get.find<FirebaseInfo>().userCredential = await Get.find<FirebaseInfo>()
          .firebaseAuth
          .signInWithEmailAndPassword(
            email: authModel.emailAddress,
            password: authModel.password,
          );

      if (Get.find<FirebaseInfo>().userCredential != null) {
        Get.find<FirebaseInfo>().userId =
            Get.find<FirebaseInfo>().userCredential.user.uid;

        return right('Success');
      } else {
        return left("Authentication Failed !");
      }
      //
    } on FirebaseAuthException {
      return left("Something went Wrong !\nAuthentication Failed !");
    }
  }

  @override
  Future<Either<String, String>> register({AuthModel authModel}) async {
    try {
      await Get.find<FirebaseInfo>()
          .firebaseAuth
          .createUserWithEmailAndPassword(
            email: authModel.emailAddress,
            password: authModel.password,
          )
          .then((value) {})
          .catchError((e) {
        return left(e.toString());
      });
      if (Get.find<FirebaseInfo>().userCredential.user != null) {
        Get.find<FirebaseInfo>().userId =
            Get.find<FirebaseInfo>().userCredential.user.uid;

        return right('Success');
      } else {
        return left("Registration Failed !");
      }

      //.user;
    } on AuthFailure {
      return left("Something went Wrong !\nAuthentication Failed !");
    }
  }

  @override
  Future<bool> signOut() async {
    if (Get.find<FirebaseInfo>().firebaseAuth.currentUser != null) {
      Get.find<FirebaseInfo>().userCredential = null;
      Get.find<FirebaseInfo>().userId = "";
      await Get.find<FirebaseInfo>().firebaseAuth.signOut();
      return true;
    } else {
      return false;
    }
  }
}
