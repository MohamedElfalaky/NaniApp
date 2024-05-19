import 'package:flutter/material.dart';
import 'package:parent_app/feature/extension/date_time_ext.dart';

class DateTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? isExpiryDateCard;
  const DateTextField(
      {super.key,
      required this.controller,
      this.validator,
      this.isExpiryDateCard});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showDatePicker(
                context: context,
                firstDate:
                    isExpiryDateCard == true ? DateTime.now() : DateTime(1940),
                lastDate:
                    isExpiryDateCard == true ? DateTime(2040) : DateTime.now())
            .then((value) => controller.text = isExpiryDateCard == true
                ? value.toString().mmYYFormat
                : value.toString().ddMMyyyyFormat);
        FocusScope.of(context).requestFocus(
            FocusNode()); // to dismiss the keyboard if it is showing
      },
      child: IgnorePointer(
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          // enabled: false,
          controller: controller,
          decoration: InputDecoration(
            hintText:
                isExpiryDateCard == true ? "Expiry Date" : "Date of births",
          ),
          validator: validator,
        ),
      ),
    );
  }
}
