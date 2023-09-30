import '../controller/captcha_controller.dart';
import 'package:get/get.dart';

class CaptchaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CaptchaController());
  }
}
