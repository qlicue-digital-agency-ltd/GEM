import 'package:flutter/material.dart';

class HeaderProfile extends StatelessWidget {
  final String headerTitle;

  const HeaderProfile({Key key, @required this.headerTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Text(
        headerTitle,
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
