import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: Dimensions.mainWidthContainer,
          height: Dimensions.margin10Height*81,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
              border: Border.all(color: Theme.of(context).colorScheme.tertiaryFixed, width: Dimensions.border1),
              color: Theme.of(context).colorScheme.primary
              ),
        ),
        Expanded(child: SizedBox.shrink()),
        Container(
          width: Dimensions.mainWidthContainer,
          height: Dimensions.margin10Height*66,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.cornerRadius20),
              border: Border.all(color: Theme.of(context).colorScheme.tertiaryFixed, width: Dimensions.border1),
              color: Theme.of(context).colorScheme.primary
              ),
        ),
      ],
    );
  }
}
