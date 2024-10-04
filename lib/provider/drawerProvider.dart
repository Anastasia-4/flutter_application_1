import 'package:flutter/material.dart';
import 'package:flutter_application_1/settings/pages/account.dart';
import 'package:flutter_application_1/settings/pages/devices.dart';
import 'package:flutter_application_1/settings/pages/pay.dart';
import 'package:flutter_application_1/settings/pages/settings_general.dart';

class DrawerProvider extends ChangeNotifier{

  int selectedPageIndex = 0;

  var pages = [
    const Account(),
    const Pay(),
    const SettingsGeneral(),
    const Devices(),
  ];

  void selectedMenu(int index) {
    selectedPageIndex = index;
    notifyListeners();
  }

}