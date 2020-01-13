import 'package:flutter/material.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:scoped_model/scoped_model.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            title: Text('About'),
          ),
          body: SingleChildScrollView(
            child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                onTap: () {
                  print('Password');
                },
                leading: Icon(Icons.loyalty),
                title: Text('Data Policy'),
              ),
              ListTile(
                onTap: () {
                  print('Terms of Use');
                },
                leading: Icon(Icons.library_books),
                title: Text('Terms of Use'),
              ),
              ListTile(
                onTap: () {
                  print('Access Data');
                },
                leading: Icon(Icons.stars),
                title: Text('License'),
              ),
            ],
          )
          ),
        );
      },
    );
  }
}