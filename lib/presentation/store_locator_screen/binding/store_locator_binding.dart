import '../controller/store_locator_controller.dart';
import 'package:get/get.dart';

class StoreLocatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreLocatorController());
  }
}
