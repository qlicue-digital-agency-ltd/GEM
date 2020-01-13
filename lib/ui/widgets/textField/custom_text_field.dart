import 'package:flutter/material.dart';
import 'package:gem/style/style.dart' as ThemeColor;

class CustomTextField extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final String hintText;
  final String labelText;
  final IconData iconData;

  const CustomTextField(
      {Key key,
      @required this.focusNode,
      @required this.textEditingController,
      @required this.hintText,
      @required this.labelText,
      @required this.iconData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Theme(
        data: new ThemeData(
          primaryColor: ThemeColor.Colors.gemPrimaryColor,
          primaryColorDark: Colors.red[50],
        ),
        child: TextField(
          focusNode: focusNode,
          controller: textEditingController,
          style: TextStyle(
              fontFamily: "WorkSansSemiBold",
              fontSize: 16.0,
              color: Colors.black),
          decoration: InputDecoration(
             // focusColor: Colors.white,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white)),
              hintText: hintText,
              labelText: labelText,
              labelStyle: TextStyle(color: Colors.black),
              hintStyle: TextStyle(
                  fontFamily: "WorkSansSemiBold",
                  fontSize: 17.0,
                  color: Colors.black),
              prefixIcon: Icon(
                iconData,
                size: 22.0,
                color: ThemeColor.Colors.gemPrimaryColor,
              ),
              suffix: InkWell(
                onTap: () {
                  print('Editing..');
                },
                child: Icon(
                  Icons.edit,
                  color: ThemeColor.Colors.gemPrimaryColor,
                ),
              )),
        ),
      ),
    );
  }
}
