import 'package:flutter/material.dart';
import 'package:gem/constants/constants.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:gem/ui/widgets/textField/confirm_password_text_field.dart';
import 'package:gem/ui/widgets/textField/mobile_text_field.dart';
import 'package:gem/ui/widgets/textField/password_text_field.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:gem/style/style.dart' as ThemeColor;

class SignupPage extends StatefulWidget {
  final MainModel model;

  const SignupPage({Key key, this.model}) : super(key: key);
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  TextEditingController _phoneTextEditingController = TextEditingController();

  TextEditingController _passwordTextEditingController =
      TextEditingController();

  TextEditingController _confirmPasswordTextEditingController =
      TextEditingController();

  String passwordText = '';

  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormFieldState> _formFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: ThemeColor.Colors.gemPrimaryColor,
          body: SingleChildScrollView(
            child: Form(
              key: _signUpFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: new Image(
                        height: 100.0,
                        fit: BoxFit.fill,
                        image: new AssetImage('assets/img/logo.png')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.0),
                    child: Text('GEM APP',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: MobileTextfield(
                      message: 'Please enter Mobile Number',
                      maxLines: 1,
                      hitText: 'Mobile',
                      labelText: null,
                      focusNode: _phoneFocusNode,
                      textEditingController: _phoneTextEditingController,
                      keyboardType: TextInputType.number,
                      selectedCountry: model.selectedCountry,
                      onCodeChange: (country) {
                        print(country);
                        model.setSelectedCountry = country;
                      },
                      onChange: (number) {},
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: PasswordLabelTextfield(
                      prefixIcon: Icons.lock,
                      message: 'Please enter Password',
                      maxLines: 1,
                      hitText: 'Password',
                      labelText: null,
                      focusNode: _passwordFocusNode,
                      textEditingController: _passwordTextEditingController,
                      keyboardType: TextInputType.text,
                      password: null,
                      onChange: (value) {
                        setState(() {
                          passwordText = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: ConfirmPasswordLabelTextfield(
                      message: 'Make sure passwords do match',
                      maxLines: 1,
                      hitText: 'Confirm Password',
                      prefixIcon: Icons.lock,
                      formFieldKey: _formFieldKey,
                      labelText: null,
                      focusNode: _confirmPasswordFocusNode,
                      password: passwordText,
                      textEditingController:
                          _confirmPasswordTextEditingController,
                      keyboardType: TextInputType.text,
                      onChange: (val) {
                        _formFieldKey.currentState.validate();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  color: Colors.white),
                              child: FlatButton(
                                child: Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                onPressed: () {
                                  final _mobile =
                                      model.selectedCountry.dialingCode +
                                          _phoneTextEditingController.text
                                              .replaceAll('(', '')
                                              .replaceAll(')', '')
                                              .replaceAll('-', '')
                                              .replaceAll(' ', '');
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  if (_signUpFormKey.currentState.validate()) {
                                    model
                                        .signUpUser(
                                            phone: _mobile,
                                            password:
                                                _passwordTextEditingController
                                                    .text)
                                        .then((onValue) {
                                      if (onValue) {
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                registerFormScreen);
                                        _phoneTextEditingController.clear();
                                        _passwordTextEditingController.clear();
                                        _confirmPasswordTextEditingController
                                            .clear();
                                      }
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: FlatButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(loginScreen);
                        },
                        child: Text(
                          "Have an account? Sign In!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontFamily: "WorkSansMedium"),
                        )),
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 3),
    ));
  }
}
