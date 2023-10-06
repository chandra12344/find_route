import 'package:google_fonts/google_fonts.dart';

import 'controller/store_locator_controller.dart';
import 'package:chandraprakash_s_application1/core/app_export.dart';
import 'package:chandraprakash_s_application1/widgets/app_bar/appbar_image.dart';
import 'package:chandraprakash_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:chandraprakash_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class RouteLocatorScreen extends GetWidget<RouteLocatorController> {
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
                                    imagePath: ImageConstant.imgRectangle458706x396,
                                    height: getVerticalSize(758),
                                    width: getHorizontalSize(396),
                                    radius: BorderRadius.circular(
                                        getHorizontalSize(10)),
                                    alignment: Alignment.center),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: GestureDetector(
                                      onTap: (){

                                      },
                                      child: Container(
                                        height: 400,
                                          child:  ListView.builder(
                                              itemCount:3,
                                              itemBuilder: (BuildContext context, int index) {
                                                return  CustomDailyPage();
                                              })),
                                    ))
                              ])))
                ]))));
  }

  onTapArrowleft15() {
    Get.back();
  }


}
class CustomDailyPage extends StatefulWidget {
  CustomDailyPage({super.key,});

  @override
  State<CustomDailyPage> createState() => _CustomDailyPageState();
}

class _CustomDailyPageState extends State<CustomDailyPage> {
  showInformation(){
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (context,setState) {
                return AlertDialog(
                  // backgroundColor: Colors.lightGreenAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  title: Text("Major Air Pollutants in New Delhi's Routes  ->",
                      style: GoogleFonts.kalam(
                        textStyle: TextStyle(
                            color: Theme.of(context).brightness == Brightness.light ? Colors.green: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("65",style: GoogleFonts.kalam(
                            textStyle: TextStyle(
                                color: Theme.of(context).brightness == Brightness.light ? Colors.black: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          )),
                          Text("(PM2.5)",style: GoogleFonts.kalam(
                            textStyle: TextStyle(
                                color: Theme.of(context).brightness == Brightness.light ? Colors.black: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Stack(
                        children: [
                          Container(
                            height:5 ,
                            width: 200,
                            color: Colors.orange.shade200,
                          ),
                          Container(
                            height: 5,
                            width: 100,
                            color: Colors.orange,
                          )
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        children: [
                          Text("2",style: GoogleFonts.kalam(
                            textStyle: TextStyle(
                                color: Theme.of(context).brightness == Brightness.light ? Colors.black: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          )),
                          Text("(OS2)",style: GoogleFonts.kalam(
                            textStyle: TextStyle(
                                color: Theme.of(context).brightness == Brightness.light ? Colors.black: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Stack(
                        children: [
                          Container(
                            height:5 ,
                            width: 200,
                            color: Colors.green.shade200,
                          ),
                          Container(
                            height: 5,
                            width: 60,
                            color: Colors.green,
                          )
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        children: [
                          Text("365",style: GoogleFonts.kalam(
                            textStyle: TextStyle(
                                color: Theme.of(context).brightness == Brightness.light ? Colors.black: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          )),
                          Text("(CO)",style: GoogleFonts.kalam(
                            textStyle: TextStyle(
                                color: Theme.of(context).brightness == Brightness.light ? Colors.black: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Stack(
                        children: [
                          Container(
                            height:5 ,
                            width: 200,
                            color: Colors.red.shade200,
                          ),
                          Container(
                            height: 5,
                            width: 140,
                            color: Colors.red,
                          )
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        children: [
                          Text("10",style: GoogleFonts.kalam(
                            textStyle: TextStyle(
                                color: Theme.of(context).brightness == Brightness.light ? Colors.black: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          )),
                          Text("(Ozone)",style: GoogleFonts.kalam(
                            textStyle: TextStyle(
                                color: Theme.of(context).brightness == Brightness.light ? Colors.black: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Stack(
                        children: [
                          Container(
                            height:5 ,
                            width: 200,
                            color: Colors.green.shade200,
                          ),
                          Container(
                            height: 5,
                            width: 140,
                            color: Colors.green,
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: getMargin(left: 20, right: 20, bottom: 10),
        padding: getPadding(left: 12, top: 19, right: 12, bottom: 19),
        decoration: AppDecoration.fillWhiteA700.copyWith(
            color: Colors.green.shade100,
            borderRadius: BorderRadiusStyle.roundedBorder6
        ),
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
                              Text("Route Name",
                                  overflow:
                                  TextOverflow
                                      .ellipsis,
                                  textAlign:
                                  TextAlign
                                      .left,
                                  style: AppStyle
                                      .txtGilroySemiBold18Bluegray800),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding:
                                          getPadding(
                                              top:
                                              14),
                                          child: Text(
                                            "Distance: 51km".tr,
                                            style: TextStyle(color: Colors.black),)),
                                      Padding(
                                          padding:
                                          getPadding(
                                              top:
                                              10),
                                          child: Text(
                                              "Pollution level : 76%"
                                                  .tr,
                                              style: TextStyle(color: Colors.black))),
                                    ],
                                  ),
                                  SizedBox(width: 25,),
                                  SizedBox(
                                    height: 28.0,
                                    child: FloatingActionButton.extended(
                                      label: Text('Start'), // <-- Text
                                      backgroundColor: Colors.blue,
                                      icon: Icon( // <-- Icon
                                        Icons.swipe_up_outlined,
                                        size: 24.0,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(onPressed: (){showInformation();}, child: Text("Major Air Pollutants ➤"))
                            ]))
                  ]),
            ]));
  }
}