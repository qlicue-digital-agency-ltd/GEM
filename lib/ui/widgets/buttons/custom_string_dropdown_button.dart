import 'package:flutter/material.dart';

typedef CustomStringDropdownButtonOnChange = Function(String);

class CustomStringDropdown extends StatelessWidget {
  final CustomStringDropdownButtonOnChange onChange;
  final String title;
  final String value;
  final List<String> items;
  final bool isRequired;

  const CustomStringDropdown(
      {Key key,
      @required this.value,
      @required this.items,
      @required this.onChange,
      @required this.title,
      this.isRequired = false})
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
                      text: isRequired ? ' *' : '',
                      style: TextStyle( color: Colors.red))
                ], style: TextStyle( color: Colors.black45)),
              ),
            ),
            Expanded(
              flex: 3,
              child: DropdownButton(
                isExpanded: true,
                hint: Text(
                  '--- Select ' + title + '---',
                  overflow: TextOverflow.ellipsis,
                ),
                iconSize: 35,
                value: value,
                iconDisabledColor: Colors.grey,
                iconEnabledColor: Theme.of(context).primaryColor,
                items: items.map((val) {
                  return DropdownMenuItem(
                    value: val,
                    child: Text(val),
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
