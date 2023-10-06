import 'dart:convert';

import 'package:chandraprakash_s_application1/core/app_export.dart';
import 'package:chandraprakash_s_application1/data/models/res_data.dart';
import 'package:chandraprakash_s_application1/presentation/map_screen/models/map_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MapController extends GetxController {
  TextEditingController inputFieldController = TextEditingController();

  TextEditingController inputFieldOneController = TextEditingController();
  TextEditingController sourceController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  Rx<MapModel> mapModelObj = MapModel().obs;
var routeList=<String>[].obs;
  getData()async{
    try {
      final response = await http.get(
        Uri.parse('https://s5.aconvert.com/convert/p3r68-cdx67/w00tb-ajjmd.json'),
        headers: {
          'Content-type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Accept': 'application/json',

        },
      );
      if (response.statusCode == 200) {
        var o = json.decode(response.body.toString());
       debugPrint("*********************************");
       // debugPrint("${o[0]["stop_name"]}");
        routeList.clear();
       for(int i=0;i<o.length;i++){
         routeList.add(o[i]["stop_name"]);
         debugPrint("${o[i]["stop_name"]}");
       }
       debugPrint("${o.length}");
       debugPrint("*********************************");
      } else {
        debugPrint("*********************************");
        debugPrint("else data ");
        debugPrint("*********************************");
      }
    } catch (e) {
      debugPrint("*********************************");
      debugPrint("catch data ");
      debugPrint("*********************************");
    }


  }


  @override
  void onReady() {
    super.onReady();
    getData();
  }

  @override
  void onClose() {
    super.onClose();
    inputFieldController.dispose();
    inputFieldOneController.dispose();
  }
}
