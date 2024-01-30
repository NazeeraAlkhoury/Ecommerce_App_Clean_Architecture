import 'package:ecommerce_app/core/utils/app_enums.dart';

import 'package:ecommerce_app/features/authentication/domain/entities/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LogInState extends Equatable {
  final String logInErrorMessage;
  final RequestState logInRequestState;
  final User? user;
  //password
  final RequestState changePassState;
  final bool isPassword;
  final IconData suffix;

  const LogInState({
    this.logInErrorMessage = ' ',
    this.logInRequestState = RequestState.initializing,
    this.user,
    //password
    this.changePassState = RequestState.loading,
    this.isPassword = true,
    this.suffix = Icons.visibility_outlined,
  });

  LogInState copyWith({
    String? logInErrorMessage,
    RequestState? logInRequestState,
    User? user,
    //password
    RequestState? changePassState,
    bool? isPassword,
    IconData? suffix,
  }) =>
      LogInState(
        logInErrorMessage: logInErrorMessage ?? this.logInErrorMessage,
        logInRequestState: logInRequestState ?? this.logInRequestState,
        user: user ?? this.user,
        //password
        changePassState: changePassState ?? this.changePassState,
        isPassword: isPassword ?? this.isPassword,
        suffix: suffix ?? this.suffix,
      );
  @override
  List<Object?> get props => [
        logInErrorMessage,
        logInRequestState,
        user,
        //password
        changePassState,
        isPassword,
        suffix,
      ];
}
