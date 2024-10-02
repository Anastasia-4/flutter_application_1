import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/timer.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';
import 'package:flutter_application_1/theme/theme_provider.dart';
import 'package:provider/provider.dart';


class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
        children: [
              Container(
                alignment: Alignment.centerRight,
                child: Timer()),
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

Widget getItem(int index){
  return Container(
    alignment: Alignment.centerRight,
    margin: EdgeInsets.only(bottom: Dimensions.margin10Height*1.1),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Container(
      //Название раздела
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: Dimensions.margin10Width*2.7),
      margin: EdgeInsets.only(left: Dimensions.margin10Width*3.2),
      width: Dimensions.sectionNameWidth,
      height: Dimensions.sectionNameHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.cornerRadius25), topLeft: Radius.circular(Dimensions.cornerRadius25)),
        color: Theme.of(context).colorScheme.primaryFixed
      ),
      
      child: EditedText(color: Theme.of(context).colorScheme.tertiary, text: "Раздел $index", size: Dimensions.font10*4, fontWeight: FontWeight.w700, ),
    ),
    Container(
      //Содержимое
      width: Dimensions.sectionMainWidth,
      height: Dimensions.sectionMainHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.cornerRadius15),
        border: Border.all(color: AppColors.greyText, width: Dimensions.border1),
        color: Theme.of(context).colorScheme.primary
      ),
      //child: Games(),
    ),
    Container(
      //Больше
      margin: EdgeInsets.only(left: Dimensions.sectionMoreMargin),
      width: Dimensions.sectionMoreWidth,
      height: Dimensions.sectionNameHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(Dimensions.cornerRadius25), bottomLeft: Radius.circular(Dimensions.cornerRadius25)),
        color: Theme.of(context).colorScheme.primary
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          EditedText(color: Theme.of(context).colorScheme.tertiary, text: "Развернуть", size: Dimensions.font10*3, fontWeight: FontWeight.w400, ),
          Icon(
            CupertinoIcons.chevron_down,
            color: Theme.of(context).colorScheme.tertiary,
            size: Dimensions.font10*4,
          )
        ],
      ),
    ),
  ],
    ),
  );
}
}
