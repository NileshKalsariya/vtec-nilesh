import 'package:equatable/equatable.dart';
import 'author_model.dart';
import 'travel_method_model.dart';
import 'step_model.dart';
import 'category_model.dart';
import 'image_model.dart';
import 'audio_model.dart';
import '../../domain/entities/route.dart';

class RouteModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final String location;
  final double price;
  final int min;
  final String active;
  final int? routeVideoId;
  final String? language;
  final String coverImage;
  final int stepcount;
  final int duration;
  final int distance;
  final bool trashed;
  final double averageRating;
  final bool isFavourite;
  final AuthorModel author;
  final TravelMethodModel travelmethod;
  final List<StepModel> steps;
  final List<CategoryModel> categories;
  final List<ImageModel> images;
  final AudioModel? audio;

  const RouteModel({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.price,
    required this.min,
    required this.active,
    this.routeVideoId,
    this.language,
    required this.coverImage,
    required this.stepcount,
    required this.duration,
    required this.distance,
    required this.trashed,
    required this.averageRating,
    required this.isFavourite,
    required this.author,
    required this.travelmethod,
    required this.steps,
    required this.categories,
    required this.images,
    this.audio,
  });

  factory RouteModel.fromJson(Map<String, dynamic> json) {
    return RouteModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      location: json['location'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      min: json['min'] ?? 0,
      active: json['active'] ?? 'no',
      routeVideoId: json['route_video_id'],
      language: json['language'],
      coverImage: json['cover_image'] ?? '',
      stepcount: json['stepcount'] ?? 0,
      duration: json['duration'] ?? 0,
      distance: json['distance'] ?? 0,
      trashed: json['trashed'] ?? false,
      averageRating: (json['average_rating'] ?? 0.0).toDouble(),
      isFavourite: json['is_favourite'] ?? false,
      author: AuthorModel.fromJson(json['author'] ?? {}),
      travelmethod: TravelMethodModel.fromJson(json['travelmethod'] ?? {}),
      steps: (json['steps'] as List<dynamic>?)
              ?.map((step) => StepModel.fromJson(step))
              .toList() ??
          [],
      categories: (json['categories'] as List<dynamic>?)
              ?.map((category) => CategoryModel.fromJson(category))
              .toList() ??
          [],
      images: (json['images'] as List<dynamic>?)
              ?.map((image) => ImageModel.fromJson(image))
              .toList() ??
          [],
      audio: json['audio'] != null ? AudioModel.fromJson(json['audio']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'location': location,
      'price': price,
      'min': min,
      'active': active,
      'route_video_id': routeVideoId,
      'language': language,
      'cover_image': coverImage,
      'stepcount': stepcount,
      'duration': duration,
      'distance': distance,
      'trashed': trashed,
      'average_rating': averageRating,
      'is_favourite': isFavourite,
      'author': author.toJson(),
      'travelmethod': travelmethod.toJson(),
      'steps': steps.map((step) => step.toJson()).toList(),
      'categories': categories.map((category) => category.toJson()).toList(),
      'images': images.map((image) => image.toJson()).toList(),
      'audio': audio?.toJson(),
    };
  }

  RouteEntity toEntity() {
    return RouteEntity(
      id: id,
      name: name,
      description: description,
      location: location,
      price: price,
      coverImage: coverImage,
      duration: duration,
      distance: distance,
      averageRating: averageRating,
      isFavourite: isFavourite,
      authorName: author.username,
      travelMethodName: travelmethod.name,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        location,
        price,
        min,
        active,
        routeVideoId,
        language,
        coverImage,
        stepcount,
        duration,
        distance,
        trashed,
        averageRating,
        isFavourite,
        author,
        travelmethod,
        steps,
        categories,
        images,
        audio,
      ];
} 