import 'package:flutter/material.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:gem/ui/widgets/relationship/cases/case_card.dart';
import 'package:gem/ui/widgets/tiles/no_items.dart';

import '../relationship_cases_detail_screen.dart';

class CasesScreen extends StatefulWidget {
  final MainModel model;

  const CasesScreen({Key key, this.model}) : super(key: key);
  @override
  _CasesScreenState createState() => _CasesScreenState();
}

class _CasesScreenState extends State<CasesScreen> {
  @override
  void initState() {
    super.initState();
    widget.model.fetchCases();
  }

  Future<void> _getData() async {
    widget.model.fetchCases();
  }

  @override
  Widget build(BuildContext context) {
    return widget.model.isFetchingCases
        ? Center(child: CircularProgressIndicator())
        : widget.model.availableCases.isEmpty
            ? Center(
                child: NoItemTile(
                    icon: 'assets/icons/heart.png',
                    title: 'No Posts',
                    subtitle: 'We have no posts of yet'),
              )
            : RefreshIndicator(
                onRefresh: _getData,
                child: Container(
                    child: ListView.builder(
                  itemCount: widget.model.availableCases.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CaseCard(
                      model: widget.model,
                      onCardTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RelationshipCasesDetailScreen(
                                      title: widget
                                          .model.availableCases[index].title,
                                      relationCase:
                                          widget.model.availableCases[index],
                                      model: widget.model,
                                    )));
                      },
                      relationCase: widget.model.availableCases[index],
                    );
                  },
                )),
              );
  }
}
