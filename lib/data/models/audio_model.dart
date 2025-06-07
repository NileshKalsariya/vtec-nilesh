import 'package:equatable/equatable.dart';

class AudioModel extends Equatable {
  final int id;
  final int routeStepId;
  final String name;
  final String path;
  final String runtime;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  const AudioModel({
    required this.id,
    required this.routeStepId,
    required this.name,
    required this.path,
    required this.runtime,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) {
    return AudioModel(
      id: json['id'] ?? 0,
      routeStepId: json['route_step_id'] ?? 0,
      name: json['name'] ?? '',
      path: json['path'] ?? '',
      runtime: json['runtime'] ?? '0',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'route_step_id': routeStepId,
      'name': name,
      'path': path,
      'runtime': runtime,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }

  @override
  List<Object?> get props => [
        id,
        routeStepId,
        name,
        path,
        runtime,
        createdAt,
        updatedAt,
        deletedAt,
      ];
} 