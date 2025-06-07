import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadHomeData extends HomeEvent {
  const LoadHomeData();
}

class LoadMoreNearbyRoutes extends HomeEvent {
  const LoadMoreNearbyRoutes();
}

class LoadMorePopularRoutes extends HomeEvent {
  const LoadMorePopularRoutes();
} 