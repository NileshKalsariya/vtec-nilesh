import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/api_constants.dart';
import '../../domain/usecases/get_home_data.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeData getHomeData;

  HomeBloc({required this.getHomeData}) : super(const HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
    on<LoadMoreNearbyRoutes>(_onLoadMoreNearbyRoutes);
    on<LoadMorePopularRoutes>(_onLoadMorePopularRoutes);
  }

  Future<void> _onLoadHomeData(
    LoadHomeData event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());

    final result = await getHomeData();

    result.fold(
      (failure) => emit(HomeError(message: failure.message)),
      (homeData) {
        final displayedNearby = homeData.nearby.take(ApiConstants.itemsPerPage).toList();
        final displayedPopular = homeData.popular.take(ApiConstants.itemsPerPage).toList();

        emit(HomeLoaded(
          allData: homeData,
          displayedNearbyRoutes: displayedNearby,
          displayedPopularRoutes: displayedPopular,
          hasMoreNearby: homeData.nearby.length > ApiConstants.itemsPerPage,
          hasMorePopular: homeData.popular.length > ApiConstants.itemsPerPage,
        ));
      },
    );
  }

  Future<void> _onLoadMoreNearbyRoutes(
    LoadMoreNearbyRoutes event,
    Emitter<HomeState> emit,
  ) async {
    if (state is! HomeLoaded) return;

    final currentState = state as HomeLoaded;
    
    emit(currentState.copyWith(isLoadingMoreNearby: true));

    await Future.delayed(const Duration(milliseconds: 500));

    final currentDisplayedCount = currentState.displayedNearbyRoutes.length;
    final totalAvailable = currentState.allData.nearby.length;
    
    if (currentDisplayedCount < totalAvailable) {
      final nextItems = currentState.allData.nearby
          .skip(currentDisplayedCount)
          .take(ApiConstants.itemsPerPage)
          .toList();
      
      final updatedDisplayedRoutes = [
        ...currentState.displayedNearbyRoutes,
        ...nextItems,
      ];

      emit(currentState.copyWith(
        displayedNearbyRoutes: updatedDisplayedRoutes,
        hasMoreNearby: updatedDisplayedRoutes.length < totalAvailable,
        isLoadingMoreNearby: false,
      ));
    } else {
      emit(currentState.copyWith(isLoadingMoreNearby: false));
    }
  }

  Future<void> _onLoadMorePopularRoutes(
    LoadMorePopularRoutes event,
    Emitter<HomeState> emit,
  ) async {
    if (state is! HomeLoaded) return;

    final currentState = state as HomeLoaded;
    
    emit(currentState.copyWith(isLoadingMorePopular: true));

    await Future.delayed(const Duration(milliseconds: 500));

    final currentDisplayedCount = currentState.displayedPopularRoutes.length;
    final totalAvailable = currentState.allData.popular.length;
    
    if (currentDisplayedCount < totalAvailable) {
      final nextItems = currentState.allData.popular
          .skip(currentDisplayedCount)
          .take(ApiConstants.itemsPerPage)
          .toList();
      
      final updatedDisplayedRoutes = [
        ...currentState.displayedPopularRoutes,
        ...nextItems,
      ];

      emit(currentState.copyWith(
        displayedPopularRoutes: updatedDisplayedRoutes,
        hasMorePopular: updatedDisplayedRoutes.length < totalAvailable,
        isLoadingMorePopular: false,
      ));
    } else {
      emit(currentState.copyWith(isLoadingMorePopular: false));
    }
  }
} 