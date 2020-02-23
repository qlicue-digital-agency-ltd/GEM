import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gem/api/api.dart';
import 'package:gem/models/user.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gem/style/style.dart' as ThemeColor;

class ProfilePage extends StatelessWidget {
  ProfilePage({Key key, @required this.user}) : super(key: key);
  final User user;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Container(
            height: 360,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0)),
                gradient: LinearGradient(
                    colors: [Colors.cyan, Colors.deepOrange],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 80),
            child: Column(
              children: <Widget>[
                Text(
                  "Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 20.0),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          height: double.infinity,
                          margin: const EdgeInsets.only(
                            left: 30,right: 30,
                               top: 10.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Image.network(
                                api + 'profile/' + user.profile.id.toString(),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(20.0)),
                          child:
                              Text(user.profile.maritalStatus.toString()),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  user.profile.firstName.toString() +
                      ' - ' +
                      _getAge(user).toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      size: 16.0,
                      color: Colors.grey,
                    ),
                    Text(
                      user.profile.nationality.toString(),
                      style: TextStyle(color: Colors.grey.shade600),
                    )
                  ],
                ),
                SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      color: Colors.pink,
                      icon: Icon(FontAwesomeIcons.instagram),
                      onPressed: () {
                        showInSnackBar(
                            context: context, value: 'User has no Instagram');
                      },
                    ),
                    IconButton(
                      color: Colors.blue.shade900,
                      icon: Icon(FontAwesomeIcons.facebookF),
                      onPressed: () {
                        showInSnackBar(
                            context: context, value: 'User has no Facebook');
                      },
                    ),
                    IconButton(
                      color: Colors.blueAccent[400],
                      icon: Icon(FontAwesomeIcons.twitter),
                      onPressed: () {
                        showInSnackBar(
                            context: context, value: 'User has no Twitter');
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 16.0),
                        margin: const EdgeInsets.only(
                            top: 30, left: 20.0, right: 20.0, bottom: 20.0),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.cyan, Colors.deepOrange],
                            ),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              color: Colors.white,
                              icon: Icon(FontAwesomeIcons.user),
                              onPressed: () {
                                _settingModalBottomSheet(context);
                              },
                            ),
                            IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.location_on),
                              onPressed: () {},
                            ),
                            Spacer(),
                            IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.call),
                              onPressed: () {
                                _launchURL(url: "tel:" + user.phone);
                              },
                            ),
                            IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.message),
                              onPressed: () {
                                _launchURL(url: "sms:" + user.phone);
                              },
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: FloatingActionButton(
                          child: Icon(
                            Icons.favorite,
                            color: Colors.pink,
                          ),
                          backgroundColor: Colors.white,
                          onPressed: () {
                    
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 120,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }

  int _getAge(User user) {
    final birthday = DateTime.parse(user.profile.birthday);
    final date2 = DateTime.now();
    final difference = date2.difference(birthday).inDays / 365;
    return difference.round();
  }

  _launchURL({@required String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void showInSnackBar(
      {@required BuildContext context, @required String value}) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: ThemeColor.Colors.gemPrimaryColor,
      duration: Duration(seconds: 3),
    ));
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: ThemeColor.Colors.gemPrimaryColor,
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(
                      FontAwesomeIcons.bookOpen,
                      color: Colors.white,
                    ),
                    title: new Text(
                      'View Bio',
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () => {}),
                new ListTile(
                  leading: new Icon(
                    FontAwesomeIcons.handPointRight,
                    color: Colors.white,
                  ),
                  title:
                      new Text('Follow', style: TextStyle(color: Colors.black)),
                  onTap: () => {},
                ),
              ],
            ),
          );
        });
  }
}
