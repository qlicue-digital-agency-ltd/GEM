import 'package:flutter/material.dart';

import 'package:gem/models/advert.dart';
import 'package:gem/style/style.dart' as ThemeColor;

class ImageAdvert extends StatelessWidget {
  final Advert advert;

  const ImageAdvert({Key key, @required this.advert}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: InkWell(
          onTap: () {
            print(advert.link);
          },
          child: Container(
            
            child: Column(
              children: <Widget>[
                Text(
                  'Sponsored Advert (' + advert.title + ')',
                  style: TextStyle(
                      color:  ThemeColor.Colors.gemPrimaryColor, fontFamily: 'itikaf',fontSize: 15.0,),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: ThemeColor.Colors.gemPrimaryColor,
                        padding: EdgeInsets.all(1),
                        child: Image(
                              height: 100,
                              fit: BoxFit.cover,
                              image: NetworkImage(advert.image))
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
