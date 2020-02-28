import 'package:flutter/material.dart';
import 'package:gem/api/api.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:gem/ui/pages/profile_page.dart';
import 'package:gem/ui/pages/search_friends.dart';
import 'package:gem/ui/widgets/image/image_holder.dart';
import 'package:gem/ui/widgets/tiles/no_items.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:gem/style/style.dart' as ThemeColor;
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../../../../models/user.dart';

class ResultChoice extends StatefulWidget {
  final MainModel model;

  const ResultChoice({Key key, @required this.model}) : super(key: key);
  @override
  _ResultChoiceState createState() => _ResultChoiceState();
}

class _ResultChoiceState extends State<ResultChoice> {
  String _displayName = '';

  @override
  void initState() {
    if (widget.model.getAllUsers().isNotEmpty) {
      _displayName = widget.model.searchedUsers.isNotEmpty
          ? widget.model.searchedUsers[0].profile.firstName
          : '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return SingleChildScrollView(
          child: model.searchedUsers.isEmpty
              ? Center(
                  child: NoItemTile(
                    icon: Icons.supervised_user_circle,
                    subtitle: 'There are no friends yet',
                    title: 'Friends',
                  ),
                )
              : Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Here are people you may be interest in',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: ThemeColor.Colors.gemPrimaryColor,
                          border: Border.all(color: Colors.white10)),
                      height: 300,
                      padding: EdgeInsets.all(16.0),
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: InkWell(
                                onTap: () => _showConfirmDialog(
                                    context, model.searchedUsers[index]),
                                child: ImageHolder(
                                  image: api +
                                      'profile/' +
                                      model.searchedUsers[index].profile.id
                                          .toString(),
                                )),
                          );
                        },
                        itemCount: model.searchedUsers.length,
                        viewportFraction: 0.8,
                        scale: 0.9,
                        pagination: SwiperPagination(),
                        onIndexChanged: _setDisplayName,
                        onTap: _navigate,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      _displayName,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
        );
      },
    );
  }

  void _setDisplayName(int index) {
    print(index);
    setState(() {
      _displayName = widget.model.searchedUsers[index].profile.firstName;
    });
  }

  void _navigate(int index) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => SearchFriendsPage()));
  }

  void _showConfirmDialog(BuildContext context, User user) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ThemeColor.Colors.gemPrimaryColor,
          title: Center(
              child: Text(
                  'Do you want to contact ' + user.profile.firstName + ' ?',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'itikaf',
                      fontWeight: FontWeight.bold))),
          content: SingleChildScrollView(
              child: Text('Upgrade to premium at 10,000/-  per month',
                  style: TextStyle(
                      fontFamily: 'itikaf',
                      fontSize: 25,
                      fontWeight: FontWeight.bold))),
          actions: <Widget>[
            RaisedButton.icon(
              color: Colors.green,
              textColor: Colors.white,
              icon: Icon(Icons.check),
              label: Text('UPGRADE',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'itikaf',
                      fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ProfilePage(
                              user: user,
                            )));
              },
            ),
            RaisedButton.icon(
              color: Colors.red,
              textColor: Colors.white,
              icon: Icon(Icons.close),
              label: Text(
                'CANCEL',
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
