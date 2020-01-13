

import 'package:flutter/material.dart';

class Trade {
  final int id;
  final String title;
  final String price;
  final String contact;
  final String image;

  Trade({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.contact,
    @required this.image,
  });
}
