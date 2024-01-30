// import 'package:ecommerce_app/core/global/routes/app_routes.dart';
// import 'package:ecommerce_app/features/app/presentation/controller/appBloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class LayoutBodyComponnent extends StatelessWidget {
//   const LayoutBodyComponnent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       key: BlocProvider.of<AppBloc>(context).layoutNavKey,
//       initialRoute: Routes.homeRoute,
//       onGenerateRoute: RouteGenerator.getRoutes,
//       onGenerateInitialRoutes: (_, route) => [
//         RouteGenerator.getRoutes(RouteSettings(name: route)),
//       ],
//     );
//   }
// }
