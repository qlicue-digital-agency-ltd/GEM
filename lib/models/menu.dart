import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

class Menu {
  final int id;
  final String title;
  final IconData icon;
  final String constant;
  final int type;
  final bool isSelected;

  Menu(
      {@required this.id,
      @required this.title,
      @required this.icon,
      @required this.constant,
      @required this.isSelected,
      @required this.type});
}
