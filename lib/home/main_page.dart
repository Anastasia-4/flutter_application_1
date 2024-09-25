import 'package:flutter/material.dart';
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
                      margin: EdgeInsets.only(top: Dimensions.margin138Height),
                      child: EditedText(color: AppColors.lighterGreyText, text: "УСТРОЙСТВА", size: Dimensions.font37, fontWeight: FontWeight.w900,),
                    )
                  //Добавляются через __ новые устройства
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