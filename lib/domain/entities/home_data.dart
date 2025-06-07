import 'package:equatable/equatable.dart';
import 'route.dart';

class HomeData extends Equatable {
  final List<RouteEntity> nearby;
  final List<RouteEntity> popular;

  const HomeData({
    required this.nearby,
    required this.popular,
  });

  @override
  List<Object?> get props => [nearby, popular];
} 