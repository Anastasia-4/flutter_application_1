import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/settings/sharedPreferencesHelper.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditedTextfield extends StatefulWidget {
  dynamic notEdited;
  EditedTextfield({
    super.key,
    required this.notEdited
    });
  @override
  State<EditedTextfield> createState() => _EditedTextfieldState();
}

class _EditedTextfieldState extends State<EditedTextfield> {

  bool _isNameValid = false;
  bool _isEmailValid = false;
  bool _isNumberValid = false;
  bool _isIdValid = false;

    @override
  void initState() {
    super.initState();
    if (SharedPreferencesHelper.getString('name') != Null)
    _isNameValid = true;
    else
    _isNameValid = false;
    if (SharedPreferencesHelper.getString('enail') != Null)
    _isEmailValid = true;
    else
    _isEmailValid = false;
    if (SharedPreferencesHelper.getString('number') != Null)
    _isNumberValid = true;
    else
    _isNumberValid = false;
    if (SharedPreferencesHelper.getString('id') != Null)
    _isIdValid = true;
    else
    _isIdValid = false;
  }

  onNameChanged(String name) {
    setState(() {
    const patternname = r'^(?:[\u0401\u0451\u0410-\u044f\–\—\−\-]+(?:\s+|$)){3,3}$';
    final regex = RegExp(patternname);
    if(regex.hasMatch(name) && name.isNotEmpty)
    {_isNameValid = true;
    SharedPreferencesHelper.setString("name", name);}
    else
    _isNameValid = false;
    });
  }

    onEmailChanged(String name) {
    setState(() {
    const patternemail = r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(patternemail);
    if(regex.hasMatch(name) && name.length>=8)
    {_isEmailValid = true;
    SharedPreferencesHelper.setString("email", name);}
    else
    _isEmailValid = false;
    });
  }

      onNumberChanged(String name) {
    setState(() {
    if(name.length == 10)
    {_isNumberValid = true;
    SharedPreferencesHelper.setString("number", name);}
    else
    _isNumberValid = false;
    });
  }

