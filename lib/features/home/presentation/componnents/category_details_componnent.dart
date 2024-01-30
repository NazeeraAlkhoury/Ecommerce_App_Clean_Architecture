// ignore_for_file: avoid_print

import 'package:ecommerce_app/core/utils/app_enums.dart';
import 'package:ecommerce_app/core/utils/app_sizes.dart';
import 'package:ecommerce_app/core/utils/app_widgets.dart';
import 'package:ecommerce_app/features/home/presentation/controller/home_bloc/bloc.dart';
import 'package:ecommerce_app/features/home/presentation/controller/home_bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetialsComponnent extends StatelessWidget {
  const CategoryDetialsComponnent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStates>(
      builder: (context, state) {
        switch (state.catDetailsState) {
          case RequestState.loaded:
            print('detials loaded');
            final data = state.categoryDetailsData!.data;
            return Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: CustomScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.52,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      childCount: data.length,
                      (context, index) => productItem(
                        context: context,
                        product: data[index],
                      ),
                    ),
                  ),
                ],
              ),
            );

          case RequestState.error:
            print('detials errror');
            return Center(child: Text(state.categoriesErrorMessage));
          default:
            print('detials loading');
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
