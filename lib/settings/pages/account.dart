import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';
import 'package:flutter_application_1/widgets/edited_textfield.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

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
                  height: Dimensions.margin10Height*83,
                  padding: EdgeInsets.symmetric(vertical: Dimensions.margin10Height*6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                      border: Border.all(color: Theme.of(context).colorScheme.tertiaryFixed, width: Dimensions.border1),
                      color: Theme.of(context).colorScheme.primary
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: Dimensions.margin10Width*43.8,
                                height: Dimensions.margin10Height*37.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.cornerRadius15),
                                  border: Border.all(color: AppColors.darkerGreyText, width: Dimensions.border1),
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              EditedTextfield(validator: validateName, text: 'ФИО', textType: TextInputType.name),
                              EditedTextfield(validator: validateEmail, text: 'Email', textType: TextInputType.emailAddress),
                              EditedTextfield(validator: validateNumber, text: 'Телефон', textType: TextInputType.number),
                              EditedTextfield(validator: validateId, text: 'Telegram id', textType: TextInputType.emailAddress),
                              
                            ],
                          )
                        ],
                      ),
                ),
                SizedBox(height: Dimensions.margin10Height*2.7),
                Container(
                  width: Dimensions.mainWidthContainer,
                  height: Dimensions.margin10Height*64,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                      border: Border.all(color: Theme.of(context).colorScheme.tertiaryFixed, width: Dimensions.border1),
                      color: Theme.of(context).colorScheme.primary
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

    String? validateName(String? value) {
  const pattern = r'^[а-я А-Я]+$';
  final regex = RegExp(pattern);

  return value!.isNotEmpty && !regex.hasMatch(value)
      ? 'Введите имя'
      : null;
}
    String? validateEmail(String? value) {
  const pattern = r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$';
  final regex = RegExp(pattern);

  return value!.isNotEmpty && !regex.hasMatch(value)
      ? 'Введите email'
      : null;
}

    String? validateNumber(String? value) {
  const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
  final regex = RegExp(pattern);

  return value!.isNotEmpty && !regex.hasMatch(value)
      ? 'Введите номер телефона'
      : null;
}

String? validateId(String? value) {
  const pattern = r'^[@][a-z1-9_]+$';
  final regex = RegExp(pattern);

  return value!.isNotEmpty && !regex.hasMatch(value)
      ? 'Введите id'
      : null;
}
}
