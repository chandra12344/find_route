import 'package:flutter/material.dart';
class LeaveApproveCardDecoration {

  static BoxDecoration leaveDecoration(double size,double width,int color,Color borderColor,Color boxShadow) {
    return BoxDecoration(
        color: color>12?Colors.redAccent: color<6?Colors.greenAccent:Colors.orangeAccent,
        borderRadius: BorderRadius.circular(size),
        border: Border.all(
            color: borderColor, style: BorderStyle.none,width: width
        ),
        boxShadow: [
          BoxShadow(
            //color: Colors.black,
            color: boxShadow,
            offset: const Offset(
              0,
              0,
            ), //Offset
            blurRadius: 1.0,
            spreadRadius: 1.0,
          ),
        ]);

  }

  static BoxDecoration leaveDecorationTwo(double size,int color,int borderColor,int boxShadow) {
    return BoxDecoration(
        color: Color(color),
        borderRadius: BorderRadius.circular(size),
        border: Border.all(
            color: Color(borderColor), style: BorderStyle.none
        ),

        boxShadow: [
          BoxShadow(
            //color: Colors.black,
            color: Color(boxShadow),
            offset: const Offset(
              0,
              0,
            ), //Offset
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ]);

  }

}