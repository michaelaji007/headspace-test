import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';




class ShimmerWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final double? borderRadius;
  final BoxDecoration decoration;

  const ShimmerWidget.rectangle(
      {super.key, this.width = double.infinity, this.height, this.borderRadius = 0})
      : decoration = const BoxDecoration(shape: BoxShape.rectangle);

  const ShimmerWidget.circle(
      {super.key, this.width = double.infinity, this.height, this.borderRadius = 0})
      : decoration = const BoxDecoration(shape: BoxShape.circle);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xffEEEFF2),
      highlightColor: const Color(0xffEEEFF2).withOpacity(0.4),
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius!),
            color: Colors.grey[400],
          )

          ),
    );
  }
}




class ShimmerTextWidget extends StatelessWidget {
  final String text;
  final TextStyle style;

  const ShimmerTextWidget({super.key,

    this.text = '#.##',
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: style.color ?? Colors.grey,
        highlightColor: const Color(0xffEEEFF2).withOpacity(0.4),
        child: Text(text, maxLines: 1, style: style));
  }
}
