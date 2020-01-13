import 'package:flutter/material.dart';
import 'package:gem/models/trade.dart';
import 'package:gem/style/style.dart' as ThemeColor;
import 'package:gem/ui/widgets/trade/trade_grid_viewer.dart';

import 'grid_tile_text.dart';

typedef BannerTapCallback = void Function();

class GridProductItem extends StatelessWidget {
  final Trade productItem;
  GridProductItem(
      {Key key, @required this.onBannerTap, @required this.productItem})
      : assert(onBannerTap != null),
        super(key: key);

  final BannerTapCallback onBannerTap;

  void goToProductDetail(BuildContext context) {
    print('go to the image detail');
  }

  void showPhoto(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(productItem.title),
          backgroundColor: ThemeColor.Colors.gemPrimaryColor,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.contacts),
              onPressed: () {
                _showConfirmDialog(context);
              },
            )
          ],
        ),
        body: SizedBox.expand(
          child: Hero(
            tag: productItem.image,
            child: GridPhotoViewer(
              productItem: productItem,
            ),
          ),
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    final Widget image = GestureDetector(
        onTap: () {
          showPhoto(context);
        },
        child: Image(fit: BoxFit.cover, image: AssetImage(productItem.image)));

    return GridTile(
      footer: GestureDetector(
        onTap: () {
          onBannerTap();
        },
        child: GridTileBar(
          backgroundColor: Colors.black45,
          title: GridTitleText(
            isAmount: false,
            text: productItem.title,
          ),
          subtitle: GridTitleText(
            isAmount: true,
            text: productItem.price,
          ),
          trailing: Icon(Icons.contacts),
        ),
      ),
      child: image,
    );
  }

  void _showConfirmDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ThemeColor.Colors.gemPrimaryColor,
          title: Center(
              child: Text('Contact the Seller ?',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'itikaf',
                      fontWeight: FontWeight.bold))),
          content: SingleChildScrollView(
              child: Text(
                  'To get the contact you need to pay commision of 500/- shilings',
                  style: TextStyle(
                      fontFamily: 'itikaf',
                      fontSize: 25,
                      fontWeight: FontWeight.bold))),
          actions: <Widget>[
            FlatButton(
              child: Text('PAY',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'itikaf',
                      fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                'CANCEL',
                style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'itikaf',
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
