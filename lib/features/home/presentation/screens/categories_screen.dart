// ignore_for_file: sort_child_properties_last

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/global/routes/app_routes.dart';
import 'package:ecommerce_app/core/global/theme/app_colors/app_colors_light.dart';
import 'package:ecommerce_app/core/utils/app_sizes.dart';
import 'package:ecommerce_app/features/home/presentation/controller/home_bloc/bloc.dart';
import 'package:ecommerce_app/features/home/presentation/controller/home_bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
        ),
      ),
      body: showCategories(),
    );
  }

  Widget showCategories() => BlocBuilder<HomeBloc, HomeStates>(
      buildWhen: (previous, current) =>
          current.categoriesReqState != previous.categoriesReqState,
      builder: (context, state) {
        return AnimationLimiter(
          child: ListView.builder(
              padding: const EdgeInsets.all(AppPadding.p20),
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                  delay: const Duration(milliseconds: 100),
                  position: index,
                  child: SlideAnimation(
                    horizontalOffset: 30.0,
                    verticalOffset: 300.0,
                    delay: const Duration(milliseconds: 100),
                    duration: const Duration(milliseconds: 2500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: FlipAnimation(
                      duration: const Duration(milliseconds: 3000),
                      curve: Curves.fastLinearToSlowEaseIn,
                      flipAxis: FlipAxis.y,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.categoryDetialsRoute,
                            arguments: {
                              'id': state.categories[index].id,
                              'name': state.categories[index].name,
                            },
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: AppMargin.m20),
                          padding: const EdgeInsets.all(AppPadding.p10),
                          child: Row(
                            children: [
                              Container(
                                height: 130,
                                width: 100,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s20),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: state.categories[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: AppSize.s20,
                              ),
                              // Expanded(
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Text(
                              //         state.categories[index].name,
                              //       ),
                              //       const SizedBox(
                              //         height: AppSize.s18,
                              //       ),
                              //       // Text(
                              //       //   ' ${state.categoryDetailsData!.total} Items',
                              //       // ),
                              //     ],
                              //   ),
                              // ),
                              Expanded(
                                child: Text(
                                  state.categories[index].name,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              const Icon(Icons.arrow_forward_ios_outlined),
                            ],
                          ),
                          height: 130,
                          decoration: BoxDecoration(
                            color: AppColorsLight.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColorsLight.black.withOpacity(0.1),
                                //يحدد درجة ضبابية الظلال
                                blurRadius: 40,
                                //يحدد مقدار انتشار الظلال
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        );
      });
}
