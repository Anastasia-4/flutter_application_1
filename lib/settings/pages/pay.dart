import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';

class Pay extends StatefulWidget {
  const Pay({super.key});

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            width: Dimensions.mainWidthContainer,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
                color: AppColors.darkMainColor),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Dimensions.margin10Height*9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: Dimensions.margin10Width * 85,
                        height: Dimensions.margin10Height * 98.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Dimensions.cornerRadius20),
                            color: AppColors.darkBgColor),
                      ),
                      Container(
                        width: Dimensions.margin10Width * 85,
                        height: Dimensions.margin10Height * 98.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Dimensions.cornerRadius20),
                            color: AppColors.darkBgColor),
                      )
                    ],
                  ),
                  SizedBox(height: Dimensions.margin10Height*9),
                  Container(
                        width: Dimensions.margin10Width * 162.1,
                        height: Dimensions.margin10Height * 98.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Dimensions.cornerRadius20),
                            color: AppColors.darkBgColor),
                      ),
                  SizedBox(height: Dimensions.margin10Height*9),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
