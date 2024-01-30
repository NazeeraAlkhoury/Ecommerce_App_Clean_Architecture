// ignore_for_file: avoid_print

import 'package:ecommerce_app/core/global/routes/app_routes.dart';
import 'package:ecommerce_app/core/global/theme/app_colors/app_colors_light.dart';
import 'package:ecommerce_app/core/services/services_locator.dart';
import 'package:ecommerce_app/core/utils/app_enums.dart';

import 'package:ecommerce_app/core/global/theme/app_fonts.dart';
import 'package:ecommerce_app/core/utils/app_preferences.dart';
import 'package:ecommerce_app/core/utils/app_sizes.dart';
import 'package:ecommerce_app/core/utils/app_string.dart';
import 'package:ecommerce_app/core/utils/app_widgets.dart';
import 'package:ecommerce_app/features/authentication/presentation/componnents/login_component.dart';
import 'package:ecommerce_app/features/authentication/presentation/controller/loginBloc/bloc.dart';
import 'package:ecommerce_app/features/authentication/presentation/controller/loginBloc/states.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AppPreferences _appPreferences = sl<AppPreferences>();
  @override
  Widget build(BuildContext context) {
    print('loginscreen');
    return BlocProvider(
        create: (BuildContext context) => sl<LogInBloc>(),
        child: BlocListener<LogInBloc, LogInState>(
          listener: (BuildContext context, state) {
            if (state.logInRequestState == RequestState.loaded) {
              _appPreferences
                  .setToken(token: state.user!.data!.token)
                  .then((value) {
                showToast(
                  toastState: ToastState.success,
                  message: state.user!.message,
                );
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.layoutRoute, (route) => false);
              });
            } else {
              if (state.logInRequestState == RequestState.error) {
                showToast(
                  toastState: ToastState.error,
                  message: state.logInErrorMessage,
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
                        AppString.logInText,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: AppColorsLight.grey, height: 2),
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      const LogInComponnent(),
                      // defaultFormField(
                      //   controller: emailController,
                      //   labelText: 'Email Address',
                      //   prefixIcon: Icons.email_outlined,
                      //   textInputType: TextInputType.emailAddress,
                      //   validate: (String? value) {
                      //     if (value!.isEmpty) {
                      //       return 'Please Enter your email address';
                      //     }
                      //     return null;
                      //   },
                      //   onChanged: (value) {
                      //     print(value);
                      //   },
                      //   onSubmitted: (value) {
                      //     print(value);
                      //   },
                      //   onTap: () {},
                      // ),
                      // const SizedBox(
                      //   height: AppSize.s12,
                      // ),
                      // BlocBuilder<LogInBloc, LogInState>(
                      //   builder: (BuildContext context, state) {
                      //     print('visability');
                      //     return defaultFormField(
                      //       controller: passwordController,
                      //       labelText: 'Password',
                      //       prefixIcon: Icons.lock_outline,
                      //       textInputType: TextInputType.visiblePassword,
                      //       validate: (String? value) {
                      //         if (value!.isEmpty) {
                      //           return 'Password is Empty';
                      //         }
                      //         return null;
                      //       },
                      //       isObscureText: state.isPassword,
                      //       suffixIcon: state.suffix,
                      //       onChanged: (value) {
                      //         print(value);
                      //       },
                      //       onSubmitted: (value) {
                      //         print(value);
                      //       },
                      //       onTap: () {},
                      //       onsuffix: () => context
                      //           .read<LogInBloc>()
                      //           .add(const ChangePassEvent()),
                      // setState(() {});
                      // isPassword = !isPassword;
                      // suffix = isPassword
                      //     ? Icons.visibility_outlined
                      //     : Icons.visibility_off_outlined;
                      //  sl().read<LogInBloc>().add(const ChangePassEvent());
                      //  sl<LogInBloc>().add(const ChangePassEvent());
                      //     );
                      //   },
                      // ),
                      // const SizedBox(
                      //   height: AppSize.s10,
                      // ),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: Text(
                      //     'Forget Password?'.toUpperCase(),
                      //   ),
                      // ),
                      // BlocBuilder<LogInBloc, LogInState>(
                      //   builder: (context, state) {
                      //     print('login builder');
                      //     switch (state.logInRequestState) {
                      //       case RequestState.initializing:
                      //         return ElevatedButton(
                      //           onPressed: () {
                      //             if (formKey.currentState!.validate()) {
                      //               print(emailController.text);
                      //               print(passwordController.text);

                      //               sl<LogInBloc>().add(
                      //                 LogInUserEvent(
                      //                   emailController.text,
                      //                   passwordController.text,
                      //                 ),
                      //               );
                      //             }
                      //           },
                      //           child: const Text('Login'),
                      //         );
                      //       case RequestState.loading:
                      //         return const Center(
                      //             child: CircularProgressIndicator());

                      // case RequestState.loaded:
                      //   print(state.user!.data.toString());
                      //       case RequestState.error:
                      //         return ElevatedButton(
                      //           onPressed: () {
                      //             if (formKey.currentState!.validate()) {
                      //               print(emailController.text);
                      //               print(passwordController.text);

                      //               sl<LogInBloc>().add(
                      //                 LogInUserEvent(
                      //                   emailController.text,
                      //                   passwordController.text,
                      //                 ),
                      //               );
                      //             }
                      //           },
                      //           child: const Text('Login'),
                      //         );

                      //       case RequestState.loaded:
                      //         return const HomeScreen();
                      //     }
                      //   },
                      // ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     if (formKey.currentState!.validate()) {
                      //       print(emailController.text);
                      //       print(passwordController.text);

                      //       sl<LogInBloc>().add(
                      //         LogInUserEvent(
                      //           emailController.text,
                      //           passwordController.text,
                      //         ),
                      //       );
                      //     }
                      //   },
                      //   child: const Text('Login'),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     if (formKey.currentState!.validate()) {
                      //       print(emailController.text);
                      //       print(passwordController.text);

                      //       sl<AuthBloc>().add(
                      //         LogInUserEvent(
                      //           emailController.text,
                      //           passwordController.text,
                      //         ),
                      //       );
                      //     }
                      //   },
                      //   child: const Text('Login'),
                      // ),
                      // BuildCondition(
                      //   condition: state.user != null,
                      //   builder: (context) =>
                      //       const Center(child: CircularProgressIndicator()),
                      //   fallback: (context) => ElevatedButton(
                      //     onPressed: () {
                      //       if (formKey.currentState!.validate()) {
                      //         print(emailController.text);
                      //         print(passwordController.text);

                      //         sl<LogInBloc>().add(
                      //           LogInUserEvent(
                      //             emailController.text,
                      //             passwordController.text,
                      //           ),
                      //         );
                      //       }
                      //     },
                      //     child: const Text('Login'),
                      //   ),
                      // ),
                      const SizedBox(
                        height: AppSize.s12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppString.noAccount,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: AppFontSize.s14),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, Routes.registerRoute);
                            },
                            child: const Text(AppString.signUp),
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
