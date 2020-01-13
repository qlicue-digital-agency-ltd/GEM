import 'package:flutter/material.dart';
import 'package:gem/models/tip.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:gem/ui/widgets/image/image_holder.dart';
import 'package:share/share.dart';

import 'package:gem/style/style.dart' as ThemeColor;

typedef CardTapCallback = void Function();

class TipsCard extends StatelessWidget {
  final CardTapCallback onCardTap;
  final Tip tip;
  final MainModel model;
  const TipsCard(
      {Key key,
      @required this.onCardTap,
      @required this.tip,
      @required this.model})
      : assert(onCardTap != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: InkWell(
          onTap: onCardTap,
          child: Card(
            elevation: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 10, top: 10),
                  child: Row(
                    children: <Widget>[
                      Text(tip.time),
                      SizedBox(
                        width: 10,
                      ),
                      Text(tip.title,
                          style: TextStyle(
                            fontFamily: 'itikaf',
                            fontSize: 20.0,
                          ))
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(tip.subtitle,
                                style: TextStyle(
                                  fontFamily: 'itikaf',
                                  fontSize: 20.0,
                                )),
                            subtitle: Text(tip.title,
                                style: TextStyle(
                                  fontFamily: 'itikaf',
                                  fontSize: 18.0,
                                )),
                          ),
                          SizedBox(
                            height: 60,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Container(
                                child: ImageHolder(
                                  image:
                                      'https://flutter.io/images/catalog-widget-placeholder.png',
                                ),
                                height: 100,
                                width: 100,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      Share.share(
                                          'check out my website https://example.com');
                                    },
                                    child: Icon(
                                      Icons.share,
                                      color: ThemeColor.Colors.gemPrimaryColor,
                                    ),
                                  )),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    model.likeTipToggle(tipId: tip.id);
                                  },
                                  child: Icon(
                                    tip.likeStatus
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: InkWell(
                      onTap: () {
                        print('object');
                      },
                      child: Text('Liked by 112 people',
                          style: TextStyle(color: Colors.black45)),
                    )),
              ],
            ),
          ),
        ));
  }
}
