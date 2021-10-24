import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:git_repositories/components/loading_widget.dart';


class CustomCachedImage extends StatelessWidget {
  final String image;

  const CustomCachedImage(this.image);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        placeholder: (context, url) => LoadingWidget(),
        errorWidget: (context, url, error) => Icon(Icons.error),
        imageBuilder: (context, imageProvider) => Container(
          width: 180,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        imageUrl: image,
        fit: BoxFit.cover);
  }
}