        onIdChanged(String name) {
    setState(() {
    if(name.length>=5)
    {_isIdValid = true;
    SharedPreferencesHelper.setString("id", name);}
    else
    _isIdValid = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EditedText(
                color: Theme.of(context).colorScheme.tertiary,
                text: "ФИО",
                size: Dimensions.font10 * 3.5,
                fontWeight: FontWeight.w700),
            Container(
              width: Dimensions.margin10Width * 131.6,
              height: Dimensions.margin10Height * 10.8,
              child: TextFormField(
                readOnly: widget.notEdited,
                initialValue: SharedPreferencesHelper.getString('name') ?? '',
                onChanged: (validString) =>
                    onNameChanged(validString),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(55),
                ],
                keyboardType: TextInputType.name,
                style: TextStyle(color: Theme.of(context).colorScheme.tertiaryContainer, fontSize: Dimensions.font10*3.5, fontFamily: 'Roboto', fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  suffixIcon: widget.notEdited
                  ? null
                  :Icon(
                    _isNameValid
                    ? Icons.check_circle_outline
                    : Icons.error_outline,
                    color: _isNameValid
                    ? AppColors.greenText
                    : AppColors.redButtonColor,
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.cornerRadius15),
                      borderSide: BorderSide(
                          color: AppColors.darkerGreyText,
                          width: Dimensions.border1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.cornerRadius15),
                      borderSide: BorderSide(
                          color: AppColors.darkerGreyText,
                          width: Dimensions.border1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.cornerRadius15),
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
                text: "Email",
                size: Dimensions.font10 * 3.5,
                fontWeight: FontWeight.w700),
            Container(
              width: Dimensions.margin10Width * 131.6,
              height: Dimensions.margin10Height * 10.8,
              child: TextFormField(
                readOnly: widget.notEdited,
                initialValue: SharedPreferencesHelper.getString('email') ?? '',
                onChanged: (valid_String) =>
                    onEmailChanged(valid_String),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(55),
                ],
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Theme.of(context).colorScheme.tertiaryContainer, fontSize: Dimensions.font10*3.5, fontFamily: 'Roboto', fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  suffixIcon: widget.notEdited
                  ? null
                  :Icon(
                    _isNameValid
                    ? Icons.check_circle_outline
                    : Icons.error_outline,
                    color: _isNameValid
                    ? AppColors.greenText
                    : AppColors.redButtonColor,
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.cornerRadius15),
                      borderSide: BorderSide(
                          color: AppColors.darkerGreyText,
                          width: Dimensions.border1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.cornerRadius15),
                      borderSide: BorderSide(
                          color: AppColors.darkerGreyText,
                          width: Dimensions.border1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.cornerRadius15),
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
                text: "Телефон",
                size: Dimensions.font10 * 3.5,
                fontWeight: FontWeight.w700),
            Container(
              width: Dimensions.margin10Width * 131.6,
              height: Dimensions.margin10Height * 10.8,
              child: TextFormField(
                readOnly: widget.notEdited,
                initialValue: numberFormatter.maskText(SharedPreferencesHelper.getString('number') ?? ''),
                onChanged: (value) => onNumberChanged(numberFormatter.getUnmaskedText()),
                inputFormatters: [numberFormatter],
                keyboardType: TextInputType.number,
                style: TextStyle(color: Theme.of(context).colorScheme.tertiaryContainer, fontSize: Dimensions.font10*3.5, fontFamily: 'Roboto', fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  suffixIcon: widget.notEdited
                  ? null
                  :Icon(
                    _isNameValid
                    ? Icons.check_circle_outline
                    : Icons.error_outline,
                    color: _isNameValid
                    ? AppColors.greenText
                    : AppColors.redButtonColor,
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.cornerRadius15),
                      borderSide: BorderSide(
                          color: AppColors.darkerGreyText,
                          width: Dimensions.border1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.cornerRadius15),
                      borderSide: BorderSide(
                          color: AppColors.darkerGreyText,
                          width: Dimensions.border1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.cornerRadius15),
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
                text: "Телеграм id",
                size: Dimensions.font10 * 3.5,
                fontWeight: FontWeight.w700),
            Container(
              width: Dimensions.margin10Width * 131.6,
              height: Dimensions.margin10Height * 10.8,
              child: TextFormField(
                readOnly: widget.notEdited,
                initialValue: idFormatter.maskText(SharedPreferencesHelper.getString('id') ?? ''),
                onChanged: (value) => onIdChanged(idFormatter.getUnmaskedText()),
                inputFormatters: [idFormatter],
                keyboardType: TextInputType.text,
                style: TextStyle(color: Theme.of(context).colorScheme.tertiaryContainer, fontSize: Dimensions.font10*3.5, fontFamily: 'Roboto', fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  suffixIcon: widget.notEdited
                  ? null
                  :Icon(
                    _isNameValid
                    ? Icons.check_circle_outline
                    : Icons.error_outline,
                    color: _isNameValid
                    ? AppColors.greenText
                    : AppColors.redButtonColor,
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.cornerRadius15),
                      borderSide: BorderSide(
                          color: AppColors.darkerGreyText,
                          width: Dimensions.border1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.cornerRadius15),
                      borderSide: BorderSide(
                          color: AppColors.darkerGreyText,
                          width: Dimensions.border1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.cornerRadius15),
                      borderSide: BorderSide(
                          color: AppColors.darkerGreyText,
                          width: Dimensions.border1)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

var numberFormatter = new MaskTextInputFormatter(
  mask: '+7 (###) ###-##-##', 
  filter: { "#": RegExp(r'[0-9]') },
  type: MaskAutoCompletionType.lazy
);
var idFormatter = new MaskTextInputFormatter(
  mask: '@################################', 
  filter: { "#": RegExp(r'[a-z1-9\_]') },
  type: MaskAutoCompletionType.lazy
);

}
