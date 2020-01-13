import 'package:flutter/material.dart';

class Question {
  final int id;
  final String content;

  Question({@required this.id, @required this.content});
}

List<Question> questionList = <Question>[
  Question(id: 1, content: 'Of what religion to you want them to be?'),
  Question(
      id: 2,
      content:
          'What is your preferred age range for a person you would like to meet?'),
  Question(id: 3, content: 'Tell us of the height range you prefer?'),
  Question(
      id: 4,
      content:
          'What is the least education level do you want this person to have?'),
  Question(id: 5, content: "Do you what a working class person or not ?"),
  Question(
      id: 6, content: "Last but not least, of what race should the person be?")
];
