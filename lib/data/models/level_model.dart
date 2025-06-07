import 'package:equatable/equatable.dart';

class LevelModel extends Equatable {
  final int id;
  final String description;

  const LevelModel({
    required this.id,
    required this.description,
  });

  factory LevelModel.fromJson(Map<String, dynamic> json) {
    return LevelModel(
      id: json['id'] ?? 0,
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
    };
  }

  @override
  List<Object?> get props => [id, description];
} 