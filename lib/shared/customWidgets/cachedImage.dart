
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:io' show Platform;

class CustomCachedImage extends StatelessWidget {

  final String imageURL;
  final double imageHeight;

  CustomCachedImage({ @required this.imageURL, @required this.imageHeight });

  @override
  Widget build(BuildContext context) {
    return new CachedNetworkImage(
      imageUrl: imageURL,
      height: imageHeight,
      fit: BoxFit.fitWidth,
      placeholder: (context, url) => 
      Platform.isAndroid ? CircularProgressIndicator() : CupertinoActivityIndicator(),
      errorWidget: (context, url, error) => new Icon(Icons.error)
    );
  }
}