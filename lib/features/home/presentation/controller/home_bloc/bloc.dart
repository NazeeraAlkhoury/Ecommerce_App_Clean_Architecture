import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/usecases/base_usecase.dart';
import 'package:ecommerce_app/core/utils/app_enums.dart';

import 'package:ecommerce_app/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:ecommerce_app/features/home/domain/usecases/get_category_details_usecase.dart';
import 'package:ecommerce_app/features/home/domain/usecases/get_home_data_usecase.dart';
import 'package:ecommerce_app/features/home/presentation/controller/home_bloc/events.dart';
import 'package:ecommerce_app/features/home/presentation/controller/home_bloc/states.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  final GetHomeDataUsecase _getHomeDataUsecase;
  // final GetBannersUsecase _getBannersUsecase;
  final GetCategoriesUsecase _getCategoriesUsecase;
  final GetCategoryDetailsUsecase _getCategoryDetailsUsecase;
  HomeBloc(
    //  this._getBannersUsecase,
    this._getCategoriesUsecase,
    this._getCategoryDetailsUsecase,
    this._getHomeDataUsecase,
  ) : super(const HomeStates()) {
    on<GetHomeEvent>((GetHomeEvent event, Emitter<HomeStates> emit) async {
      final result = await _getHomeDataUsecase(const NoParameters());
      result.fold(
          (l) => emit(state.copyWith(
                homeErrorMessage: l.messageFailure,
                homeRequestState: RequestState.error,
              )),
          (r) => emit(state.copyWith(
                home: r,
                homeRequestState: RequestState.loaded,
              )));
    });

    // on<GetBannersEvent>(_getBanners);

    on<GetCategoriesEvent>(_getCategories);
    on<GetCatDetailsEvent>(_getCatDetais);
  }
  // FutureOr<void> _getBanners(
  //     GetBannersEvent event, Emitter<HomeStates> emit) async {
  //   final result = await _getBannersUsecase(const NoParameter());
  //   result.fold(
  //     (l) => emit(
  //       state.copyWith(
  //         bnnnaresErrorMessage: l.messageFailure,
  //         bannaresReqState: RequestState.error,
  //       ),
  //     ),
  //     (r) => emit(
  //       state.copyWith(
  //         bannares: r,
  //         bannaresReqState: RequestState.loaded,
  //       ),
  //     ),
  //   );
  // }

  FutureOr<void> _getCategories(
      GetCategoriesEvent event, Emitter<HomeStates> emit) async {
    final result = await _getCategoriesUsecase(const NoParameter());
    result.fold(
      (l) => emit(
        state.copyWith(
          categoriesErrorMessage: l.messageFailure,
          categoriesReqState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          categories: r,
          categoriesReqState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getCatDetais(
      GetCatDetailsEvent event, Emitter<HomeStates> emit) async {
    final result = await _getCategoryDetailsUsecase(
        CatDetailsParams(categoryId: event.catId));
    result.fold(
        (l) => emit(
              state.copyWith(
                catDetailsState: RequestState.error,
                catDetailsErrorMessage: l.messageFailure,
              ),
            ),
        (r) => emit(
              state.copyWith(
                catDetailsState: RequestState.loaded,
                categoryDetailsData: r,
              ),
            ));
  }
}
