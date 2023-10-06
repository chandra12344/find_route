import 'package:textfield_search/textfield_search.dart';

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
    // controller.getData();
    Future<List> fetchSimpleData() async {
      await Future.delayed(Duration(milliseconds: 2000));
      return controller.routeList;
    }
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
                                            padding: getPadding(left: 16, top: 32, right: 16, bottom: 16),
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                      child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
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
                                                                      TextFieldSearch(
                                                                          decoration:  InputDecoration(
                                                                            contentPadding:
                                                                            EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                                                                            focusedBorder: OutlineInputBorder(
                                                                              borderSide: BorderSide(color: Colors.black12, width: 2.0),
                                                                            ),
                                                                            enabledBorder: OutlineInputBorder(
                                                                              borderSide: BorderSide(color: Colors.black12, width: 2.0),
                                                                            ),
                                                                            hintText: "msg_choose_start_location".tr,
                                                                          ),
                                                                          label:'',
                                                                          controller: controller.sourceController,
                                                                          future: () {
                                                                            return fetchSimpleData();
                                                                          }),
                                                                      SizedBox(height: 5.0,),
                                                                      TextFieldSearch(
                                                                          decoration:  InputDecoration(
                                                                            contentPadding:
                                                                            EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                                                                            focusedBorder: OutlineInputBorder(
                                                                              borderSide: BorderSide(color: Colors.black12, width: 2.0),
                                                                            ),
                                                                            enabledBorder: OutlineInputBorder(
                                                                              borderSide: BorderSide(color: Colors.black12, width: 2.0),
                                                                            ),
                                                                            hintText: "msg_choose_destination".tr,
                                                                          ),
                                                                          label: '',
                                                                          controller: controller.destinationController,
                                                                          future: () {
                                                                            return fetchSimpleData();
                                                                          }),
                                                                  /*    // CustomTextFormField(
                                                                      //     focusNode:
                                                                      //         FocusNode(),
                                                                      //     controller: controller
                                                                      //         .inputFieldController,
                                                                      //     hintText: "msg_choose_start_location"
                                                                      //         .tr,
                                                                      //     variant: TextFormFieldVariant
                                                                      //         .OutlineBluegray10001,
                                                                      //     fontStyle:
                                                                      //         TextFormFieldFontStyle.GilroyMedium16Bluegray300),
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
                                                                              TextInputAction.done),*/
                                                                      Align(child: ElevatedButton(onPressed: () { controller.getLatLog(); }, child: Text("Find route"),),)
                                                                    ])))
                                                      ])),
                                                ]
                                            ))
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
