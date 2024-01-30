// ignore_for_file: avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/global/routes/app_routes.dart';

import 'package:ecommerce_app/core/global/theme/app_colors/app_colors_light.dart';
import 'package:ecommerce_app/core/global/theme/app_text_styles.dart';

import 'package:ecommerce_app/core/utils/app_enums.dart';
import 'package:ecommerce_app/core/utils/app_sizes.dart';

import 'package:ecommerce_app/features/home/presentation/controller/home_bloc/bloc.dart';
import 'package:ecommerce_app/features/home/presentation/controller/home_bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesComponnent extends StatelessWidget {
  const CategoriesComponnent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStates>(
        buildWhen: (previous, current) =>
            previous.categoriesReqState != current.categoriesReqState,
        builder: (context, state) {
          switch (state.categoriesReqState) {
            case RequestState.loaded:
              print('Categories loaded');
              return SizedBox(
                height: 120,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) {
                      final categories = state.categories[index];
                      return Padding(
                        padding: const EdgeInsetsDirectional.only(
                            end: AppPadding.p12),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8.0),
                          onTap: () {
                            Navigator.pushNamed(
                              context, Routes.categoryDetialsRoute,
                              arguments: {
                                'id': categories.id,
                                'name': categories.name,
                              },
                              //  categories.id
                            );
                          },
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: CachedNetworkImage(
                                  imageUrl: categories.image,
                                  width: 110,
                                  height: 120,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      height: 120.0,
                                      width: 110.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[100]!,
                                    borderRadius:
                                        const BorderRadiusDirectional.only(
                                      bottomEnd: Radius.circular(8),
                                      bottomStart: Radius.circular(8),
                                    )),
                                height: 20,
                                width: 110,
                                alignment: Alignment.center,
                                child: Text(
                                  categories.name,
                                  style: getRegularStyle(
                                      color: AppColorsLight.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );

                      //  InkWell(
                      //   onTap: (() {}),
                      //   child: Stack(
                      //     alignment: Alignment.bottomCenter,
                      //     children: [
                      //       ClipRRect(
                      //         borderRadius: BorderRadius.circular(8.0),
                      //         child: CachedNetworkImage(
                      //           imageUrl: categories.image,
                      //           width: 100,
                      //           fit: BoxFit.cover,
                      //           errorWidget: (context, url, error) =>
                      //               const Icon(Icons.error),
                      //         ),
                      //       ),
                      //       Text(categories.name),
                      //     ],
                      //   ),
                      // );
                    }),
              );

            case RequestState.error:
              print('Categories error');
              return SizedBox(
                height: 120,
                child: Text(state.categoriesErrorMessage),
              );
            default:
              print('Categories loading');
              return const SizedBox(
                height: 120,
                child: Center(child: CircularProgressIndicator()),
              );
          }
        });
  }
}
