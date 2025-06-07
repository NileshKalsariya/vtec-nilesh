import 'package:equatable/equatable.dart';

class RouteEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final String location;
  final double price;
  final String coverImage;
  final int duration;
  final int distance;
  final double averageRating;
  final bool isFavourite;
  final String authorName;
  final String travelMethodName;

  const RouteEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.price,
    required this.coverImage,
    required this.duration,
    required this.distance,
    required this.averageRating,
    required this.isFavourite,
    required this.authorName,
    required this.travelMethodName,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        location,
        price,
        coverImage,
        duration,
        distance,
        averageRating,
        isFavourite,
        authorName,
        travelMethodName,
      ];
} 