import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/timer.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
              Timer(),
              Expanded(
                child: SingleChildScrollView(
                  child: 
              ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index){
                return getItem(index);
              },
              ),
              )
              )           
            ]
            );
  }
}

Widget getItem(int index){
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(bottom: Dimensions.margin11Height),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Container(
      //Название раздела
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: Dimensions.margin27Width),
      margin: EdgeInsets.only(left: Dimensions.margin32Width),
      width: Dimensions.sectionNameWidth,
      height: Dimensions.sectionNameHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.cornerRadius25), topLeft: Radius.circular(Dimensions.cornerRadius25)),
        color: AppColors.darkMainColor
      ),
      
      child: EditedText(color: AppColors.greyText, text: "Раздел $index", size: Dimensions.font10*4, fontWeight: FontWeight.w700, ),
    ),
    Container(
      //Содержимое
      width: Dimensions.sectionMainWidth,
      height: Dimensions.sectionMainHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.cornerRadius15),
        border: Border.all(color: AppColors.greyText, width: Dimensions.border1),
        color: AppColors.darkMainColor
      ),
      //child: ,
    ),
    Container(
      //Больше
      margin: EdgeInsets.only(left: Dimensions.sectionMoreMargin),
      width: Dimensions.sectionMoreWidth,
      height: Dimensions.sectionNameHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(Dimensions.cornerRadius25), bottomLeft: Radius.circular(Dimensions.cornerRadius25)),
        color: AppColors.darkMainColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          EditedText(color: AppColors.greyText, text: "Развернуть", size: Dimensions.font10*3, fontWeight: FontWeight.w400, ),
          Icon(
            CupertinoIcons.chevron_down,
            color: AppColors.greyText,
            size: Dimensions.font10*4,
          )
        ],
      ),
    ),
  ],
    ),
  );
}