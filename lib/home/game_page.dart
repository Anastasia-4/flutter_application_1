import 'package:flutter/material.dart';
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
          Container(
                  margin: EdgeInsets.only(bottom: Dimensions.margin37Height),
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
                        alignment: Alignment.center,
                        child: EditedText(color: AppColors.blackText, text: "Пауза", size: Dimensions.font35, fontWeight: FontWeight.w700),
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
                        alignment: Alignment.center,
                        child: EditedText(color: AppColors.blackText, text: "Стоп", size: Dimensions.font35, fontWeight: FontWeight.w700),
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
                        alignment: Alignment.center,
                        child: EditedText(color: AppColors.blackText, text: "Трансляция", size: Dimensions.font35, fontWeight: FontWeight.w700),
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
                        alignment: Alignment.center,
                        child: EditedText(color: AppColors.blackText, text: "Граница", size: Dimensions.font35, fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                  )
                ],
              ),
              ),
              Expanded(child: SingleChildScrollView(child: 
              ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index){
                return getItem(index);
              },),))
              
              
            
            ]);
  }
}

Widget getItem(int index){
  return Container(
    margin: EdgeInsets.all(10),
    height: 200,
    width: Dimensions.timeWidthContainer,  
    color: AppColors.darkMainColor,
    );
}