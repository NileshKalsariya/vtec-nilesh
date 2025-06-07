import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../core/network/api_client.dart';
import '../data/datasources/home_remote_data_source.dart';
import '../data/datasources/home_local_data_source.dart';
import '../data/repositories/home_repository_impl.dart';
import '../domain/repositories/home_repository.dart';
import '../domain/usecases/get_home_data.dart';
import '../presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => HomeBloc(getHomeData: sl()),
  );

  sl.registerLazySingleton(() => GetHomeData(sl()));

  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(),
  );

  sl.registerLazySingleton(() => ApiClient(dio: sl()));
  sl.registerLazySingleton(() => Dio());
}
