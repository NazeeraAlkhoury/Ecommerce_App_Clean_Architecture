// ignore_for_file: avoid_print

import 'package:ecommerce_app/core/global/routes/app_routes.dart';
import 'package:ecommerce_app/core/global/theme/app_colors/app_colors_light.dart';
import 'package:ecommerce_app/core/global/theme/app_fonts.dart';
import 'package:ecommerce_app/core/services/services_locator.dart';
import 'package:ecommerce_app/core/utils/app_enums.dart';
import 'package:ecommerce_app/core/utils/app_preferences.dart';
import 'package:ecommerce_app/core/utils/app_sizes.dart';
import 'package:ecommerce_app/core/utils/app_string.dart';
import 'package:ecommerce_app/core/utils/app_widgets.dart';
import 'package:ecommerce_app/features/authentication/presentation/componnents/register_componnent.dart';
import 'package:ecommerce_app/features/authentication/presentation/controller/registerBloc/bloc.dart';
import 'package:ecommerce_app/features/authentication/presentation/controller/registerBloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AppPreferences _appPreferences = sl<AppPreferences>();
  @override
  Widget build(BuildContext context) {
    print('Registerscreen');
    return BlocProvider(
        create: (BuildContext context) => sl<RegisterBloc>(),
        child: BlocListener<RegisterBloc, RegisterState>(
          listener: (BuildContext context, state) {
            if (state.registerRequestState == RequestState.loaded) {
              _appPreferences
                  .setToken(token: state.registerUser!.data!.token)
                  .then((value) {
                showToast(
                  toastState: ToastState.success,
                  message: state.registerUser!.message,
                );
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.layoutRoute, (route) => false);
              });
            } else {
              if (state.registerRequestState == RequestState.error) {
                showToast(
                  toastState: ToastState.error,
                  message: state.registerErrorMessage,
                );
              }
            }
          },
          child: Scaffold(
            appBar: AppBar(
              elevation: AppElevation.e0,
              backgroundColor: AppColorsLight.white,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.welcomBack,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: AppSize.s5,
                      ),
                      Text(
                        AppString.signUpText,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: AppColorsLight.grey, height: 2),
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      const RegisterComponnent(),
                      const SizedBox(
                        height: AppSize.s12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppString.account,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: AppFontSize.s14),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(AppString.signIn),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
