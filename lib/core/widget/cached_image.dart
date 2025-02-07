import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:headspace_test/core/widget/shimmer.dart';

enum ImageType { svg, png }

class SpaceCacheImage extends StatelessWidget {
  final String imgUrl;
  final double? height;
  final double? width;
  final BoxFit boxFit;
  final double borderRadius;
  final bool showPlaceholder;
  final Widget? errorWidget;
  final int? memCacheHeight;
  final int? memCacheWidth;
  final bool? defaultImage;

  const SpaceCacheImage(
      {Key? key,
      this.height,
      this.width,
      required this.imgUrl,
      this.borderRadius = 0,
      this.boxFit = BoxFit.cover,
      this.showPlaceholder = false,
      this.errorWidget,
      this.memCacheHeight = 400,
      this.memCacheWidth = 400,
      this.defaultImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: getImageType(imgUrl) == ImageType.svg
            ? svgImageViewer()
            : CachedNetworkImage(
                imageUrl: imgUrl,
                height: height,
                width: width,
                fit: boxFit,
                memCacheHeight: memCacheHeight,
                memCacheWidth: memCacheWidth,
                placeholder: (context, url) => ShimmerWidget.rectangle(
                      height: height,
                      width: width,
                    ),
                errorWidget: (context, url, error) {
                  if (defaultImage == true) {
                    return CachedNetworkImage(
                      height: height,
                      width: width,
                      imageUrl:
                          'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y',
                    );
                  }

                  return Icon(
                    Icons.error,
                  );
                }));
  }

  Widget svgImageViewer() {
    return SvgPicture.network(
      imgUrl,
      height: height,
      width: width,
      fit: boxFit,
    );
  }

  ImageType getImageType(String url) {
    var path = url.split(".");
    String ext = path[path.length - 1];
    if (ext == "svg") return ImageType.svg;
    return ImageType.png;
  }
}
