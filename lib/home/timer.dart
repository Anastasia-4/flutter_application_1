import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    return Container(
                  margin: EdgeInsets.only(bottom: Dimensions.margin10Height*3.7),
                  width: Dimensions.mainWidthContainer,
                  height: Dimensions.timerHeightContainer,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.cornerRadius25),
                  border: Border.all(color: Theme.of(context).colorScheme.tertiaryFixed, width: Dimensions.border1),
                  color: Theme.of(context).colorScheme.primary,
              ),
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    //таймер
                    width: Dimensions.timeWidthContainer,
                    height: Dimensions.timeHeightContainer,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),   
              
                  ),
                  Container(
                    //кнопки
                    width: Dimensions.buttonWidthContainer,
                    height: Dimensions.timeHeightContainer,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: Dimensions.margin10Width*3.2),
                          height: Dimensions.buttonHeight,
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                          color: AppColors.yellowButtonColor,
                        ),
                        alignment: Alignment.center,
                        child: EditedText(color: AppColors.blackText, text: "Пауза", size: Dimensions.font10*3.5, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: Dimensions.margin10Width*3.2),
                          height: Dimensions.buttonHeight,
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                          color: AppColors.yellowButtonColor,
                        ),
                        alignment: Alignment.center,
                        child: EditedText(color: AppColors.blackText, text: "Стоп", size: Dimensions.font10*3.5, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: Dimensions.margin10Width*3.2),
                          height: Dimensions.buttonHeight,
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                          color: AppColors.yellowButtonColor,
                        ),
                        alignment: Alignment.center,
                        child: EditedText(color: AppColors.blackText, text: "Трансляция", size: Dimensions.font10*3.5, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: Dimensions.margin10Width*3.2, right: Dimensions.margin10Width*3.2),
                          height: Dimensions.buttonHeight,
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                          color: AppColors.yellowButtonColor,
                        ),
                        alignment: Alignment.center,
                        child: EditedText(color: AppColors.blackText, text: "Граница", size: Dimensions.font10*3.5, fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                  )
                ],
              ),
              );
  }
}