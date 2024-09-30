import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/drawerProvider.dart';
import 'package:flutter_application_1/settings/drawer_menu.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
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
        width: Dimensions.devicesWidthContainer,
        backgroundColor: AppColors.darkMainColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerMenu(
                isSelected: widget.drawerProvider.selectedPageIndex == 0,
                title: "Личный кабинет",
                icon: 'assets/image/account.png',
                onTap: () {
                  widget.drawerProvider.selectedMenu(0);
                },
              ),
              DrawerMenu(
                isSelected: widget.drawerProvider.selectedPageIndex == 1,
                title: "Тарифы и платежи ",
                icon: 'assets/image/wallet.png',
                onTap: () {
                  widget.drawerProvider.selectedMenu(1);
                },
              ),
              DrawerMenu(
                isSelected: widget.drawerProvider.selectedPageIndex == 2,
                title: "Общие настройки ",
                icon: 'assets/image/gear.png',
                onTap: () {
                  widget.drawerProvider.selectedMenu(2);
                },
              ),
              DrawerMenu(
                isSelected: widget.drawerProvider.selectedPageIndex == 3,
                title: "Устройства",
                icon: 'assets/image/headset.png',
                onTap: () {
                  widget.drawerProvider.selectedMenu(3);
                },
              ),
              GestureDetector(
                child: DrawerMenu(
                  isSelected: widget.drawerProvider.selectedPageIndex == 4,
                  title: "Категории",
                  icon: 'assets/image/category.png',
                  onTap: () {
                    widget.drawerProvider.selectedMenu(4);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}