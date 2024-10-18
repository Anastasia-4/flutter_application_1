import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/settings/sharedPreferencesHelper.dart';
import 'package:flutter_application_1/utils/global_variables.dart';
import 'package:flutter_application_1/services/database_service.dart';
import 'package:flutter_application_1/services/device_model.dart';
import 'package:flutter_application_1/settings/settings_main.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/dialog_content.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';
import 'package:flutter_application_1/widgets/game_dialog_content.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late TextEditingController nameController;
  late TextEditingController numController;
  final DatabaseService _databaseService = DatabaseService.instance;
  int _selectedTile = 0;
  late var timers = List.generate(currentDevicesCount, (index) => Timer(const Duration(), () => {}));
  late var durations = List.generate(currentDevicesCount, (index) => const Duration());
  late var pause = List.generate(currentDevicesCount, (index) => false);
  int finalDevicesCount = 5;
  late int currentDevicesCount = 0;
  bool isLoaded = false;

  bool Check15 = false;
  bool Check30 = true;
  bool Check45 = true;
  bool Check60 = true;
  bool LaunchDemo = false;

  @override
  initState() {
    super.initState();
    nameController = TextEditingController();
    numController = TextEditingController();
    Check15 = SharedPreferencesHelper.getBool("Check15") ?? false;
    Check30 = SharedPreferencesHelper.getBool("Check30") ?? true;
    Check45 = SharedPreferencesHelper.getBool("Check45") ?? true;
    Check60 = SharedPreferencesHelper.getBool("Check60") ?? true;
    LaunchDemo =  SharedPreferencesHelper.getBool("Demo") ?? false;
    WidgetsBinding.instance.addPostFrameCallback((_){
      _getDb();
  });
  }

  _getDb() async {
    currentDevicesCount = await _databaseService.getCount();
    timers = List.generate(currentDevicesCount, (index) => Timer(const Duration(), () => {}));
    durations = List.generate(currentDevicesCount, (index) => const Duration());
    pause = List.generate(currentDevicesCount, (index) => false);
    setState(() {
    isLoaded = true;
    });
  }

  addNew() async {
    currentDevicesCount = await _databaseService.getCount();
    timers.addAll(List.generate(currentDevicesCount - timers.length, (index) => Timer(const Duration(), () => {})));
    durations.addAll(List.generate(currentDevicesCount - durations.length, (index) => const Duration()));
    pause.addAll(List.generate(currentDevicesCount - pause.length, (index) => false));
    setState(() {
    isLoaded = true;
    });
  }

  void handleStop() {
      timers[_selectedTile].cancel();
  }

  void reset() {
    durations[_selectedTile] = const Duration();
    pause[_selectedTile] = false;
  }

  void setDuration(int minutes) {
    if (timers[_selectedTile].isActive == false) {
      pause[_selectedTile] = false;
      durations[_selectedTile] = Duration(minutes: minutes);
    }
  }

    void changeDuration(bool plus) {
    if (durations[_selectedTile].inMilliseconds > 0) {
      if (plus) {
        setState(() {
          if(durations[_selectedTile].inMinutes <= 75){
          durations[_selectedTile] += const Duration(minutes: 15);
        }
        });
      } else {
        setState(() {
          durations[_selectedTile] -= const Duration(minutes: 15);
          if(durations[_selectedTile].inMilliseconds <= 0){
            handleStop();
            reset();
          }
        });
      }
    }
  }

  void start(int index) {
    if (timers[index].isActive == false) {
      timers[index] = Timer.periodic(const Duration(seconds: 1), (_) => subtractTime(index));
    }
  }

  void subtractTime(int index) {
    setState(() {
      final seconds = durations[index].inSeconds - 1;
      if (seconds < 0) {
        timers[index].cancel();
      } else {
        durations[index] = Duration(seconds: seconds);
      }
    });
  }

  String returnFormattedText(int id) {
    var milli = durations[id].inMilliseconds;

    String seconds = ((milli ~/ 1000) % 60)
        .toString()
        .padLeft(2, "0"); // this is for the second
    String minutes = ((milli ~/ 1000) ~/ 60)
        .toString()
        .padLeft(2, "0"); // this is for the minute

    return "$minutes:$seconds";
  }

  //=======================================

    final List<String> images = [
    'assets/image/arizonaSunshine.png',
    'assets/image/jobSimulator.png',
    'assets/image/superHot.png',
    'assets/image/hero_capsule.png',
    'assets/image/subnautica.png',
    'assets/image/phasmophobia.png',
    'assets/image/arizonaSunshine.png',
    'assets/image/jobSimulator.png',
    'assets/image/superHot.png',
    'assets/image/hero_capsule.png',
    'assets/image/subnautica.png',
    'assets/image/phasmophobia.png',
    '',
    '',
  ];
  final List<String> names = [
    'Arizona Sunshine',
    'Job Simulator',
    'Super Hot',
    'Half-Life: Alyx',
    'Subnautica',
    'Phasmophobia',
    'Arizona Sunshine',
    'Job Simulator',
    'Super Hot',
    'Half-Life: Alyx',
    'Subnautica',
    'Phasmophobia',
    'Game',
    'Game',
  ];

  //=======================================


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: currentDevicesCount == durations.length
        ? SafeArea(
            minimum: EdgeInsets.only(
                left: Dimensions.margin10Width * 2.7,
                right: Dimensions.margin10Width * 2.7,
                top: Dimensions.margin10Height * 2.7,
                bottom: Dimensions.margin10Height * 2.7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  //устройства
                  width: Dimensions.devicesWidthContainer,
                  height: Dimensions.devicesHeightContainer,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(Dimensions.cornerRadius20),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.tertiaryFixed,
                        width: Dimensions.border1),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: Dimensions.margin10Height * 13.8,
                          bottom: Dimensions.margin10Height * 9.5),
                      child: EditedText(
                        color: Theme.of(context).colorScheme.tertiary,
                        text: "УСТРОЙСТВА",
                        size: Dimensions.font10 * 3.7,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                            child: FutureBuilder(
                                future: _databaseService.getDevice(),
                                builder: (context, snapshot) {
                                  return Column(
                                    children: [
                                      ListView.builder(
                                        physics:const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount:snapshot.data?.length ?? 0,
                                        itemBuilder:(BuildContext context,int index) {
                                          currentDevicesCount = snapshot.data?.length ?? 0;
                                          Device device =snapshot.data![index];
                                          if (currentDevicesCount == durations.length){
                                            if (durations[index].inMilliseconds != 0 && pause[index] == false) {
                                              start(index);
                                            }
                                          }
                                          return GestureDetector(
                                            child: Container(
                                                height: Dimensions.devicesListHeight,
                                                margin: EdgeInsets.only(
                                                    left: Dimensions.margin10Width *2,
                                                    right: Dimensions.margin10Width *2,
                                                    bottom: Dimensions.margin10Height *5.9),
                                                padding: EdgeInsets.only(
                                                    left: Dimensions.margin10Width *1.5),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: _selectedTile == index
                                                    ? AppColors.greyText
                                                    : Colors.transparent,
                                                    width: Dimensions.border1*3),
                                                  borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                                                  color: Theme.of(context).colorScheme.primaryContainer,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            width: Dimensions.margin10Width *25,
                                                            height: Dimensions.margin10Height *8.2,
                                                            decoration: const BoxDecoration(
                                                                border: Border(
                                                                    bottom:BorderSide(color: AppColors.darkerGreyText))),
                                                            child: EditedText(
                                                                color: Theme.of(context).colorScheme.tertiary,
                                                                text: device.name,
                                                                size: Dimensions.font10 *3.5,
                                                                fontWeight:FontWeight.w500),
                                                          ),
                                                          Container(alignment:Alignment.center,
                                                            width: Dimensions.margin10Width *20,
                                                            height: Dimensions.margin10Height *8.2,
                                                            child: currentDevicesCount == durations.length
                                                            ? EditedText(
                                                                color: durations[index].inSeconds < 300 &&durations[index].inSeconds > 0
                                                                    ? AppColors.redButtonColor
                                                                    : Theme.of(context).colorScheme.tertiary,
                                                                text: returnFormattedText(index) =="00:00"
                                                                    ? "--:--"
                                                                    : returnFormattedText(index),
                                                                size: Dimensions.font10 *7,
                                                                fontWeight: FontWeight.w900)
                                                            : const SizedBox()
                                                          ),
                                                        ]),
                                                    SizedBox(
                                                      width: Dimensions.margin10Width *8.3,
                                                      child: RotatedBox(
                                                        quarterTurns: 3,
                                                        child: Row(
                                                          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            Column(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Transform.flip(
                                                                  flipX:true,
                                                                  child: Image.asset(
                                                                    height:Dimensions.margin10Width * 4.7,
                                                                    width:Dimensions.margin10Height * 2.9,
                                                                    'assets/image/controller.png',
                                                                    fit: BoxFit.fill,
                                                                  ),
                                                                ),
                                                                EditedText(
                                                                    color: Theme.of(context).colorScheme.tertiary,
                                                                    text:'100',
                                                                    size: Dimensions.font10 *2.5,
                                                                    fontWeight:FontWeight.w700),
                                                              ],
                                                            ),
                                                            Column(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Image.asset(
                                                                  height: Dimensions.margin10Width *3.8,
                                                                  width: Dimensions.margin10Height *5.6,
                                                                  'assets/image/VRheadset.png',
                                                                  fit: BoxFit.contain,
                                                                ),
                                                                EditedText(
                                                                    color: Theme.of(context).colorScheme.tertiary,
                                                                    text:'100',
                                                                    size: Dimensions.font10 *2.5,
                                                                    fontWeight:FontWeight.w700),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Image.asset(
                                                                  height: Dimensions.margin10Width *4.7,
                                                                  width: Dimensions.margin10Height *2.9,
                                                                  'assets/image/controller.png',
                                                                  fit: BoxFit.fill,
                                                                ),
                                                                EditedText(
                                                                    color: Theme.of(context).colorScheme.tertiary,
                                                                    text:'100',
                                                                    size: Dimensions.font10 *2.5,
                                                                    fontWeight:FontWeight.w700),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )),
                                            onTap: () {
                                              Feedback.forTap(context);
                                              setState(() {
                                                _selectedTile = index;
                                              });
                                            },
                                          );
                                        },
                                      ),
                                      Container(
                                        child: currentDevicesCount < finalDevicesCount
                                        ? Container(
                                          height: Dimensions.margin10Height *16.5,
                                          width:Dimensions.devicesListWidth,
                                          margin: EdgeInsets.only(
                                              left:Dimensions.margin10Width *2,
                                              right:Dimensions.margin10Width *2,
                                              bottom:Dimensions.margin10Height *5.9),
                                          padding: EdgeInsets.only(
                                              left:Dimensions.margin10Width *1.5),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                                              color: Theme.of(context).colorScheme.primaryContainer),
                                          child: GestureDetector(
                                            child: Column(
                                              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                              children: [
                                                EditedText(
                                                    color: Theme.of(context).colorScheme.tertiary,
                                                    text: 'Не активировано',
                                                    size:Dimensions.font10 *3.5,
                                                    fontWeight:FontWeight.w500),
                                                Container(
                                                  alignment:Alignment.center,
                                                  height: Dimensions.margin10Height *5.7,
                                                  width: Dimensions.margin10Width *20,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(Dimensions.cornerRadius20 /2),
                                                      color: AppColors.yellowButtonColor),
                                                  child: EditedText(
                                                      color: AppColors.blackText,
                                                      text: 'Активировать',
                                                      size: Dimensions.font10 *2.5,
                                                      fontWeight:FontWeight.w500),
                                                )
                                              ],
                                            ),
                                            onTap: () {
                                              setState(() {
                                                nameController.text = "";
                                                numController.text = "";
                                              });
                                              if (currentDevicesCount == finalDevicesCount){
                                                null;
                                              } else {
                                                Feedback.forTap(context);
                                                openDialog().then((_) => {addNew()});
                                              }
                                            },
                                          ))
                                      : Container(), 
                                      )
                                      
                                      
                                    ],
                                  );
                                }))),
                    GestureDetector(
                        child: Container(
                            margin: EdgeInsets.only(
                                top: Dimensions.margin10Height * 19.7,
                                bottom: Dimensions.margin10Height * 6.3),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: Dimensions.margin10Width,
                                  right: Dimensions.margin10Width),
                              width: Dimensions.settingsBtnWidth,
                              height: Dimensions.settingsBtnHeight,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.cornerRadius15),
                                  color: Theme.of(context).colorScheme.primaryContainer),
                              child: Row(
                                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    CupertinoIcons.gear,
                                    color:Theme.of(context).colorScheme.tertiary,
                                    size: Dimensions.font10 * 4.2,
                                  ),
                                  EditedText(
                                    color:Theme.of(context).colorScheme.tertiary,
                                    text: "Настройки",
                                    size: Dimensions.font10 * 3.2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            )),
                        onTap: () {
                          if (durations.where((duration) => duration.inMilliseconds != 0).toList().isEmpty){
                            GlobalVariables.change(true);
                              setState(() {
                              isLoaded = false;
                              });
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsMain())).then((_) => {
                              _getDb(),
                            });
                          }else{
                            GlobalVariables.change(false);
                              setState(() {
                              isLoaded = false;
                              });
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsMain())).then((_) => {
                              addNew(),
                            });
                          }
                          Feedback.forTap(context);
                        }),
                  ]),
                ),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                      Container(
                        margin: EdgeInsets.only(bottom: Dimensions.margin10Height * 3.7),
                        width: Dimensions.mainWidthContainer,
                        height: Dimensions.timerHeightContainer,
                        decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(Dimensions.cornerRadius25),
                          border: Border.all(
                              color:Theme.of(context).colorScheme.tertiaryFixed,
                              width: Dimensions.border1),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              //таймер
                              padding: EdgeInsets.symmetric(horizontal: Dimensions.margin10Width*2),
                              width: Dimensions.timeWidthContainer,
                              height: Dimensions.timeHeightContainer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                                color: Theme.of(context).colorScheme.primaryContainer,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                      width: Dimensions.margin10Width*24,
                                    child: 
                                    (currentDevicesCount != 0 )
                                    ?  EditedText(
                                      color: durations[_selectedTile].inSeconds < 300 &&durations[_selectedTile].inSeconds > 0
                                        ? AppColors.redButtonColor
                                        : Theme.of(context).colorScheme.tertiary,
                                      text: returnFormattedText(_selectedTile) =="00:00"
                                        ? "--:--"
                                        : returnFormattedText(_selectedTile), 
                                      size: Dimensions.font10*9, 
                                      fontWeight: FontWeight.w700)
                                    : EditedText(
                                      color: Theme.of(context).colorScheme.tertiary,
                                      text: "--:--",
                                      size: Dimensions.font10*9, 
                                      fontWeight: FontWeight.w700)
                                  ),
                              GestureDetector(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: Dimensions.margin10Width*14,
                                  height: Dimensions.margin10Height*14,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                                    color: AppColors.whiteButtonColor
                                  ),
                                  child: EditedText(color: AppColors.blackText, text: '+', size: Dimensions.font10*10, fontWeight: FontWeight.w700)
                                  ),
                                  onTap: () {
                                    Feedback.forTap(context);
                                    if(currentDevicesCount > 0){
                                      changeDuration(true);
                                    }
                                  },
                              ),
                                GestureDetector(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: Dimensions.margin10Width*14,
                                    height: Dimensions.margin10Height*14,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                                      color: AppColors.whiteButtonColor
                                    ),
                                    child: EditedText(color: AppColors.blackText, text: '–', size: Dimensions.font10*10, fontWeight: FontWeight.w700)
                                    ),
                                    onTap: () {
                                      Feedback.forTap(context);
                                      if(currentDevicesCount > 0){changeDuration(false);}
                                    },
                                ),
                                ],
                              ),
                            ),
                            Container(
                              //кнопки
                              width: Dimensions.buttonWidthContainer,
                              height: Dimensions.timeHeightContainer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                                color: Theme.of(context).colorScheme.primaryContainer,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      child: Container(
                                        margin: EdgeInsets.only(left:Dimensions.margin10Width * 3.2),
                                        height: Dimensions.buttonHeight,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                                          color: AppColors.yellowButtonColor,
                                        ),
                                        alignment: Alignment.center,
                                        child: EditedText(
                                            color: AppColors.blackText,
                                            text: "Пауза",
                                            size: Dimensions.font10 * 3.5,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      onTap: () {
                                          Feedback.forTap(context);
                                        if(currentDevicesCount > 0){
                                        setState(() {
                                          if (durations[_selectedTile].inMilliseconds > 0){
                                            pause[_selectedTile] = !pause[_selectedTile];
                                            handleStop();
                                          }
                                        });
                                        }
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      child: Container(
                                        margin: EdgeInsets.only(left: Dimensions.margin10Width * 3.2),
                                        height: Dimensions.buttonHeight,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                                          color: AppColors.yellowButtonColor,
                                        ),
                                        alignment: Alignment.center,
                                        child: EditedText(
                                            color: AppColors.blackText,
                                            text: "Стоп",
                                            size: Dimensions.font10 * 3.5,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      onTap: () {
                                        Feedback.forTap(context);
                                        if(currentDevicesCount > 0){
                                        setState(() {
                                          handleStop();
                                          reset();
                                        });
                                        }
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: Dimensions.margin10Width * 3.2),
                                      height: Dimensions.buttonHeight,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                                        color: AppColors.yellowButtonColor,
                                      ),
                                      alignment: Alignment.center,
                                      child: EditedText(
                                          color: AppColors.blackText,
                                          text: "Трансляция",
                                          size: Dimensions.font10 * 3.5,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: Dimensions.margin10Width * 3.2,
                                          right:Dimensions.margin10Width * 3.2),
                                      height: Dimensions.buttonHeight,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                                        color: AppColors.yellowButtonColor,
                                      ),
                                      alignment: Alignment.center,
                                      child: EditedText(
                                          color: AppColors.blackText,
                                          text: "Граница",
                                          size: Dimensions.font10 * 3.5,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                      width: Dimensions.mainWidthContainer,
                      decoration: BoxDecoration(
                        border: Border.all(
                        color: Theme.of(context).colorScheme.tertiaryFixed,
                        width: Dimensions.border1),
                        borderRadius: BorderRadius.circular(Dimensions.cornerRadius15),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: SingleChildScrollView(
                        child: GridView.builder(
                          padding: EdgeInsets.symmetric(vertical: Dimensions.margin10Height*6, horizontal: Dimensions.margin10Width),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                mainAxisSpacing: Dimensions.margin10Height*7,
                              ),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: names.length,
                          itemBuilder: (BuildContext context, int index) {
                            return 
                            GestureDetector(
                              onTap: () {
                                if (timers[_selectedTile].isActive == false) {
                                  Feedback.forTap(context);
                                
                                  if (currentDevicesCount > 0){
                                    gameDialog(names[index]);
                                  }
                                }
                                },
                              child: getItem(index));
                          },
                        ),
                      ),
                    )),
                    ]))
              ],
            )
            )
        : const Center(child: CircularProgressIndicator())
            );
  }

  Future<void> gameDialog(String gameName) => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.cornerRadius25)),
            contentPadding: EdgeInsets.zero,
            content: GameDialogContent(gameName: gameName),
            actions: [
              Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                        alignment: Alignment.center,
                        width: Dimensions.margin10Width * 41.2,
                        height: Dimensions.margin10Height * 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Dimensions.cornerRadius20),
                            color: AppColors.yellowButtonColor),
                        child: EditedText(
                            color: AppColors.blackText,
                            text: 'Запустить игру',
                            size: Dimensions.font10 * 3.5,
                            fontWeight: FontWeight.w500)),
                    onTap: () {
                      if (GlobalVariables.selectedTimer != 0) {
                        isLoaded = false;
                        Feedback.forTap(context);
                        setState(() {
                          setDuration(GlobalVariables.selectedTimer);
                          GlobalVariables.changeTimer(0);
                        });
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              ),
            ],
          ));

    Future<void> openDialog() => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.primary,
            content: DialogContent(nameController: nameController, numController: numController,),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                        alignment: Alignment.center,
                        width: Dimensions.margin10Width * 38,
                        height: Dimensions.margin10Height * 7,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Dimensions.cornerRadius20),
                            color: AppColors.yellowButtonColor),
                        child: EditedText(
                            color: AppColors.blackText,
                            text: 'Сохранить',
                            size: Dimensions.font10 * 3.3,
                            fontWeight: FontWeight.w500)),
                    onTap: () {
                      isLoaded = false;
                      if (numController.text.isNotEmpty &&
                          nameController.text.isNotEmpty && numController.text.length == 15) {
                        _databaseService.addDevice(
                            nameController.text, numController.text);
                            Feedback.forTap(context);
                        setState(() {
                          nameController.text = "";
                          numController.text = "";
                        });
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              ),
            ],
          ));

  Widget getItem(int index) {
    return GridTile(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.cornerRadius20 / 2),
              child: Image.asset(
                images[index],
                width: Dimensions.margin10Width*33,
                height: Dimensions.margin10Height*33,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColors.whiteButtonColor,
                  width: Dimensions.margin10Width*33,
                  height: Dimensions.margin10Height*33,
                  child: Icon(
                    size: Dimensions.font10*8,
                    Icons.camera_alt,
                    color: AppColors.greyText,
                    ),
                      ),
                ),
            ),
            SizedBox(height: Dimensions.margin10Height*3),
            EditedText(color: Theme.of(context).colorScheme.tertiaryContainer, text: names[index], size: Dimensions.font10*3.5, fontWeight: FontWeight.w400)
          ],
        )
    );
  }
}
