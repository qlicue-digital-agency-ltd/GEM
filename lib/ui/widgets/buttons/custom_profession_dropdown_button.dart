import 'package:flutter/material.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:gem/ui/widgets/selectors/select_profession%C3%8F.dart';

class CustomProfessionDropdown extends StatelessWidget {
  final String title;

  final bool isRequired;
  final MainModel model;

  const CustomProfessionDropdown(
      {Key key,
      this.isRequired = false,
      this.title = 'Profession\t',
      @required this.model})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: Container(
        padding: EdgeInsets.only(left: 5),
        height: 50,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 2,
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(text: title),
                  TextSpan(
                      text: isRequired ? '*' : '',
                      style: TextStyle(color: Colors.red))
                ], style: TextStyle(color: Colors.black45)),
              ),
            ),
            Expanded(
              flex: 3,
              child: FlatButton(
                child: Text(
                  model.isSelectedProf
                      ? model.selectedProfessionLevel.description
                      : 'Select your profession',
                  maxLines: 1,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return SelectProfession();
                  }));
                },
              ),
            ),
            IconButton(
              tooltip: 'Add a new Category',
              icon: Icon(
                Icons.arrow_drop_down,
                size: 40,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                return SelectProfession();
              })),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
