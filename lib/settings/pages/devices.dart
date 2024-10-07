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
  late TextEditingController controller;

  @override
    void initState(){
      super.initState();
      controller = TextEditingController();
    }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final DatabaseService _databaseService = DatabaseService.instance;
  List<TabData> tabs = [
    TabData(
      index: 1,
      title: const Tab(
        child: EditedTab(text: 'Tab 1', id: 1,),
      ),
      content: const Center(child: Text('Content for Tab 1')),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Dimensions.margin10Width*3.7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                onPressed: addTab,
                child: const Text('Add Tab'),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () => tabs.length > 1 ? removeTab(tabs.length) : null,
                child: const Text('Remove Last Tab'),
              ),
              const SizedBox(width: 16),
            ],
          ),
          Expanded(
            child: DynamicTabBarWidget(
              indicator: BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.greyText)),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.cornerRadius20), topRight: Radius.circular(Dimensions.cornerRadius20)), // Creates border
                          color: AppColors.darkMainColor
                          ),
              
              dividerColor: AppColors.darkMainColor,
              physicsTabBarView: NeverScrollableScrollPhysics(),
              dynamicTabs: tabs,
              isScrollable: true,
              onTabControllerUpdated: (controller) {},
              onTabChanged: (index) {},
              onAddTabMoveTo: MoveToTab.last,
              showBackIcon: false,
              showNextIcon: false,
              tabAlignment: TabAlignment.start,
              labelPadding: EdgeInsets.zero,
              trailing : SizedBox(width: Dimensions.margin10Width*46, child: Center(
                    child: GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: Dimensions.margin10Width*33.5,
                        height: Dimensions.margin10Height*7.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                          color: AppColors.yellowButtonColor
                        ),
                        child: EditedText(color: AppColors.blackText, text: 'Добавить', size: Dimensions.font10*3.3, fontWeight: FontWeight.w500)),
                    onTap: () => openDialog(),
                    ),
                    ),
                    )
            ),
          ),
        ],
      ),
    );
  }
  void addTab() {
    setState(() {
      var tabNumber = tabs.last.index+1;
      tabs.add(
        TabData(
          index: tabNumber,
          title: Tab(
            child: EditedTab(text: 'Tab $tabNumber', id: tabNumber,),
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Dynamic Tab $tabNumber'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => removeTab(tabNumber),
                child: const Text('Remove this Tab'),
              ),
            ],
          ),
        ),
      );
    });
  }

  void removeTab(int id) {
    setState(() {
      tabs.removeWhere((item) => item.index == id);
    });
  }

  Future<String?> openDialog() => showDialog(
    
    context: context, 
    builder: (context) => AlertDialog(
      backgroundColor: AppColors.darkMainColor,
    content: SizedBox(
      width: Dimensions.margin10Width*125,
      height: Dimensions.margin10Height*90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: Dimensions.margin10Width*9.2,
                height: Dimensions.margin10Height*6.5,
                decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.cornerRadius15),
                          color: AppColors.blueButtonColor
                        ),
                ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EditedText(
                      color: Theme.of(context).colorScheme.tertiary,
                      text: "Название устройства",
                      size: Dimensions.font10 * 3.5,
                      fontWeight: FontWeight.w700),
                  Container(
                    width: Dimensions.margin10Width * 131.6,
                    height: Dimensions.margin10Height * 10.8,
                    child: TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.name,
                      style: TextStyle(color: Theme.of(context).colorScheme.tertiaryContainer, fontSize: Dimensions.font10*3.5, fontFamily: 'Roboto', fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.primaryContainer,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(Dimensions.cornerRadius15),
                            borderSide: BorderSide(
                                color: AppColors.darkerGreyText,
                                width: Dimensions.border1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(Dimensions.cornerRadius15),
                            borderSide: BorderSide(
                                color: AppColors.darkerGreyText,
                                width: Dimensions.border1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(Dimensions.cornerRadius15),
                            borderSide: BorderSide(
                                color: AppColors.darkerGreyText,
                                width: Dimensions.border1)),
                      ),
                    ),
                  ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EditedText(
                      color: Theme.of(context).colorScheme.tertiary,
                      text: "Серийный номер ",
                      size: Dimensions.font10 * 3.5,
                      fontWeight: FontWeight.w700),
                  Container(
                    width: Dimensions.margin10Width * 131.6,
                    height: Dimensions.margin10Height * 10.8,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      style: TextStyle(color: Theme.of(context).colorScheme.tertiaryContainer, fontSize: Dimensions.font10*3.5, fontFamily: 'Roboto', fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.primaryContainer,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(Dimensions.cornerRadius15),
                            borderSide: BorderSide(
                                color: AppColors.darkerGreyText,
                                width: Dimensions.border1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(Dimensions.cornerRadius15),
                            borderSide: BorderSide(
                                color: AppColors.darkerGreyText,
                                width: Dimensions.border1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(Dimensions.cornerRadius15),
                            borderSide: BorderSide(
                                color: AppColors.darkerGreyText,
                                width: Dimensions.border1)),
                      ),
                    ),
                  ),
            ],
          ),
          
        ],
      ),
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: Dimensions.margin10Width*38,
                            height: Dimensions.margin10Height*7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                              color: AppColors.yellowButtonColor
                            ),
                            child: EditedText(color: AppColors.blackText, text: 'Сохранить', size: Dimensions.font10*3.3, fontWeight: FontWeight.w500)),
                        onTap: () => Navigator.of(context).pop(controller.text),
                        ),
        ],
      ),
    ],
  ));

  void submit(){
    Navigator.of(context).pop(controller.text);
  }
}