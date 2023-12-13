import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ImageComponent extends StatelessWidget {
  final String? image;
  final double heigth;
  final double width;
  final double? radius;

  const ImageComponent({
    super.key,
    this.image,
    required this.heigth,
    required this.width,
    this.radius,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? width),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? width),
        child: Image.asset(
          image!,
          height: heigth,
          width: width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
