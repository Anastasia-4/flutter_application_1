import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';

class EditedTab extends StatelessWidget {
  const EditedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.margin10Height * 10.5,
      width: Dimensions.margin10Width * 32.4,
      decoration: BoxDecoration(
          border: Border.symmetric(
              vertical: BorderSide(color: AppColors.greyText))),
      child: EditedText(
          color: AppColors.whiteText,
          text: 'Устройство',
          size: Dimensions.font10 * 3.5,
          fontWeight: FontWeight.w700),
    );
  }
}
