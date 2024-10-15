/*import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/database_service.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widgets/dialog_content.dart';
import 'package:flutter_application_1/widgets/edited_text.dart';

class EditedDialog extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController numController;
  final DatabaseService databaseService;
  final int selectedDevice;
  const EditedDialog({super.key, required this.nameController, required this.numController, required this.databaseService, required this.selectedDevice});

  @override
  State<EditedDialog> createState() => _EditedDialogState();
}

class _EditedDialogState extends State<EditedDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
            backgroundColor: AppColors.darkMainColor,
            content: DialogContent(nameController: widget.nameController, numController: widget.numController),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                        alignment: Alignment.center,
                        width: Dimensions.margin10Width * 38,
                        height: Dimensions.margin10Height * 7,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Dimensions.cornerRadius20),
                            color: AppColors.yellowButtonColor),
                        child: EditedText(
                            color: AppColors.blackText,
                            text: 'Сохранить',
                            size: Dimensions.font10 * 3.3,
                            fontWeight: FontWeight.w500)),
                    onTap: () {
                      if (widget.numController.text.isNotEmpty &&
                          widget.nameController.text.isNotEmpty && widget.numController.text.length == 15) {
                        widget.databaseService.updateDevice(widget.selectedDevice,
                            widget.nameController.text, widget.numController.text);
                        setState(() {
                          widget.nameController.text = "";
                          widget.numController.text = "";
                        });
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              ),
            ],
          );
  }
}*/