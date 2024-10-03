import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_textfield.dart';
class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: Dimensions.mainWidthContainer,
                  height: Dimensions.margin10Height * 88.2,
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.margin10Height * 6),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.cornerRadius20),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.tertiaryFixed,
                          width: Dimensions.border1),
                      color: Theme.of(context).colorScheme.primary),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: Dimensions.margin10Width * 43.8,
                            height: Dimensions.margin10Height * 37.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.cornerRadius15),
                              border: Border.all(
                                  color: AppColors.darkerGreyText,
                                  width: Dimensions.border1),
                            ),
                          )
                        ],
                      ),
                      EditedTextfield(),
                    ],
                  ),
                ),
                SizedBox(height: Dimensions.margin10Height * 2.7),
                Container(
                  width: Dimensions.mainWidthContainer,
                  height: Dimensions.margin10Height * 60,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.cornerRadius20),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.tertiaryFixed,
                          width: Dimensions.border1),
                      color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String? validateName(String? value) {
    const pattern = r'^[а-яА-Я]+\ [а-яА-Я]+\ [а-яА-Я]+';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value) ? 'false' : null;
  }

  String? validateEmail(String? value) {
    const pattern = r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value) ? 'false' : null;
  }

  String? validateNumber(String? value) {
    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value) ? 'false' : null;
  }

  String? validateId(String? value) {
    const pattern = r'^[@][a-z1-9_]+$';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value) ? 'false' : null;
  }
  
}
