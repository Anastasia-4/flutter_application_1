import 'package:flutter/material.dart';
import 'package:flutter_application_1/settings/account.dart';

class DrawerProvider extends ChangeNotifier{

  int selectedPageIndex = 0;

  var pages = [
    /*const DashboardPage(),
    const ProductPage(),
    const CategoryPage(),
    const CouponPage(),
    const SettingsPage(),*/

    const Account(),
    const Account(),
    const Account(),
    const Account(),
    const Account(),

    /*Container(color: Colors.red),
    Container(color: Colors.blue),
    Container(color: Colors.pink),
    Container(color: Colors.yellow),
    Container(color: Colors.purple),*/
  ];

  void selectedMenu(int index) {
    selectedPageIndex = index;
    notifyListeners();
  }

}