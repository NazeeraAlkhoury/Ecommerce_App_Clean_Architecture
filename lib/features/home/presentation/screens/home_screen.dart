// ignore_for_file: avoid_print

import 'package:ecommerce_app/core/global/routes/app_routes.dart';
import 'package:ecommerce_app/core/global/theme/app_colors/app_colors_light.dart';
import 'package:ecommerce_app/core/global/theme/app_fonts.dart';
import 'package:ecommerce_app/core/global/theme/app_text_styles.dart';

import 'package:ecommerce_app/core/utils/app_sizes.dart';
import 'package:ecommerce_app/core/utils/app_string.dart';
import 'package:ecommerce_app/features/home/presentation/componnents/banners_componnent.dart';
import 'package:ecommerce_app/features/home/presentation/componnents/categories_componnent.dart';
import 'package:ecommerce_app/features/home/presentation/componnents/products_componnent.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('home build');
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: AppPadding.p20,
            end: AppPadding.p20,
            top: AppPadding.p20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BannersComponnet(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.categories,
                    style: getSemiBoldStyle(
                      color: AppColorsLight.black,
                      fontsize: AppFontSize.s16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.categories);
                    },
                    child: const Text(AppString.seeMore),
                  ),
                ],
              ),
              const CategoriesComponnent(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p5,
                ),
                child: Text(
                  AppString.products,
                  style: getSemiBoldStyle(
                    color: AppColorsLight.black,
                    fontsize: AppFontSize.s16,
                  ),
                ),
              ),
              const ProductsComponnent(),
            ],
          ),
        ),
      ),

      //   ),
    );
  }
}
