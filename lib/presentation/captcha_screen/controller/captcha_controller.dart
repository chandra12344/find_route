import 'package:chandraprakash_s_application1/core/app_export.dart';
import 'package:chandraprakash_s_application1/presentation/captcha_screen/models/captcha_model.dart';
import 'package:flutter/material.dart';

class CaptchaController extends GetxController {
  TextEditingController group10033Controller = TextEditingController();

  Rx<CaptchaModel> captchaModelObj = CaptchaModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    group10033Controller.dispose();
  }
}
