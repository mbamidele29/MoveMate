import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/utils/colors.dart';

class AppTextField extends StatelessWidget {
  final String? initialValue;
  final String? hintText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final bool readOnly;
  final bool enabled;
  final Color? color;
  final VoidCallback? onTap;
  final TextInputAction textInputAction;
  final bool autoFocus;
  final FocusNode? focusNode;
  final double radius;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;

  const AppTextField({
    Key? key,
    this.color,
    this.hintText,
    this.focusNode,
    this.onChanged,
    this.prefixWidget,
    this.suffixWidget,
    this.readOnly = false,
    this.enabled = true,
    this.onTap,
    this.textInputAction = TextInputAction.next,
    this.radius = 10,
    this.validator,
    this.autoFocus = false,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      initialValue: initialValue,
      autofocus: autoFocus,
      textInputAction: textInputAction,
      enabled: enabled,
      readOnly: readOnly || onTap != null,
      validator: validator,
      onTap: onTap,
      onChanged: onChanged,
      style: TextStyle(
        fontSize: 14.sp,
        color: AppColors.primary,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        suffixIconConstraints: BoxConstraints(maxHeight: 36.h),
        prefixIcon: prefixWidget,
        suffixIcon: suffixWidget,
        errorStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        isDense: true,
        filled: true,
        hintText: hintText,
        fillColor: color ?? const Color(0xFFF4F4F4),
        hintStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
        contentPadding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 16.h),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(color: Colors.transparent)),
        errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(color: Colors.transparent)),
        enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(color: Colors.transparent)),
        disabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(color: Colors.transparent)),
        focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(color: Colors.transparent)),
      ),
    );
  }
}
