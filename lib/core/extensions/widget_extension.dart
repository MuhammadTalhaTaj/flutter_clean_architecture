import 'package:flutter/cupertino.dart';

import '../components/sb.dart';



extension WidgetExtension on Widget {


  Widget paddingAll(double value){
    return Padding(padding: EdgeInsets.all(value),child: this,);
  }

  Widget paddingSymmetric(double horizontal, double vertical){
    return Padding(padding: EdgeInsets.symmetric(horizontal: horizontal,vertical: vertical),child: this,);
  }
  Widget paddingOnly({double left = 0, double right = 0, double top = 0, double bottom = 0}){
    return Padding(padding: EdgeInsets.only(left: left,right: right,top: top,bottom: bottom),child: this,);
  }

  Widget toScrollableList({int count = 5, Axis scrollDirection = Axis.vertical}) {
    return ListView.separated(
      separatorBuilder: (context, index) => scrollDirection==Axis.vertical?SB.h(10):SB.w(10),
      itemCount: count,
      scrollDirection: scrollDirection,
      primary: false,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return this;
      },
    );
  }


  Widget toGridView({int count = 5, Axis scrollDirection = Axis.vertical}) {
    return Expanded(
      child: GridView.builder(

        scrollDirection: scrollDirection,

        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15),
        itemBuilder: (context, index) {
          return this;
        },
        itemCount: count,
      ),
    );
  }
}



