import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gem/api/api.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:gem/ui/widgets/divider/custom_divider.dart';
import 'package:gem/ui/widgets/profile/content.dart';
import 'package:gem/ui/widgets/profile/header.dart';
import 'package:gem/util/util.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:gem/style/style.dart' as ThemeColor;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final double _appBarHeight = 256.0;
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          key: _scaffoldKey,
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: _appBarHeight,
                pinned: _appBarBehavior == AppBarBehavior.pinned,
                floating: _appBarBehavior == AppBarBehavior.floating ||
                    _appBarBehavior == AppBarBehavior.snapping,
                snap: _appBarBehavior == AppBarBehavior.snapping,
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.create),
                    tooltip: 'Edit',
                    onPressed: () {
                      _scaffoldKey.currentState.showSnackBar(const SnackBar(
                          content: Text("Editing user details.")));
                    },
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(model.authenticatedUser.profile.firstName +
                      '\t' +
                      model.authenticatedUser.profile.lastName),
                  background: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.network(
                        api +
                            'profile/' +
                            model.authenticatedUser.profile.id.toString(),
                        fit: BoxFit.cover,
                        height: _appBarHeight,
                      ),

                      // This gradient ensures that the toolbar icons are distinct
                      // against the background image.
                      const DecoratedBox(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          HeaderProfile(
                            headerTitle: 'Personal Information:',
                          ),
                          ContentProfile(
                            title: 'Username:',
                            subTitle:
                                model.authenticatedUser.profile.lastName,
                          ),
                          CustomDivider(
                            color: ThemeColor.Colors.gemPrimaryColor,
                          ),
                          ContentProfile(
                            title: 'Birth Day:',
                            subTitle:
                                model.authenticatedUser.profile.birthday,
                          ),
                          CustomDivider(
                            color: ThemeColor.Colors.gemPrimaryColor,
                          ),
                          ContentProfile(
                            title: 'Nationality:',
                            subTitle:
                                model.authenticatedUser.profile.nationality,
                          ),
                          CustomDivider(
                            color: ThemeColor.Colors.gemPrimaryColor,
                          ),
                          ContentProfile(
                            title: 'Pronvice:',
                            subTitle: model
                                .authenticatedUser.profile.pronvice
                                .toString(),
                          ),
                          CustomDivider(
                            color: ThemeColor.Colors.gemPrimaryColor,
                          ),
                          ContentProfile(
                            title: 'Skin Color:',
                            subTitle:
                                model.authenticatedUser.profile.skinColor,
                          ),
                          CustomDivider(
                            color: ThemeColor.Colors.gemPrimaryColor,
                          ),
                          ContentProfile(
                            title: 'Height:',
                            subTitle: model.authenticatedUser.profile.height
                                    .toString() +
                                ' ft',
                          ),
                          CustomDivider(
                            color: ThemeColor.Colors.gemPrimaryColor,
                          ),
                          ContentProfile(
                            title: 'Dominion:',
                            subTitle:
                                model.authenticatedUser.profile.dominion,
                          ),
                          CustomDivider(
                            color: ThemeColor.Colors.gemPrimaryColor,
                          ),
                          ContentProfile(
                            title: 'Marital Status:',
                            subTitle: model
                                .authenticatedUser.profile.maritalStatus,
                          ),
                          CustomDivider(
                            color: ThemeColor.Colors.gemPrimaryColor,
                          ),
                          ContentProfile(
                            title: 'Sex:',
                            subTitle: model.authenticatedUser.profile.sex,
                          ),
                          HeaderProfile(
                            headerTitle: 'BIO:',
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                            child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        model.authenticatedUser.profile.bio,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ThemeColor
                                            .Colors.gemPrimaryColor))),
                          ),
                          HeaderProfile(
                            headerTitle: 'Education:',
                          ),
                          ContentProfile(
                            title: 'Profession:',
                            subTitle: model
                                .authenticatedUser.profile.profession
                                .toString(),
                          ),
                          ContentProfile(
                            title: 'Highest Level:',
                            subTitle: model
                                .authenticatedUser.profile.education
                                .toString(),
                          ),
                          SizedBox(
                            height: 200,
                          )
                        ],
                      ))
                ]),
              )
            ],
          ),
        );
      },
    );
  }
}
