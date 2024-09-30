import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/devices_list.dart';
import 'package:flutter_application_1/home/game_page.dart';
import 'package:flutter_application_1/settings/settings_main.dart';
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
        minimum: EdgeInsets.only(left: Dimensions.margin10Width*2.7, right: Dimensions.margin10Width*2.7, top: Dimensions.margin10Height*2.7, bottom: Dimensions.margin10Height*2.7),
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
                      margin: EdgeInsets.only(top: Dimensions.margin10Height*13.8, bottom: Dimensions.margin10Height*9.5),
                      child: EditedText(color: AppColors.greyText, text: "УСТРОЙСТВА", size: Dimensions.font10*3.7, fontWeight: FontWeight.w900,),
                    ),
                      Expanded(child: DevicesList()),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(top: Dimensions.margin10Height*19.7, bottom: Dimensions.margin10Height*6.3),
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
                      onTap: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SettingsMain()),
                      );
                      }
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