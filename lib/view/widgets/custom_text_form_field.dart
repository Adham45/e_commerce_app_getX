import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.text,
    this.hintText,
    this.onSaved,
    this.validator,
  }) : super(key: key);
  final String? text;
  final String? hintText;
  final FormFieldSetter? onSaved;
  final FormFieldValidator? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text!,
            fontSize: 14,
            color: Colors.grey.shade500,
          ),
          TextFormField(
            onSaved: onSaved,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
