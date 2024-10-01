import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/drawerProvider.dart';
import 'package:flutter_application_1/settings/drawer_menu.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({
    super.key,
    required this.drawerProvider,
  });

  final DrawerProvider drawerProvider;

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerProvider>(builder: (context, value, child) {
      return Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.cornerRadius20)
        ),
        width: Dimensions.devicesWidthContainer,
        backgroundColor: AppColors.darkMainColor,
          //child: SingleChildScrollView(
            child: 
            Column(
              children: [
                Container(
                      margin: EdgeInsets.only(top: Dimensions.margin10Height*13.8, bottom: Dimensions.margin10Height*9.5),
                      child: EditedText(color: AppColors.greyText, text: "НАСТРОЙКИ", size: Dimensions.font10*3.7, fontWeight: FontWeight.w900,),
                    ),

                DrawerMenu(
                  isSelected: widget.drawerProvider.selectedPageIndex == 0,
                  title: "Личный кабинет",
                  selectedTitle: "Личный кабинет",
                  icon: 'assets/image/account.png',
                  size: Dimensions.margin10Width*6.1,
                  onTap: () {
                    widget.drawerProvider.selectedMenu(0);
                  }, 
                ),
                DrawerMenu(
                  isSelected: widget.drawerProvider.selectedPageIndex == 1,
                  title: "Тарифы и платежи",
                  selectedTitle: "Тарифный план",
                  icon: 'assets/image/wallet.png',
                  size: Dimensions.margin10Width*5.8,
                  onTap: () {
                    widget.drawerProvider.selectedMenu(1);
                  },
                ),
                DrawerMenu(
                  isSelected: widget.drawerProvider.selectedPageIndex == 2,
                  title: "Общие настройки",
                  selectedTitle: "Общие настройки",
                  icon: 'assets/image/gear.png',
                  size: Dimensions.margin10Width*6.1,
                  onTap: () {
                    widget.drawerProvider.selectedMenu(2);
                  },
                ),
                DrawerMenu(
                  isSelected: widget.drawerProvider.selectedPageIndex == 3,
                  title: "Устройства",
                  selectedTitle: "Устройства",
                  icon: 'assets/image/headset.png',
                  size: Dimensions.margin10Width*6.1,
                  onTap: () {
                    widget.drawerProvider.selectedMenu(3);
                  },
                ),
                 DrawerMenu(
                    isSelected: widget.drawerProvider.selectedPageIndex == 4,
                    title: "Категории",
                    selectedTitle: "Категории",
                    icon: 'assets/image/category.png',
                    size: Dimensions.margin10Width*6.1,
                    onTap: () {
                      widget.drawerProvider.selectedMenu(4);
                    },
                  ),
                GestureDetector(
                  child: Container(
                        margin: EdgeInsets.only(top: Dimensions.margin10Height*46, bottom: Dimensions.margin10Height*5),
                        child: Container(
                        padding: EdgeInsets.only(left: Dimensions.margin10Width, right: Dimensions.margin10Width),
                          width: Dimensions.settingsBtnWidth,
                          height: Dimensions.settingsBtnHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.cornerRadius15),
                            color: AppColors.blueButtonColor
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/image/exit.png',
                                width: Dimensions.margin10Width*5,
                                fit: BoxFit.contain,
                              ),
                              
                              EditedText(color: AppColors.whiteText, text: " Выход", size: Dimensions.font10*3.2, fontWeight: FontWeight.w500, ),
                            ],
                          ),
                        )
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                ),
              ],
            ),
         // ),
      );
    });
  }
}