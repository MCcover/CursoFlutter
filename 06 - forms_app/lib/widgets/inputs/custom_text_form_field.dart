import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool isPassword;
  final Function(String value)? onChanged;
  final String? Function(String? value)? validator;

  const CustomTextFormField({super.key, this.label, this.hint, this.errorMessage, this.onChanged, this.validator, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    );
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: isPassword,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: colors.primary)),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText: errorMessage,
        errorBorder: border.copyWith(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
