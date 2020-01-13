import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gem/constants/constants.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:gem/style/style.dart' as ThemeColor;
import 'package:gem/ui/widgets/textField/custom_text_field.dart';
import 'package:scoped_model/scoped_model.dart';

class PersonalForm extends StatefulWidget {
  @override
  _PersonalFormState createState() => _PersonalFormState();
}

class _PersonalFormState extends State<PersonalForm> {
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode ageFocusNode = FocusNode();
  final FocusNode heightFocusNode = FocusNode();
  final FocusNode skinColorFocusNode = FocusNode();
  final FocusNode nationalityFocusNode = FocusNode();
  final FocusNode educationLevelFocusNode = FocusNode();
  final FocusNode professionFocusNode = FocusNode();
  final FocusNode religionFocusNode = FocusNode();
  final FocusNode bioFocusNode = FocusNode();

  TextEditingController usernameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController skinController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController educationLevelController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/icons/male.jpg'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                focusNode: usernameFocusNode,
                textEditingController: usernameController,
                hintText: 'Username',
                labelText: 'Username',
                iconData: FontAwesomeIcons.user,
              ),
              CustomTextField(
                focusNode: ageFocusNode,
                textEditingController: ageController,
                hintText: 'Age',
                labelText: 'Age',
                iconData: FontAwesomeIcons.calendar,
              ),
              CustomTextField(
                focusNode: heightFocusNode,
                textEditingController: heightController,
                hintText: 'Height',
                labelText: 'Height',
                iconData: Icons.arrow_upward,
              ),
              CustomTextField(
                focusNode: skinColorFocusNode,
                textEditingController: skinController,
                hintText: 'Skin Color',
                labelText: 'Skin Color',
                iconData: Icons.palette,
              ),
              CustomTextField(
                focusNode: nationalityFocusNode,
                textEditingController: nationalityController,
                hintText: 'Nationality',
                labelText: 'Nationality',
                iconData: Icons.flag,
              ),
              CustomTextField(
                focusNode: professionFocusNode,
                textEditingController: professionController,
                hintText: 'Profession',
                labelText: 'Profession',
                iconData: Icons.library_books,
              ),
              CustomTextField(
                focusNode: educationLevelFocusNode,
                textEditingController: educationLevelController,
                hintText: 'Highest Level of Educaton',
                labelText: 'Highest Level of Educaton',
                iconData: Icons.library_books,
              ),
              CustomTextField(
                focusNode: religionFocusNode,
                textEditingController: religionController,
                hintText: 'Religion',
                labelText: 'Religion',
                iconData: FontAwesomeIcons.mosque,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Theme(
                  data: new ThemeData(
                    primaryColor: ThemeColor.Colors.gemPrimaryColor,
                    primaryColorDark: Colors.red[50],
                  ),
                  child: TextField(
                    maxLines: 10,
                    style: TextStyle(
                        fontFamily: "WorkSansSemiBold",
                        fontSize: 16.0,
                        color: Colors.black),
                    decoration: InputDecoration(
                      //focusColor: Colors.white,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: 'BIO',
                      labelText: 'MY BIO',
                      labelStyle: TextStyle(color: Colors.black),
                      hintStyle: TextStyle(
                          fontFamily: "WorkSansSemiBold",
                          fontSize: 17.0,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(homeScreen);
                        },
                        child: Text('SUBMIT',
                            style: TextStyle(color: Colors.white)),
                        color: ThemeColor.Colors.gemPrimaryColor,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 130)
            ],
          ),
        );
      },
    );
  }
}
