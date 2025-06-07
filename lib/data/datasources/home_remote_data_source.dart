import 'dart:convert';
import '../../core/network/api_client.dart';
import '../../core/error/exceptions.dart';
import '../../core/constants/api_constants.dart';
import '../models/home_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeResponseModel> getHomeData();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient client;

  HomeRemoteDataSourceImpl({required this.client});

  @override
  Future<HomeResponseModel> getHomeData() async {
    try {
      final response = await client.get(ApiConstants.routesEndpoint);

      if (response.data is String) {
        String stringResponse = response.data as String;

        if (stringResponse.trim().startsWith('{') &&
            stringResponse.trim().endsWith('}')) {
          Map<String, dynamic> jsonData = json.decode(stringResponse);
          return HomeResponseModel.fromJson(jsonData);
        } else {
          throw ServerException(
              'Authentication or server error. Please check your credentials.');
        }
      }

      if (response.data is Map<String, dynamic>) {
        return HomeResponseModel.fromJson(
            response.data as Map<String, dynamic>);
      }

      throw ServerException('API returned unexpected data format');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException('Failed to fetch home data: ${e.toString()}');
    }
  }
}
