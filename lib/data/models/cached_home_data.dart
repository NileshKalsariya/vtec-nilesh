import 'package:equatable/equatable.dart';
import '../../core/constants/api_constants.dart';
import 'home_response_model.dart';

class CachedHomeData extends Equatable {
  final HomeResponseModel data;
  final DateTime timestamp;

  const CachedHomeData({
    required this.data,
    required this.timestamp,
  });

  bool get isExpired {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    return difference >= ApiConstants.cacheExpiration;
  }

  @override
  List<Object?> get props => [data, timestamp];
} 