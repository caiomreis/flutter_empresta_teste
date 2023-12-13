import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class InputBase extends StatefulWidget {
  final TextEditingController textController;
  final TextInputType keyboardType;
  final String placeholder;
  final Function(String? value) onChange;
  final Function(String? value) onSubmit;
  final VoidCallback? onTap;
  final bool obscureText;
  final bool autoCorrect;
  final bool enableSuggestions;
  final bool autoFocus;
  final List<TextInputFormatter>? inputFormater;

  final double? fontSize;
  final TextStyle? textStyle;
  final bool? readOnly;
  final FocusNode? focusNode;

  const InputBase({
    super.key,
    required this.textController,
    required this.keyboardType,
    required this.placeholder,
    required this.onChange,
    this.inputFormater,
    required this.onSubmit,
    this.onTap,
    this.obscureText = false,
    this.autoCorrect = true,
    this.enableSuggestions = true,
    this.autoFocus = false,
    this.fontSize,
    this.textStyle,
    this.readOnly = false,
    this.focusNode,
  });

  @override
  State<InputBase> createState() => _InputBase();
}

class _InputBase extends State<InputBase> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: TextFormField(
          focusNode: widget.focusNode,
          onTap: () => widget.onTap?.call(),
          controller: widget.textController,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          autofocus: widget.autoFocus,
          enableSuggestions: widget.enableSuggestions,
          autocorrect: widget.autoCorrect,
          cursorHeight: 20,
          readOnly: widget.readOnly ?? false,
          inputFormatters: widget.inputFormater,
          decoration: InputDecoration(
            floatingLabelStyle: TextStyle(color: HexColor('#ff9800')),
            labelText: widget.placeholder,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: HexColor('#ff9800'),
              ),
            ),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: HexColor('#323130'),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            fillColor: const Color(0xFFFFFFFF),
            hintText: widget.placeholder,
            counterStyle: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
            hintStyle: TextStyle(
              fontSize: widget.fontSize ?? 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          style: TextStyle(
            fontSize: widget.fontSize ?? 16,
            fontWeight: FontWeight.w400,
          ),
          onChanged: (value) {
            widget.onChange(value);
          },
          onFieldSubmitted: (value) => widget.onSubmit(value),
        ),
      ),
    );
  }
}
