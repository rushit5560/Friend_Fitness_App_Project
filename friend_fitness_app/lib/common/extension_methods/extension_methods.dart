import 'package:flutter/material.dart';

extension CustomWidgets on Widget {

  Widget commonAllSidePadding({double? padding}) {
    return Padding(
      padding: EdgeInsets.all(padding ?? 10),
      child: this,
    );
  }

  Widget commonSymmetricPadding({double? horizontal, double? vertical}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal ?? 0,vertical: vertical ?? 0),
      child: this,
    );
  }
}