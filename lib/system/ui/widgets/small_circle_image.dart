import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'circular_loading.dart';

class SmallCircleImage extends StatelessWidget {
  final String imageUrl;

  SmallCircleImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl == '') {
      return Container();
    }

    return CachedNetworkImage(
      memCacheHeight: 200,
      memCacheWidth: 200,
      imageBuilder: (context, imageProvider) => Container(
        margin: EdgeInsets.only(right: 15),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
        ),
      ),
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) => Container(
          margin: EdgeInsets.only(right: 15),
          child: CircularLoading(value: downloadProgress.progress, color: Colors.grey)),
      errorWidget: (context, url, error) => Container(),
    );
  }
}