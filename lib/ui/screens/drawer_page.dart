import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gem/api/api.dart';
import 'package:gem/constants/constants.dart';

import 'package:gem/scoped-model/main.dart';
import 'package:gem/ui/widgets/divider/custom_divider.dart';

import 'package:gem/ui/widgets/drawer/drawer_tile.dart';

import 'package:scoped_model/scoped_model.dart';

import 'package:gem/style/style.dart' as ThemeColor;

const String _kAsset0 = 'assets/icons/male.jpg';

class DrawerPage extends StatefulWidget {
  final MainModel model;

  const DrawerPage({Key key, @required this.model}) : super(key: key);
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static final Animatable<Offset> _drawerDetailsTween = Tween<Offset>(
    begin: const Offset(0.0, -1.0),
    end: Offset.zero,
  ).chain(CurveTween(
    curve: Curves.fastOutSlowIn,
  ));

  AnimationController _controller;
  Animation<double> _drawerContentsOpacity;
  Animation<Offset> _drawerDetailsPosition;
  bool _showDrawerContents = true;

  @override
  void initState() {
    widget.model.fetchUserProfile();
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _drawerContentsOpacity = CurvedAnimation(
      parent: ReverseAnimation(_controller),
      curve: Curves.fastOutSlowIn,
    );
    _drawerDetailsPosition = _controller.drive(_drawerDetailsTween);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        List<Widget> _menuChildren() {
          return new List<Widget>.generate(model.getMenu().length, (int index) {
            return model.getMenu()[index].type == 0
                ? DrawerTile(
                    onTileTap: () {
                      Navigator.pop(context);
                      switch (model.getMenu()[index].constant) {
                        case '/ProfileScreen':
                          Navigator.pushNamed(context, profileScreen);
                          break;

                        case '/AboutScreen':
                          Navigator.pushNamed(context, aboutScreen);
                          break;
                        case '/HelpScreen':
                          Navigator.pushNamed(context, helpScreen);
                          break;
                        case '/SecurityScreen':
                          Navigator.pushNamed(context, securityScreen);
                          break;
                        case '/LogoutScreen':
                          //  Navigator.pushNamed(context, logoutScreen);
                          model.signOut();
                          break;
                        default:
                      }
                    },
                    menu: model.getMenu()[index],
                  )
                : Container();
          });
        }

        List<Widget> _moreChildren() {
          return new List<Widget>.generate(model.getMenu().length, (int index) {
            return model.getMenu()[index].type == 1
                ? DrawerTile(
                    onTileTap: () {
                      Navigator.pop(context);
                    },
                    menu: model.getMenu()[index],
                  )
                : Container();
          });
        }

        return Drawer(
          key: _scaffoldKey,
          child: model.authenticatedUser.profile == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                          color: ThemeColor.Colors.gemPrimaryColor),
                      accountName: Text(
                        model.authenticatedUser.profile != null
                            ? model.authenticatedUser.profile.firstName
                            : 'Display Name',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'mermaid',
                        ),
                      ),
                      accountEmail: Text(
                        model.authenticatedUser.phone != null
                            ? model.authenticatedUser.phone
                            : 'Phone Number',
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'mermaid',
                        ),
                      ),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: model.authenticatedUser.profile == null
                            ? AssetImage(_kAsset0)
                            : NetworkImage(api +
                                'profile/' +
                                model.authenticatedUser.profile.id
                                    .toString()),
                      ),
                      // otherAccountsPictures: <Widget>[
                      //   GestureDetector(
                      //     onTap: () {},
                      //     child: Semantics(
                      //       label: 'Switch to Account B',
                      //       child: const CircleAvatar(
                      //         backgroundImage: AssetImage(_kAsset1),
                      //       ),
                      //     ),
                      //   ),
                      //   GestureDetector(
                      //     onTap: () {},
                      //     child: Semantics(
                      //       label: 'Switch to Account C',
                      //       child: const CircleAvatar(
                      //         backgroundImage: AssetImage(_kAsset2),
                      //       ),
                      //     ),
                      //   )
                      // ],
                      margin: EdgeInsets.zero,
                      onDetailsPressed: () {
                        _showDrawerContents = !_showDrawerContents;
                        if (_showDrawerContents)
                          _controller.reverse();
                        else
                          _controller.forward();
                      },
                    ),
                    MediaQuery.removePadding(
                      context: context,
                      // DrawerHeader consumes top MediaQuery padding.
                      removeTop: true,
                      child: Expanded(
                          child: Container(
                        color: ThemeColor.Colors.gemPrimaryColor,
                        child: ListView(
                          padding: const EdgeInsets.only(top: 8.0),
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                CustomDivider(
                                  color: Colors.white,
                                ),
                                // The initial contents of the drawer.
                                FadeTransition(
                                  opacity: _drawerContentsOpacity,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: _menuChildren(),
                                  ),
                                ),
                                // The drawer's "details" view.
                                SlideTransition(
                                  position: _drawerDetailsPosition,
                                  child: FadeTransition(
                                    opacity: ReverseAnimation(
                                        _drawerContentsOpacity),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: _moreChildren()),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
