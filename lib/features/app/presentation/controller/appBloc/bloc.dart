import 'dart:async';

import 'package:ecommerce_app/core/utils/app_enums.dart';
import 'package:ecommerce_app/features/app/presentation/controller/appBloc/events.dart';
import 'package:ecommerce_app/features/app/presentation/controller/appBloc/states.dart';
import 'package:ecommerce_app/features/home/presentation/screens/cart_screen.dart';
import 'package:ecommerce_app/features/home/presentation/screens/favorite_screen.dart';
import 'package:ecommerce_app/features/home/presentation/screens/home_screen.dart';
import 'package:ecommerce_app/features/home/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppEvents, AppStates> {
  List<Widget> screens = const [
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  final layoutNavKey = GlobalKey<NavigatorState>();
  AppBloc() : super(const AppStates()) {
    on<ChangeBottomNavBarEvent>(_changeBottomNavBar);
  }

  FutureOr<void> _changeBottomNavBar(
      ChangeBottomNavBarEvent event, Emitter<AppStates> emit) {
    emit(
      state.copyWith(
        currentIndex: event.currentIndex,
        changeNaveState: RequestState.loaded,
      ),
    );
    //
    //_changeScreenBody(event.currentIndex);
  }

//List<> screens = [];
//
  // void _changeScreenBody(int index) {
  //   switch (index) {
  //     case 0:
  //       layoutNavKey.currentState?.pushReplacementNamed(Routes.homeRoute);
  //       break;
  //     case 1:
  //       layoutNavKey.currentState?.pushReplacementNamed(Routes.favoriteRoute);
  //       break;
  //     case 2:
  //       layoutNavKey.currentState?.pushReplacementNamed(Routes.cartRoute);
  //       break;
  //     case 3:
  //       layoutNavKey.currentState?.pushReplacementNamed(Routes.profileRoute);
  //       break;
  //     default:
  //       layoutNavKey.currentState?.pushNamed(Routes.homeRoute);
  //   }
  // }
}
