import 'package:ecommerce_app/core/utils/app_enums.dart';
import 'package:ecommerce_app/features/authentication/domain/entities/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RegisterState extends Equatable {
  final User? registerUser;
  final String registerErrorMessage;
  final RequestState registerRequestState;
//password
  final RequestState changePassState;
  final bool isPassword;
  final IconData suffix;

  const RegisterState({
    this.registerUser,
    this.registerErrorMessage = '',
    this.registerRequestState = RequestState.initializing,
    //password
    this.changePassState = RequestState.loading,
    this.isPassword = true,
    this.suffix = Icons.visibility_outlined,
  });

  RegisterState copyWith({
    User? registerUser,
    String? registerErrorMessage,
    RequestState? registerRequestState,
    //password
    RequestState? changePassState,
    bool? isPassword,
    IconData? suffix,
  }) =>
      RegisterState(
        registerUser: registerUser ?? this.registerUser,
        registerErrorMessage: registerErrorMessage ?? this.registerErrorMessage,
        registerRequestState: registerRequestState ?? this.registerRequestState,
//password
        changePassState: changePassState ?? this.changePassState,
        isPassword: isPassword ?? this.isPassword,
        suffix: suffix ?? this.suffix,
      );

  @override
  List<Object?> get props => [
        registerUser,
        registerErrorMessage,
        registerRequestState,
        changePassState,
        isPassword,
        suffix
      ];
}
