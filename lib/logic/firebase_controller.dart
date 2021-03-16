import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/state_manager.dart';

class FirebaseInfo extends GetxController {
  String userId = ''.obs();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance.obs();
  UserCredential userCredential = null.obs();
}
