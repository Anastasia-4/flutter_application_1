import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';

class Pay extends StatefulWidget {
  const Pay({super.key});

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            width: Dimensions.mainWidthContainer,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                border: Border.all(color: Theme.of(context).colorScheme.tertiaryFixed, width: Dimensions.border1, strokeAlign: BorderSide.strokeAlignOutside),
                color: Theme.of(context).colorScheme.primary),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Dimensions.margin10Height*9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: Dimensions.margin10Width * 85,
                        height: Dimensions.margin10Height * 98.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                            border: Border.all(color: AppColors.greyText, width: Dimensions.border1),
                            color: Theme.of(context).colorScheme.primaryContainer),
                            child: Column(
                              children: [
                                EditedText(color: AppColors.greyText, text: 'Home', size: 20, fontWeight: FontWeight.w700)
                              ],
                            ),
                      ),
                      Container(
                        width: Dimensions.margin10Width * 85,
                        height: Dimensions.margin10Height * 98.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                            border: Border.all(color: AppColors.greyText, width: Dimensions.border1),
                            color: Theme.of(context).colorScheme.primaryContainer),
                      )
                    ],
                  ),
                  SizedBox(height: Dimensions.margin10Height*9),
                  Container(
                        width: Dimensions.margin10Width * 162.1,
                        height: Dimensions.margin10Height * 98.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                            border: Border.all(color: AppColors.greyText, width: Dimensions.border1),
                            color: Theme.of(context).colorScheme.primaryContainer),
                      ),
                  SizedBox(height: Dimensions.margin10Height*9),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
