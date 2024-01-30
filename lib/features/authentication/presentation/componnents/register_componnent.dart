// ignore_for_file: avoid_print

import 'package:ecommerce_app/core/utils/app_enums.dart';
import 'package:ecommerce_app/core/utils/app_sizes.dart';
import 'package:ecommerce_app/core/utils/app_string.dart';
import 'package:ecommerce_app/core/utils/app_widgets.dart';
import 'package:ecommerce_app/features/authentication/domain/usecases/register_usecase.dart';
import 'package:ecommerce_app/features/authentication/presentation/controller/registerBloc/bloc.dart';
import 'package:ecommerce_app/features/authentication/presentation/controller/registerBloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/registerBloc/events.dart';

class RegisterComponnent extends StatelessWidget {
  const RegisterComponnent({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocBuilder<RegisterBloc, RegisterState>(
        buildWhen: (previous, current) =>
            current.registerRequestState != RequestState.loaded,
        builder: (context, state) {
          print('Registerrebuild');
          switch (state.registerRequestState) {
            case RequestState.loading:
              return Form(
                key: formKey,
                child: Column(children: [
                  defaultFormField(
                    controller: nameController,
                    labelText: 'User Name',
                    prefixIcon: Icons.person_add_alt_1_outlined,
                    textInputType: TextInputType.name,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Enter your Name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    onSubmitted: (value) {
                      print(value);
                    },
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: AppSize.s18,
                  ),
                  defaultFormField(
                    controller: phoneController,
                    labelText: 'Phone Number',
                    prefixIcon: Icons.phone_android_outlined,
                    textInputType: TextInputType.phone,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Enter your Phone Number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    onSubmitted: (value) {
                      print(value);
                    },
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: AppSize.s18,
                  ),
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
                    onsuffix: () => context
                        .read<RegisterBloc>()
                        .add(const ChangePassEvent()),
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  const Center(child: CircularProgressIndicator())
                ]),
              );
            default:
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    defaultFormField(
                      controller: nameController,
                      labelText: 'User Name',
                      prefixIcon: Icons.person_add_alt_1_outlined,
                      textInputType: TextInputType.name,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please Enter your Name';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        print(value);
                      },
                      onSubmitted: (value) {
                        print(value);
                      },
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: AppSize.s18,
                    ),
                    defaultFormField(
                      controller: phoneController,
                      labelText: 'Phone Number',
                      prefixIcon: Icons.phone_android_outlined,
                      textInputType: TextInputType.phone,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please Enter your Phone Number';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        print(value);
                      },
                      onSubmitted: (value) {
                        print(value);
                      },
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: AppSize.s18,
                    ),
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
                      onsuffix: () => context
                          .read<RegisterBloc>()
                          .add(const ChangePassEvent()),
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<RegisterBloc>().add(RegisterUserEvent(
                                RegisterParams(
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              ));
                        }
                      },
                      child: const Text(AppString.signUp),
                    ),
                  ],
                ),
              );
          }
        });
  }
}
