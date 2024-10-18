import 'package:flutter/material.dart';
import 'package:flutter_application_1/settings/sharedPreferencesHelper.dart';
import 'package:flutter_application_1/theme/theme_provider.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_check.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';
import 'package:provider/provider.dart';

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
  bool _Theme = true;
  @override

  void initState() {
    super.initState();
    _Theme = SharedPreferencesHelper.getBool("Theme") ?? true;
    ShowGames =  SharedPreferencesHelper.getBool("Games") ?? false;
    LaunchDemo =  SharedPreferencesHelper.getBool("Demo") ?? false;
    Check15 =  SharedPreferencesHelper.getBool("Check15") ?? false;
    Check30 = SharedPreferencesHelper.getBool("Check30") ?? true;
    Check45 = SharedPreferencesHelper.getBool("Check45") ?? true;
    Check60 = SharedPreferencesHelper.getBool("Check60") ?? true;
  }
  
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
                  border: Border.all(color: Theme.of(context).colorScheme.tertiaryFixed, width: Dimensions.border1),
                  color: Theme.of(context).colorScheme.primary
                  ),
            child: Column(
              children: [
                SizedBox(height: Dimensions.margin10Height*13.5),
                EditedText(color:Theme.of(context).colorScheme.tertiary, text: 'Общие настройки', size: Dimensions.font10*4.5, fontWeight: FontWeight.w700),
                SizedBox(height: Dimensions.margin10Height*10),
                Container(
                  height: Dimensions.margin10Height*20,
                  decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: AppColors.greyText, width: Dimensions.border1))
                      ),
                  child: Row(
                    mainAxisAlignment:  MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Dimensions.sectionTimeMargin,
                        child: EditedText(color: Theme.of(context).colorScheme.tertiary, text: 'Таймер по умолчанию:', size: Dimensions.font10*3.5, fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          GestureDetector(child: EditedCheck(text: '15', isChecked: Check15),onTap: () {
                            setState(
                              () {
                                Check15 = !Check15;
                                SharedPreferencesHelper.setBool("Check15", Check15);
                                Feedback.forTap(context);
                              }
                            );
                          },),
                          GestureDetector(child: EditedCheck(text: '30', isChecked: Check30),onTap: () {
                            setState(
                              () {
                                Check30 = !Check30;
                                SharedPreferencesHelper.setBool("Check30", Check30);
                                Feedback.forTap(context);
                              } 
                            );
                          },),
                          GestureDetector(child: EditedCheck(text: '45', isChecked: Check45),onTap: () {
                            setState(
                              () {
                                Check45 = !Check45;
                                SharedPreferencesHelper.setBool("Check45", Check45);
                                Feedback.forTap(context);
                              } 
                            );
                          },),
                          GestureDetector(child: EditedCheck(text: '60', isChecked: Check60),onTap: () {
                            setState(
                              () {
                                Check60 = !Check60;
                                SharedPreferencesHelper.setBool("Check60", Check60);
                                Feedback.forTap(context);
                              } 
                            );
                          },),
                        ],
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
                      SizedBox(
                        width: Dimensions.sectionTimeMargin,
                        child: EditedText(color: Theme.of(context).colorScheme.tertiary, text: 'Запуск демо игры:', size: Dimensions.font10*3.5, fontWeight: FontWeight.w700),
                      ),
                      Container(
                        child: Row(
                          children: [
                            GestureDetector(child: EditedCheck(text: 'Да', isChecked: LaunchDemo),onTap: () {
                              setState(
                                () {
                                  LaunchDemo = true;
                                  SharedPreferencesHelper.setBool("Demo", true);
                                  Feedback.forTap(context);
                                }
                              );
                            },),
                            GestureDetector(child: EditedCheck(text: 'Нет', isChecked: !LaunchDemo),onTap: () {
                              setState(
                                () {
                                  LaunchDemo = false;
                                  SharedPreferencesHelper.setBool("Demo", false);
                                  Feedback.forTap(context);
                                }
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
                        border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: Dimensions.border1))
                      ),
                  child: Row(
                    mainAxisAlignment:  MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Dimensions.sectionTimeMargin,
                        child: EditedText(color: Theme.of(context).colorScheme.tertiary, text: 'Отображать игры в устройстве:', size: Dimensions.font10*3.5, fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          GestureDetector(child: EditedCheck(text: 'Да', isChecked: ShowGames),onTap: () {
                            setState(
                              () {
                               ShowGames = true;
                               SharedPreferencesHelper.setBool("Games", true);
                               Feedback.forTap(context);
                              }  
                            );
                          },),
                          GestureDetector(child: EditedCheck(text: 'Нет', isChecked: !ShowGames),onTap: () {
                            setState(
                              () {
                                ShowGames = false;
                                SharedPreferencesHelper.setBool("Games", false);  
                                Feedback.forTap(context);
                              }
                            );
                          },),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: Dimensions.margin10Height*20,
                  decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: Dimensions.border1))
                      ),
                  child: Row(
                    mainAxisAlignment:  MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Dimensions.sectionTimeMargin,
                        child: EditedText(color: Theme.of(context).colorScheme.tertiary, text: 'Тема приложения:', size: Dimensions.font10*3.5, fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          GestureDetector(child: EditedCheck(text: 'Темная', isChecked: _Theme),onTap: () async {
                            setState(
                              () {
                                _Theme = true;
                                SharedPreferencesHelper.setBool("Theme", true);
                                Feedback.forTap(context);
                              },
                            );
                            Provider.of<ThemeProvider>(context, listen: false).toggleTheme(_Theme);
                            
                      
                          },),
                          SizedBox(width: Dimensions.margin10Width*7.5),
                          GestureDetector(child: EditedCheck(text: 'Светлая', isChecked: !_Theme),onTap: () async {
                            setState(
                              () {
                                _Theme = false;
                                SharedPreferencesHelper.setBool("Theme", false);
                                Feedback.forTap(context);
                              },
                            );
                            Provider.of<ThemeProvider>(context, listen: false).toggleTheme(_Theme);
                            
                          },),
                        ],
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