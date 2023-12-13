import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SimulatorButton extends StatelessWidget {
  final String text;
  final bool? isLoading;
  final bool? disable;
  final Function()? onPress;
  final Color? color;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final double? fontSize;

  const SimulatorButton({
    super.key,
    required this.text,
    this.onPress,
    this.isLoading = false,
    this.disable = false,
    this.color,
    this.backgroundColor,
    this.width,
    this.height,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton(
        onPressed: () {
          if (!isLoading!) {
            if (!disable!) onPress?.call();
          }
        },
        style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (disable!) return Colors.grey;
            return backgroundColor ?? HexColor('#ff9800');
          }),
        ),
        child: isLoading!
            ? AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                alignment: Alignment.center,
                height: height ?? 42,
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: color ?? Colors.white,
                    strokeWidth: 2,
                  ),
                ),
              )
            : AnimatedContainer(
                height: height ?? 42,
                duration: const Duration(milliseconds: 400),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        color: color ?? Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: fontSize ?? 16,
                        textBaseline: TextBaseline.ideographic,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
