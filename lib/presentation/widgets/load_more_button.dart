import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';

class LoadMoreButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isVisible;
  final String text;

  const LoadMoreButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.isVisible = true,
    this.text = "Load More",
  });

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();

    return Center(
      child: GestureDetector(
        onTap: isLoading ? null : onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          decoration: BoxDecoration(
            border: Border.all(
              color: isLoading ? AppColors.grey : AppColors.primary,
              width: 1.2,
            ),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: isLoading
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 16.w,
                      height: 16.w,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColors.grey),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "Loading...",
                      style: TextStyle(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                )
              : Text(
                  text,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
        ),
      ),
    );
  }
}
