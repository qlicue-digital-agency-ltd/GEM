import 'package:flutter/material.dart';
import 'package:gem/models/education.dart';

typedef CustomEducationDropdownButtonOnChange = Function(Education);

class CustomEducationDropdown extends StatelessWidget {
  final CustomEducationDropdownButtonOnChange onChange;
  final Education value;
  final String title;
  final List<Education> items;
  final bool isRequired;

  const CustomEducationDropdown(
      {Key key,
      @required this.value,
      @required this.items,
      this.isRequired = false,
      this.title = 'Education\t',
      @required this.onChange})
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
              child: DropdownButton(
                isExpanded: true,
                hint: Text(
                  '--- Select Education ---',
                  overflow: TextOverflow.ellipsis,
                ),
                iconSize: 35,
                value: value,
                iconDisabledColor: Colors.grey,
                iconEnabledColor: Theme.of(context).primaryColor,
                items: items.map((education) {
                  return DropdownMenuItem(
                    value: education,
                    child: Text(education.level),
                  );
                }).toList(),
                onChanged: (newValue) => onChange(newValue),
              ),
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
