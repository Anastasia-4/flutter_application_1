import 'package:flutter/material.dart';
import 'package:flutter_application_1/Database/db_helper.dart';
import 'package:flutter_application_1/home/main_page.dart';
import 'package:flutter_application_1/provider/drawerProvider.dart';
import 'package:flutter_application_1/settings/settings_main.dart';
import 'package:flutter_application_1/settings/sharedPreferencesHelper.dart';
import 'package:flutter_application_1/theme/theme_provider.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]).then((value) async {

  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.initDb();
  await DatabaseHelper.instance.initializeUsers();


  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) =>DrawerProvider(),
      ),
      ChangeNotifierProvider(
        create: (BuildContext context) =>ThemeProvider(isDark: SharedPreferencesHelper.getBool("Theme") ?? true),
      ),
    ],
  child: const MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UnitVR',
      theme: Provider.of<ThemeProvider>(context).themeData,
      /*theme: ThemeData(
        scaffoldBackgroundColor: AppColors.darkBgColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),*/
      home: MainPage(),
    );
  }
}