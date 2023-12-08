import 'package:flutter/material.dart';
import 'package:movemate/core/route/keys.dart';
import 'package:movemate/core/utils/colors.dart';
import 'package:movemate/core/widgets/app_textfield.dart';
import 'package:movemate/core/widgets/appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/widgets/button.dart';
import 'package:movemate/core/widgets/slide_fade.dart';
import 'package:movemate/features/calculate/widgets/form.dart';
import 'package:movemate/features/calculate/widgets/header.dart';

import 'widgets/categories_widget.dart';
import 'widgets/prefix.dart';

class CalculateRootWidget extends StatelessWidget {
  const CalculateRootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MoveMateAppBar(
          leadingWidth: 40.w,
          color: AppColors.purple[300],
          titleText: 'Calculate'),
      body: SlideFadeWidget(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              const CalculateHeaderWidget(title: 'Destination'),
              10.verticalSpace,
              const CalculateFormWidget(),
              20.verticalSpace,
              const CalculateHeaderWidget(
                  title: 'Packaging', subtitle: 'What are you sending?'),
              10.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      offset: const Offset(1.8, 1.8),
                      color: Colors.grey.withOpacity(.1),
                    )
                  ],
                ),
                child: AppTextField(
                  initialValue: 'Box',
                  color: Colors.white,
                  prefixWidget: const CalculatePrefixWidget(
                      icon: Icons.file_upload_outlined),
                  suffixWidget: Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 30.w,
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ),
              20.verticalSpace,
              const CategoriesWidget(),
              40.verticalSpace,
              AppButton(
                buttonText: 'Calculate',
                onPressed: () =>
                    Navigator.of(context).pushNamed(RouteKeys.shipmentSuccess),
              )
            ],
          ),
        ),
      ),
    );
  }
}
