import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: 70,
      width: 70,
      imageUrl: imageUrl.contains('https:') ? imageUrl : 'https:$imageUrl',
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) =>
          Image.asset("assets/images/no_image.png"),
    );
  }
}
