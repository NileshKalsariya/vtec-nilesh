import 'package:equatable/equatable.dart';
import 'audio_model.dart';
import 'travel_method_model.dart';
import 'geo_position_model.dart';

class StepModel extends Equatable {
  final int id;
  final int routeId;
  final int routeTravelmethodId;
  final int order;
  final String description;
  final int isStart;
  final int isFinish;
  final int distance;
  final int duration;
  final GeoPositionModel geopos;
  final double locLat;
  final double locLong;
  final List<AudioModel> audios;
  final TravelMethodModel travelmethod;

  const StepModel({
    required this.id,
    required this.routeId,
    required this.routeTravelmethodId,
    required this.order,
    required this.description,
    required this.isStart,
    required this.isFinish,
    required this.distance,
    required this.duration,
    required this.geopos,
    required this.locLat,
    required this.locLong,
    required this.audios,
    required this.travelmethod,
  });

  factory StepModel.fromJson(Map<String, dynamic> json) {
    return StepModel(
      id: json['id'] ?? 0,
      routeId: json['route_id'] ?? 0,
      routeTravelmethodId: json['route_travelmethod_id'] ?? 0,
      order: json['order'] ?? 0,
      description: json['description'] ?? '',
      isStart: json['is_start'] ?? 0,
      isFinish: json['is_finish'] ?? 0,
      distance: json['distance'] ?? 0,
      duration: json['duration'] ?? 0,
      geopos: GeoPositionModel.fromJson(json['geopos'] ?? {}),
      locLat: (json['loc_lat'] ?? 0.0).toDouble(),
      locLong: (json['loc_long'] ?? 0.0).toDouble(),
      audios: (json['audios'] as List<dynamic>?)
              ?.map((audio) => AudioModel.fromJson(audio))
              .toList() ??
          [],
      travelmethod: TravelMethodModel.fromJson(json['travelmethod'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'route_id': routeId,
      'route_travelmethod_id': routeTravelmethodId,
      'order': order,
      'description': description,
      'is_start': isStart,
      'is_finish': isFinish,
      'distance': distance,
      'duration': duration,
      'geopos': geopos.toJson(),
      'loc_lat': locLat,
      'loc_long': locLong,
      'audios': audios.map((audio) => audio.toJson()).toList(),
      'travelmethod': travelmethod.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        routeId,
        routeTravelmethodId,
        order,
        description,
        isStart,
        isFinish,
        distance,
        duration,
        geopos,
        locLat,
        locLong,
        audios,
        travelmethod,
      ];
} 