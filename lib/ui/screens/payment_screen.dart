// import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'package:gem/scoped-model/main.dart';
// import 'package:gem/style/style.dart' as ThemeColor;
// import 'package:gem/util/util.dart';
// import 'package:scoped_model/scoped_model.dart';

// import 'job_application_screen.dart';

// class PaymentPage extends StatelessWidget {
//   final PaymentSender sender;

//   const PaymentPage({Key key, @required this.sender}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return ScopedModelDescendant(
//       builder: (BuildContext context, Widget child, MainModel model) {
//         return WebviewScaffold(
//           url: 'https://www.artivation.co.tz/pesapal/initial.php',
//           appBar: AppBar(
//             backgroundColor: ThemeColor.Colors.gemPrimaryColor,
//             title: Text('Make Payment'),
//             actions: <Widget>[
//               sender == PaymentSender.values[0]
//                   ? IconButton(
//                       icon: Icon(Icons.people),
//                       onPressed: () {
//                         model.setFriendshipPayed(status: true);
//                         Navigator.of(context).pop();
//                       },
//                     )
//                   : Container(),
//               sender == PaymentSender.values[1]
//                   ? IconButton(
//                       icon: Icon(Icons.shopping_cart),
//                       onPressed: () {},
//                     )
//                   : Container(),
//               sender == PaymentSender.values[2]
//                   ? IconButton(
//                       icon: Icon(Icons.access_time),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => JobApplicationScreen()));
//                       },
//                     )
//                   : Container(),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
