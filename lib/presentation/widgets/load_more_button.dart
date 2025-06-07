import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';

class LoadMoreButton extends StatelessWidget {
  const LoadMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.r),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary, width: 1.2),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: const Text(
          "Load More",
          style: TextStyle(
              color: AppColors.primary, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
