import 'controller/captcha_controller.dart';
import 'package:chandraprakash_s_application1/core/app_export.dart';
import 'package:chandraprakash_s_application1/widgets/custom_button.dart';
import 'package:chandraprakash_s_application1/widgets/custom_icon_button.dart';
import 'package:chandraprakash_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class CaptchaScreen extends GetWidget<CaptchaController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.gray50,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 14,
            right: 14,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.maxFinite,
                child: Container(
                  margin: getMargin(
                    bottom: 5,
                  ),
                  padding: getPadding(
                    left: 7,
                    top: 11,
                    right: 7,
                    bottom: 11,
                  ),
                  decoration: AppDecoration.outlineBluegray10002,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                        focusNode: FocusNode(),
                        controller: controller.group10033Controller,
                        hintText: "msg_select_all_images".tr,
                        margin: getMargin(
                          top: 1,
                        ),
                        variant: TextFormFieldVariant.FillBlueA200,
                        padding: TextFormFieldPadding.PaddingT25,
                        fontStyle: TextFormFieldFontStyle.RobotoMedium18,
                        textInputAction: TextInputAction.done,
                        maxLines: 4,
                      ),
                      Padding(
                        padding: getPadding(
                          top: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomImageView(
                                imagePath: ImageConstant.imgRectangle126x1261,
                                height: getSize(
                                  126,
                                ),
                                width: getSize(
                                  126,
                                ),
                                margin: getMargin(
                                  right: 2,
                                ),
                              ),
                            ),
                            Expanded(
                              child: CustomImageView(
                                imagePath: ImageConstant.imgRectangle126x1262,
                                height: getSize(
                                  126,
                                ),
                                width: getSize(
                                  126,
                                ),
                                margin: getMargin(
                                  left: 2,
                                  right: 2,
                                ),
                              ),
                            ),
                            Expanded(
                              child: CustomImageView(
                                imagePath: ImageConstant.imgRectangle126x1263,
                                height: getSize(
                                  126,
                                ),
                                width: getSize(
                                  126,
                                ),
                                margin: getMargin(
                                  left: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgRectangle126x1264,
                              height: getSize(
                                126,
                              ),
                              width: getSize(
                                126,
                              ),
                            ),
                            Container(
                              height: getSize(
                                114,
                              ),
                              width: getSize(
                                114,
                              ),
                              margin: getMargin(
                                left: 4,
                                bottom: 12,
                              ),
                              child: Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  CustomImageView(
                                    imagePath:
                                        ImageConstant.imgRectangle102x1021,
                                    height: getSize(
                                      102,
                                    ),
                                    width: getSize(
                                      102,
                                    ),
                                    alignment: Alignment.bottomRight,
                                  ),
                                  CustomIconButton(
                                    height: 26,
                                    width: 26,
                                    variant: IconButtonVariant.FillBlueA200,
                                    shape: IconButtonShape.CircleBorder13,
                                    padding: IconButtonPadding.PaddingAll5,
                                    alignment: Alignment.topLeft,
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgCheckmark,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgRectangle126x1265,
                              height: getSize(
                                126,
                              ),
                              width: getSize(
                                126,
                              ),
                              margin: getMargin(
                                left: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomImageView(
                                imagePath: ImageConstant.imgRectangle126x1266,
                                height: getSize(
                                  126,
                                ),
                                width: getSize(
                                  126,
                                ),
                                margin: getMargin(
                                  right: 2,
                                ),
                              ),
                            ),
                            Expanded(
                              child: CustomImageView(
                                imagePath: ImageConstant.imgRectangle126x1267,
                                height: getSize(
                                  126,
                                ),
                                width: getSize(
                                  126,
                                ),
                                margin: getMargin(
                                  left: 2,
                                  right: 2,
                                ),
                              ),
                            ),
                            Expanded(
                              child: CustomImageView(
                                imagePath: ImageConstant.imgRectangle126x1268,
                                height: getSize(
                                  126,
                                ),
                                width: getSize(
                                  126,
                                ),
                                margin: getMargin(
                                  left: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 7,
                          top: 20,
                          right: 7,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgRefresh,
                              height: getSize(
                                24,
                              ),
                              width: getSize(
                                24,
                              ),
                              margin: getMargin(
                                top: 5,
                                bottom: 5,
                              ),
                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgMusic,
                              height: getSize(
                                24,
                              ),
                              width: getSize(
                                24,
                              ),
                              margin: getMargin(
                                left: 10,
                                top: 5,
                                bottom: 5,
                              ),
                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgInfo,
                              height: getSize(
                                24,
                              ),
                              width: getSize(
                                24,
                              ),
                              margin: getMargin(
                                left: 10,
                                top: 5,
                                bottom: 5,
                              ),
                            ),
                            Spacer(),
                            CustomButton(
                              height: getVerticalSize(
                                34,
                              ),
                              width: getHorizontalSize(
                                94,
                              ),
                              text: "lbl_verify".tr,
                              variant: ButtonVariant.FillBlueA200,
                              shape: ButtonShape.RoundedBorder2,
                              padding: ButtonPadding.PaddingAll8,
                              fontStyle: ButtonFontStyle.RobotoMedium14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
