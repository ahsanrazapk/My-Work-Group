

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

enum Number {Zero, One, Two, Three, Four, Five, Six}
extension ValidIndex on Number {
  bool get valid => (this == Number.Two || this == Number.Five || this == Number.Six);
}
Color get accentColor => Color(0xff063970);
int get crossAxisCount => 4;
double get crossAxisSpacing => 3;
int get count => 7;
Radius get radiusCircular => Radius.circular(15);
String get title => "My Work Group";
double get titleTopPadding => 35;
double get titleFontSize => 18;
StaggeredTile get fullTile => new StaggeredTile.count(4, 1);
StaggeredTile get halfTile => new StaggeredTile.count(2, 1.8);
double get radius10 => 10.0;
double get radius25 => 25.0;
double get fontSize23 => 23.0;
double get fontSize26 => 26.0;
double get fontSize18 => 18.0;
double get fontSize14 => 14.0;
double get fontSize28 => 28.0;
double get iconSize30 => 30.0;
double get padding6 => 6.0;
double get padding8 => 8.0;
double get padding10 => 10.0;
double get padding20 => 20.0;
double get elevation => 4.0;
dynamic get positioned35 => 35.0;
dynamic get scale35 => 35.0;








