/*import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/database_service.dart';
import 'package:flutter_application_1/services/device_model.dart';
import 'package:flutter_application_1/settings/settings_main.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
//import 'package:flutter_application_1/widgets/device_tile.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/provider/time_provider.dart';
import 'package:provider/provider.dart';
class DevicesList extends StatefulWidget {
  const DevicesList({super.key});

  @override
  State<DevicesList> createState() => _DevicesListState();

}

class _DevicesListState extends State<DevicesList> {
  final DatabaseService _databaseService = DatabaseService.instance;
  int _selectedTile = 0;
  //var timers = List<int>.generate(4, (index) => index*index);
  var stopwatches = new List.generate(4, (index) => Stopwatch());
  var timers = new List.generate(4, (index) => Timer(Duration(seconds: 1), () => {}));
  var durations = new List.generate(4, (index) => Duration(milliseconds: 0));

  @override
  void initState() {
    super.initState();
  }

  void handleStartStop() {
    if(stopwatches[_selectedTile].isRunning) {
      stopwatches[_selectedTile].stop();
      timers[_selectedTile].cancel();
    }
    else {
      stopwatches[_selectedTile].start();
    }
  }

  void reset(){
    stopwatches[_selectedTile].reset();
  }

  void setDuration(int minutes){
    if (timers[_selectedTile].isActive == false){
      durations[_selectedTile] = Duration(minutes: minutes);
    }
  }

  void start(int index){
    if (timers[index].isActive == false){
      timers[index] = Timer.periodic(Duration(seconds: 1), (_) => subtractTime(index));
    }
  }
    void subtractTime(int index) {
    setState( () {
      final seconds = durations[index].inSeconds - 1;
    if (seconds < 0){
      timers[index].cancel();
    }else{
      durations[index] = Duration(seconds: seconds);
    }
    });
  }


    String returnFormattedText(int id) {
    var milli = durations[id].inMilliseconds;
 
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0"); // this is for the second
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0"); // this is for the minute
 
    return "$minutes:$seconds";
  }



  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
            child: FutureBuilder(
                future: _databaseService.getDevice(),
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      Container(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            Device device = snapshot.data![index];
                            if(_selectedTile == index && durations[index] != 0){
                              start(index);
                            }
                            return GestureDetector(
                              child: Container(
                                  height: Dimensions.devicesListHeight,
                                  margin: EdgeInsets.only(
                                      left: Dimensions.margin10Width * 2,
                                      right: Dimensions.margin10Width * 2,
                                      bottom: Dimensions.margin10Height * 5.9),
                                  padding: EdgeInsets.only(
                                      left: Dimensions.margin10Width * 1.5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.cornerRadius20),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width:
                                                  Dimensions.margin10Width * 25,
                                              height:
                                                  Dimensions.margin10Height * 8.2,
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: AppColors
                                                              .darkerGreyText))),
                                              child: EditedText(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .tertiary,
                                                  text: device.name,
                                                  size: Dimensions.font10 * 3.5,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              width:
                                                  Dimensions.margin10Width * 20,
                                              height:
                                                  Dimensions.margin10Height * 8.2,
                                              child: 
                                              EditedText(
                                                  color: durations[index].inSeconds < 300 && durations[index].inSeconds > 0
                                                  ? AppColors.redButtonColor
                                                  : Theme.of(context)
                                                      .colorScheme
                                                      .tertiary,
                                                  text: returnFormattedText(index) == "00:00" ? "--:--" : returnFormattedText(index),
                                                  size: Dimensions.font10 * 7,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ]),
                                      Container(
                                        width: Dimensions.margin10Width * 8.3,
                                        child: RotatedBox(
                                          quarterTurns: 3,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Transform.flip(
                                                    flipX: true,
                                                    child: Image.asset(
                                                      height: Dimensions
                                                              .margin10Width *
                                                          4.7,
                                                      width: Dimensions
                                                              .margin10Height *
                                                          2.9,
                                                      'assets/image/controller.png',
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  EditedText(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .tertiary,
                                                      text: '100',
                                                      size:
                                                          Dimensions.font10 * 2.5,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Image.asset(
                                                    height:
                                                        Dimensions.margin10Width *
                                                            3.8,
                                                    width: Dimensions
                                                            .margin10Height *
                                                        5.6,
                                                    'assets/image/VRheadset.png',
                                                    fit: BoxFit.contain,
                                                  ),
                                                  EditedText(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .tertiary,
                                                      text: '100',
                                                      size:
                                                          Dimensions.font10 * 2.5,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Image.asset(
                                                    height:
                                                        Dimensions.margin10Width *
                                                            4.7,
                                                    width: Dimensions
                                                            .margin10Height *
                                                        2.9,
                                                    'assets/image/controller.png',
                                                    fit: BoxFit.fill,
                                                  ),
                                                  EditedText(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .tertiary,
                                                      text: '100',
                                                      size:
                                                          Dimensions.font10 * 2.5,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            onTap: () {
                              setState(() {
                                _selectedTile = index;
                              });
                              setDuration(index+2);
                            },
                            );
                          },
                        ),
                      ),
                      Container(
                          height: Dimensions.margin10Height * 16.5,
                          width: Dimensions.devicesListWidth,
                          margin: EdgeInsets.only(
                              left: Dimensions.margin10Width * 2,
                              right: Dimensions.margin10Width * 2,
                              bottom: Dimensions.margin10Height * 5.9),
                          padding: EdgeInsets.only(
                              left: Dimensions.margin10Width * 1.5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Dimensions.cornerRadius20),
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer),
                          child: GestureDetector(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                EditedText(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    text: 'Не активировано',
                                    size: Dimensions.font10 * 3.5,
                                    fontWeight: FontWeight.w500),
                                Container(
                                  alignment: Alignment.center,
                                  height: Dimensions.margin10Height * 5.7,
                                  width: Dimensions.margin10Width * 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.cornerRadius20 / 2),
                                      color: AppColors.yellowButtonColor),
                                  child: EditedText(
                                      color: AppColors.blackText,
                                      text: 'Активировать',
                                      size: Dimensions.font10 * 2.5,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            onTap: () {
                              Get.to(() => SettingsMain(),
                                  transition: Transition.fadeIn);
                            },
                          ))
                    ],
                  );
                })));
  }
}*/