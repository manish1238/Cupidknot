import 'package:flutter/material.dart';

import '../styles/colors.dart';

class ATextField extends StatelessWidget {
  const ATextField({
    Key? key,
    required this.onChanged,
    this.validator,
    this.label = '',
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.enabled = true,
    this.initialText,
    this.maxLength,
    this.obscureText = false,
    this.leadingIcon,
    this.borderColor,
    this.maxLines = 1, this.suffixIcon,
  }) : super(key: key);
  final Function onChanged;
  final Function? validator;
  final String label;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final AutovalidateMode autovalidateMode;
  final bool enabled;
  final String? initialText;
  final int? maxLength;
  final bool obscureText;
  final Icon? leadingIcon;
  final Color? borderColor;
  final int maxLines;
  final IconButton? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
          maxLines: maxLines,
          obscureText: obscureText,
          enabled: enabled,
          maxLength: maxLength,
          initialValue: initialText,
          autovalidateMode: autovalidateMode,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            prefixIcon: leadingIcon,
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: kGrey),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: kGrey.withOpacity(0.5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: kGrey),
            ),
            labelText: label,
            labelStyle:
                borderColor == null ? null : TextStyle(color: borderColor),
            border: OutlineInputBorder(borderSide: BorderSide(color: kGrey)),
            suffixIcon: suffixIcon
          ),
          keyboardType: keyboardType,
          validator: (value) {
            if (validator == null) {
              return null;
            } else {
              String? message = validator!(value);
              return message;
            }
          },
          onChanged: (value) {
            onChanged(value);
          },
          onFieldSubmitted: (_) => FocusScope.of(context).nextFocus),
    );
  }
}
