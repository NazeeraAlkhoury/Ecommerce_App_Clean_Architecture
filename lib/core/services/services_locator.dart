import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/netwok/api_constance.dart';

import 'package:ecommerce_app/core/utils/app_preferences.dart';
import 'package:ecommerce_app/core/utils/dio_helper.dart';
import 'package:ecommerce_app/features/app/presentation/controller/appBloc/bloc.dart';
import 'package:ecommerce_app/features/authentication/data/dataSource/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/authentication/data/repository/auth_repository.dart';
import 'package:ecommerce_app/features/authentication/domain/repository/auth_base_repository.dart';
import 'package:ecommerce_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:ecommerce_app/features/authentication/domain/usecases/register_usecase.dart';
import 'package:ecommerce_app/features/authentication/presentation/controller/loginBloc/bloc.dart';
import 'package:ecommerce_app/features/authentication/presentation/controller/registerBloc/bloc.dart';
import 'package:ecommerce_app/features/home/data/datasource/remote_data_source.dart';
import 'package:ecommerce_app/features/home/data/repository/home_repository.dart';
import 'package:ecommerce_app/features/home/domain/repository/home_base_repository.dart';
import 'package:ecommerce_app/features/home/domain/usecases/get_bannares_usecase.dart';
import 'package:ecommerce_app/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:ecommerce_app/features/home/domain/usecases/get_category_details_usecase.dart';
import 'package:ecommerce_app/features/home/domain/usecases/get_home_data_usecase.dart';
import 'package:ecommerce_app/features/home/presentation/controller/home_bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    //Bloc
    sl.registerFactory(() => LogInBloc(sl()));
    sl.registerFactory(() => RegisterBloc(sl()));
    sl.registerFactory(() => AppBloc());
    sl.registerFactory(() => HomeBloc(
          sl(),
          sl(),
          sl(),
          //  sl(),
        ));

    // sharedpreferences instance
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

    // AppPreferences instance
    sl.registerLazySingleton<AppPreferences>(() => AppPreferences(sl()));

    // Dio instance
    Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstance.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    sl.registerLazySingleton<Dio>(() => dio);

    // dioHelper instance
    sl.registerLazySingleton(() => DioHelper(sl()));

    //dataSource instance
    sl.registerLazySingleton<AuthBaseRemoteDataSource>(
        () => AuthRemoteDataSource(sl()));

    sl.registerLazySingleton<HomeBaseRemoteDataSource>(
        () => HomeRemoteDataSource(sl()));

    // Repository
    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));
    sl.registerLazySingleton<HomeBaseRepository>(() => HomeRepository(sl()));

    // useCases instance
    sl.registerLazySingleton(() => LogInUsecase(sl()));
    sl.registerLazySingleton(() => RegisterUsecase(sl()));
    sl.registerLazySingleton(() => GetHomeDataUsecase(sl()));
    sl.registerLazySingleton(() => GetBannersUsecase(sl()));
    sl.registerLazySingleton(() => GetCategoriesUsecase(sl()));
    sl.registerLazySingleton(() => GetCategoryDetailsUsecase(sl()));
  }
}
