import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gem/constants/constants.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:gem/ui/widgets/textField/mobile_text_field.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:gem/style/style.dart' as ThemeColor;


class LoginPage extends StatefulWidget {
  final MainModel model;

  const LoginPage({Key key, this.model}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  TextEditingController _phoneTextEditingController = TextEditingController();
  TextEditingController _passwordloginTextEditingController =
      TextEditingController();
  bool _obscureTextLogin = true;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();
    _phoneTextEditingController.dispose();
    _passwordloginTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: ThemeColor.Colors.gemPrimaryColor,
          body: SingleChildScrollView(
            child: Form(
              key: _signInFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: new Image(
                        height: 100,
                        fit: BoxFit.fill,
                        image: new AssetImage('assets/img/logo.png')),
                  ),
                  Text('GEM APP',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
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
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: TextFormField(
                        focusNode: _passwordFocusNode,
                        controller: _passwordloginTextEditingController,
                        obscureText: _obscureTextLogin,
                        onChanged: (String value) {},
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        cursorColor: Theme.of(context).cursorColor,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Material(
                              elevation: 0,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              child: Icon(
                                Icons.lock,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            suffixIcon: InkWell(
                              splashColor: Theme.of(context).primaryColor,
                              highlightColor: Colors.transparent,
                              child: Icon(_obscureTextLogin
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash),
                              onTap: () {
                                setState(() {
                                  _obscureTextLogin = !_obscureTextLogin;
                                });
                              },
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 13)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
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
                                  "Login",
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
                                  if (_signInFormKey.currentState.validate()) {
                                    model
                                        .signInUser(
                                            phone: _mobile,
                                            password:
                                                _passwordloginTextEditingController
                                                    .text)
                                        .then((status) {
                                      Navigator.pushReplacementNamed(
                                          context, homeScreen);
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
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: FlatButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(registerScreen);
                        },
                        child: Text(
                          "Don't have an account? Sign Up!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
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
