import 'package:flutter/material.dart';

class NoItemTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const NoItemTile(
      {Key key,
      @required this.icon,
      @required this.title,
      @required this.subtitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
             icon,
              size: 200,
              color: Colors.cyan,
            ),
            Text(
             title,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            Text(subtitle,
                style: TextStyle(color: Colors.black, fontSize: 18),
                textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
