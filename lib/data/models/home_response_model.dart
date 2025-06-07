import 'package:equatable/equatable.dart';
import 'route_model.dart';

class HomeDataModel extends Equatable {
  final List<RouteModel> nearby;
  final List<RouteModel> popular;

  const HomeDataModel({
    required this.nearby,
    required this.popular,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) {
    return HomeDataModel(
      nearby: (json['nearby'] as List<dynamic>?)
              ?.map((route) => RouteModel.fromJson(route))
              .toList() ??
          [],
      popular: (json['popular'] as List<dynamic>?)
              ?.map((route) => RouteModel.fromJson(route))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nearby': nearby.map((route) => route.toJson()).toList(),
      'popular': popular.map((route) => route.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [nearby, popular];
}

class HomeResponseModel extends Equatable {
  final bool status;
  final String message;
  final HomeDataModel data;

  const HomeResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: HomeDataModel.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }

  @override
  List<Object?> get props => [status, message, data];
} 