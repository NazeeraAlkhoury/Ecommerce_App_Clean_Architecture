// ignore_for_file: avoid_print

import 'package:ecommerce_app/core/global/routes/app_routes.dart';
import 'package:ecommerce_app/core/global/theme/theme_data/theme_data_light.dart';
import 'package:ecommerce_app/core/services/services_locator.dart';
import 'package:ecommerce_app/core/utils/app_string.dart';
import 'package:ecommerce_app/core/utils/bloc_observer.dart';

import 'package:ecommerce_app/features/app/presentation/controller/appBloc/bloc.dart';
import 'package:ecommerce_app/features/home/presentation/controller/home_bloc/bloc.dart';
import 'package:ecommerce_app/features/home/presentation/controller/home_bloc/events.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesLocator().init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AppBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<HomeBloc>()
            ..add(GetHomeEvent())
            //      ..add(GetBannersEvent())
            ..add(GetCategoriesEvent()),
        ),
      ],
      child: MaterialApp(
        title: AppString.appName,
        theme: getThemeDataLight(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoutes,
        initialRoute: Routes.splashRoute,
      ),
    );
  }
}
