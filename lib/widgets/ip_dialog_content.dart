import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/settings/sharedPreferencesHelper.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/utils/global_variables.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class IpDialogContent extends StatefulWidget {
  const IpDialogContent({super.key});

  @override
  State<IpDialogContent> createState() => _IpDialogContentState();
}

class _IpDialogContentState extends State<IpDialogContent> {
  var ipController;

  @override
  void initState() {
    ipController = List.generate(GlobalVariables.finalDevicesCount, (index) => TextEditingController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.margin10Height*1.5, horizontal: Dimensions.margin10Width*4),
      width: Dimensions.margin10Width * 200,
      height: Dimensions.margin10Height * 76,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Dimensions.margin10Width * 28,
                height: Dimensions.margin10Height * 7),
              EditedText(color: AppColors.whiteText, text: "Список трансляций :", size: Dimensions.font10*4.8, fontWeight: FontWeight.w700),
              GestureDetector(
                      child: Container(
                          margin: EdgeInsets.only(
                              bottom: Dimensions.margin10Height * 5),
                          child: Container(
                            padding: EdgeInsets.only(
                                left: Dimensions.margin10Width,
                                right: Dimensions.margin10Width),
                            width: Dimensions.margin10Width*28,
                            height: Dimensions.margin10Height*7,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.cornerRadius15),
                                color: AppColors.blueButtonColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/image/exit.png',
                                  width: Dimensions.margin10Width * 5,
                                  fit: BoxFit.contain,
                                ),
                                EditedText(
                                  color: AppColors.whiteText,
                                  text: "  Закрыть",
                                  size: Dimensions.font10 * 3.2,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          )),
                      onTap: () {
                        Feedback.forTap(context);
                        Navigator.pop(context);
                      },
                    ),
            ],
          ),
          SizedBox(height: Dimensions.margin10Height*2),
          Expanded(child: SingleChildScrollView(
            child: ListView.builder(
                physics:NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: GlobalVariables.finalDevicesCount,
                itemBuilder: (context, index) {
                  ipController[index].text = SharedPreferencesHelper.getString('IP $index') ?? '';
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        GlobalVariables.changeIP(index);
                        GlobalVariables.changeIP_text(ipController[index].text);
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EditedText(
                    color: Theme.of(context).colorScheme.tertiary,
                    text: "Ip телевизора для трансляции",
                    size: Dimensions.font10 * 3.5,
                    fontWeight: FontWeight.w700),
                                  Container(
                                    margin: EdgeInsets.only(bottom: Dimensions.margin10Height*3.5),
                                    width: Dimensions.margin10Width * 150,
                                    height: Dimensions.margin10Height * 12.3,
                                    child: TextFormField(
                    controller: ipController[index],
                    inputFormatters: [ipFormatter],
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                        fontSize: Dimensions.font10 * 3.5,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500),
                        onChanged: (text) {
                          SharedPreferencesHelper.setString('IP $index', ipFormatter.maskText(ipController[index].text));
                        },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.primaryContainer,
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.cornerRadius15),
                          borderSide: BorderSide(
                              color: AppColors.darkerGreyText,
                              width: GlobalVariables.selectedIP == index ? Dimensions.border1*4 : Dimensions.border1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.cornerRadius15),
                          borderSide: BorderSide(
                              color: AppColors.darkerGreyText,
                              width: GlobalVariables.selectedIP == index ? Dimensions.border1*4 : Dimensions.border1)),

                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.cornerRadius15),
                          borderSide: BorderSide(
                              color: AppColors.darkerGreyText,
                              width: GlobalVariables.selectedIP == index ? Dimensions.border1*4 : Dimensions.border1)),
                    ),
                                    ),
                                  ),
                      ],
                    ),
                  );
                }),
          )
          )
        ],
      )
      );
  }
  var ipFormatter = new MaskTextInputFormatter(
      mask: '###.###.###.###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
}