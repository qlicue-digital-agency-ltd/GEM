import 'package:flutter/material.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:gem/ui/pages/profile_page.dart';

import 'package:gem/ui/widgets/tiles/user_tile.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class FriendsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     timeDilation = 3.0;
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Container(
        child: ListView.builder(
          itemCount: model.getAllUsers().length,
          itemBuilder:    (BuildContext context, int index) {
            return UserTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ProfilePage(user: model.getAllUsers()[index],)));
              },
              user: model.getAllUsers()[index],
            );
          },
        ),
      );
    });
  }
}
