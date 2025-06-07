import 'package:equatable/equatable.dart';
import '../../domain/entities/home_data.dart';
import '../../domain/entities/route.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  final HomeData allData;
  final List<RouteEntity> displayedNearbyRoutes;
  final List<RouteEntity> displayedPopularRoutes;
  final bool hasMoreNearby;
  final bool hasMorePopular;
  final bool isLoadingMoreNearby;
  final bool isLoadingMorePopular;

  const HomeLoaded({
    required this.allData,
    required this.displayedNearbyRoutes,
    required this.displayedPopularRoutes,
    required this.hasMoreNearby,
    required this.hasMorePopular,
    this.isLoadingMoreNearby = false,
    this.isLoadingMorePopular = false,
  });

  HomeLoaded copyWith({
    HomeData? allData,
    List<RouteEntity>? displayedNearbyRoutes,
    List<RouteEntity>? displayedPopularRoutes,
    bool? hasMoreNearby,
    bool? hasMorePopular,
    bool? isLoadingMoreNearby,
    bool? isLoadingMorePopular,
  }) {
    return HomeLoaded(
      allData: allData ?? this.allData,
      displayedNearbyRoutes: displayedNearbyRoutes ?? this.displayedNearbyRoutes,
      displayedPopularRoutes: displayedPopularRoutes ?? this.displayedPopularRoutes,
      hasMoreNearby: hasMoreNearby ?? this.hasMoreNearby,
      hasMorePopular: hasMorePopular ?? this.hasMorePopular,
      isLoadingMoreNearby: isLoadingMoreNearby ?? this.isLoadingMoreNearby,
      isLoadingMorePopular: isLoadingMorePopular ?? this.isLoadingMorePopular,
    );
  }

  @override
  List<Object?> get props => [
        allData,
        displayedNearbyRoutes,
        displayedPopularRoutes,
        hasMoreNearby,
        hasMorePopular,
        isLoadingMoreNearby,
        isLoadingMorePopular,
      ];
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object?> get props => [message];
} 