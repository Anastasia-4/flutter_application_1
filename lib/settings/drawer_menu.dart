import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';
import 'package:flutter_application_1/widgets/selected_icon.dart';

class DrawerMenu extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String selectedTitle;
  final String icon;
  final double size;
  final isSelected;
  const DrawerMenu({
    super.key,
    required this.onTap,
    required this.title, 
    required this.icon, 
    this.isSelected = false,
    required this.size,
    required this.selectedTitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: Dimensions.margin10Height*13.4,
      onTap: onTap,
      title: EditedText(color: isSelected
      ? Theme.of(context).colorScheme.tertiary
      : Theme.of(context).colorScheme.tertiaryContainer, 
      text: isSelected
      ? selectedTitle
      : title, 
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
      selectedTileColor: Theme.of(context).colorScheme.primaryFixedDim,
      contentPadding: EdgeInsets.only(left: Dimensions.border1*2),
      shape: Border(left: BorderSide(color: isSelected
      ? AppColors.blueButtonColor
      : Theme.of(context).colorScheme.primary, width: Dimensions.border1*12,)),
    );
  }
}