import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';

class Devices extends StatefulWidget {
  const Devices({super.key});

  @override
  State<Devices> createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Dimensions.margin10Width*3.7),
      child: DefaultTabController(
        length: 8,
        child: Scaffold(
          appBar: AppBar(
              toolbarHeight: 0,
              bottom: TabBar(
                tabAlignment: TabAlignment.start,
                labelPadding: EdgeInsets.zero,
                isScrollable: true,
                indicator: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.cornerRadius20), topRight: Radius.circular(Dimensions.cornerRadius20)), // Creates border
                color: AppColors.darkMainColor),
                tabs: [
                  Tab(
                      height: Dimensions.margin10Height * 10.5,
                      child: SizedBox(
                        width: Dimensions.margin10Width * 32.4,
                        child: EditedText(
                            color: AppColors.whiteText,
                            text: 'Устройство',
                            size: Dimensions.font10 * 3.5,
                            fontWeight: FontWeight.w700),
                      )),
                  Tab(
                      height: Dimensions.margin10Height * 10,
                      child: SizedBox(
                        width: Dimensions.margin10Width * 32.4,
                        child: EditedText(
                            color: AppColors.whiteText,
                            text: 'Устройство',
                            size: Dimensions.font10 * 3.5,
                            fontWeight: FontWeight.w700),
                      )),
                      Tab(
                      height: Dimensions.margin10Height * 10,
                      child: SizedBox(
                        width: Dimensions.margin10Width * 32.4,
                        child: EditedText(
                            color: AppColors.whiteText,
                            text: 'Устройство',
                            size: Dimensions.font10 * 3.5,
                            fontWeight: FontWeight.w700),
                      )),
                      Tab(
                      height: Dimensions.margin10Height * 10,
                      child: SizedBox(
                        width: Dimensions.margin10Width * 32.4,
                        child: EditedText(
                            color: AppColors.whiteText,
                            text: 'Устройство',
                            size: Dimensions.font10 * 3.5,
                            fontWeight: FontWeight.w700),
                      )),
                      Tab(
                      height: Dimensions.margin10Height * 10,
                      child: SizedBox(
                        width: Dimensions.margin10Width * 32.4,
                        child: EditedText(
                            color: AppColors.whiteText,
                            text: 'Устройство',
                            size: Dimensions.font10 * 3.5,
                            fontWeight: FontWeight.w700),
                      )),
                      Tab(
                      height: Dimensions.margin10Height * 10,
                      child: SizedBox(
                        width: Dimensions.margin10Width * 32.4,
                        child: EditedText(
                            color: AppColors.whiteText,
                            text: 'Устройство',
                            size: Dimensions.font10 * 3.5,
                            fontWeight: FontWeight.w700),
                      )),
                      Tab(
                      height: Dimensions.margin10Height * 10,
                      child: SizedBox(
                        width: Dimensions.margin10Width * 32.4,
                        child: EditedText(
                            color: AppColors.whiteText,
                            text: 'Устройство',
                            size: Dimensions.font10 * 3.5,
                            fontWeight: FontWeight.w700),
                      )),
                      Tab(
                      height: Dimensions.margin10Height * 10,
                      child: SizedBox(
                        width: Dimensions.margin10Width * 32.4,
                        child: EditedText(
                            color: AppColors.whiteText,
                            text: 'Устройство',
                            size: Dimensions.font10 * 3.5,
                            fontWeight: FontWeight.w700),
                      )),
                ],
              )),
          body: TabBarView(
            physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
            children: [
              Center(child: Text('1')),
              Center(child: Text('2')),
              Center(child: Text('3')),
              Center(child: Text('4')),
              Center(child: Text('5')),
              Center(child: Text('5')),
              Center(child: Text('5')),
              Center(child: Text('5')),
            ],
          ),
        ),
      ),
    );
  }
}
