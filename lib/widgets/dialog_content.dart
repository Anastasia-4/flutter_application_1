import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DialogContent extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController numController;
  DialogContent({super.key, required this.nameController, required this.numController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.margin10Width * 125,
      height: Dimensions.margin10Height * 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: Container(
                  width: Dimensions.margin10Width * 9.2,
                  height: Dimensions.margin10Height * 6.5,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.cornerRadius15),
                      color: AppColors.blueButtonColor),
                  child: Icon(Icons.close,
                      color: AppColors.whiteText, size: Dimensions.font10 * 4),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Feedback.forTap(context);
                } 
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EditedText(
                  color: Theme.of(context).colorScheme.tertiary,
                  text: "Название устройства",
                  size: Dimensions.font10 * 3.5,
                  fontWeight: FontWeight.w700),
              Container(
                width: Dimensions.margin10Width * 131.6,
                height: Dimensions.margin10Height * 10.8,
                child: TextFormField(
                  controller: nameController,
                  autofocus: true,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                      fontSize: Dimensions.font10 * 3.5,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.primaryContainer,
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.cornerRadius15),
                        borderSide: BorderSide(
                            color: AppColors.darkerGreyText,
                            width: Dimensions.border1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.cornerRadius15),
                        borderSide: BorderSide(
                            color: AppColors.darkerGreyText,
                            width: Dimensions.border1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.cornerRadius15),
                        borderSide: BorderSide(
                            color: AppColors.darkerGreyText,
                            width: Dimensions.border1)),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EditedText(
                  color: Theme.of(context).colorScheme.tertiary,
                  text: "Ip устройства",
                  size: Dimensions.font10 * 3.5,
                  fontWeight: FontWeight.w700),
              Container(
                width: Dimensions.margin10Width * 131.6,
                height: Dimensions.margin10Height * 10.8,
                child: TextFormField(
                  controller: numController,
                  inputFormatters: [ipFormatter],
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                      fontSize: Dimensions.font10 * 3.5,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.primaryContainer,
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.cornerRadius15),
                        borderSide: BorderSide(
                            color: AppColors.darkerGreyText,
                            width: Dimensions.border1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.cornerRadius15),
                        borderSide: BorderSide(
                            color: AppColors.darkerGreyText,
                            width: Dimensions.border1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.cornerRadius15),
                        borderSide: BorderSide(
                            color: AppColors.darkerGreyText,
                            width: Dimensions.border1)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

    var ipFormatter = new MaskTextInputFormatter(
      mask: '###.###.###.###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
}