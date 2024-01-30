import 'package:ecommerce_app/core/utils/app_enums.dart';
import 'package:ecommerce_app/features/home/domain/entities/categories_entity.dart';
import 'package:ecommerce_app/features/home/domain/entities/category_detials_entity.dart';
import 'package:ecommerce_app/features/home/domain/entities/home_entity.dart';
import 'package:equatable/equatable.dart';

class HomeStates extends Equatable {
  // final List<Banners> bannares;
  // final RequestState bannaresReqState;
  // final String bnnnaresErrorMessage;

  // Home
  final Home? home;
  final RequestState homeRequestState;
  final String homeErrorMessage;

  //categories
  final List<Categories> categories;
  final RequestState categoriesReqState;
  final String categoriesErrorMessage;
  // CategoryDetials
  final CategoryDetailsData? categoryDetailsData;
  final RequestState catDetailsState;
  final String catDetailsErrorMessage;

  const HomeStates({
    // this.bannares = const [],
    // this.bnnnaresErrorMessage = '',
    // this.bannaresReqState = RequestState.loading,

//Home
    this.home,
    this.homeErrorMessage = '',
    this.homeRequestState = RequestState.loading,

    //categories
    this.categories = const [],
    this.categoriesErrorMessage = '',
    this.categoriesReqState = RequestState.loading,

    // CategoryDetials
    this.categoryDetailsData,
    this.catDetailsErrorMessage = '',
    this.catDetailsState = RequestState.loading,
  });

  HomeStates copyWith({
    // List<Banners>? bannares,
    // RequestState? bannaresReqState,
    // String? bnnnaresErrorMessage,
//home
    Home? home,
    RequestState? homeRequestState,
    String? homeErrorMessage,

    //categories
    List<Categories>? categories,
    RequestState? categoriesReqState,
    String? categoriesErrorMessage,
    // CategoryDetials
    CategoryDetailsData? categoryDetailsData,
    RequestState? catDetailsState,
    String? catDetailsErrorMessage,
  }) =>
      HomeStates(
          // bannares: bannares ?? this.bannares,
          // bnnnaresErrorMessage:
          //     bnnnaresErrorMessage ?? this.bnnnaresErrorMessage,
          // bannaresReqState: bannaresReqState ?? this.bannaresReqState,

          //home
          home: home ?? this.home,
          homeErrorMessage: homeErrorMessage ?? this.homeErrorMessage,
          homeRequestState: homeRequestState ?? this.homeRequestState,

          //categories
          categories: categories ?? this.categories,
          categoriesErrorMessage:
              categoriesErrorMessage ?? this.categoriesErrorMessage,
          categoriesReqState: categoriesReqState ?? this.categoriesReqState,
          // CategoryDetials
          categoryDetailsData: categoryDetailsData ?? this.categoryDetailsData,
          catDetailsState: catDetailsState ?? this.catDetailsState,
          catDetailsErrorMessage:
              catDetailsErrorMessage ?? this.catDetailsErrorMessage);

  @override
  List<Object?> get props => [
        // bannares,
        // bnnnaresErrorMessage,
        // bannaresReqState,
        home,
        homeErrorMessage,
        homeRequestState,
        categories,
        categoriesErrorMessage,
        categoriesReqState,
        catDetailsErrorMessage,
        catDetailsState,
        categoryDetailsData,
      ];
}
