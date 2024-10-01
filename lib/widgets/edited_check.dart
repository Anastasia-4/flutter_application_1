import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';

class EditedCheck extends StatefulWidget {
  final String text;
  dynamic isChecked;
  EditedCheck({
    super.key,
  required this.text, this.isChecked = false});

  @override
  State<EditedCheck> createState() => _EditedCheckState();
}

class _EditedCheckState extends State<EditedCheck> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: Dimensions.margin10Width*6.5),
      child: Row(
       children: [
        Container(
          width: Dimensions.margin10Width*6,
          height: Dimensions.margin10Width*6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.cornerRadius15/3),
            border: Border.all(color: AppColors.greyText),
            color: AppColors.whiteButtonColor
          ),
        child: Icon(
          Icons.lens,
          size: Dimensions.margin10Height*3.5,
          color: widget.isChecked
          ? AppColors.yellowButtonColor
          : Colors.transparent,
        ),
            ),
          SizedBox(width: Dimensions.margin10Width*2),
          EditedText(color: AppColors.greyText, text: widget.text, size: Dimensions.font10*5, fontWeight: FontWeight.w900)
       ],
      ),
    );
  }
}
