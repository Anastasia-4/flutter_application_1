/*import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/drawerProvider.dart';
import 'package:flutter_application_1/settings/account.dart';
import 'package:flutter_application_1/settings/app_drawer.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:provider/provider.dart';

class SettingsMain extends StatelessWidget {
  const SettingsMain({super.key});

  @override
  Widget build(BuildContext context) {
  final drawerProvider = Provider.of<DrawerProvider>(context, listen: false);

    return Scaffold(
      //backgroundColor: AppColors.darkBgColor,
      drawer: AppDrawer(drawerProvider: drawerProvider),
      body: SafeArea(
        minimum: EdgeInsets.only(left: Dimensions.margin10Width*2.7, right: Dimensions.margin10Width*2.7, top: Dimensions.margin10Height*2.7, bottom: Dimensions.margin10Height*2.7),
          child: Row(
        children: [
          AppDrawer(drawerProvider: drawerProvider),
               Column(
              children: [
                //const AppTopBar(),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Consumer<DrawerProvider>(
                        builder: (context, value, child) =>
                            value.pages[value.selectedPageIndex],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          
        ],
      )),
    );
  }
}*/