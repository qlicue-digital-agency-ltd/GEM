import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageHolder extends StatelessWidget {
  final String image;

  const ImageHolder({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: CircularProgressIndicator()),
        Center(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: image,
          ),
        ),
      ],
    );
  }
}
