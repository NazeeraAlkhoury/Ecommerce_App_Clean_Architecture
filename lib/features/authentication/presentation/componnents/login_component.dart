// ignore_for_file: avoid_print

import 'package:ecommerce_app/core/utils/app_enums.dart';
import 'package:ecommerce_app/core/utils/app_sizes.dart';
import 'package:ecommerce_app/core/utils/app_string.dart';
import 'package:ecommerce_app/core/utils/app_widgets.dart';
import 'package:ecommerce_app/features/authentication/presentation/controller/loginBloc/bloc.dart';
import 'package:ecommerce_app/features/authentication/presentation/controller/loginBloc/events.dart';
import 'package:ecommerce_app/features/authentication/presentation/controller/loginBloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInComponnent extends StatelessWidget {
  const LogInComponnent({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocBuilder<LogInBloc, LogInState>(
        buildWhen: (previous, current) =>
            current.logInRequestState != RequestState.loaded,
        builder: (context, state) {
          print('loginrebuild');
          switch (state.logInRequestState) {
            case RequestState.loading:
              return Form(
                key: formKey,
                child: Column(children: [
                  defaultFormField(
                    controller: emailController,
                    labelText: AppString.emailAddress,
                    prefixIcon: Icons.email_outlined,
                    textInputType: TextInputType.emailAddress,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return AppString.validateEmail;
                      }
                      return null;
                    },
                    onChanged: (value) {},
                    onSubmitted: (value) {},
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: AppSize.s18,
                  ),
                  defaultFormField(
                    controller: passwordController,
                    labelText: AppString.passWord,
                    prefixIcon: Icons.lock_outline,
                    textInputType: TextInputType.visiblePassword,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return AppString.validatePassword;
                      }
                      return null;
                    },
                    isObscureText: state.isPassword,
                    suffixIcon: state.suffix,
                    onChanged: (value) {},
                    onSubmitted: (value) {},
                    onTap: () {},
                    onsuffix: () =>
                        context.read<LogInBloc>().add(const ChangePassEvent()),
                    // setState(() {});
                    // isPassword = !isPassword;
                    // suffix = isPassword
                    //     ? Icons.visibility_outlined
                    //     : Icons.visibility_off_outlined;
                    //  sl().read<LogInBloc>().add(const ChangePassEvent());
                    //  sl<LogInBloc>().add(const ChangePassEvent());
                  ),
                  const SizedBox(
                    height: AppSize.s5,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          AppString.forgetPassword,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  const Center(child: CircularProgressIndicator())
                ]
                    // ElevatedButton(
                    //   onPressed: () {
                    //     if (formKey.currentState!.validate()) {
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

                    ),
              );
            default:
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    defaultFormField(
                      controller: emailController,
                      labelText: AppString.emailAddress,
                      prefixIcon: Icons.email_outlined,
                      textInputType: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return AppString.validateEmail;
                        }
                        return null;
                      },
                      onChanged: (value) {},
                      onSubmitted: (value) {
                        FocusScope.of(context).nextFocus();
                      },
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: AppSize.s18,
                    ),
                    defaultFormField(
                      controller: passwordController,
                      labelText: AppString.passWord,
                      prefixIcon: Icons.lock_outline,
                      textInputType: TextInputType.visiblePassword,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return AppString.validatePassword;
                        }
                        return null;
                      },
                      isObscureText: state.isPassword,
                      suffixIcon: state.suffix,
                      onChanged: (value) {},
                      onSubmitted: (value) {
                        // FocusScope.of(context).nextFocus();
                        if (formKey.currentState!.validate()) {
                          context.read<LogInBloc>().add(
                                LogInUserEvent(
                                  emailController.text,
                                  passwordController.text,
                                ),
                              );
                        }
                      },
                      onTap: () {},
                      onsuffix: () => context
                          .read<LogInBloc>()
                          .add(const ChangePassEvent()),
                      // setState(() {});
                      // isPassword = !isPassword;
                      // suffix = isPassword
                      //     ? Icons.visibility_outlined
                      //     : Icons.visibility_off_outlined;
                      //  sl().read<LogInBloc>().add(const ChangePassEvent());
                      //  sl<LogInBloc>().add(const ChangePassEvent());
                    ),
                    const SizedBox(
                      height: AppSize.s5,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          AppString.forgetPassword,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<LogInBloc>().add(
                                LogInUserEvent(
                                  emailController.text,
                                  passwordController.text,
                                ),
                              );
                        }
                      },
                      child: const Text(AppString.logIn),
                    ),
                  ],
                ),
              );
          }
        });
  }
}
