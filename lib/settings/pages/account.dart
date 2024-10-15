import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';
import 'package:flutter_application_1/widgets/edited_textfield.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool notEdited = true;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: Dimensions.mainWidthContainer,
            height: Dimensions.margin10Height * 88,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: Dimensions.margin10Height / 2),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.margin10Width * 5,
                          vertical: Dimensions.margin10Height * 2),
                      width: Dimensions.margin10Width * 43.8,
                      height: Dimensions.margin10Height * 37.8,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primaryContainer,
                        borderRadius: BorderRadius.circular(
                            Dimensions.cornerRadius15),
                        border: Border.all(
                            color: AppColors.darkerGreyText,
                            width: Dimensions.border1),
                      ),
                      child: Image.asset('assets/image/avatar.png',
                          fit: BoxFit.cover,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    SizedBox(height: Dimensions.margin10Height / 10),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: Dimensions.margin10Width * 33.2,
                        height: Dimensions.settingsBtnHeight,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Dimensions.cornerRadius20),
                            color: AppColors.yellowButtonColor),
                        child: EditedText(
                            color: AppColors.blackText,
                            text: 'Редактировать',
                            size: Dimensions.font10 * 3,
                            fontWeight: FontWeight.w500),
                      ),
                      onTap: () => setState(() {
                        Feedback.forTap(context);
                        notEdited = false;
                      }),
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: Dimensions.margin10Width * 33.2,
                        height: Dimensions.settingsBtnHeight,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Dimensions.cornerRadius20),
                            color: AppColors.yellowButtonColor),
                        child: EditedText(
                            color: AppColors.blackText,
                            text: 'Сохранить',
                            size: Dimensions.font10 * 3,
                            fontWeight: FontWeight.w500),
                      ),
                      onTap: () => setState(() {
                        Feedback.forTap(context);
                        notEdited = true;
                      }),
                    )
                  ],
                ),
                EditedTextfield(notEdited: notEdited),
              ],
            ),
          ),
          SizedBox(height: Dimensions.margin10Height*2.7),
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
        )
      ],
    );
  }
}
