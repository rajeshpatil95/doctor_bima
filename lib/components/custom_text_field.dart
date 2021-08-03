import 'package:doctor_bima/style/app_colors.dart';
import 'package:doctor_bima/style/font.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String textHint;
  final bool isEditable;
  final TextEditingController textEditingController;
  final Function onChanged;

  const CustomTextField(
      {Key key,
      this.textHint,
      this.textEditingController,
      this.isEditable,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("${textHint.toUpperCase()}",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppFontSize.small,
                    color: AppColors.grey)),
            Center(
                child: Container(
                    width: double.infinity,
                    child: TextFormField(
                      autocorrect: isEditable,
                      readOnly: !isEditable,
                      initialValue: textEditingController.text,
                      onChanged: (value) {
                        this.onChanged(value);
                      },
                    ))),
          ],
        ));
  }
}
