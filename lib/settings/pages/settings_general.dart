import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_check.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class SettingsGeneral extends StatefulWidget {
  const SettingsGeneral({super.key});

  @override
  State<SettingsGeneral> createState() => _SettingsGeneralState();
}

class _SettingsGeneralState extends State<SettingsGeneral> {
  bool Check15 = false;
  bool Check30 = true;
  bool Check45 = true;
  bool Check60 = true;
  bool LaunchDemo = false;
  bool ShowGames = false;
  bool Theme = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            width: Dimensions.mainWidthContainer,
            padding: EdgeInsets.symmetric(horizontal: Dimensions.margin10Width*8.4),
            decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                  color: AppColors.darkMainColor
                  ),
            child: Column(
              children: [
                SizedBox(height: Dimensions.margin10Height*13.5),
                EditedText(color: AppColors.greyText, text: 'Общие настройки', size: Dimensions.font10*4.5, fontWeight: FontWeight.w700),
                SizedBox(height: Dimensions.margin10Height*10),
                Container(
                  height: Dimensions.margin10Height*20,
                  decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: AppColors.greyText, width: Dimensions.border1))
                      ),
                  child: Row(
                    mainAxisAlignment:  MainAxisAlignment.start,
                    children: [
                      Container(
                        width: Dimensions.sectionTimeMargin,
                        child: EditedText(color: AppColors.whiteText, text: 'Таймер по умолчанию:', size: Dimensions.font10*3.5, fontWeight: FontWeight.w700),
                      ),
                      Container(
                        child: Row(
                          children: [
                            GestureDetector(child: EditedCheck(text: '15', isChecked: Check15),onTap: () {
                              setState(
                                () => Check15 = !Check15,
                              );
                            },),
                            GestureDetector(child: EditedCheck(text: '30', isChecked: Check30),onTap: () {
                              setState(
                                () => Check30 = !Check30,
                              );
                            },),
                            GestureDetector(child: EditedCheck(text: '45', isChecked: Check45),onTap: () {
                              setState(
                                () => Check45 = !Check45,
                              );
                            },),
                            GestureDetector(child: EditedCheck(text: '60', isChecked: Check60),onTap: () {
                              setState(
                                () => Check60 = !Check60,
                              );
                            },),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: Dimensions.margin10Height*20,
                  decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: AppColors.greyText, width: Dimensions.border1))
                      ),
                  child: Row(
                    mainAxisAlignment:  MainAxisAlignment.start,
                    children: [
                      Container(
                        width: Dimensions.sectionTimeMargin,
                        child: EditedText(color: AppColors.whiteText, text: 'Запуск демо игры:', size: Dimensions.font10*3.5, fontWeight: FontWeight.w700),
                      ),
                      Container(
                        child: Row(
                          children: [
                            GestureDetector(child: EditedCheck(text: 'Да', isChecked: LaunchDemo),onTap: () {
                              setState(
                                () => LaunchDemo = true,
                              );
                            },),
                            GestureDetector(child: EditedCheck(text: 'Нет', isChecked: !LaunchDemo),onTap: () {
                              setState(
                                () => LaunchDemo = false,
                              );
                            },),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: Dimensions.margin10Height*20,
                  decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: AppColors.greyText, width: Dimensions.border1))
                      ),
                  child: Row(
                    mainAxisAlignment:  MainAxisAlignment.start,
                    children: [
                      Container(
                        width: Dimensions.sectionTimeMargin,
                        child: EditedText(color: AppColors.whiteText, text: 'Отображать игры в устройстве:', size: Dimensions.font10*3.5, fontWeight: FontWeight.w700),
                      ),
                      Container(
                        child: Row(
                          children: [
                            GestureDetector(child: EditedCheck(text: 'Да', isChecked: ShowGames),onTap: () {
                              setState(
                                () => ShowGames = true,
                              );
                            },),
                            GestureDetector(child: EditedCheck(text: 'Нет', isChecked: !ShowGames),onTap: () {
                              setState(
                                () => ShowGames = false,
                              );
                            },),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: Dimensions.margin10Height*20,
                  decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: AppColors.greyText, width: Dimensions.border1))
                      ),
                  child: Row(
                    mainAxisAlignment:  MainAxisAlignment.start,
                    children: [
                      Container(
                        width: Dimensions.sectionTimeMargin,
                        child: EditedText(color: AppColors.whiteText, text: 'Тема приложения:', size: Dimensions.font10*3.5, fontWeight: FontWeight.w700),
                      ),
                      Container(
                        child: Row(
                          children: [
                            GestureDetector(child: EditedCheck(text: 'Темная', isChecked: Theme),onTap: () {
                              setState(
                                () => Theme = true,
                              );
                            },),
                            SizedBox(width: Dimensions.margin10Width*7.5),
                            GestureDetector(child: EditedCheck(text: 'Светлая', isChecked: !Theme),onTap: () {
                              setState(
                                () => Theme = false,
                              );
                            },),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
      ],
    );
  }
}
