import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:gem/constants/constants.dart';
import 'package:gem/constants/static_lists.dart';

import 'package:gem/scoped-model/main.dart';
import 'package:gem/ui/widgets/buttons/custom_date_picker_button.dart';
import 'package:gem/ui/widgets/buttons/custom_district_dropdown_button.dart';
import 'package:gem/ui/widgets/buttons/custom_education_dropdown_button.dart';
import 'package:gem/ui/widgets/buttons/custom_profession_dropdown_button.dart';
import 'package:gem/ui/widgets/buttons/custom_string_dropdown_button.dart';

import 'package:gem/ui/widgets/textField/laber_text_field.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:gem/style/style.dart' as ThemeColor;

const String MIN_DATETIME = '1900-01-01';
const String MAX_DATETIME = '2100-01-01';
const String INIT_DATETIME = '2019-01-01';

class RegisterFormPage extends StatefulWidget {
  final MainModel model;

  const RegisterFormPage({Key key, @required this.model}) : super(key: key);
  @override
  _RegisterFormPageState createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();

  TextEditingController _firstNameTextEditingController =
      TextEditingController();
  TextEditingController _lastNameTextEditingController =
      TextEditingController();

  String _dropdownValueGender = 'Male';
  String _dropdownValueMaritalStatus = 'Single';
  String _dropdownValueHeight = 'Medium';
  String _dropdownValueRaceColor = 'African';
  String _dropdownValueReligion = 'Non';

  bool _showTitle = true;

  DateTimePickerLocale _locale = DateTimePickerLocale.en_us;

  String _format = 'yyyy-MMMM-dd';
  TextEditingController _formatCtrl = TextEditingController();

  DateTime _birthday;

