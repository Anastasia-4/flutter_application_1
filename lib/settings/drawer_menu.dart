import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';
import 'package:flutter_application_1/widgets/selected_icon.dart';

class DrawerMenu extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String icon;
  final double size;
  final isSelected;
  const DrawerMenu({
    super.key,
    required this.onTap,
    required this.title, 
    required this.icon, 
    this.isSelected = false,
    required this.size});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: EditedText(color: isSelected
      ? AppColors.greyText
      : AppColors.whiteText, 
      text: title, 
      size: isSelected
      ? Dimensions.font10*3.3
      : Dimensions.font10*3, 
      fontWeight: isSelected
      ? FontWeight.w900
      : FontWeight.w500),
      leading: SelectedIcon(size: size, image: icon, isSelected: isSelected),    
      selected: isSelected,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      selectedColor: AppColors.greyText,
      selectedTileColor: AppColors.darkBgColor,
      contentPadding: EdgeInsets.only(left: Dimensions.border1*2),
    );
  }
}