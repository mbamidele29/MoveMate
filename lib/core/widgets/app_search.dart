import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/utils/assets.dart';
import 'package:movemate/core/utils/colors.dart';
import 'package:movemate/core/widgets/app_textfield.dart';

class AppSearchTextField extends StatelessWidget {
  final String? hintText;
  final VoidCallback? onTap;
  final TextInputAction textInputAction;
  final bool autoFocus;
  final FocusNode? focusNode;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const AppSearchTextField({
    Key? key,
    this.focusNode,
    this.hintText,
    this.onTap,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.autoFocus = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: AppTextField(
        radius: 100.r,
        onTap: onTap,
        focusNode: focusNode,
        onChanged: onChanged,
        autoFocus: autoFocus,
        textInputAction: textInputAction,
        prefixWidget: Icon(
          Icons.search,
          size: 20.w,
          color: AppColors.grey,
        ),
        suffixWidget: Padding(
          padding: EdgeInsets.only(right: 5.w),
          child: CircleAvatar(
            radius: 20.w,
            backgroundColor: AppColors.yellow,
            child: Image.asset(
              AppAssets.scan,
              width: 25.w,
              color: Colors.white,
            ),
          ),
        ),
        hintText: 'Enter the receipt number...',
      ),
    );
  }
}
