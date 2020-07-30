import 'package:flutter/material.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:gem/style/theme.dart';
import 'package:gem/ui/pages/home_page.dart';
import 'package:gem/ui/pages/login_page.dart';
import 'package:gem/ui/pages/register_form_page.dart';
import 'package:gem/ui/pages/signup_page.dart';
import 'package:gem/ui/screens/about_screen.dart';
import 'package:gem/ui/screens/help_screen.dart';
import 'package:gem/ui/screens/my_jobs_screen.dart';
import 'package:gem/ui/screens/personal_screen.dart';
import 'package:gem/ui/screens/profile_screen.dart';
import 'package:gem/ui/screens/security_screen.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

import 'constants/constants.dart';
import 'ui/screens/AnimatedSplashScreen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final MainModel _model = MainModel();
  bool _isAuthenticated = false;

  //making list of pages needed to pass in IntroViewsFlutter constructor.
  final pages = [
    PageViewModel(
      pageColor: Colors.cyan,
      iconImageAssetPath: 'assets/img/logo.png',
      body: Text(
        'Welcome to GEM APP! for Relationshp, Trade & Jobs',
      ),
      title: Text('GEM APP'),
      mainImage: Image.asset(
        'assets/img/logo.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      pageColor: Colors.pink[400],
      iconImageAssetPath: 'assets/icons/relationship.png',
      body: Text(
        'Find a friend or Spouse',
      ),
      title: Text('Relationship'),
      mainImage: Image.asset(
        'assets/icons/relationship.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      pageColor: const Color(0xFF03a9f4),
      iconImageAssetPath: 'assets/icons/shopping-bag.png',
      body: Text(
        'Buy and Sell with cashless transaction',
      ),
      title: Text('Trade'),
      mainImage: Image.asset(
        'assets/icons/shopping-bag.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      pageColor: Colors.green[400],
      iconImageAssetPath: 'assets/icons/employee.png',
      body: Text(
        'Seek for a job that suits your profession',
      ),
      title: Text('Jobs'),
      mainImage: Image.asset(
        'assets/icons/employee.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
  ];

  @override
  void initState() {
    _model.getOnBoardingStatus();
    _model.fetchEducationLevels();
    _model.fetchProfessionLevels();
    _model.fetchDistricts();
    super.initState();
    _model.autoAuthenticate().then((onValue) {
      _model.fetchUserProfile();
    });
    _model.userSubject.listen((bool isAuthenticated) {
      setState(() {
        _isAuthenticated = isAuthenticated;
      });
    });

    _model.fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      child: MaterialApp(
        title: 'GEM APP',
        debugShowCheckedModeBanner: false,
        theme: ArchSampleTheme.theme,
        home: AnimatedSplashScreen(
          model: _model,
        ),
        routes: {
          homeScreen: (BuildContext context) => _isAuthenticated
              ? (_model.authenticatedUser.id != 0
                  ? HomePage(
                      model: _model,
                    )
                  : RegisterFormPage(
                      model: _model,
                    ))
              : LoginPage(),
          registerFormScreen: (BuildContext context) => RegisterFormPage(
                model: _model,
              ),
          loginScreen: (BuildContext context) => LoginPage(),
          registerScreen: (BuildContext context) => SignupPage(),
          securityScreen: (BuildContext context) => SecurityScreen(),
          profileScreen: (BuildContext context) => ProfileScreen(),
          myJobsScreen: (BuildContext context) => MyJobsScreen(),
          aboutScreen: (BuildContext context) => AboutScreen(),
          helpScreen: (BuildContext context) => HelpScreen(),
          personalDetailScreen: (BuildContext context) =>
              PersonalDetailScreen(),
          onBoardingScreen: (BuildContext context) => IntroViewsFlutter(
                pages,
                onTapDoneButton: () {
                  Navigator.pushReplacementNamed(context, homeScreen);
                  _model.setOnBoardingCompleted(status: true);
                  print('object');
                },
                pageButtonTextStyles: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
        },
      ),
      model: _model,
    );
  }
}
