import 'package:flutter/material.dart';

import 'color_style.dart';

class InputStyle {
  static OutlineInputBorder roundWhiteInput  = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(80)),
    borderSide: BorderSide(width: 1,color: Colors.white),
  );

  static OutlineInputBorder roundGreenInput  = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(80)),
    borderSide: BorderSide(width: 1,color: ColorStyle.green),
  );

  static OutlineInputBorder roundBlueInput  = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(80)),
    borderSide: BorderSide(width: 1,color: ColorStyle.blue),
  );

  static OutlineInputBorder roundPinkInput  = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(80)),
    borderSide: BorderSide(width: 1,color: ColorStyle.pink),
  );
}
