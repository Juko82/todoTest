// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
 final VoidCallback? voidCallback;
  final String? title;
  final bool obscureText;
  final String? errorText;
  const CustomTextField({
    Key? key,
    required this.controller,
    this.voidCallback,
    required this.title,
    this.obscureText = false,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (val) {
        if (errorText != null && voidCallback != null) {
          voidCallback!();
        }
        
      },
      obscureText: obscureText,
      controller: controller,
      style: TextStyle(
        color: Colors.blue[300],
      ),
      cursorColor: Colors.blue,
      maxLines: 1,
      decoration: InputDecoration(
        errorText: errorText,
          label: title != null ? Text(
            title!,
            style: const TextStyle(
              color: Colors.blue,
              // fontSize: 16,
            ),
          ) : null,
          focusColor: Colors.blue,
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue))),
    );
  }

}
