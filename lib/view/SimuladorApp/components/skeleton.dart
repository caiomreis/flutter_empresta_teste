import 'package:desktop/components/line_skeleton.dart';
import 'package:flutter/material.dart';

class SkeletonSimulador extends StatelessWidget {
  const SkeletonSimulador({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LineSkeleton(
          height: 60,
          width: MediaQuery.of(context).size.width,
        ),
        const SizedBox(height: 14),
        LineSkeleton(
          height: 60,
          width: MediaQuery.of(context).size.width,
        ),
        const SizedBox(height: 14),
        LineSkeleton(
          height: 60,
          width: MediaQuery.of(context).size.width,
        ),
        const SizedBox(height: 14),
        LineSkeleton(
          height: 60,
          width: MediaQuery.of(context).size.width,
        ),
        const SizedBox(height: 14),
      ],
    );
  }
}
