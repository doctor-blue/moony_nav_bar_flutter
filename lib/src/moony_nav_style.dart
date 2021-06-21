import 'package:flutter/material.dart';
import 'package:moony_nav_bar/moony_nav_bar.dart';

class MoonyNavStyle {
  Color activeColor;
  Color color;
  IndicatorPosition indicatorPosition;
  IndicatorType indicatorType;
  double marginLeft;
  double marginRight;
  double marginBottom;
  double elevation;
  double borderRadius;

  MoonyNavStyle(
      {this.activeColor = Colors.black,
      this.color = Colors.black45,
      this.indicatorPosition = IndicatorPosition.TOP,
      this.indicatorType = IndicatorType.POINT,
      this.marginBottom = 0,
      this.marginLeft = 0,
      this.marginRight = 0,
      this.elevation = 5,
      this.borderRadius = 0});
}