  @override
  void initState() {
    widget.model.fetchEducationLevels();
    widget.model.fetchProfessionLevels();
    widget.model.fetchDistricts();
    super.initState();
    _formatCtrl.text = _format;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Personal Info'),
        ),
        body: model.availableEducationLevels.isEmpty ||
                model.availableProfessionLevels.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            child: InkWell(
                              onTap: () {
                                model.chooseAmImage();
                              },
                              child: CircleAvatar(
                                backgroundImage: model.pickedImage == null
                                    ? AssetImage('assets/icons/male.jpg')
                                    : FileImage(
                                        model.pickedImage,
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: LabelTextfield(
                              message: 'Please enter User  name',
                              maxLines: 1,
                              prefixIcon: FontAwesomeIcons.user,
                              hitText: 'First Name',
                              labelText: null,
                              focusNode: _firstNameFocusNode,
                              textEditingController:
                                  _firstNameTextEditingController,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: LabelTextfield(
                              message: 'Please enter your last name',
                              maxLines: 1,
                              prefixIcon: FontAwesomeIcons.user,
                              hitText: 'Last Name',
                              labelText: null,
                              focusNode: _lastNameFocusNode,
                              textEditingController:
                                  _lastNameTextEditingController,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: CustomStringDropdown(
                              items: sexList,
                              onChange: (gender) {
                                setState(() {
                                  _dropdownValueGender = gender;
                                });
                              },
                              title: 'Gender',
                              value: _dropdownValueGender,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomDateDropdown(
                            birthday: _birthday,
                            model: model,
                            onTap: () {
                              print('object');
                              _showDatePicker();
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: CustomStringDropdown(
                              items: maritalStatusList,
                              onChange: (maritalStatus) {
                                setState(() {
                                  _dropdownValueMaritalStatus = maritalStatus;
                                });
                              },
                              title: 'Marital Status',
                              value: _dropdownValueMaritalStatus,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: CustomStringDropdown(
                              items: dominonList,
                              onChange: (dominion) {
                                setState(() {
                                  _dropdownValueReligion = dominion;
                                });
                              },
                              title: 'Religion',
                              value: _dropdownValueReligion,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: CustomStringDropdown(
                              items: heightList,
                              onChange: (height) {
                                setState(() {
                                  _dropdownValueHeight = height;
                                });
                              },
                              title: 'Height',
                              value: _dropdownValueHeight,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: CustomStringDropdown(
                              items: skinColorList,
                              onChange: (height) {
                                setState(() {
                                  _dropdownValueRaceColor = height;
                                });
                              },
                              title: 'Race',
                              value: _dropdownValueRaceColor,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CustomEducationDropdown(
                                items: model.availableEducationLevels,
                                onChange: (level) {
                                  model.selectEducationLevel(level);
                                },
                                value: model.selectedEducationLevel,
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: CustomProfessionDropdown(
                              model: model,
                            ),
                          ),
                          SizedBox(height: 20),
                          CustomDistrictDropdown(
                            items: model.availableDistricts,
                            onChange: (district) {
                              model.selectDistrict(district);
                            },
                            value: model.selectedDistrict,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: RaisedButton(
                                  disabledTextColor: Colors.grey,
                                  disabledColor: Colors.cyan[200],
                                  color: Color(0xFF00d0cb),
                                  onPressed: () {
                                    print(model.authenticatedUser);

                                    if (_formKey.currentState.validate()) {
                                      if (model.pickedImage != null &&
                                          _birthday != null) {
                                        if (_getAge(
                                                date: _birthday.toString()) >=
                                            16) {
                                          model
                                              .updateProfile(
                                                  birthday:
                                                      _birthday.toString(),
                                                  educationLevel: model
                                                      .selectedEducationLevel,
                                                  firstName:
                                                      _firstNameTextEditingController
                                                          .text,
                                                  lastName:
                                                      _lastNameTextEditingController
                                                          .text,
                                                  matrialStatus:
                                                      _dropdownValueMaritalStatus,
                                                  profession: model
                                                      .selectedProfessionLevel,
                                                  pronvice:
                                                      model.selectedDistrict,
                                                  sex: _dropdownValueGender,
                                                  bio:
                                                      'Please Write Something about you',
                                                  nationality: 'Tanzanian',
                                                  dominion:
                                                      _dropdownValueReligion,
                                                  height: _dropdownValueHeight,
                                                  skinColor:
                                                      _dropdownValueRaceColor)
                                              .then((val) {
                                            if (val) {
                                              _showInSnackBar(
                                                  'Error while uploading product',
                                                  Icons.error,
                                                  Colors.red);
                                            } else {
                                              _firstNameTextEditingController
                                                  .clear();
                                              _lastNameTextEditingController
                                                  .clear();
                                              _birthday = null;
                                            }

                                            Navigator.of(context)
                                                .pushReplacementNamed(
                                                    homeScreen);
                                          });
                                        } else {
                                          _showInSnackBar(
                                              'You should be above 16 years of age to continue',
                                              Icons.calendar_today,
                                              Colors.white);
                                        }
                                      } else {
                                        _showInSnackBar(
                                            'Please Add an Image',
                                            Icons.picture_in_picture,
                                            Colors.white);
                                      }
                                    }
                                  },
                                  child: model.isSubmitingUserData
                                      ? CircularProgressIndicator()
                                      : Text(
                                          'Submit',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      );
    });
  }

  /// Display date picker.
  void _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      pickerTheme: DateTimePickerTheme(
        showTitle: _showTitle,
        confirm: Text('Done', style: TextStyle(color: Colors.cyan)),
        cancel: Text('cancel', style: TextStyle(color: Colors.red)),
      ),
      minDateTime: DateTime.parse(MIN_DATETIME),
      maxDateTime: DateTime.parse(MAX_DATETIME),
      initialDateTime: _birthday,
      dateFormat: _format,
      locale: _locale,
      onClose: () => print("----- onClose -----"),
      onCancel: () => print('onCancel'),
      onChange: (dateTime, List<int> index) {
        setState(() {
          _birthday = dateTime;
        });
      },
      onConfirm: (dateTime, List<int> index) {
        setState(() {
          _birthday = dateTime;
        });
      },
    );
  }

  int _getAge({@required String date}) {
    final birthday = DateTime.parse(date);
    final date2 = DateTime.now();
    final difference = date2.difference(birthday).inDays / 365;
    return difference.round();
  }

  void _showInSnackBar(String value, IconData icon, Color color) {
    FocusScope.of(context).requestFocus(FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontFamily: "WorkSansSemiBold"),
        ),
      ),
      backgroundColor: ThemeColor.Colors.gemPrimaryColor,
      duration: Duration(seconds: 3),
    ));
  }
}
