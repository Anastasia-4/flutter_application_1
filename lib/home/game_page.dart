import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home/timer.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';
import 'package:flutter_application_1/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  final List<String> images = [
    'assets/image/arizonaSunshine.png',
    'assets/image/jobSimulator.png',
    'assets/image/superHot.png',
    'assets/image/hero_capsule.png',
    'assets/image/subnautica.png',
    'assets/image/phasmophobia.png',
    'assets/image/arizonaSunshine.png',
    'assets/image/jobSimulator.png',
    'assets/image/superHot.png',
    'assets/image/hero_capsule.png',
    'assets/image/subnautica.png',
    'assets/image/phasmophobia.png',
    '',
    '',
  ];
  final List<String> names = [
    'Arizona Sunshine',
    'Job Simulator',
    'Super Hot',
    'Half-Life: Alyx',
    'Subnautica',
    'Phasmophobia',
    'Arizona Sunshine',
    'Job Simulator',
    'Super Hot',
    'Half-Life: Alyx',
    'Subnautica',
    'Phasmophobia',
    'Game',
    'Game',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Container(child: Timer()),
      Expanded(
          child: Container(
        width: Dimensions.mainWidthContainer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.cornerRadius15),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: SingleChildScrollView(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(vertical: Dimensions.margin10Height*6, horizontal: Dimensions.margin10Width),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: Dimensions.margin10Height*7,
                ),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: names.length,
            itemBuilder: (BuildContext context, int index) {
              return getItem(index);
            },
          ),
        ),
      ))
    ]);
  }

  Widget getItem(int index) {
    return GridTile(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.cornerRadius20 / 2),
              child: Image.asset(
                images[index],
                width: Dimensions.margin10Width*33,
                height: Dimensions.margin10Height*33,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColors.whiteButtonColor,
                  width: Dimensions.margin10Width*33,
                  height: Dimensions.margin10Height*33,
                  child: Icon(
                    size: Dimensions.font10*8,
                    Icons.camera_alt,
                    color: AppColors.greyText,
                    ),
                      ),
                ),
            ),
            SizedBox(height: Dimensions.margin10Height*3),
            EditedText(color: Theme.of(context).colorScheme.tertiaryContainer, text: names[index], size: Dimensions.font10*3.5, fontWeight: FontWeight.w400)
          ],
        )
    );
  }
}
