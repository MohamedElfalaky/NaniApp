import 'package:flutter/material.dart';

final class PasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;
  final Function(String?) validator;

  const PasswordFormField(
      {super.key,
      this.controller,
      required this.labelText,
      required this.validator});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => widget.validator(value),
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }
}
