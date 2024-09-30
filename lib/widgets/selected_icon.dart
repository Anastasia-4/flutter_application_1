import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';

class SelectedIcon extends StatelessWidget {
  final String image;
  final double size;
  final isSelected;
  SelectedIcon({
    Key? key,
    required this.size,
    required this.image, 
    this.isSelected = false,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: isSelected
      ? AppColors.blueButtonColor
      : AppColors.darkMainColor, width: Dimensions.border1*12)
        )
      ),
      padding: EdgeInsets.only(left: Dimensions.margin10Width*2.3),
      child: Image.asset(image, width: size, fit: BoxFit.contain,),
    );
  }
}