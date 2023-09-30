import 'controller/store_locator_controller.dart';
import 'package:chandraprakash_s_application1/core/app_export.dart';
import 'package:chandraprakash_s_application1/widgets/app_bar/appbar_image.dart';
import 'package:chandraprakash_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:chandraprakash_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class StoreLocatorScreen extends GetWidget<StoreLocatorController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray50,
            appBar: CustomAppBar(
                height: getVerticalSize(51),
                leadingWidth: 40,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 14, bottom: 13),
                    onTap: () {
                      onTapArrowleft15();
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "lbl_store_locator".tr)),
            body: Container(
                height: MediaQuery.of(context).size.height,
                width: double.maxFinite,
                padding: getPadding(left: 16, top: 22, right: 16, bottom: 22),
                child: Stack(alignment: Alignment.topCenter, children: [
                  CustomImageView(
                      svgPath: ImageConstant.imgLocation,
                      height: getSize(40),
                      width: getSize(40),
                      alignment: Alignment.topRight,
                      margin: getMargin(top: 326, right: 167)),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          height: getVerticalSize(758),
                          width: getHorizontalSize(396),
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgRectangle458706x396,
                                    height: getVerticalSize(758),
                                    width: getHorizontalSize(396),
                                    radius: BorderRadius.circular(
                                        getHorizontalSize(10)),
                                    alignment: Alignment.center),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                        margin: getMargin(
                                            left: 40, right: 39, bottom: 60),
                                        padding: getPadding(
                                            left: 12,
                                            top: 19,
                                            right: 12,
                                            bottom: 19),
                                        decoration: AppDecoration.fillWhiteA700
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder6),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgEllipse19540x40,
                                                        height: getSize(40),
                                                        width: getSize(40),
                                                        radius: BorderRadius
                                                            .circular(
                                                                getHorizontalSize(
                                                                    20)),
                                                        margin: getMargin(
                                                            bottom: 17)),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 3),
                                                        child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  "lbl_store_1"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtGilroySemiBold18Bluegray800),
                                                              Padding(
                                                                  padding:
                                                                      getPadding(
                                                                          top:
                                                                              14),
                                                                  child: Text(
                                                                      "msg_3339_ventura_drive"
                                                                          .tr,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: AppStyle
                                                                          .txtGilroyMedium14Bluegray400))
                                                            ]))
                                                  ]),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 51,
                                                      top: 10,
                                                      bottom: 1),
                                                  child: Row(children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgCall,
                                                        height: getSize(20),
                                                        width: getSize(20)),
                                                    Padding(
                                                        padding: getPadding(
                                                            left: 8,
                                                            top: 1,
                                                            bottom: 1),
                                                        child: Text(
                                                            "lbl_415_926_3641"
                                                                .tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtGilroyMedium14Bluegray400))
                                                  ]))
                                            ])))
                              ])))
                ]))));
  }

  onTapArrowleft15() {
    Get.back();
  }
}
