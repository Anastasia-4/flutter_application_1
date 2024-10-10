import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/database_service.dart';
import 'package:flutter_application_1/services/device_model.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';

class Devices extends StatefulWidget {
  const Devices({super.key});

  @override
  State<Devices> createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
  late TextEditingController nameController;
  late TextEditingController numController;
  int selectedDevice = 0;
  final DatabaseService _databaseService = DatabaseService.instance;

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


    int finalDevicesCount = 10;
    int currentDevicesCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: Dimensions.margin10Width*2.7),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.margin10Height*10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: Dimensions.margin10Width*160, child:  _devicesList()),
                  Expanded(child: Center(child: GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: Dimensions.margin10Width*33.5,
                        height: Dimensions.margin10Height*7.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                          color: (currentDevicesCount == finalDevicesCount)
                          ? Color(0xFF89631A)
                          : AppColors.yellowButtonColor
                        ),
                        child: EditedText(color: AppColors.blackText, text: 'Добавить', size: Dimensions.font10*3.3, fontWeight: FontWeight.w500)),
                    onTap: () {
                      (currentDevicesCount == finalDevicesCount)
                      ? null
                      : openDialog();
                    },
                    ),))
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.margin10Height*7.7, left: Dimensions.margin10Width*5.8),
                color: AppColors.darkMainColor,
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
          return Container(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                Device device = snapshot.data![index];
                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(right: Dimensions.border1, left: Dimensions.border1*2),
                    decoration: BoxDecoration(
                      border: selectedDevice == index 
                      ? (index == 0 
                      ? Border.symmetric(vertical: BorderSide(color: Colors.transparent, width: Dimensions.border1)) 
                      : Border(right: BorderSide(color:Colors.transparent, width: Dimensions.border1)))
                      : (index == 0 
                      ? Border(right: BorderSide(color: (selectedDevice - index) == 1 ? Colors.transparent : AppColors.greyText, width: Dimensions.border1) , left: BorderSide(color: AppColors.greyText, width: Dimensions.border1)) 
                      : Border(right: BorderSide(color: (selectedDevice - index) == 1 ? Colors.transparent : AppColors.greyText, width: Dimensions.border1)))
                    ),
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(Dimensions.cornerRadius20)),
                        color: selectedDevice == index ? AppColors.darkMainColor : AppColors.darkBgColor,
                      ),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: Dimensions.margin10Width*4.7),
                        child: EditedText(
                          color: selectedDevice == index ? AppColors.whiteText : AppColors.greyText,
                          text: device.name,
                          size: Dimensions.font10*3.5,
                          fontWeight: selectedDevice == index ? FontWeight.w700 : FontWeight.w400),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedDevice = index;
                    });
                  }
                  );
              }
                          ),
          );
        });
  }

  Widget _deviceInfo() {
    return FutureBuilder(
      future: _databaseService.getDevice(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        currentDevicesCount = snapshot.data?.length ?? 0;
        if (snapshot.hasData){
        Device deviceInfo = snapshot.data![selectedDevice];
          return Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EditedText(color: AppColors.greyText, text: 'Серийный номер', size: Dimensions.font10*3.5, fontWeight: FontWeight.w700),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: Dimensions.margin10Width*4),
                  width: Dimensions.margin10Width*150,
                  height: Dimensions.margin10Height*12.3,
                  decoration: BoxDecoration(
                    color: AppColors.darkBgColor,
                    borderRadius: BorderRadius.circular(Dimensions.cornerRadius15),
                    border: Border.all(color: AppColors.greyText, width: Dimensions.border1)
                  ),
                  child: EditedText(color: AppColors.whiteText, text: deviceInfo.serialNum, size: Dimensions.font10*3.5, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: Dimensions.margin10Height*6),
                EditedText(color: AppColors.greyText, text: 'Ip телевизора для трансляции', size: Dimensions.font10*3.5, fontWeight: FontWeight.w700),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: Dimensions.margin10Width*4),
                      width: Dimensions.margin10Width*150,
                      height: Dimensions.margin10Height*12.3,
                      decoration: BoxDecoration(
                        color: AppColors.darkBgColor,
                        borderRadius: BorderRadius.circular(Dimensions.cornerRadius15),
                        border: Border.all(color: AppColors.greyText, width: Dimensions.border1)
                      ),
                      child: EditedText(color: AppColors.whiteText, text: deviceInfo.serialNum, size: Dimensions.font10*3.5, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
        }
        else{
          return Center(child: CircularProgressIndicator());
        }
      }
      );
  }

  Future<String?> openDialog() => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: AppColors.darkMainColor,
            content: SizedBox(
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
                              borderRadius: BorderRadius.circular(
                                  Dimensions.cornerRadius15),
                              color: AppColors.blueButtonColor),
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
                              color: Theme.of(context)
                                  .colorScheme
                                  .tertiaryContainer,
                              fontSize: Dimensions.font10 * 3.5,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor:
                                Theme.of(context).colorScheme.primaryContainer,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.cornerRadius15),
                                borderSide: BorderSide(
                                    color: AppColors.darkerGreyText,
                                    width: Dimensions.border1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.cornerRadius15),
                                borderSide: BorderSide(
                                    color: AppColors.darkerGreyText,
                                    width: Dimensions.border1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.cornerRadius15),
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
                          text: "Серийный номер ",
                          size: Dimensions.font10 * 3.5,
                          fontWeight: FontWeight.w700),
                      Container(
                        width: Dimensions.margin10Width * 131.6,
                        height: Dimensions.margin10Height * 10.8,
                        child: TextFormField(
                          controller: numController,
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .tertiaryContainer,
                              fontSize: Dimensions.font10 * 3.5,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor:
                                Theme.of(context).colorScheme.primaryContainer,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.cornerRadius15),
                                borderSide: BorderSide(
                                    color: AppColors.darkerGreyText,
                                    width: Dimensions.border1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.cornerRadius15),
                                borderSide: BorderSide(
                                    color: AppColors.darkerGreyText,
                                    width: Dimensions.border1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.cornerRadius15),
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
            ),
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
                      if (numController.text.isNotEmpty) {
                        _databaseService.addDevice(
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
}