import 'package:flutter/material.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:scoped_model/scoped_model.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Help'),
          ),
          body: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                onTap: () {
                  print('Password');
                },
                leading: Icon(Icons.help_outline),
                title: Text('Report a Problem'),
              ),
              ListTile(
                onTap: () {
                  print('Help Center');
                },
                leading: Icon(Icons.help),
                title: Text('Help Center'),
              ),
              ListTile(
                onTap: () {
                  print('Access Data');
                },
                leading: Icon(Icons.data_usage),
                title: Text('Privacy and Security Help'),
              ),
            ],
          )
          ),
        );
      },
    );
  }
}
