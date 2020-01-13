import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'package:gem/style/style.dart' as ThemeColor;

class JobApplicationScreen extends StatelessWidget {
  //final Job job;

  const JobApplicationScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://qlicue.co.tz',
      appBar: AppBar(
        backgroundColor: ThemeColor.Colors.gemPrimaryColor,
        title: Text('Apply for' + 'job'),
      ),
    );
  }
}
