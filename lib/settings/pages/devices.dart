import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/database_service.dart';
import 'package:flutter_application_1/services/device_model.dart';
import 'package:flutter_application_1/settings/sharedPreferencesHelper.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/utils/global_variables.dart';
import 'package:flutter_application_1/widgets/dialog.dart';
import 'package:flutter_application_1/widgets/dialog_content.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';
import 'package:flutter_application_1/widgets/ip_dialog_content.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Devices extends StatefulWidget {
  const Devices({super.key});

  @override
  State<Devices> createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
  late TextEditingController nameController;
  late TextEditingController numController;
  final DatabaseService _databaseService = DatabaseService.instance;
  int selectedDevice = -1;
  int selectedIndex = 0;
  int finalDevicesCount = 5;
  int currentDevicesCount = 0;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    numController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _getDb();
      setState(() {});
    });
      
  }

  _getDb() async {
    currentDevicesCount = await _databaseService.getCount();
    isLoaded = true;
  }

  @override
  void dispose() {
    nameController.dispose();
    numController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(left: Dimensions.margin10Width * 2.7),
      child: Column(
        children: [ isLoaded
        ? SizedBox(
            height: Dimensions.margin10Height * 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: Dimensions.margin10Width * 160,
                    child: _devicesList()),
                Expanded(
                    child: Center(
                  child: GestureDetector(
                    child: Container(
                        alignment: Alignment.center,
                        width: Dimensions.margin10Width * 33.5,
                        height: Dimensions.margin10Height * 7.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Dimensions.cornerRadius20),
                            color: (currentDevicesCount == finalDevicesCount)
                                ? Color(0xFF89631A)
                                : AppColors.yellowButtonColor),
                        child: EditedText(
                            color: AppColors.blackText,
                            text: 'Добавить',
                            size: Dimensions.font10 * 3.3,
                            fontWeight: FontWeight.w500)),
                    onTap: () {
                      setState(() {
                        nameController.text = "";
                        numController.text = "";
                      });
                      if (currentDevicesCount == finalDevicesCount){
                        null;
                      } else {
                        openDialog();
                        Feedback.forTap(context);
                      }
                    },
                  ),
                ))
              ],
            ),
          )
        : SizedBox(height: Dimensions.margin10Height * 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                  top: Dimensions.margin10Height * 7.7,
                  left: Dimensions.margin10Width * 5.8,
                  right: Dimensions.margin10Width * 5.8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(Dimensions.cornerRadius20)),
                color: AppColors.darkMainColor,
              ),
              child: _deviceInfo(),
            ),
          )
        ],
      ),
    )
        );
  }

  Widget _devicesList() {
    return FutureBuilder(
        future: _databaseService.getDevice(),
        builder: (context, snapshot) {
          currentDevicesCount = snapshot.data?.length ?? 0;
          currentDevicesCount == 0 ? selectedDevice = -1 : selectedDevice = 0;
          return Container(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  Device device = snapshot.data![index];
                  return GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(left: Dimensions.border1 * 2),
                        decoration: BoxDecoration(
                            border: selectedIndex == index
                                ? (index == 0
                                    ? Border.symmetric(
                                        vertical: BorderSide(
                                            color: Colors.transparent,
                                            width: Dimensions.border1))
                                    : Border(
                                        right: BorderSide(
                                            color: Colors.transparent,
                                            width: Dimensions.border1)))
                                : (index == 0
                                    ? Border(
                                        right: BorderSide(
                                            color: (selectedIndex - index) == 1
                                                ? Colors.transparent
                                                : AppColors.greyText,
                                            width: Dimensions.border1),
                                        left: BorderSide(
                                            color: AppColors.greyText,
                                            width: Dimensions.border1))
                                    : Border(
                                        right: BorderSide(
                                            color: (selectedIndex - index) == 1
                                                ? Colors.transparent
                                                : AppColors.greyText,
                                            width: Dimensions.border1)))),
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top:
                                    Radius.circular(Dimensions.cornerRadius20)),
                            color: selectedIndex == index
                                ? AppColors.darkMainColor
                                : AppColors.darkBgColor,
                          ),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                                left: Dimensions.margin10Width * 4.7),
                            child: EditedText(
                                color: selectedIndex == index
                                    ? AppColors.whiteText
                                    : AppColors.greyText,
                                text: device.name,
                                size: Dimensions.font10 * 3.5,
                                fontWeight: selectedIndex == index
                                    ? FontWeight.w700
                                    : FontWeight.w400),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      });
                }),
          );
        });
  }

  Widget _deviceInfo() {
    return FutureBuilder(
        future: _databaseService.getDevice(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          currentDevicesCount = snapshot.data?.length ?? 0;
          if (snapshot.hasData && currentDevicesCount != 0) {
            Device deviceInfo = snapshot.data![selectedIndex];
            selectedDevice = deviceInfo.id;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EditedText(
                    color: AppColors.greyText,
                    text: 'Ip устройства',
                    size: Dimensions.font10 * 3.5,
                    fontWeight: FontWeight.w700),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding:
                          EdgeInsets.only(left: Dimensions.margin10Width * 4),
                      width: Dimensions.margin10Width * 150,
                      height: Dimensions.margin10Height * 12.3,
                      decoration: BoxDecoration(
                          color: AppColors.darkBgColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.cornerRadius15),
                          border: Border.all(
                              color: AppColors.greyText,
                              width: Dimensions.border1)),
                      child: EditedText(
                          color: AppColors.whiteText,
                          text: deviceInfo.serialNum,
                          size: Dimensions.font10 * 3.5,
                          fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: Dimensions.margin10Width * 33.5,
                        height: Dimensions.margin10Height * 7,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.cornerRadius20),
                          color: AppColors.yellowButtonColor,
                        ),
                        child: EditedText(
                            color: AppColors.blackText,
                            text: 'Редактировать',
                            size: Dimensions.font10 * 3,
                            fontWeight: FontWeight.w500),
                      ),
                      onTap: () {
                        setState(() {
                          nameController.text = deviceInfo.name;
                          numController.text =ipFormatter.maskText(deviceInfo.serialNum);
                          Feedback.forTap(context);
                        });
                        updateDialog();
                      },
                    )
                  ],
                ),
                SizedBox(height: Dimensions.margin10Height * 6),
                EditedText(
                    color: AppColors.greyText,
                    text: 'Ip телевизора для трансляции',
                    size: Dimensions.font10 * 3.5,
                    fontWeight: FontWeight.w700),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding:
                          EdgeInsets.only(left: Dimensions.margin10Width * 4),
                      width: Dimensions.margin10Width * 150,
                      height: Dimensions.margin10Height * 12.3,
                      decoration: BoxDecoration(
                          color: AppColors.darkBgColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.cornerRadius15),
                          border: Border.all(
                              color: AppColors.greyText,
                              width: Dimensions.border1)),
                      child: EditedText(
                          color: AppColors.whiteText,
                          text: "${deviceInfo.ipNum}",
                          size: Dimensions.font10 * 3.5,
                          fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: Dimensions.margin10Width * 33.5,
                        height: Dimensions.margin10Height * 7,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.cornerRadius20),
                          color: AppColors.yellowButtonColor,
                        ),
                        child: EditedText(
                            color: AppColors.blackText,
                            text: 'Редактировать',
                            size: Dimensions.font10 * 3,
                            fontWeight: FontWeight.w500),
                      ),
                      onTap: () {
                        Feedback.forTap(context);
                        IPDialog();
                        setState(() {
                        });
                      },
                    )
                  ],
                ),
                SizedBox(height: Dimensions.margin10Height * 6),
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    width: Dimensions.margin10Width * 43.5,
                    height: Dimensions.margin10Height * 7,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.cornerRadius20),
                      color: AppColors.yellowButtonColor,
                    ),
                    child: EditedText(
                        color: AppColors.blackText,
                        text: GlobalVariables.canDelete == true
                        ? 'Удалить устройство'
                        : 'Хрен',
                        size: Dimensions.font10 * 3,
                        fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                      Feedback.forTap(context);
                      if (GlobalVariables.canDelete == true){
                      _databaseService.deleteDevice(deviceInfo.id);
                      setState(() {
                        currentDevicesCount--;
                        selectedIndex = 0;
                      });
                      } else {
                        errorDelete();
                      }
                  },
                )
              ],
            );
          } else {
            return Center(
                child: EditedText(
                    color: AppColors.whiteText,
                    text: 'Нет устройств',
                    size: Dimensions.font10 * 3,
                    fontWeight: FontWeight.w500));
          }
        });
  }

  Future<void> openDialog() => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: AppColors.darkMainColor,
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
                      if (numController.text.isNotEmpty &&
                          nameController.text.isNotEmpty && numController.text.length == 15) {
                        _databaseService.addDevice(
                            nameController.text, numController.text);
                            Feedback.forTap(context);
                        setState(() {
                          nameController.text = "";
                          numController.text = "";
                          currentDevicesCount++;
                        });
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              ),
            ],
          ));

  Future<void> IPDialog() => showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.cornerRadius25)),
      backgroundColor: AppColors.darkMainColor,
      contentPadding: EdgeInsets.zero,
      content: IpDialogContent(),
      actions: [
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
                      if (GlobalVariables.selectedIP != -1) {
                        setState(() {
                          _databaseService.addIPDevice(selectedDevice, GlobalVariables.selectedIP_text);
                          GlobalVariables.changeIP(-1);
                      });
                        Navigator.of(context).pop();
                      }
                    },
                  ),
      ],
    );
        }  
    );
        
    Future<void> errorDelete() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: AppColors.darkMainColor,
            content: Container(
              alignment: Alignment.center,
              width: Dimensions.margin10Width*100,
              height: Dimensions.margin10Height*35,
              child: EditedText(color: AppColors.whiteText, text: 'Сначала отключите все таймеры', size: Dimensions.font10*5, fontWeight: FontWeight.w700),
              ),
            actions: [
              GestureDetector(
                    child: Container(
                        alignment: Alignment.center,
                        width: Dimensions.margin10Width * 25,
                        height: Dimensions.margin10Height * 9,
                        child: EditedText(
                            color: AppColors.whiteText,
                            text: 'ОК',
                            size: Dimensions.font10 * 4,
                            fontWeight: FontWeight.w600)),
                    onTap: () {
                        Feedback.forTap(context);
                        Navigator.of(context).pop();
                    },
                  ),
            ],
          ));
  
  Future<void> updateDialog() => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: AppColors.darkMainColor,
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
                      if (numController.text.isNotEmpty &&
                          nameController.text.isNotEmpty && numController.text.length == 15) {
                        _databaseService.updateDevice(selectedDevice,
                            nameController.text, numController.text);
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


  var ipFormatter = new MaskTextInputFormatter(
      mask: '###.###.###.###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
}
