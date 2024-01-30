// ignore_for_file: avoid_print

import 'package:ecommerce_app/core/utils/app_enums.dart';
import 'package:ecommerce_app/core/utils/app_widgets.dart';
import 'package:ecommerce_app/features/home/presentation/controller/home_bloc/bloc.dart';
import 'package:ecommerce_app/features/home/presentation/controller/home_bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsComponnent extends StatelessWidget {
  const ProductsComponnent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStates>(
        buildWhen: (previous, current) =>
            previous.homeRequestState != current.homeRequestState,
        builder: (context, state) {
          switch (state.homeRequestState) {
            case RequestState.loaded:
              print('product loaded');
              return GridView.builder(
                shrinkWrap: true,
                // scrollDirection: Axis.vertical,
                itemCount: state.home!.data.products.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.52,
                ),

                itemBuilder: (context, index) => productItem(
                  context: context,
                  product: state.home!.data.products[index],
                ),
              );

            case RequestState.error:
              print('product error');
              return Text(state.homeErrorMessage);

            default:
              print('product loading');
              return const SizedBox(
                height: 240,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
          }
        });
  }
}
