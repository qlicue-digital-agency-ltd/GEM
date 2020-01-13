import 'package:flutter/material.dart';
import 'package:gem/style/style.dart' as ThemeColor;


class ContentProfile extends StatelessWidget {
  final String title;
  final String subTitle;

  const ContentProfile({Key key, @required this.title, @required this.subTitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Text(title + ' ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                )),
          ),
          Expanded(
            flex: 8,
            child: Text(subTitle,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                )),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {},
              child: Icon(Icons.edit,
              color: ThemeColor.Colors.gemPrimaryColor,),
            ),
          )
        ],
      ),
    );
  }
}
