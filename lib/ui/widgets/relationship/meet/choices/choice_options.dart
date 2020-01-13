import 'package:flutter/material.dart';
import 'package:gem/models/category.dart';
import 'package:gem/scoped-model/main.dart';

import 'package:scoped_model/scoped_model.dart';

class ChoiceOptionsDialog extends StatefulWidget {
  static final String path = "lib/src/pages/quiz_app/quiz_options.dart";
  final Cats category;

  const ChoiceOptionsDialog({Key key, this.category}) : super(key: key);

  @override
  _ChoiceOptionsDialogState createState() => _ChoiceOptionsDialogState();
}

class _ChoiceOptionsDialogState extends State<ChoiceOptionsDialog> {
  bool processing;

  @override
  void initState() {
    super.initState();

    processing = false;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, MainModel model) {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey.shade200,
              child: Text(
                widget.category.name,
                style: Theme.of(context).textTheme.title.copyWith(),
              ),
            ),
            SizedBox(height: 10.0),
            Text("Select the " + widget.category.name + " you prefer"),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.center,
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.category.subcats.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ActionChip(
                      label:
                          Text(widget.category.subcats[index].name.toString()),
                      labelStyle: TextStyle(color: Colors.white),
                      backgroundColor: widget.category.subcats[index].isSelected
                          ? Colors.indigo
                          : Colors.grey.shade600,
                      onPressed: () => model.selectCategory(
                          catIndex: widget.category.id, subIndex: index),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            processing
                ? CircularProgressIndicator()
                : RaisedButton(
                    child: Text("Save"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () => _saveChoiceCategory(model: model),
                  ),
            SizedBox(height: 20.0),
          ],
        ),
      );
    });
  }

  void _saveChoiceCategory({@required MainModel model}) async {
    model.setCategory(newCategoryItem: widget.category.categoryItem);
    Navigator.pop(context);
  }
}
