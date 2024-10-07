import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/database_service.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_tab.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';

class Devices extends StatefulWidget {
  const Devices({super.key});

  @override
  State<Devices> createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
  final DatabaseService _databaseService = DatabaseService.instance;
  bool click = false;

  List<TabData> tabs = [
    TabData(
      index: 1,
      title: const Tab(
        child: EditedTab(),
      ),
      content: const Center(child: Text('Content for Tab 1')),
    ),
    TabData(
      index: 2,
      title: const Tab(
        child: EditedTab(),
      ),
      content: const Center(child: Text('Content for Tab 2')),
    ),
    // Add more tabs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Dimensions.margin10Width*3.7),
      child: DefaultTabController(
        length: 8,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: Dimensions.margin10Width*160,
                  height: Dimensions.margin10Height*10,
                  child: TabBar(
                          tabAlignment: TabAlignment.start,
                          labelPadding: EdgeInsets.zero,
                          isScrollable: true,
                          indicator: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.cornerRadius20), topRight: Radius.circular(Dimensions.cornerRadius20)), // Creates border
                          color: AppColors.darkMainColor
                          ),
                          dividerColor: AppColors.darkMainColor,
                          tabs: [
                            Tab(
                                child: Container(
                                height: Dimensions.margin10Height * 10.5,
                                  width: Dimensions.margin10Width * 32.4,
                                  decoration: BoxDecoration(
                                    border: Border.symmetric(vertical: BorderSide(color: AppColors.greyText))
                                  ),
                                  child: EditedText(
                                      color: AppColors.whiteText,
                                      text: 'Устройство',
                                      size: Dimensions.font10 * 3.5,
                                      fontWeight: FontWeight.w700),
                                )),
                            Tab(
                                height: Dimensions.margin10Height * 10,
                                child: SizedBox(
                                  width: Dimensions.margin10Width * 32.4,
                                  child: EditedText(
                                      color: AppColors.whiteText,
                                      text: 'Устройство',
                                      size: Dimensions.font10 * 3.5,
                                      fontWeight: FontWeight.w700),
                                )),
                                Tab(
                                height: Dimensions.margin10Height * 10,
                                child: SizedBox(
                                  width: Dimensions.margin10Width * 32.4,
                                  child: EditedText(
                                      color: AppColors.whiteText,
                                      text: 'Устройство',
                                      size: Dimensions.font10 * 3.5,
                                      fontWeight: FontWeight.w700),
                                )),
                                Tab(
                                height: Dimensions.margin10Height * 10,
                                child: SizedBox(
                                  width: Dimensions.margin10Width * 32.4,
                                  child: EditedText(
                                      color: AppColors.whiteText,
                                      text: 'Устройство',
                                      size: Dimensions.font10 * 3.5,
                                      fontWeight: FontWeight.w700),
                                )),
                                Tab(
                                height: Dimensions.margin10Height * 10,
                                child: SizedBox(
                                  width: Dimensions.margin10Width * 32.4,
                                  child: EditedText(
                                      color: AppColors.whiteText,
                                      text: 'Устройство',
                                      size: Dimensions.font10 * 3.5,
                                      fontWeight: FontWeight.w700),
                                )),
                                Tab(
                                height: Dimensions.margin10Height * 10,
                                child: SizedBox(
                                  width: Dimensions.margin10Width * 32.4,
                                  child: EditedText(
                                      color: AppColors.whiteText,
                                      text: 'Устройство',
                                      size: Dimensions.font10 * 3.5,
                                      fontWeight: FontWeight.w700),
                                )),
                                Tab(
                                height: Dimensions.margin10Height * 10,
                                child: SizedBox(
                                  width: Dimensions.margin10Width * 32.4,
                                  child: EditedText(
                                      color: AppColors.whiteText,
                                      text: 'Устройство',
                                      size: Dimensions.font10 * 3.5,
                                      fontWeight: FontWeight.w700),
                                )),
                                Tab(
                                height: Dimensions.margin10Height * 10,
                                child: SizedBox(
                                  width: Dimensions.margin10Width * 32.4,
                                  child: EditedText(
                                      color: AppColors.whiteText,
                                      text: 'Устройство',
                                      size: Dimensions.font10 * 3.5,
                                      fontWeight: FontWeight.w700),
                                )),
                          ],
                        ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: Dimensions.margin10Width*33.5,
                      height: Dimensions.margin10Height*7.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                        color: AppColors.yellowButtonColor
                      ),
                    ),
                  ),
                )
              ],
            ),
               Expanded(
                 child: TabBarView(
                  physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                  children: [
                    Expanded(child: Container(color: AppColors.darkMainColor)),
                    Expanded(child: Container(color: AppColors.darkMainColor)),
                    Expanded(child: Container(color: AppColors.darkMainColor)),
                    Expanded(child: Container(color: AppColors.darkMainColor)),
                    Expanded(child: Container(color: AppColors.darkMainColor)),
                    Expanded(child: Container(color: AppColors.darkMainColor)),
                    Expanded(child: Container(color: AppColors.darkMainColor)),
                    Expanded(child: Container(color: AppColors.darkMainColor)),
                  ],
                               ),
               ),
          
          ],
        ),
      ),
    );
  }
  Widget _tab(String text) {
    return Container(
      padding: const EdgeInsets.all(0),
      height: Dimensions.margin10Height * 10.5,
      width: Dimensions.margin10Width * 32.4,
      decoration: const BoxDecoration(
          border: Border(right: BorderSide(color: Colors.white, width: 1, style: BorderStyle.solid))),
      child: Tab(
        text: text,
      ),
    );
  }
}