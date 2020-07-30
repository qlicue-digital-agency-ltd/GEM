import 'package:flutter/material.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:gem/ui/screens/relation/cases_screen.dart';
import 'package:gem/ui/screens/relation/tips_screen.dart';


import 'package:gem/ui/widgets/relationship/meet/choices/choose_friends.dart';
import 'package:gem/ui/widgets/relationship/meet/choices/result_choices.dart';

import 'package:scoped_model/scoped_model.dart';

class FriendshipScreen extends StatefulWidget {
  final MainModel model;
  const FriendshipScreen({Key key, @required this.model}) : super(key: key);

  @override
  _FriendshipScreenState createState() => _FriendshipScreenState();
}

class _FriendshipScreenState extends State<FriendshipScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode ageFocusNode = FocusNode();
  final FocusNode heightFocusNode = FocusNode();
  final FocusNode skinColorFocusNode = FocusNode();
  final FocusNode nationalityFocusNode = FocusNode();
  final FocusNode educationFocusNode = FocusNode();
  final FocusNode religionFocusNode = FocusNode();
  final FocusNode bioFocusNode = FocusNode();

  TextEditingController usernameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController skinController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.model.loadCats();
    _tabController = new TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();

    usernameFocusNode.dispose();
    ageFocusNode.dispose();
    heightController.dispose();
    skinController.dispose();
    nationalityFocusNode.dispose();
    educationFocusNode.dispose();
    religionFocusNode.dispose();
    bioFocusNode.dispose();

    usernameController.dispose();
    ageController.dispose();
    heightController.dispose();
    skinController.dispose();
    nationalityController.dispose();
    educationController.dispose();
    religionController.dispose();
    bioController.dispose();

    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        _tabController?.animateTo(model.indexTopTab,
            duration: Duration(milliseconds: 500), curve: Curves.decelerate);

        return TabBarView(
          controller: _tabController,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: <Widget>[
                    model.isChoiceRequired
                        ? ChooseFriends()
                        : ResultChoice(
                            model: model,
                          ),
                  ],
                )),
            CasesScreen(
              model: model,
            ),
            TipsScreen(
              model: model,
            )
          ],
        );
      },
    );
  }
}
