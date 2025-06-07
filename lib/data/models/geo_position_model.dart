import 'package:equatable/equatable.dart';

class GeoPositionModel extends Equatable {
  final String type;
  final List<double> coordinates;

  const GeoPositionModel({
    required this.type,
    required this.coordinates,
  });

  factory GeoPositionModel.fromJson(Map<String, dynamic> json) {
    return GeoPositionModel(
      type: json['type'] ?? '',
      coordinates: List<double>.from(
        json['coordinates']?.map((x) => x.toDouble()) ?? [],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'coordinates': coordinates,
    };
  }

  @override
  List<Object?> get props => [type, coordinates];
} 