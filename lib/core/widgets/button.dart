import 'package:flutter/material.dart';
import 'package:movemate/core/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/widgets/bounce_widget.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const AppButton({Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BounceWidget(
      shrinkRate: .95,
      onPressed: onPressed,
      child: ElevatedButton(
        onPressed: null,
        style: ButtonStyle(
          elevation: MaterialStateProperty.resolveWith<double>((states) => 0),
          padding: MaterialStateProperty.resolveWith<EdgeInsets>(
            (states) => EdgeInsets.symmetric(vertical: 12.h),
          ),
          fixedSize: MaterialStateProperty.resolveWith<Size>(
              (states) => Size(335.w, 55.h)),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
            (states) => RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.r)),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return AppColors.yellow;
            },
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            height: 1,
            fontSize: 16.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
