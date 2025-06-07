import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';

class TourCard extends StatelessWidget {
  final Map<String, dynamic> data;

  const TourCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: const [BoxShadow(color: AppColors.shadow, blurRadius: 4)],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              data['image'],
              width: 80.w,
              height: 80.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['title'],
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(color: AppColors.grey, fontSize: 12.sp),
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Text(data['flag'], style: TextStyle(fontSize: 14.sp)),
                          VerticalDivider(color: Colors.red.withOpacity(.3)),
                          Icon(Icons.star, color: Colors.amber, size: 16.sp),
                          Text(data['rating'],
                              style: TextStyle(fontSize: 10.sp)),
                        ],
                      ),
                    )
                  ],
                ),
                Divider(color: AppColors.grey.withOpacity(.3)),
                SizedBox(height: 6.h),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Icon(Icons.access_time,
                          size: 14.sp, color: AppColors.grey),
                      SizedBox(width: 4.w),
                      Text(data['distance'], style: TextStyle(fontSize: 10.sp)),
                      const VerticalDivider(color: AppColors.grey),
                      Icon(Icons.shopping_bag,
                          size: 14.sp, color: AppColors.grey),
                      SizedBox(width: 4.w),
                      Text(data['price'], style: TextStyle(fontSize: 10.sp)),
                      const VerticalDivider(color: AppColors.grey),
                      Icon(Icons.swap_horiz,
                          size: 14.sp, color: AppColors.grey),
                      Text(data['km'], style: TextStyle(fontSize: 10.sp)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
