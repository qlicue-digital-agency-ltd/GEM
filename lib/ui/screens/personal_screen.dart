import 'package:flutter/material.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:gem/ui/widgets/forms/personal_form.dart';
import 'package:scoped_model/scoped_model.dart';

class PersonalDetailScreen extends StatefulWidget {
  @override
  _PersonalDetailScreenState createState() => _PersonalDetailScreenState();
}

class _PersonalDetailScreenState extends State<PersonalDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
            appBar: AppBar(title: Text('Personal Information')),
            body: Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                elevation: 10,
                child: PersonalForm(),
              ),
            ));
      },
    );
  }
}
