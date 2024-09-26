import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/devices_list.dart';
import 'package:flutter_application_1/home/game_page.dart';
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
      body: SafeArea(
        minimum: EdgeInsets.only(left: Dimensions.margin27Width, right: Dimensions.margin27Width, top: Dimensions.margin27Height, bottom: Dimensions.margin27Height),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Container(
                      margin: EdgeInsets.only(top: Dimensions.margin138Height, bottom: Dimensions.margin95Height),
                      child: EditedText(color: AppColors.lighterGreyText, text: "УСТРОЙСТВА", size: Dimensions.font10*3.7, fontWeight: FontWeight.w900,),
                    ),
                      Expanded(child: DevicesList()),
                    Container(
                      margin: EdgeInsets.only(top: Dimensions.margin197Height, bottom: Dimensions.margin63Height),
                      child: Container(
                      padding: EdgeInsets.only(left: Dimensions.margin10Width, right: Dimensions.margin10Width),
                        width: Dimensions.settingsBtnWidth,
                        height: Dimensions.settingsBtnHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.cornerRadius15),
                          color: AppColors.darkBgColor
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              CupertinoIcons.gear,
                              color: AppColors.greyText,
                              size: Dimensions.font10*4.2,
                            ),
                            EditedText(color: AppColors.greyText, text: "Настройки", size: Dimensions.font10*3.2, fontWeight: FontWeight.w400, ),
                          ],
                        ),
                      )
                    ),
                  ]
                ),
              ),
              Expanded(child:  GamePage())
              
            ],
          )
        )
    );
  }
}