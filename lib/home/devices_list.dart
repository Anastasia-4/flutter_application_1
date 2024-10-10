import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/drawerProvider.dart';
import 'package:flutter_application_1/services/database_service.dart';
import 'package:flutter_application_1/services/device_model.dart';
import 'package:flutter_application_1/settings/settings_main.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';
import 'package:get/get.dart';

class DevicesList extends StatefulWidget {
  const DevicesList({super.key});

  @override
  State<DevicesList> createState() => _DevicesListState();
}

class _DevicesListState extends State<DevicesList> {
  late DrawerProvider drawerProvider;
  final DatabaseService _databaseService = DatabaseService.instance;

  @override
  void initState() {
    drawerProvider = DrawerProvider();
    super.initState();
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
                            return Container(
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
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
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
                                            alignment: Alignment.centerLeft,
                                            width:
                                                Dimensions.margin10Width * 25,
                                            height:
                                                Dimensions.margin10Height * 8.2,
                                            child: EditedText(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary,
                                                text: '00:00',
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
                                ));
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
                                    color: Theme.of(context).colorScheme.tertiary,
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
                              //drawerProvider.selectedMenu(3);
                              Get.to(() => SettingsMain(), transition: Transition.fadeIn);
                            },
                          ))
                    ],
                  );
                })));
  }

  /*Widget getDevice(int index) {
    return Container(
        height: Dimensions.devicesListHeight,
        margin: EdgeInsets.only(
            left: Dimensions.margin10Width * 2,
            right: Dimensions.margin10Width * 2,
            bottom: Dimensions.margin10Height * 5.9),
        padding: EdgeInsets.only(left: Dimensions.margin10Width * 1.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                alignment: Alignment.centerLeft,
                width: Dimensions.margin10Width * 25,
                height: Dimensions.margin10Height * 8.2,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: AppColors.darkerGreyText))),
                child: EditedText(
                    color: Theme.of(context).colorScheme.tertiary,
                    text: device.name,
                    size: Dimensions.font10 * 3.5,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: Dimensions.margin10Width * 25,
                height: Dimensions.margin10Height * 8.2,
                child: EditedText(
                    color: Theme.of(context).colorScheme.tertiary,
                    text: '00:00',
                    size: Dimensions.font10 * 7,
                    fontWeight: FontWeight.w900),
              ),
            ]),
            Container(
              width: Dimensions.margin10Width * 8.3,
              child: RotatedBox(
                quarterTurns: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Transform.flip(
                          flipX: true,
                          child: Image.asset(
                            height: Dimensions.margin10Width * 4.7,
                            width: Dimensions.margin10Height * 2.9,
                            'assets/image/controller.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        EditedText(
                            color: Theme.of(context).colorScheme.tertiary,
                            text: '100',
                            size: Dimensions.font10 * 2.5,
                            fontWeight: FontWeight.w700),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          height: Dimensions.margin10Width * 3.8,
                          width: Dimensions.margin10Height * 5.6,
                          'assets/image/VRheadset.png',
                          fit: BoxFit.contain,
                        ),
                        EditedText(
                            color: Theme.of(context).colorScheme.tertiary,
                            text: '100',
                            size: Dimensions.font10 * 2.5,
                            fontWeight: FontWeight.w700),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          height: Dimensions.margin10Width * 4.7,
                          width: Dimensions.margin10Height * 2.9,
                          'assets/image/controller.png',
                          fit: BoxFit.fill,
                        ),
                        EditedText(
                            color: Theme.of(context).colorScheme.tertiary,
                            text: '100',
                            size: Dimensions.font10 * 2.5,
                            fontWeight: FontWeight.w700),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }*/
}
