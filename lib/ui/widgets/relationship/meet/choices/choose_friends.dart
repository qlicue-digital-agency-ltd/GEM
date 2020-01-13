import 'package:flutter/material.dart';
import 'package:gem/models/question.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:gem/ui/widgets/card/answer_card.dart';
import 'package:gem/ui/widgets/relationship/meet/choices/result_choices.dart';

import 'package:scoped_model/scoped_model.dart';

class ChooseFriends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return CustomScrollView(
          slivers: model.currentWizardIndex <= 5
              ? <Widget>[
                  model.currentWizardIndex < 0
                      ? SliverList(
                          delegate: SliverChildListDelegate([
                            Image.asset(
                              'assets/img/friendship.png',
                              height: 200,
                            ),
                            Padding(
                                padding: EdgeInsets.all(20),
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                    text: "Hello ",
                                    children: <TextSpan>[
                                      TextSpan(
                                          text:
                                              model.authenticatedUser.profile !=
                                                      null
                                                  ? model.authenticatedUser
                                                          .profile.firstName +
                                                      ", "
                                                  : "",
                                          style:
                                              TextStyle(color: Colors.black)),
                                      TextSpan(
                                          text:
                                              ' Welcome to GEM APP! Help us to find a partner or a friend of your choice by answering the following questions! \t GET STARTED',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18))
                                    ],
                                  ),
                                )),
                          ]),
                        )
                      : SliverList(
                          delegate: SliverChildListDelegate([
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                questionList[model.currentWizardIndex].content,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ]),
                        ),
                  model.currentWizardIndex == 0
                      ? SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: AnswerCard(
                                answer: model.availableReligionList[index],
                                onTap: () {
                                  model.setPreferredReligion =
                                      model.availableReligionList[index].id;
                                },
                                model: model,
                              ),
                            );
                          }, childCount: model.availableReligionList.length),
                        )
                      : model.currentWizardIndex == 1
                          ? SliverList(
                              delegate:
                                  SliverChildBuilderDelegate((context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: AnswerCard(
                                    answer: model.availableAgeList[index],
                                    onTap: () {
                                      model.setPreferredAge =
                                          model.availableAgeList[index].id;
                                    },
                                    model: model,
                                  ),
                                );
                              }, childCount: model.availableAgeList.length),
                            )
                          : model.currentWizardIndex == 2
                              ? SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                      (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: AnswerCard(
                                        answer:
                                            model.availableHeightList[index],
                                        onTap: () {
                                          model.setPreferredHeight = model
                                              .availableHeightList[index].id;
                                        },
                                        model: model,
                                      ),
                                    );
                                  },
                                      childCount:
                                          model.availableHeightList.length),
                                )
                              : model.currentWizardIndex == 3
                                  ? SliverList(
                                      delegate: SliverChildBuilderDelegate(
                                          (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: AnswerCard(
                                            answer: model
                                                .availableEducationList[index],
                                            onTap: () {
                                              model.setPreferredEducation =
                                                  model
                                                      .availableEducationList[
                                                          index]
                                                      .id;
                                            },
                                            model: model,
                                          ),
                                        );
                                      },
                                          childCount: model
                                              .availableEducationList.length),
                                    )
                                  : model.currentWizardIndex == 4
                                      ? SliverList(
                                          delegate: SliverChildBuilderDelegate(
                                              (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: AnswerCard(
                                                answer: model
                                                    .availableJobsList[index],
                                                onTap: () {
                                                  model.setPreferredJobs = model
                                                      .availableJobsList[index]
                                                      .id;
                                                },
                                                model: model,
                                              ),
                                            );
                                          },
                                              childCount: model
                                                  .availableJobsList.length),
                                        )
                                      : model.currentWizardIndex == 5
                                          ? SliverList(
                                              delegate:
                                                  SliverChildBuilderDelegate(
                                                      (context, index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: AnswerCard(
                                                    answer:
                                                        model.availableRaceList[
                                                            index],
                                                    onTap: () {
                                                      model.setPreferredRace =
                                                          model
                                                              .availableRaceList[
                                                                  index]
                                                              .id;
                                                    },
                                                    model: model,
                                                  ),
                                                );
                                              },
                                                      childCount: model
                                                          .availableRaceList
                                                          .length),
                                            )
                                          : SliverList(
                                              delegate:
                                                  SliverChildBuilderDelegate(
                                                      (context, index) {
                                                return Container();
                                              },
                                                      childCount: model
                                                          .availableRaceList
                                                          .length),
                                            ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      model.currentWizardIndex <= 5
                          ? Padding(
                              padding: EdgeInsets.all(20),
                              child: RaisedButton(
                                textColor: Colors.white,
                                color: Theme.of(context).primaryColor,
                                child: Text(model.currentWizardIndex < 0
                                    ? "START"
                                    : model.currentWizardIndex == 5
                                        ? 'SEARCH'
                                        : 'NEXT'),
                                onPressed: () {
                                  if (model.currentWizardIndex < 5) {
                                    model.setCurrentWizardIndex =
                                        model.currentWizardIndex + 1;
                                  } else {
                                    model
                                        .filterUsers(
                                            race: model.availableRaceList
                                                .firstWhere(
                                                    (race) => race.isSelected)
                                                .content
                                                .toLowerCase(),
                                            age: model.availableAgeList
                                                .firstWhere(
                                                    (age) => age.isSelected)
                                                .alphabet,
                                            religion: model
                                                .availableReligionList
                                                .firstWhere((religion) =>
                                                    religion.isSelected)
                                                .content
                                                .toLowerCase(),
                                            education: model
                                                .availableEducationList
                                                .firstWhere((education) =>
                                                    education.isSelected)
                                                .content
                                                .toLowerCase(),
                                            employment: model.availableJobsList
                                                .firstWhere(
                                                    (job) => job.isSelected)
                                                .alphabet,
                                            height: model.availableHeightList
                                                .firstWhere((height) =>
                                                    height.isSelected)
                                                .content
                                                .toLowerCase(),
                                            sex: model.authenticatedUser.profile
                                                        .sex
                                                        .toLowerCase() ==
                                                    "male"
                                                ? "female"
                                                : "male")
                                        .then((onValue) {
                                      model.setCurrentWizardIndex = 6;
                                    });
                                  }
                                },
                              ),
                            )
                          : Container(),
                    ]),
                  ),
                ]
              : <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate([
                      ResultChoice(
                        model: model,
                      )
                    ]),
                  )
                ],
        );
      },
    );
  }
}
