import 'package:flutter/material.dart';
import 'package:gem/models/district.dart';

typedef CustomDistrictDropdownButtonOnChange = Function(District);

class CustomDistrictDropdown extends StatelessWidget {
  final CustomDistrictDropdownButtonOnChange onChange;
  final District value;
  final String title;
  final List<District> items;
  final bool isRequired;

  const CustomDistrictDropdown(
      {Key key,
      @required this.value,
      @required this.items,
      this.isRequired = false,
      this.title = 'District\t',
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
                  '--- Select District ---',
                  overflow: TextOverflow.ellipsis,
                ),
                iconSize: 35,
                value: value,
                iconDisabledColor: Colors.grey,
                iconEnabledColor: Theme.of(context).primaryColor,
                items: items.map((district) {
                  return DropdownMenuItem(
                    value: district,
                    child: Text(district.name),
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
