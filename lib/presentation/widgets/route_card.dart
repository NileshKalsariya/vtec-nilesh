import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';
import '../../domain/entities/route.dart';

class RouteCard extends StatelessWidget {
  final RouteEntity route;

  const RouteCard({super.key, required this.route});

  String _getFlagEmoji(String location) {
    final locationLower = location.toLowerCase();
    if (locationLower.contains('berlin') || locationLower.contains('germany') || locationLower.contains('münster') || locationLower.contains('augsburg')) {
      return '🇩🇪';
    } else if (locationLower.contains('prague') || locationLower.contains('czech')) {
      return '🇨🇿';
    } else if (locationLower.contains('usa') || locationLower.contains('america')) {
      return '🇺🇸';
    } else if (locationLower.contains('uk') || locationLower.contains('england') || locationLower.contains('britain')) {
      return '🇬🇧';
    }
    return '🇩🇪';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              route.coverImage,
              width: 100.w,
              height: 100.w,
              fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 100.w,
                  height: 100.w,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported),
                );
              },
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  route.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 14.sp,
                            color: AppColors.grey,
                          ),
                          SizedBox(width: 2.w),
                          Expanded(
                            child: Text(
                              route.location.isEmpty ? 'Location not specified' : route.location,
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 12.sp,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          _getFlagEmoji(route.location),
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        SizedBox(width: 6.w),
                        Container(
                          width: 1,
                          height: 16.h,
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        SizedBox(width: 6.w),
                        Icon(Icons.star, color: Colors.amber, size: 14.sp),
                        SizedBox(width: 2.w),
                        Text(
                          '${route.averageRating.toStringAsFixed(1)}/5',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Container(
                  height: 1,
                  color: Colors.grey.withOpacity(0.2),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 12.sp, color: AppColors.grey),
                    SizedBox(width: 4.w),
                    Text(
                      route.duration > 0 ? '${(route.duration / 60).toStringAsFixed(1)}h' : '2.25h',
                      style: TextStyle(fontSize: 10.sp, color: AppColors.grey),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      width: 1,
                      height: 12.h,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    SizedBox(width: 8.w),
                    Icon(Icons.shopping_bag, size: 12.sp, color: AppColors.grey),
                    SizedBox(width: 4.w),
                    Text(
                      '\$${route.price.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 10.sp, color: AppColors.grey),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      width: 1,
                      height: 12.h,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    SizedBox(width: 8.w),
                    Icon(Icons.swap_horiz, size: 12.sp, color: AppColors.grey),
                    SizedBox(width: 4.w),
                    Text(
                      route.distance > 0 ? '${(route.distance / 1000).toStringAsFixed(2)}km' : '471.68km',
                      style: TextStyle(fontSize: 10.sp, color: AppColors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 