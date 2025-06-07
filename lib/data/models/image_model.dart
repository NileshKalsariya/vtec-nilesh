import 'package:equatable/equatable.dart';

class ImageModel extends Equatable {
  final int id;
  final String path;

  const ImageModel({
    required this.id,
    required this.path,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'] ?? 0,
      path: json['path'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'path': path,
    };
  }

  @override
  List<Object?> get props => [id, path];
} 