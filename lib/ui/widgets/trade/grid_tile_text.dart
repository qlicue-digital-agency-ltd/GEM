import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GridTitleText extends StatelessWidget {
  final bool isAmount;
  const GridTitleText({@required this.text, @required this.isAmount});

  final String text;

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter =
        NumberFormat.simpleCurrency(decimalDigits: 2, name: 'TZS  ');
    return FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: !isAmount ? Text(text) : Text('${formatter.format(int.parse(text))}'));
  }
}
