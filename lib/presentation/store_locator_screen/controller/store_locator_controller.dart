import 'package:chandraprakash_s_application1/core/app_export.dart';
import 'package:chandraprakash_s_application1/presentation/store_locator_screen/models/store_locator_model.dart';

class StoreLocatorController extends GetxController {
  Rx<StoreLocatorModel> storeLocatorModelObj = StoreLocatorModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
