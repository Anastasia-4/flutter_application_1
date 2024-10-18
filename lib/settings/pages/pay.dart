import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';
import 'package:flutter_application_1/widgets/pay_check.dart';

class Pay extends StatefulWidget {
  const Pay({super.key});

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  var value = 3;
  var bp_value = 1;
  List<bool> list = [
    true,
    true,
    false,
    false,
    false,
    false,
  ];
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
                border: Border.all(
                    color: Theme.of(context).colorScheme.tertiaryFixed,
                    width: Dimensions.border1,
                    strokeAlign: BorderSide.strokeAlignOutside),
                color: Theme.of(context).colorScheme.primary),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Dimensions.margin10Height * 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.margin10Width * 6),
                        width: Dimensions.margin10Width * 85,
                        height: Dimensions.margin10Height * 98.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Dimensions.cornerRadius20),
                            border: Border.all(
                                color: AppColors.greyText,
                                width: Dimensions.border1),
                            color:
                                Theme.of(context).colorScheme.primaryContainer),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SizedBox(height: Dimensions.margin10Height * 6),
                                EditedText(
                                    color: Theme.of(context).colorScheme.tertiary,
                                    text: 'HOME',
                                    size: Dimensions.font10 * 4.5,
                                    fontWeight: FontWeight.w700),
                                SizedBox(height: Dimensions.margin10Height * 4),
                                EditedText(
                                    color: Theme.of(context).colorScheme.tertiary,
                                    text: '1000 ₽ / месяц',
                                    size: Dimensions.font10 * 4.5,
                                    fontWeight: FontWeight.w500),
                                SizedBox(height: Dimensions.margin10Height * 7),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: EditedText(
                                        color: Theme.of(context).colorScheme.tertiaryContainer,
                                        text:
                                            '• Синхронизация шлема с планшетом \n• Запуск шлема по паролю с планшета\n• Запуск всех игр с планшета\n• Таймер для запуска игр\n• Тех поддержка клиентов',
                                        size: Dimensions.font10 * 3.5,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            Column(
                              children: [
                                EditedText(
                                    color: Theme.of(context).colorScheme.tertiary,
                                    text: '1 устройство',
                                    size: Dimensions.font10 * 3.5,
                                    fontWeight: FontWeight.w700),
                                SizedBox(height: Dimensions.margin10Height * 7),
                                Container(
                                  alignment: Alignment.center,
                                  width: Dimensions.margin10Width * 65.6,
                                  height: Dimensions.settingsBtnHeight,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.cornerRadius20),
                                      color: AppColors.yellowButtonColor),
                                  child: EditedText(
                                      color: AppColors.blackText,
                                      text: 'Оплатить',
                                      size: Dimensions.font10 * 3,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                    height: Dimensions.margin10Height * 5.5),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.margin10Width * 6),
                        width: Dimensions.margin10Width * 85,
                        height: Dimensions.margin10Height * 98.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Dimensions.cornerRadius20),
                            border: Border.all(
                                color: AppColors.greyText,
                                width: Dimensions.border1),
                            color:
                                Theme.of(context).colorScheme.primaryContainer),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SizedBox(height: Dimensions.margin10Height * 6),
                                EditedText(
                                    color: Theme.of(context).colorScheme.tertiary,
                                    text: 'BUSINESS',
                                    size: Dimensions.font10 * 4.5,
                                    fontWeight: FontWeight.w700),
                                SizedBox(height: Dimensions.margin10Height * 4),
                                EditedText(
                                    color: Theme.of(context).colorScheme.tertiary,
                                    text: '2000 ₽ / месяц',
                                    size: Dimensions.font10 * 4.5,
                                    fontWeight: FontWeight.w500),
                                SizedBox(height: Dimensions.margin10Height * 7),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: EditedText(
                                        color: Theme.of(context).colorScheme.tertiaryContainer,
                                        text:
                                            '• Синхронизация шлема с планшетом\n• Запуск всех игр с планшета\n• Таймер для запуска игр\n• Обучающая демо игра\n• Отслеживание уровня зарядки\n• Индикатор перегрева шлема\n• Тех поддержка клиентов',
                                        size: Dimensions.font10 * 3.5,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                EditedText(
                                    color: Theme.of(context).colorScheme.tertiary,
                                    text: 'Количество устройств:',
                                    size: Dimensions.font10 * 3.5,
                                    fontWeight: FontWeight.w700),
                                SizedBox(width: Dimensions.margin10Width * 4.5),
                                Container(
                                  width: Dimensions.margin10Width * 20.6,
                                  height: Dimensions.margin10Height * 6.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.cornerRadius20 / 2),
                                    color: AppColors.yellowButtonColor,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: GestureDetector(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: EditedText(
                                                color: AppColors.blackText,
                                                text: '+',
                                                size: Dimensions.font10 * 4,
                                                fontWeight: FontWeight.w700)),
                                        onTap: () {
                                          setState(() {
                                            if(value < 20 ){
                                              value++;
                                              Feedback.forTap(context);
                                            } else {
                                              value = 20;
                                            }
                                          });
                                        },
                                      )),
                                      Expanded(
                                          child: Container(
                                        alignment: Alignment.center,
                                        color: AppColors.whiteButtonColor,
                                        child: EditedText(
                                            color: AppColors.blackText,
                                            text: '$value',
                                            size: Dimensions.font10 * 4.5,
                                            fontWeight: FontWeight.w700),
                                      )),
                                      Expanded(
                                          child: GestureDetector(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: EditedText(
                                                color: AppColors.blackText,
                                                text: '-',
                                                size: Dimensions.font10 * 4,
                                                fontWeight: FontWeight.w700)),
                                        onTap: () {
                                          setState(() {
                                            if (value > 1) {
                                              value--;
                                              Feedback.forTap(context);
                                            } else {
                                              value = 1;
                                            } 
                                          });
                                        },
                                      )),
                                    ],
                                  ),
                                ),
                                SizedBox(width: Dimensions.margin10Width * 4),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                EditedText(
                                    color: Theme.of(context).colorScheme.tertiary,
                                    text: 'Итого к оплате:',
                                    size: Dimensions.font10 * 3.5,
                                    fontWeight: FontWeight.w700),
                                SizedBox(width: Dimensions.margin10Width * 4.5),
                                Container(
                                  alignment: Alignment.center,
                                  width: Dimensions.margin10Width * 20.6,
                                  height: Dimensions.margin10Height * 6.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.cornerRadius20 / 2),
                                    color: AppColors.whiteButtonColor,
                                  ),
                                  child: EditedText(
                                      color: AppColors.blackText,
                                      text: '${value * 2000}' '₽',
                                      size: Dimensions.font10 * 3.8,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(width: Dimensions.margin10Width * 4),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: Dimensions.margin10Width * 65.6,
                                  height: Dimensions.settingsBtnHeight,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.cornerRadius20),
                                      color: AppColors.yellowButtonColor),
                                  child: EditedText(
                                      color: AppColors.blackText,
                                      text: 'Оплатить',
                                      size: Dimensions.font10 * 3,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                    height: Dimensions.margin10Height * 5.5),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: Dimensions.margin10Height * 9),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.margin10Width * 6),
                    width: Dimensions.margin10Width * 162.1,
                    height: Dimensions.margin10Height * 105,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.cornerRadius20),
                        border: Border.all(
                            color: AppColors.greyText,
                            width: Dimensions.border1),
                        color: Theme.of(context).colorScheme.primaryContainer),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: Dimensions.margin10Height * 6),
                            EditedText(
                                color: Theme.of(context).colorScheme.tertiary,
                                text: 'BUSINESS PRO',
                                size: Dimensions.font10 * 4.5,
                                fontWeight: FontWeight.w700),
                            SizedBox(height: Dimensions.margin10Height * 4),
                            EditedText(
                                color: Theme.of(context).colorScheme.tertiary,
                                text: 'от 2000 ₽ / месяц',
                                size: Dimensions.font10 * 4.5,
                                fontWeight: FontWeight.w500),
                            SizedBox(height: Dimensions.margin10Height * 7),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: EditedText(
                                        color: Theme.of(context).colorScheme.tertiaryContainer,
                                        text:
                                            '• Синхронизация шлема с планшетом\n• Запуск всех игр с планшета\n• Таймер для запуска игр\n• Обучающая демо игра\n• Отслеживание уровня зарядки\n• Индикатор перегрева шлема\n• Тех поддержка клиентов',
                                        size: Dimensions.font10 * 3.5,
                                        fontWeight: FontWeight.w400)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    child: PayCheck(
                                                        isChecked: list[0]),
                                                    onTap: () {
                                                      setState(() {
                                                        list[0] = !list[0];
                                                        Feedback.forTap(context);
                                                      });
                                                    },
                                                  ),
                                                  EditedText(
                                                color: Theme.of(context).colorScheme.tertiaryContainer,
                                                text:
                                                    'История запуска игр день/неделя/месяц',
                                                size: Dimensions.font10 * 3.5,
                                                fontWeight: FontWeight.w400)
                                                                                      
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  child: PayCheck(
                                                      isChecked: list[1]),
                                                  onTap: () {
                                                    setState(() {
                                                        list[1] = !list[1];
                                                        Feedback.forTap(context);
                                                      });
                                                  },
                                                ),
                                                EditedText(
                                                color: Theme.of(context).colorScheme.tertiaryContainer,
                                                text:
                                                    'Отправка отчетов на почту руководителю',
                                                size: Dimensions.font10 * 3.5,
                                                fontWeight: FontWeight.w400)
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  child: PayCheck(
                                                      isChecked: list[2]),
                                                  onTap: () {
                                                    setState(() {
                                                        list[2] = !list[2];
                                                        Feedback.forTap(context);
                                                      });
                                                  },
                                                ),
                                                EditedText(
                                                color: Theme.of(context).colorScheme.tertiaryContainer,
                                                text:
                                                    'Привязка кассы к приложению Unit VR',
                                                size: Dimensions.font10 * 3.5,
                                                fontWeight: FontWeight.w400)
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  child: PayCheck(
                                                      isChecked: list[3]),
                                                  onTap: () {
                                                    setState(() {
                                                        list[3] = !list[3];
                                                        Feedback.forTap(context);
                                                      });
                                                  },
                                                ),
                                                EditedText(
                                                color: Theme.of(context).colorScheme.tertiaryContainer,
                                                text:
                                                    'Бронирование клуба через ПО',
                                                size: Dimensions.font10 * 3.5,
                                                fontWeight: FontWeight.w400)
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  child: PayCheck(
                                                      isChecked: list[4]),
                                                  onTap: () {
                                                    setState(() {
                                                        list[4] = !list[4];
                                                        Feedback.forTap(context);
                                                      });
                                                  },
                                                ),
                                                EditedText(
                                                color: Theme.of(context).colorScheme.tertiaryContainer,
                                                text:
                                                    'Чат с клиентами клуба',
                                                size: Dimensions.font10 * 3.5,
                                                fontWeight: FontWeight.w400)
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  child: PayCheck(
                                                      isChecked: list[5]),
                                                  onTap: () {
                                                    setState(() {
                                                        list[5] = !list[5];
                                                        Feedback.forTap(context);
                                                      });
                                                  },
                                                ),
                                                EditedText(
                                                color: Theme.of(context).colorScheme.tertiaryContainer,
                                                text:
                                                    'Распределение игр по категориям',
                                                size: Dimensions.font10 * 3.5,
                                                fontWeight: FontWeight.w400)
                                              ],
                                            ),
                                          ],
                                        ),
                                        /*Container(
                                            alignment: Alignment.centerLeft,
                                            child: EditedText(
                                                color: Theme.of(context).colorScheme.tertiaryContainer,
                                                text:
                                                    'Привязка кассы к приложению Unit VR\nБронирование клуба через ПО\nЧат с клиентами клуба\nРаспределение игр по категориям',
                                                size: Dimensions.font10 * 3.5,
                                                fontWeight: FontWeight.w400)),*/
                                      ],
                                    ),
                                    EditedText(color: AppColors.blueGreyText, text: '+ 400 ₽ / функция', size: Dimensions.font10*4, fontWeight: FontWeight.w700)
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: Dimensions.margin10Width * 70,
                          height: Dimensions.margin10Height*15,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      EditedText(
                                          color: AppColors.blueGreyText,
                                          text: 'Количество устройств:',
                                          size: Dimensions.font10 * 3.8,
                                          fontWeight: FontWeight.w700),
                                      SizedBox(width: Dimensions.margin10Width * 4.5),
                                      Container(
                                        width: Dimensions.margin10Width * 20.6,
                                        height: Dimensions.margin10Height * 6.5,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.cornerRadius20 / 2),
                                          color: AppColors.blueGreyText,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: GestureDetector(
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  child: EditedText(
                                                      color: AppColors.whiteText,
                                                      text: '+',
                                                      size: Dimensions.font10 * 4,
                                                      fontWeight: FontWeight.w700)),
                                              onTap: () {
                                                setState(() {
                                                  if (bp_value < 20) {
                                                    bp_value++;
                                                    Feedback.forTap(context);
                                                  } else {
                                                    bp_value = 20;
                                                  }
                                                });
                                              },
                                            )),
                                            Expanded(
                                                child: Container(
                                              alignment: Alignment.center,
                                              color: AppColors.whiteButtonColor,
                                              child: EditedText(
                                                  color: AppColors.blackText,
                                                  text: '$bp_value',
                                                  size: Dimensions.font10 * 4.5,
                                                  fontWeight: FontWeight.w700),
                                            )),
                                            Expanded(
                                                child: GestureDetector(
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  child: EditedText(
                                                      color: AppColors.whiteText,
                                                      text: '-',
                                                      size: Dimensions.font10 * 4,
                                                      fontWeight: FontWeight.w700)),
                                              onTap: () {
                                                setState(() {
                                                  if (bp_value > 1) {
                                                    bp_value--;
                                                    Feedback.forTap(context);
                                                  } else {
                                                    bp_value = 1;
                                                  }
                                                });
                                              },
                                            )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      EditedText(
                                          color: AppColors.blueGreyText,
                                          text: 'Итого к оплате:',
                                          size: Dimensions.font10 * 3.8,
                                          fontWeight: FontWeight.w700),
                                      SizedBox(width: Dimensions.margin10Width * 4.5),
                                      Container(
                                        alignment: Alignment.center,
                                        width: Dimensions.margin10Width * 20.6,
                                        height: Dimensions.margin10Height * 6.5,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.cornerRadius20 / 2),
                                          color: AppColors.whiteButtonColor,
                                        ),
                                        child: EditedText(
                                            color: AppColors.blackText,
                                            text: '${bp_value * (2000 + list.where((x) => x == true).length * 400)}' '₽',
                                            size: Dimensions.font10 * 3.8,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: Dimensions.margin10Width * 70,
                              height: Dimensions.settingsBtnHeight,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.cornerRadius20),
                                  color: AppColors.purpleButtonColor),
                              child: EditedText(
                                  color: AppColors.whiteText,
                                  text: 'В разработке',
                                  size: Dimensions.font10 * 4,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: Dimensions.margin10Height * 5.5),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.margin10Height * 9),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
