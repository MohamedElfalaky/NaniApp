import 'package:flutter/material.dart';

extension KeyboardDismissed on Widget {
  Widget keyboardDismissed(context) => GestureDetector(
      child: this,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      });
}
