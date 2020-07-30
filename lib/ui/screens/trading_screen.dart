import 'package:flutter/material.dart';
import 'package:gem/scoped-model/main.dart';
import 'package:gem/ui/widgets/tiles/no_items.dart';
import 'package:gem/ui/widgets/trade/trade_grid.dart';

class TradingScreen extends StatefulWidget {
  final MainModel model;
  const TradingScreen({Key key, @required this.model}) : super(key: key);

  @override
  _TradingScreenState createState() => _TradingScreenState();
}

class _TradingScreenState extends State<TradingScreen> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return widget.model.getTrades().isEmpty
        ? Center(
          child: NoItemTile(
              icon: 'assets/icons/shopping-bag.png',
              subtitle: 'No Items to trade',
              title: 'Trade',
            ),
        )
        : GridView.builder(
            padding: EdgeInsets.all(5),
            itemCount: widget.model.getTrades().length,
            itemBuilder: (BuildContext context, int index) {
              return GridProductItem(
                productItem: widget.model.getTrades()[index],
                onBannerTap: () {},
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
                childAspectRatio:
                    (orientation == Orientation.portrait) ? 1.0 : 1.3),
          );
  }
}
