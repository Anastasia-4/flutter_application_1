import 'package:flutter/material.dart';

class EditedText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  EditedText({
    Key? key,
    required this.color,
    required this.text,
    required this.size,
    required this.fontWeight,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontFamily: 'Roboto',
        fontSize: size,
      ),
    );
  }
}