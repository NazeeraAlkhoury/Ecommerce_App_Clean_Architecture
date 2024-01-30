import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/utils/app_enums.dart';
import 'package:ecommerce_app/features/authentication/domain/usecases/register_usecase.dart';
import 'package:ecommerce_app/features/authentication/presentation/controller/registerBloc/events.dart';
import 'package:ecommerce_app/features/authentication/presentation/controller/registerBloc/states.dart';
import 'package:flutter/material.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUsecase registerUsecase;
  RegisterBloc(this.registerUsecase) : super(const RegisterState()) {
    on<RegisterUserEvent>(_registerUser);
    on<ChangePassEvent>(_changePass);
  }
  FutureOr<void> _registerUser(
      RegisterUserEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(
      registerRequestState: RequestState.loading,
    ));
    final result = await registerUsecase(RegisterParams(
      email: event.registerParams.email,
      name: event.registerParams.name,
      password: event.registerParams.password,
      phone: event.registerParams.phone,
    ));
    result.fold(
      (l) => emit(state.copyWith(
        registerRequestState: RequestState.error,
        registerErrorMessage: l.messageFailure,
      )),
      (r) => emit(state.copyWith(
        registerRequestState: RequestState.loaded,
        registerUser: r,
      )),
    );
  }

  FutureOr<void> _changePass(
      ChangePassEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(
      changePassState: RequestState.loaded,
      isPassword: !state.isPassword,
      suffix: state.isPassword
          ? Icons.visibility_off_outlined
          : Icons.visibility_outlined,
    ));
  }
}
