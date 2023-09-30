import 'controller/chatbot_controller.dart';
import 'package:chandraprakash_s_application1/core/app_export.dart';
import 'package:chandraprakash_s_application1/widgets/app_bar/appbar_image.dart';
import 'package:chandraprakash_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:chandraprakash_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:chandraprakash_s_application1/widgets/custom_button.dart';
import 'package:chandraprakash_s_application1/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;

class ChatbotScreen extends GetWidget<ChatbotController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            appBar: CustomAppBar(
                height: getVerticalSize(49),
                leadingWidth: 40,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 13, bottom: 12),
                    onTap: () {
                      onTapArrowleft11();
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "lbl_name".tr),
                actions: [
                  AppbarImage(
                      height: getSize(24),
                      width: getSize(24),
                      svgPath: ImageConstant.imgQuestion,
                      margin:
                          getMargin(left: 16, top: 13, right: 16, bottom: 12))
                ]),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 5, right: 16, bottom: 5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Divider(
                          height: getVerticalSize(1),
                          thickness: getVerticalSize(1),
                          color: ColorConstant.blueGray10001),
                      Container(
                          margin: getMargin(top: 23),
                          padding: getPadding(
                              left: 24, top: 11, right: 24, bottom: 11),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: fs.Svg(ImageConstant.imgUnion),
                                  fit: BoxFit.cover)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: getHorizontalSize(129),
                                    margin: getMargin(top: 2),
                                    child: Text("msg_hi_i_m_danial".tr,
                                        maxLines: null,
                                        textAlign: TextAlign.left,
                                        style:
                                            AppStyle.txtGilroyMedium14Black900))
                              ])),
                      Padding(
                          padding: getPadding(left: 9, top: 6),
                          child: Text("lbl_3_02_pm".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtGilroyRegular12Black90066)),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              width: getHorizontalSize(268),
                              margin: getMargin(top: 19),
                              padding: getPadding(
                                  left: 31, top: 11, right: 31, bottom: 11),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: fs.Svg(ImageConstant.imgGroup3615),
                                      fit: BoxFit.cover)),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: getHorizontalSize(176),
                                        margin: getMargin(top: 2),
                                        child: Text("msg_lorem_ipsum_dolor2".tr,
                                            maxLines: null,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtGilroyMedium14Black900))
                                  ]))),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: getPadding(top: 5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                        padding: getPadding(top: 1),
                                        child: Text("lbl_3_02_pm".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtGilroyRegular12Black90066)),
                                    CustomImageView(
                                        svgPath: ImageConstant.imgAirplane,
                                        height: getSize(16),
                                        width: getSize(16),
                                        margin: getMargin(left: 4))
                                  ]))),
                      Spacer(),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(left: 9, right: 11),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: getHorizontalSize(149),
                                        padding: getPadding(
                                            left: 24,
                                            top: 13,
                                            right: 24,
                                            bottom: 13),
                                        decoration: AppDecoration
                                            .outlineBlueA7001
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .circleBorder25),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding: getPadding(top: 2),
                                                  child: Text(
                                                      "lbl_lorem_ipsum_1".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtGilroyMedium14))
                                            ])),
                                    Container(
                                        width: getHorizontalSize(94),
                                        margin: getMargin(left: 8),
                                        padding: getPadding(
                                            left: 24,
                                            top: 14,
                                            right: 24,
                                            bottom: 14),
                                        decoration: AppDecoration
                                            .outlineBlueA7001
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .circleBorder25),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("lbl_que_2".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtGilroyMedium14)
                                            ])),
                                    CustomButton(
                                        height: getVerticalSize(46),
                                        width: getHorizontalSize(117),
                                        text: "lbl_question_3".tr,
                                        margin: getMargin(left: 8),
                                        variant:
                                            ButtonVariant.OutlineBlueA700_1,
                                        shape: ButtonShape.CircleBorder23,
                                        fontStyle: ButtonFontStyle
                                            .GilroyMedium14BlueA700)
                                  ]))),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(left: 9, top: 8, right: 11),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: getHorizontalSize(94),
                                        padding: getPadding(
                                            left: 24,
                                            top: 14,
                                            right: 24,
                                            bottom: 14),
                                        decoration: AppDecoration
                                            .outlineBlueA7001
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .circleBorder25),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text("lbl_que_2".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtGilroyMedium14)
                                            ])),
                                    CustomButton(
                                        height: getVerticalSize(46),
                                        width: getHorizontalSize(117),
                                        text: "lbl_question_3".tr,
                                        margin: getMargin(left: 8),
                                        variant:
                                            ButtonVariant.OutlineBlueA700_1,
                                        shape: ButtonShape.CircleBorder23,
                                        fontStyle: ButtonFontStyle
                                            .GilroyMedium14BlueA700),
                                    Container(
                                        width: getHorizontalSize(149),
                                        margin: getMargin(left: 8),
                                        padding: getPadding(
                                            left: 24,
                                            top: 13,
                                            right: 24,
                                            bottom: 13),
                                        decoration: AppDecoration
                                            .outlineBlueA7001
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .circleBorder25),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                  padding: getPadding(top: 2),
                                                  child: Text(
                                                      "lbl_lorem_ipsum_1".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtGilroyMedium14))
                                            ]))
                                  ]))),
                      Padding(
                          padding: getPadding(top: 16, bottom: 9),
                          child: Divider(
                              height: getVerticalSize(1),
                              thickness: getVerticalSize(1),
                              color: ColorConstant.blueGray10001))
                    ])),
            bottomNavigationBar: Padding(
                padding: getPadding(left: 16, right: 16, bottom: 74),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(
                      child: Container(
                          padding: getPadding(
                              left: 16, top: 12, right: 16, bottom: 12),
                          decoration: AppDecoration.outlineBluegray10001
                              .copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder6),
                          child: Row(children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgPlus,
                                height: getSize(20),
                                width: getSize(20),
                                margin: getMargin(top: 1, bottom: 1)),
                            Padding(
                                padding:
                                    getPadding(left: 16, top: 5, right: 173),
                                child: Text("msg_your_message".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtGilroyMedium14Bluegray400))
                          ]))),
                  CustomIconButton(
                      height: 48,
                      width: 48,
                      margin: getMargin(left: 4),
                      variant: IconButtonVariant.OutlineBluegray10001,
                      child: CustomImageView(svgPath: ImageConstant.imgSend))
                ]))));
  }

  onTapArrowleft11() {
    Get.back();
  }
}
