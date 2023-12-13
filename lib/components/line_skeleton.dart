import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LineSkeleton extends StatelessWidget {
  final double width;
  final double height;

  const LineSkeleton({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFEBEBEB),
      highlightColor: const Color(0xFF80848F),
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
        ),
      ),
    );
  }
}
