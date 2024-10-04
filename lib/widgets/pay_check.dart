import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';

class PayCheck extends StatefulWidget {
  dynamic isChecked;
  PayCheck({
    super.key,this.isChecked = false});

  @override
  State<PayCheck> createState() => _EditedCheckState();
}

class _EditedCheckState extends State<PayCheck> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.margin10Height*1.5, right: Dimensions.margin10Width*3),
      child: Row(
       children: [
        Container(
          width: Dimensions.margin10Width*3.5,
          height: Dimensions.margin10Width*3.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.cornerRadius15/3),
            border: Border.all(color: AppColors.greyText),
            color: AppColors.whiteButtonColor
          ),
        child: Icon(
          Icons.lens,
          size: Dimensions.margin10Height*2,
          color: widget.isChecked
          ? AppColors.purpleButtonColor
          : Colors.transparent,
        ),
            ),
       ],
      ),
    );
  }
}
