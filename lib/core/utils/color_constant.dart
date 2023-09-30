import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray7000f = fromHex('#0f555555');

  static Color gray5001 = fromHex('#f8f9fa');

  static Color lightGreenA400 = fromHex('#67ea00');

  static Color blueA700 = fromHex('#0061ff');

  static Color blueGray10001 = fromHex('#d6dae2');

  static Color blueGray10002 = fromHex('#d6d6d6');

  static Color lightGreenA700 = fromHex('#4ec306');

  static Color blueA200 = fromHex('#468ee5');

  static Color green600 = fromHex('#349765');

  static Color gray50 = fromHex('#f9fbff');

  static Color red100 = fromHex('#ffe1cc');

  static Color pinkA200 = fromHex('#e61eba');

  static Color greenA700 = fromHex('#14c025');

  static Color black90066 = fromHex('#66000000');

  static Color black900 = fromHex('#000000');

  static Color gray50001 = fromHex('#a6a6a6');

  static Color blueGray800 = fromHex('#324666');

  static Color blueGray700 = fromHex('#424c5d');

  static Color blueGray900 = fromHex('#262b35');

  static Color gray70011 = fromHex('#11555555');

  static Color black90026 = fromHex('#26000000');

  static Color blueGray200 = fromHex('#bac1ce');

  static Color blueGray100 = fromHex('#d9d9d9');

  static Color gray500 = fromHex('#9e9e9e');

  static Color blueGray400 = fromHex('#74839d');

  static Color blueGray300 = fromHex('#9ea8ba');

  static Color orangeA700 = fromHex('#ff6700');

  static Color blueGray600 = fromHex('#5f6c86');

  static Color orange900 = fromHex('#d55600');

  static Color gray200 = fromHex('#ececec');

  static Color blue50 = fromHex('#e0ebff');

  static Color deepPurple50 = fromHex('#ebe8f1');

  static Color black90011 = fromHex('#11000000');

  static Color black90033 = fromHex('#33000000');

  static Color indigo900 = fromHex('#002055');

  static Color blueGray40001 = fromHex('#888888');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
