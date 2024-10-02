import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';

class EditedTextfield extends StatelessWidget {
  FormFieldValidator<String>? validator;
  TextInputType? textType;
  final String text;
  EditedTextfield({super.key, required this.validator, required this.textType, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EditedText(
            color: AppColors.greyText,
            text: text,
            size: Dimensions.font10 * 3.5,
            fontWeight: FontWeight.w700),
        Container(
          width: Dimensions.margin10Width * 131.6,
          height: Dimensions.margin10Height * 10.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.cornerRadius15),
            border: Border.all(
                color: AppColors.darkerGreyText, width: Dimensions.border1),
          ),
          child: Form(
            autovalidateMode: AutovalidateMode.onUnfocus,
            child: TextFormField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(55),
              ],
              keyboardType: textType,
              validator: validator,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.darkBgColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
