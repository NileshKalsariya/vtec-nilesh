import 'package:dartz/dartz.dart';
import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/home_data.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';
import '../datasources/home_local_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, HomeData>> getHomeData() async {
    try {
      final cachedData = await localDataSource.getCachedHomeData();
      
      if (cachedData != null) {
        final homeData = HomeData(
          nearby: cachedData.data.nearby.map((route) => route.toEntity()).toList(),
          popular: cachedData.data.popular.map((route) => route.toEntity()).toList(),
        );
        return Right(homeData);
      }
      
      final homeResponseModel = await remoteDataSource.getHomeData();
      
      await localDataSource.cacheHomeData(homeResponseModel);
      
      final homeData = HomeData(
        nearby: homeResponseModel.data.nearby.map((route) => route.toEntity()).toList(),
        popular: homeResponseModel.data.popular.map((route) => route.toEntity()).toList(),
      );
      
      return Right(homeData);
    } on ServerException catch (e) {
      final cachedData = await localDataSource.getCachedHomeData();
      if (cachedData != null) {
        final homeData = HomeData(
          nearby: cachedData.data.nearby.map((route) => route.toEntity()).toList(),
          popular: cachedData.data.popular.map((route) => route.toEntity()).toList(),
        );
        return Right(homeData);
      }
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error occurred'));
    }
  }
} 