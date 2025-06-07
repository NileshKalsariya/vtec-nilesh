import '../models/cached_home_data.dart';
import '../models/home_response_model.dart';

abstract class HomeLocalDataSource {
  Future<HomeResponseModel?> getCachedHomeData();
  Future<void> cacheHomeData(HomeResponseModel data);
  Future<void> clearCache();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  CachedHomeData? _cachedData;

  @override
  Future<HomeResponseModel?> getCachedHomeData() async {
    if (_cachedData == null || _cachedData!.isExpired) {
      return null;
    }
    return _cachedData!.data;
  }

  @override
  Future<void> cacheHomeData(HomeResponseModel data) async {
    _cachedData = CachedHomeData(
      data: data,
      timestamp: DateTime.now(),
    );
  }

  @override
  Future<void> clearCache() async {
    _cachedData = null;
  }
} 