import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/settings/sharedPreferencesHelper.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/utils/global_variables.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';

class GameDialogContent extends StatefulWidget {
  final String gameName;
  GameDialogContent({super.key, required this.gameName});

  @override
  State<GameDialogContent> createState() => _GameDialogContentState();
}

class _GameDialogContentState extends State<GameDialogContent> {
  bool Check15 = false;
  bool Check30 = true;
  bool Check45 = true;
  bool Check60 = true;
  bool LaunchDemo = false;

  @override
  void initState() {
    super.initState();
    Check15 = SharedPreferencesHelper.getBool("Check15") ?? false;
    Check30 = SharedPreferencesHelper.getBool("Check30") ?? true;
    Check45 = SharedPreferencesHelper.getBool("Check45") ?? true;
    Check60 = SharedPreferencesHelper.getBool("Check60") ?? true;
    LaunchDemo =  SharedPreferencesHelper.getBool("Demo") ?? false;
  }


  @override
  Widget build(BuildContext context) {
    return 
    Container(
      width: Dimensions.margin10Width * 100,
      height: Dimensions.margin10Height * 90,
      padding: EdgeInsets.symmetric(vertical: Dimensions.margin10Height*7, horizontal: Dimensions.margin10Width*6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Dimensions.margin10Width * 9.2,
                height: Dimensions.margin10Height * 6.5,
              ),
              Center(child: EditedText(color: Theme.of(context).colorScheme.tertiaryContainer, text: widget.gameName, size: Dimensions.font10*5, fontWeight: FontWeight.w700)),
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
              EditedText(color: Theme.of(context).colorScheme.tertiary, text: 'Таймер игры:', size: Dimensions.font10*4, fontWeight: FontWeight.w700),
              SizedBox(height: Dimensions.margin10Height*4),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (Check15) GestureDetector(
                child: Container(
                    alignment: Alignment.center,
                  margin: EdgeInsets.only(right: Dimensions.margin10Width*5),
                  width: Dimensions.margin10Width * 18,
                  height: Dimensions.margin10Height * 10,
                  decoration: BoxDecoration(
                    color: AppColors.yellowButtonColor,
                    borderRadius: BorderRadius.circular(Dimensions.cornerRadius25),
                  border: (GlobalVariables.selectedTimer == 15) ? Border.all(color: AppColors.blueButtonColor, width: Dimensions.border1*7) : null
                  ),
                  child: EditedText(color: AppColors.whiteText, text: '15', size: Dimensions.font10*4, fontWeight: FontWeight.w700),
                  ),
                  onTap: () {
                    setState(() {
                      GlobalVariables.changeTimer(15);
                    });
                  },
              ),
              if (Check30) GestureDetector(
                child: Container(
                    alignment: Alignment.center,
                  margin: EdgeInsets.only(right: Dimensions.margin10Width*5),
                  width: Dimensions.margin10Width * 18,
                  height: Dimensions.margin10Height * 10,
                  decoration: BoxDecoration(
                    color: AppColors.yellowButtonColor,
                    borderRadius: BorderRadius.circular(Dimensions.cornerRadius25),
                  border: (GlobalVariables.selectedTimer == 30) ? Border.all(color: AppColors.blueButtonColor, width: Dimensions.border1*7) : null
                  ),
                  child: EditedText(color: AppColors.whiteText, text: '30', size: Dimensions.font10*4, fontWeight: FontWeight.w700),
                  ),
                  onTap: () {
                    setState(() {
                      GlobalVariables.changeTimer(30);
                    });
                  },
              ),
                if (Check45) GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                  margin: EdgeInsets.only(right: Dimensions.margin10Width*5),
                  width: Dimensions.margin10Width * 18,
                  height: Dimensions.margin10Height * 10,
                  decoration: BoxDecoration(
                    color: AppColors.yellowButtonColor,
                    borderRadius: BorderRadius.circular(Dimensions.cornerRadius25),
                    border: (GlobalVariables.selectedTimer == 45) ? Border.all(color: AppColors.blueButtonColor, width: Dimensions.border1*7) : null
                  ),
                  child: EditedText(color: AppColors.whiteText, text: '45', size: Dimensions.font10*4, fontWeight: FontWeight.w700),
                  ),
                  onTap: () {
                    setState(() {
                      GlobalVariables.changeTimer(45);
                    });
                  },
                ),
                if (Check60) GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                  width: Dimensions.margin10Width * 18,
                  height: Dimensions.margin10Height * 10,
                  decoration: BoxDecoration(
                    color: AppColors.yellowButtonColor,
                    borderRadius: BorderRadius.circular(Dimensions.cornerRadius25),
                    border: (GlobalVariables.selectedTimer == 60) ? Border.all(color: AppColors.blueButtonColor, width: Dimensions.border1*7) : null
                  ),
                  child: EditedText(color: AppColors.whiteText, text: '60', size: Dimensions.font10*4, fontWeight: FontWeight.w700),
                  ),
                  onTap: () {
                    setState(() {
                      GlobalVariables.changeTimer(60);
                    });
                  },
                ),
                ],
                ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EditedText(color: Theme.of(context).colorScheme.tertiary, text: 'Демо игра:', size: Dimensions.font10*4, fontWeight: FontWeight.w700),
              SizedBox(height: Dimensions.margin10Height*4),
              Row(
                children: [
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: Dimensions.margin10Width*5),
                      width: Dimensions.margin10Width * 18,
                      height: Dimensions.margin10Height * 10,
                      decoration: BoxDecoration(
                        color: LaunchDemo ? AppColors.yellowButtonColor : AppColors.darkBgColor,
                        borderRadius: BorderRadius.circular(Dimensions.cornerRadius25)
                      ),
                      child: EditedText(color: LaunchDemo ? AppColors.whiteText : AppColors.greyText, text: 'Да', size: Dimensions.font10*4, fontWeight: FontWeight.w700),
                    ),
                    onTap: () {
                      setState(() {
                      LaunchDemo = true;
                      });
                    },
                  ),
                GestureDetector(
                  child: Container(
                      alignment: Alignment.center,
                      width: Dimensions.margin10Width * 18,
                      height: Dimensions.margin10Height * 10,
                      decoration: BoxDecoration(
                        color: LaunchDemo ? AppColors.darkBgColor : AppColors.yellowButtonColor,
                        borderRadius: BorderRadius.circular(Dimensions.cornerRadius25)
                      ),
                      child: EditedText(color: LaunchDemo ? AppColors.greyText : AppColors.whiteText, text: 'Нет', size: Dimensions.font10*4, fontWeight: FontWeight.w700),
                  ),
                  onTap: () {
                    setState(() {
                      LaunchDemo = false;
                    });
                  },
                ),
              ],),
            ],
          ),
          SizedBox(),
        ],
      ),
    );
  }
}