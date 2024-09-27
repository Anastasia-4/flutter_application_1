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
              Column(
                children: [
                  ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index){
                return getDevice(index);
              },
              ),
              Container(
                height: Dimensions.margin10Height*16.5,
                width: Dimensions.devicesListWidth,
                margin: EdgeInsets.only(left: Dimensions.margin10Width*2, right: Dimensions.margin10Width*2, bottom: Dimensions.margin10Height*5.9),
                padding: EdgeInsets.only(left: Dimensions.margin10Width*1.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                  color: AppColors.darkBgColor
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  EditedText(color: AppColors.greyText, text: 'Не активировано', size: Dimensions.font10*3.5, fontWeight: FontWeight.w500),
                  Container(
                    alignment: Alignment.center,
                    height: Dimensions.margin10Height*5.7,
                    width: Dimensions.margin10Width*20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.cornerRadius20/2),
                      color: AppColors.yellowButtonColor
                  ),
                  child: EditedText(color: AppColors.blackText, text: 'Активировать', size: Dimensions.font10*2.5, fontWeight: FontWeight.w500),
                  )
                ],
              )
              )
                ],
              ),
              )
              );          

  }
}

Widget getDevice(int index){
  return Container(
    height: Dimensions.devicesListHeight,
    margin: EdgeInsets.only(left: Dimensions.margin10Width*2, right: Dimensions.margin10Width*2, bottom: Dimensions.margin10Height*5.9),
    padding: EdgeInsets.only(left: Dimensions.margin10Width*1.5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
      color: AppColors.darkBgColor,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: Dimensions.margin10Width*25,
              height: Dimensions.margin10Height*8.2,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.whiteButtonColor))
              ),
              child: EditedText(color: AppColors.greyText, text: 'Устройство $index', size: Dimensions.font10*3.5, fontWeight: FontWeight.w500),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: Dimensions.margin10Width*25,
              height: Dimensions.margin10Height*8.2,
              child: EditedText(color: AppColors.greyText, text: '00:00', size: Dimensions.font10*7, fontWeight: FontWeight.w900),
            ),
          ]
        ),
        Container(
          width: Dimensions.margin10Width*8.3,
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
                                height: Dimensions.margin10Width*4.7,
                                width: Dimensions.margin10Height*2.9,
                              'assets/image/controller.png',
                              fit: BoxFit.fill,
                              ),
                              ),
                            EditedText(color: AppColors.greyText, text: '100', size: Dimensions.font10*2.5, fontWeight: FontWeight.w700),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                height: Dimensions.margin10Width*3.8,
                                width: Dimensions.margin10Height*5.6,
                              'assets/image/VRheadset.png',
                              fit: BoxFit.contain,
                              ),
                            EditedText(color: AppColors.greyText, text: '100', size: Dimensions.font10*2.5, fontWeight: FontWeight.w700),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Image.asset(
                                height: Dimensions.margin10Width*4.7,
                                width: Dimensions.margin10Height*2.9,
                              'assets/image/controller.png',
                              fit: BoxFit.fill,
                              ),
                            EditedText(color: AppColors.greyText, text: '100', size: Dimensions.font10*2.5, fontWeight: FontWeight.w700),
                            ],
                          ),
                        ],
          ),
          ),
        )
      ],
    )
  );
}

