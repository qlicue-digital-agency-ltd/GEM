import 'package:flutter/material.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:gem/ui/widgets/relationship/tips/tips_card.dart';

import '../relation_tips_detail_screen.dart';

class TipsScreen extends StatefulWidget {
  final MainModel model;

  const TipsScreen({Key key, this.model}) : super(key: key);
  @override
  _TipsScreenState createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  @override
  void initState() {
    super.initState();
   widget.model.fetchTips();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: widget.model.availableTips.length,
      itemBuilder: (BuildContext context, int index) {
        return TipsCard(
          model: widget.model,
          tip: widget.model.availableTips[index],
          onCardTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RelationshipTipsDetailScreen(
                          title: widget.model.availableTips[index].subtitle,
                          relationTip: widget.model.availableTips[index],
                          model: widget.model,
                          index: index,
                        )));
          },
        );
      },
    ));
  }
}
