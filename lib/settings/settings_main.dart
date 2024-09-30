import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/drawerProvider.dart';
import 'package:flutter_application_1/settings/app_drawer.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:provider/provider.dart';

class SettingsMain extends StatefulWidget {
  const SettingsMain({super.key});

  @override
  State<SettingsMain> createState() => _SettingsMainState();
}

class _SettingsMainState extends State<SettingsMain> {
  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context, listen: false);

    return Scaffold(
      //backgroundColor: AppColors.darkBgColor,
      drawer: AppDrawer(drawerProvider: drawerProvider),
      body: SafeArea(
          minimum: EdgeInsets.only(
              left: Dimensions.margin10Width * 2.7,
              right: Dimensions.margin10Width * 2.7,
              top: Dimensions.margin10Height * 2.7,
              bottom: Dimensions.margin10Height * 2.7),
          child: Row(
            children: [
              AppDrawer(drawerProvider: drawerProvider),
              Container(
                child: Column(
                  children: [
                    Expanded(
                      //child: SingleChildScrollView(
                        child: Consumer<DrawerProvider>(
                          builder: (context, value, child) =>
                              value.pages[value.selectedPageIndex],
                        ),
                      //),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
