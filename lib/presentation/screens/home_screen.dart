import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';
import '../../di/injection_container.dart' as di;
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widgets/route_card.dart';
import '../widgets/route_card_shimmer.dart';
import '../widgets/load_more_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<HomeBloc>()..add(const LoadHomeData()),
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return SingleChildScrollView(
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
                  _buildNearbySection(context, state),
                  SizedBox(height: 20.h),
                  _buildPopularSection(context, state),
                  SizedBox(height: 20.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildNearbySection(BuildContext context, HomeState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text.rich(
            TextSpan(
              text: "Routes ",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textBlack,
              ),
              children: [
                TextSpan(
                  text: "nearby",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),
        _buildRoutesList(context, state, isNearby: true),
        SizedBox(height: 10.h),
        _buildLoadMoreButton(context, state, isNearby: true),
      ],
    );
  }

  Widget _buildPopularSection(BuildContext context, HomeState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text.rich(
            TextSpan(
              text: "Favourite ",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textBlack,
              ),
              children: [
                TextSpan(
                  text: "Tours",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),
        _buildRoutesList(context, state, isNearby: false),
        SizedBox(height: 10.h),
        _buildLoadMoreButton(context, state, isNearby: false),
      ],
    );
  }

  Widget _buildRoutesList(BuildContext context, HomeState state,
      {required bool isNearby}) {
    if (state is HomeLoading) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: List.generate(
            2,
            (index) => const RouteCardShimmer(),
          ),
        ),
      );
    } else if (state is HomeLoaded) {
      final routes =
          isNearby ? state.displayedNearbyRoutes : state.displayedPopularRoutes;

      if (routes.isEmpty) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Center(
            child: Text(
              'No ${isNearby ? 'nearby' : 'favourite'} routes found',
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.grey,
              ),
            ),
          ),
        );
      }

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: routes.map((route) => RouteCard(route: route)).toList(),
        ),
      );
    } else if (state is HomeError) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.error_outline,
                size: 48.sp,
                color: Colors.red,
              ),
              SizedBox(height: 8.h),
              Text(
                'Error: ${state.message}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<HomeBloc>(context).add(const LoadHomeData());
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildLoadMoreButton(BuildContext context, HomeState state,
      {required bool isNearby}) {
    if (state is! HomeLoaded) return const SizedBox.shrink();

    final hasMore = isNearby ? state.hasMoreNearby : state.hasMorePopular;
    final isLoading =
        isNearby ? state.isLoadingMoreNearby : state.isLoadingMorePopular;

    return LoadMoreButton(
      isVisible: hasMore,
      isLoading: isLoading,
      onPressed: () {
        if (isNearby) {
          context.read<HomeBloc>().add(const LoadMoreNearbyRoutes());
        } else {
          context.read<HomeBloc>().add(const LoadMorePopularRoutes());
        }
      },
    );
  }
}
