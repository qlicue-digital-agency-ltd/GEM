import 'package:flutter/material.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:gem/ui/screens/relation_tips_detail_screen.dart';

import 'package:gem/ui/widgets/relationship/cases/case_card.dart';
import 'package:gem/ui/widgets/relationship/meet/choices/choose_friends.dart';
import 'package:gem/ui/widgets/relationship/meet/choices/result_choices.dart';

import 'package:gem/ui/widgets/relationship/tips/tips_card.dart';
import 'package:scoped_model/scoped_model.dart';

import 'relationship_cases_detail_screen.dart';

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
            Container(
                child: ListView.builder(
              itemCount: model.availableCases.length,
              itemBuilder: (BuildContext context, int index) {
                return CaseCard(
                  model: model,
                  onCardTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RelationshipCasesDetailScreen(
                                  title: model.availableCases[index].subtitle,
                                  relationCase: model.availableCases[index],
                                  index: index,
                                  model: model,
                                )));
                  },
                  relationCase: model.availableCases[index],
                );
              },
            )),
            Container(
                child: ListView.builder(
              itemCount: model.availableTips.length,
              itemBuilder: (BuildContext context, int index) {
                return TipsCard(
                  model: model,
                  tip: model.availableTips[index],
                  onCardTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RelationshipTipsDetailScreen(
                                  title: model.availableTips[index].subtitle,
                                  relationTip: model.availableTips[index],
                                  model: model,
                                  index: index,
                                )));
                  },
                );
              },
            )),
          ],
        );
      },
    );
  }
}
