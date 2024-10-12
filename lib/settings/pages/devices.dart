import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/database_service.dart';
import 'package:flutter_application_1/services/device_model.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';
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

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    numController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    numController.dispose();
    super.dispose();
  }

  int finalDevicesCount = 5;
  int currentDevicesCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(left: Dimensions.margin10Width * 2.7),
      child: Column(
        children: [
          SizedBox(
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
                      (currentDevicesCount == finalDevicesCount)
                          ? null
                          : openDialog();
                    },
                  ),
                ))
              ],
            ),
          ),
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
    ));
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
                          numController.text =
                              ipFormatter.maskText(deviceInfo.serialNum);
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
                          text: "${deviceInfo.id}",
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
                      onTap: () {},
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
                        text: 'Удалить устройство',
                        size: Dimensions.font10 * 3,
                        fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    _databaseService.deleteDevice(deviceInfo.id);
                    setState(() {
                      currentDevicesCount--;
                      selectedIndex = 0;
                    });
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
            content: dialogContent(),
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

  Future<void> updateDialog() => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: AppColors.darkMainColor,
            content: dialogContent(),
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
                        print(selectedDevice);
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

  Widget dialogContent() {
    return SizedBox(
      width: Dimensions.margin10Width * 125,
      height: Dimensions.margin10Height * 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: Container(
                  width: Dimensions.margin10Width * 9.2,
                  height: Dimensions.margin10Height * 6.5,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.cornerRadius15),
                      color: AppColors.blueButtonColor),
                  child: Icon(Icons.close,
                      color: AppColors.whiteText, size: Dimensions.font10 * 4),
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EditedText(
                  color: Theme.of(context).colorScheme.tertiary,
                  text: "Название устройства",
                  size: Dimensions.font10 * 3.5,
                  fontWeight: FontWeight.w700),
              Container(
                width: Dimensions.margin10Width * 131.6,
                height: Dimensions.margin10Height * 10.8,
                child: TextFormField(
                  controller: nameController,
                  autofocus: true,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                      fontSize: Dimensions.font10 * 3.5,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.primaryContainer,
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.cornerRadius15),
                        borderSide: BorderSide(
                            color: AppColors.darkerGreyText,
                            width: Dimensions.border1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.cornerRadius15),
                        borderSide: BorderSide(
                            color: AppColors.darkerGreyText,
                            width: Dimensions.border1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.cornerRadius15),
                        borderSide: BorderSide(
                            color: AppColors.darkerGreyText,
                            width: Dimensions.border1)),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EditedText(
                  color: Theme.of(context).colorScheme.tertiary,
                  text: "Ip устройства",
                  size: Dimensions.font10 * 3.5,
                  fontWeight: FontWeight.w700),
              Container(
                width: Dimensions.margin10Width * 131.6,
                height: Dimensions.margin10Height * 10.8,
                child: TextFormField(
                  controller: numController,
                  inputFormatters: [ipFormatter],
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                      fontSize: Dimensions.font10 * 3.5,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.primaryContainer,
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.cornerRadius15),
                        borderSide: BorderSide(
                            color: AppColors.darkerGreyText,
                            width: Dimensions.border1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.cornerRadius15),
                        borderSide: BorderSide(
                            color: AppColors.darkerGreyText,
                            width: Dimensions.border1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.cornerRadius15),
                        borderSide: BorderSide(
                            color: AppColors.darkerGreyText,
                            width: Dimensions.border1)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  var ipFormatter = new MaskTextInputFormatter(
      mask: '###.###.###.###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
}
