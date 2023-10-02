import '../store_locator_screen/route_locator_screen.dart';
import 'controller/map_controller.dart';
import 'package:chandraprakash_s_application1/core/app_export.dart';
import 'package:chandraprakash_s_application1/widgets/app_bar/appbar_image.dart';
import 'package:chandraprakash_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:chandraprakash_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:chandraprakash_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class MapScreen extends GetWidget<MapController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.black90011,
            body: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                    color: ColorConstant.black90011,
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgMapsettings),
                        fit: BoxFit.cover)),
                child: Container(
                    width: double.maxFinite,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: double.maxFinite,
                              child: Container(
                                  padding: getPadding(top: 12, bottom: 12),
                                  decoration: AppDecoration.fillWhiteA700
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .customBorderBL6),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomAppBar(
                                            height: getVerticalSize(29),
                                            leadingWidth: 40,
                                            leading: AppbarImage(
                                                height: getSize(24),
                                                width: getSize(24),
                                                svgPath:
                                                    ImageConstant.imgArrowleft,
                                                margin: getMargin(
                                                    left: 16, bottom: 4),
                                                onTap: () {
                                                  onTapArrowleft1();
                                                }),
                                            centerTitle: true,
                                            title: AppbarSubtitle(
                                                text:
                                                    "msg_view_location_on".tr)),
                                        Padding(
                                            padding: getPadding(
                                                left: 16,
                                                top: 32,
                                                right: 16,
                                                bottom: 16),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                        Container(
                                                            width:
                                                                getHorizontalSize(
                                                                    24),
                                                            margin: getMargin(
                                                                top: 10,
                                                                bottom: 10),
                                                            child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgEye,
                                                                      height:
                                                                          getSize(
                                                                              24),
                                                                      width: getSize(
                                                                          24)),
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgGroup9796,
                                                                      height:
                                                                          getVerticalSize(
                                                                              11),
                                                                      width:
                                                                          getHorizontalSize(
                                                                              2),
                                                                      margin: getMargin(
                                                                          top:
                                                                              8)),
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgLocation,
                                                                      height:
                                                                          getSize(
                                                                              24),
                                                                      width:
                                                                          getSize(
                                                                              24),
                                                                      margin: getMargin(
                                                                          top:
                                                                              9))
                                                                ])),
                                                        Expanded(
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            8),
                                                                child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      CustomTextFormField(
                                                                          focusNode:
                                                                              FocusNode(),
                                                                          controller: controller
                                                                              .inputFieldController,
                                                                          hintText: "msg_choose_start_location"
                                                                              .tr,
                                                                          variant: TextFormFieldVariant
                                                                              .OutlineBluegray10001,
                                                                          fontStyle:
                                                                              TextFormFieldFontStyle.GilroyMedium16Bluegray300),
                                                                      CustomTextFormField(
                                                                          focusNode:
                                                                              FocusNode(),
                                                                          controller: controller
                                                                              .inputFieldOneController,
                                                                          hintText: "msg_choose_destination"
                                                                              .tr,
                                                                          margin: getMargin(
                                                                              top:
                                                                                  8),
                                                                          variant: TextFormFieldVariant
                                                                              .OutlineBluegray10001,
                                                                          fontStyle: TextFormFieldFontStyle
                                                                              .GilroyMedium16Bluegray300,
                                                                          textInputAction:
                                                                              TextInputAction.done),
                                                                      Align(child: ElevatedButton(onPressed: () { Get.to(RouteLocatorScreen()); }, child: Text("Find route"),),)
                                                                    ])))
                                                      ])),
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgVolumeBlueGray300,
                                                      height: getSize(20),
                                                      width: getSize(20),
                                                      margin: getMargin(
                                                          left: 8,
                                                          top: 38,
                                                          bottom: 38))
                                                ]))
                                      ]))),
                          Spacer(),
                          Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              margin: getMargin(left: 16, bottom: 58),
                              color: ColorConstant.whiteA700,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadiusStyle.circleBorder25),
                              child: Container(
                                  height: getSize(50),
                                  width: getSize(50),
                                  decoration: AppDecoration.fillWhiteA700
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder25),
                                  child: Stack(children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgDashboard,
                                        height: getSize(50),
                                        width: getSize(50),
                                        alignment: Alignment.center)
                                  ])))
                        ])))));
  }

  onTapArrowleft1() {
    Get.back();
  }
}
