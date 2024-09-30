import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
        Container(color: Colors.red),
        Container(color: Colors.blue,),
      ],
      ),
    );
  }
}