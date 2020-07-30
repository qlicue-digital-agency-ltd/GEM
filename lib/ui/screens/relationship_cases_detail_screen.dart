import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gem/models/case.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:gem/ui/widgets/adverts/image_advert.dart';
import 'package:gem/ui/widgets/image/image_holder.dart';
import 'package:gem/util/util.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:gem/style/style.dart' as ThemeColor;
import 'package:share/share.dart';

class RelationshipCasesDetailScreen extends StatefulWidget {
  final String title;
  final Case relationCase;
  final MainModel model;
  final int index;

  const RelationshipCasesDetailScreen(
      {Key key,
      @required this.title,
      @required this.relationCase,
      @required this.model,
      @required this.index})
      : super(key: key);

  @override
  _RelationshipCasesDetailScreenState createState() =>
      _RelationshipCasesDetailScreenState();
}

class _RelationshipCasesDetailScreenState
    extends State<RelationshipCasesDetailScreen> {
  final double _appBarHeight = 256.0;

  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: ThemeColor.Colors.gemPrimaryColor,
                expandedHeight: _appBarHeight,
                pinned: _appBarBehavior == AppBarBehavior.pinned,
                floating: _appBarBehavior == AppBarBehavior.floating ||
                    _appBarBehavior == AppBarBehavior.snapping,
                snap: _appBarBehavior == AppBarBehavior.snapping,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {
                      _settingModalBottomSheet(context);
                    },
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(widget.title,
                      style: TextStyle(
                        fontFamily: 'trajanProRegular',
                        fontSize: 18.0,
                      )),
                  background: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      ImageHolder(
                        image:
                            'https://flutter.io/images/catalog-widget-placeholder.png',
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.0, -1.0),
                            end: Alignment(0.0, -0.4),
                            colors: <Color>[
                              Color(0x60000000),
                              Color(0x00000000)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(<Widget>[
                  AnnotatedRegion<SystemUiOverlayStyle>(
                      value: SystemUiOverlayStyle.dark,
                      child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text('BY: ',
                              style: TextStyle(
                                fontFamily: 'trajanProRegular',
                                fontSize: 15.0,
                              )))),
                ]),
              ),
              SliverList(delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: Text(widget.relationCase.paragraphs[index].body,
                        style: TextStyle(
                          fontFamily: 'itikaf',
                          fontSize: 20.0,
                        )),
                  ),
                  ImageAdvert(
                    advert: widget.relationCase.paragraphs[index].advert,
                  ),
                ]);
              }))
            ],
          ),
        );
      },
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return ScopedModelDescendant(
            builder: (BuildContext context, Widget child, MainModel model) {
              return Container(
                child: Wrap(
                  children: <Widget>[
                    ListTile(
                        leading: Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                        title: Text('Share'),
                        onTap: () {
                          Share.share(
                              'check out my website https://qlicue.co.tz');
                        }),
                    ListTile(
                        leading: Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        ),
                        title: Text('Like'),
                        onTap: () {
                          widget.model
                              .likeCaseToggle(caseId: widget.relationCase.id);
                        }),
                    ListTile(
                      leading: Icon(
                        Icons.bookmark,
                        color: Colors.white,
                      ),
                      title: Text('Book Mark'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
