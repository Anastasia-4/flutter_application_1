import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';

class DevicesList extends StatefulWidget {
  const DevicesList({super.key});

  @override
  State<DevicesList> createState() => _DevicesListState();
}

class _DevicesListState extends State<DevicesList> {
  @override
  Widget build(BuildContext context) {
    return  
              Expanded(
                child: SingleChildScrollView(
                  child: 
              ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index){
                return getDevice(index);
              },
              ),
              )
              );          

  }
}

Widget getDevice(int index){
  return Container(
    width: Dimensions.devicesListWidth,
    height: Dimensions.devicesListHeight,
    margin: EdgeInsets.all(5),
    color: AppColors.darkBgColor,
    child: EditedText(color: AppColors.greyText, text: 'Устройство $index', size: Dimensions.font10*3.5, fontWeight: FontWeight.w500),
  );
}