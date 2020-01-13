import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:scoped_model/scoped_model.dart';

class SelectProfession extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Select your Profession'),
        ),
        body: ListView.separated(
          itemCount: model.availableProfessionLevels.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                model.selectProfessionLevel(
                    model.availableProfessionLevels[index]);
                Navigator.pop(context);
              },
              leading: Icon(FontAwesomeIcons.peopleCarry),
              title: Text(model.availableProfessionLevels[index].description),
              trailing: Icon(model.availableProfessionLevels[index].isSelected
                  ? Icons.check_circle_outline
                  : Icons.check_box_outline_blank),
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(
            indent: 10,
            endIndent: 10,
          ),
        ),
      );
    });
  }
}
