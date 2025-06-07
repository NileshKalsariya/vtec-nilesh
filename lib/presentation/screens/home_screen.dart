import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';
import '../widgets/tour_card.dart';
import '../widgets/load_more_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> routes = const [
    {
      'title': 'Surat',
      'location': 'Katargam',
      'image': 'https://picsum.photos/200/300',
      'flag': '🇩🇪',
      'rating': '4.8/5',
      'distance': '2.25m',
      'price': '\$2.95',
      'km': '471.68km'
    },
    {
      'title': 'Surat',
      'location': 'Katargam',
      'image': 'https://picsum.photos/200/300',
      'flag': '🇺🇸',
      'rating': '4.8/5',
      'distance': '2.25m',
      'price': '\$2.95',
      'km': '471.68km'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 100.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 60, left: 16),
                child: Text(
                  "Explore routes",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text.rich(
                TextSpan(
                  text: "Routes ",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                  children: [
                    TextSpan(
                      text: "nearby",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.textBlack,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: routes.map((data) => TourCard(data: data)).toList(),
              ),
            ),
            SizedBox(height: 10.h),
            const LoadMoreButton(),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text.rich(
                TextSpan(
                  text: "Favourite ",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                  children: [
                    TextSpan(
                      text: "Tours",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.textBlack,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: routes.map((data) => TourCard(data: data)).toList(),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
