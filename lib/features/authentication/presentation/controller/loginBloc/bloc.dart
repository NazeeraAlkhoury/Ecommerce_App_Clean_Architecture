// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/utils/app_enums.dart';
import 'package:ecommerce_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:ecommerce_app/features/authentication/presentation/controller/loginBloc/events.dart';
import 'package:ecommerce_app/features/authentication/presentation/controller/loginBloc/states.dart';
import 'package:flutter/material.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final LogInUsecase logInUsecase;

  LogInBloc(
    this.logInUsecase,
  ) : super(const LogInState()) {
    on<LogInUserEvent>(_logInUser);
    on<ChangePassEvent>(_changePass);
  }
  FutureOr<void> _logInUser(
      LogInUserEvent event, Emitter<LogInState> emit) async {
    emit(
      state.copyWith(logInRequestState: RequestState.loading),
    );
    final result = await logInUsecase(
      LoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
      (l) => emit(
        state.copyWith(
          logInErrorMessage: l.messageFailure,
          logInRequestState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          user: r,
          logInRequestState: RequestState.loaded,
        ),
      ),
      // {
      //   emit(
      //     state.copyWith(
      //       user: r,
      //       logInRequestState: RequestState.loaded,
      //     ),
      //   );
      //   AppConstants.printFullText(
      //     'result is : ${r.data}',
      //   );
      // },
    );
  }

  FutureOr<void> _changePass(ChangePassEvent event, Emitter<LogInState> emit) {
    emit(state.copyWith(
      changePassState: RequestState.loaded,
      isPassword: !state.isPassword,
      //عكست الايقونة لانو القيمة الاساسية الي مع الحالة الابتدائية لن تتبدل عند اول كبسة ونحن نبدل تبعا لقيمة ispassword المرسلة بالبداية مع الحالة ويمكن ك حل بديل تغيير قيمة الايقونة في ui
      suffix: state.isPassword
          ? Icons.visibility_off_outlined
          : Icons.visibility_outlined,
    ));
  }
}
