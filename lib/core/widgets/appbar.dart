import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/widgets/back_button.dart';

class MoveMateAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? lead;
  final Widget? action;
  final Color? color;
  final Color? leadColor;
  final bool centerTitle;
  final String? titleText;
  final Widget? titleWidget;
  final double? height;
  final double? leadingWidth;
  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;
  const MoveMateAppBar({
    Key? key,
    this.lead,
    this.color,
    this.action,
    this.bottom,
    this.height,
    this.titleText,
    this.leadColor,
    this.titleWidget,
    this.leadingWidth,
    this.toolbarHeight,
    this.centerTitle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      leadingWidth: leadingWidth,
      shadowColor: Colors.black.withOpacity(.2),
      elevation: 0,
      leading: lead ?? const BackButtonWidget(),
      toolbarHeight: toolbarHeight,
      backgroundColor: color,
      surfaceTintColor: Colors.transparent,
      actions: [action ?? const SizedBox()],
      centerTitle: centerTitle,
      title: titleWidget ??
          Text(
            titleText ?? '',
            style: TextStyle(
              height: 1,
              fontSize: 18.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 56);
}
