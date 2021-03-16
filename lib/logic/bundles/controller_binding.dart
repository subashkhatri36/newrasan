import 'package:get/instance_manager.dart';
import 'package:rasan/logic/auth/auth_controller.dart';
import 'package:rasan/logic/firebase_controller.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAuthController>(() => UserAuthController());
    Get.put<FirebaseInfo>(FirebaseInfo(), permanent: true);
  }
}
