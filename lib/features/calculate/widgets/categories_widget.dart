import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movemate/core/utils/colors.dart';
import 'package:movemate/core/widgets/bounce_widget.dart';

import 'header.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _slideAnimation;
  final List<String> selectedCategories = [];
  final List<String> categories = [
    'Documents',
    'Glass',
    'Liquid',
    'Food',
    'Electronic',
    'Product',
    'Others'
  ];
  @override
  void initState() {
    AnimationController controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this)
      ..forward();
    _slideAnimation = Tween<Offset>(
      end: const Offset(0, 0),
      begin: const Offset(.5, 0),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CalculateHeaderWidget(
            title: 'Categories', subtitle: 'What are you sending?'),
        10.verticalSpace,
        SlideTransition(
          position: _slideAnimation,
          child: Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: categories.map((e) {
              bool isSelected = selectedCategories.contains(e);

              return AnimatedSize(
                duration: const Duration(milliseconds: 200),
                child: BounceWidget(
                  shrinkRate: .9,
                  onPressed: () {
                    if (isSelected) {
                      selectedCategories.remove(e);
                    } else {
                      selectedCategories.add(e);
                    }
                    setState(() {});
                  },
                  child: AnimatedContainer(
                    curve: Curves.easeIn,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color:
                          isSelected ? AppColors.primary : Colors.transparent,
                      border: Border.all(color: AppColors.grey),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    duration: const Duration(milliseconds: 200),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Visibility(
                          visible: isSelected,
                          child: Icon(
                            Icons.check_rounded,
                            color: Colors.white,
                            size: 14.w,
                          ),
                        ),
                        4.horizontalSpace,
                        Text(
                          e,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color:
                                isSelected ? Colors.white : AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
