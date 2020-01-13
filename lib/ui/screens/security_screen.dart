import 'package:flutter/material.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:gem/ui/widgets/divider/custom_divider.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:gem/style/style.dart' as ThemeColor;

class SecurityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            title: Text('My Security'),
          ),
          body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Login Security',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                onTap: () {
                  print('Password');
                },
                leading: Icon(Icons.vpn_key),
                title: Text('Password'),
              ),
              ListTile(
                onTap: () {
                  print('Color Storage');
                },
                leading: Icon(Icons.security),
                title: Text('Color Storage'),
              ),
              CustomDivider(
                color: ThemeColor.Colors.gemPrimaryColor,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Data and History',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                onTap: () {
                  print('Access Data');
                },
                leading: Icon(Icons.data_usage),
                title: Text('Access Data'),
              ),
              ListTile(
                onTap: () {
                  print('Clear Search History');
                },
                leading: Icon(Icons.search),
                title: Text('Clear Search History'),
              ),
            ],
          )
          ),
        );
      },
    );
  }
}
