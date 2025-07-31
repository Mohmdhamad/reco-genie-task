import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String label;
  final IconData prefix;
  final String? Function(String?) validate;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  final VoidCallback? onTap;
  final IconData? suffix;
  final VoidCallback? suffixPressed;
  final bool isPassword;

  const DefaultTextFormField({
    super.key,
    required this.controller,
    required this.type,
    required this.label,
    required this.prefix,
    required this.validate,
    this.onChange,
    this.onSubmit,
    this.onTap,
    this.suffix,
    this.suffixPressed,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
      ),
      onChanged: onChange,
      onTap: onTap,
      onFieldSubmitted: onSubmit,
      validator: validate,
    );
  }
}
