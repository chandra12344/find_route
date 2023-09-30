import 'package:chandraprakash_s_application1/core/app_export.dart';
import 'package:chandraprakash_s_application1/presentation/map_screen/models/map_model.dart';
import 'package:flutter/material.dart';

class MapController extends GetxController {
  TextEditingController inputFieldController = TextEditingController();

  TextEditingController inputFieldOneController = TextEditingController();

  Rx<MapModel> mapModelObj = MapModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    inputFieldController.dispose();
    inputFieldOneController.dispose();
  }
}
