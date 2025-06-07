import 'package:equatable/equatable.dart';

class TravelMethodModel extends Equatable {
  final int id;
  final String name;

  const TravelMethodModel({
    required this.id,
    required this.name,
  });

  factory TravelMethodModel.fromJson(Map<String, dynamic> json) {
    return TravelMethodModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  List<Object?> get props => [id, name];
} 