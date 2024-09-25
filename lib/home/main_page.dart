import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          //устройства
          width: Dimensions.devicesWidthContainer,
          height: Dimensions.devicesHeightContainer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
            color: AppColors.darkMainColor,
          ),
          child: Column(
            children: [
            EditedText(color: AppColors.lighterGreyText, text: "УСТРОЙСТВА", size: Dimensions.font37, fontWeight: FontWeight.w900)
            //Добавляются через новые устройства
            ]
          ),
        ),
        Column(
          children: [
            //таймер(вся строка)
            Container(
              width: Dimensions.mainWidthContainer,
              height: Dimensions.timerHeightContainer,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.cornerRadius25),
              color: AppColors.darkMainColor,
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
                color: AppColors.darkBgColor,
              ),   
              ),
              Container(
                //кнопки
                width: Dimensions.buttonWidthContainer,
                height: Dimensions.timeHeightContainer,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                color: AppColors.darkBgColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: Dimensions.margin32Width),
                      height: Dimensions.buttonHeight,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                      color: AppColors.yellowButtonColor,
                    ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: Dimensions.margin32Width),
                      height: Dimensions.buttonHeight,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                      color: AppColors.yellowButtonColor,
                    ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: Dimensions.margin32Width, right: Dimensions.margin32Width),
                      height: Dimensions.buttonHeight,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                      color: AppColors.yellowButtonColor,
                    ),
                    ),
                  )
                ],
              ),
              )
            ],
          ),
            )

            //игры
          ],
        )
      ],
    )
    );
  }
}