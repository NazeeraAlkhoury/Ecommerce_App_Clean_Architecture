// ignore_for_file: avoid_print

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/utils/app_enums.dart';
import 'package:ecommerce_app/features/home/presentation/controller/home_bloc/bloc.dart';
import 'package:ecommerce_app/features/home/presentation/controller/home_bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannersComponnet extends StatelessWidget {
  const BannersComponnet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStates>(
      buildWhen: (previous, current) =>
          //   previous.bannaresReqState != current.bannaresReqState,
          previous.homeRequestState != current.homeRequestState,
      builder: (context, state) {
        switch (state.homeRequestState) {
          case RequestState.loaded:
            print('banners loaded');
            return FadeIn(
              duration: const Duration(seconds: 1),
              child: CarouselSlider(
                items: state.home!.data.banners!
                    // state.bannares
                    .map(
                      (item) => CachedNetworkImage(
                        imageUrl: item.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        //                       errorWidget: (context, url, error) => const Center(
                        //   child: Text('Error loading image'),
                        // ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  scrollPhysics: const ScrollPhysics(),
                  height: 180,
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(
                    seconds: 2,
                  ),
                  autoPlayInterval: const Duration(
                    seconds: 3,
                  ),
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  enableInfiniteScroll: true,
                  viewportFraction: 1.0,
                ),
              ),
            );

          case RequestState.initializing:
            print('banners initializing');
            return const SizedBox(
              height: 180.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestState.loading:
            print('banners loading');
            return const SizedBox(
              height: 180.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case RequestState.error:
            print('banners error');
            return SizedBox(
              height: 180.0,
              child: Center(
                child: Text(state.homeErrorMessage),
              ),
            );
        }
      },
    );
  }
}
