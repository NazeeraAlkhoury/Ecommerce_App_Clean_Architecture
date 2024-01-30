// ignore_for_file: avoid_print

import 'package:ecommerce_app/core/global/routes/app_routes.dart';
import 'package:ecommerce_app/core/global/theme/app_colors/app_colors_light.dart';
import 'package:ecommerce_app/core/services/services_locator.dart';

import 'package:ecommerce_app/core/utils/app_assets_image.dart';
import 'package:ecommerce_app/core/utils/app_preferences.dart';
import 'package:ecommerce_app/core/utils/app_sizes.dart';
import 'package:ecommerce_app/core/utils/app_string.dart';

import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class OnBoardingModel {
  final String image;
  final String title;
  final String body;
  OnBoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final AppPreferences _appPreferences = sl<AppPreferences>();

  final List<OnBoardingModel> onBoarding = [
    OnBoardingModel(
      image: AppAssetsImage.onBoarding1,
      title: AppString.onBoardingTitle1,
      body: AppString.onBoardingBody,
    ),
    OnBoardingModel(
      image: AppAssetsImage.onBoarding2,
      title: AppString.onBoardingTitle2,
      body: AppString.onBoardingBody,
    ),
    OnBoardingModel(
      image: AppAssetsImage.onBoarding3,
      title: AppString.onBoardingTitle3,
      body: AppString.onBoardingBody,
    ),
  ];

  var pageController = PageController();
  bool isLast = false;

  Future<void> submit() async {
    _appPreferences.setOnBoardingScreen().then(
        (value) => Navigator.pushReplacementNamed(context, Routes.loginRoute));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: AppElevation.e0,
        backgroundColor: AppColorsLight.white,
        actions: [
          TextButton(
            onPressed: () {
              submit();
            },
            child: const Text(
              'Skip',
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p30),
        child: Column(
          children: [
            const SizedBox(
              height: AppSize.s20,
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (int index) {
                  if (index == onBoarding.length - 1) {
                    print('last');
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    print('Not last');
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                itemCount: onBoarding.length,
                itemBuilder: (context, index) =>
                    buildItemBuilder(onBoarding[index]),
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: onBoarding.length,
              effect: ExpandingDotsEffect(
                activeDotColor: AppColorsLight.primaryColor,
                dotColor: AppColorsLight.ligtGrey,
                dotHeight: 8.0,
                dotWidth: 8.0,
                expansionFactor: 4,
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            ElevatedButton(
              onPressed: () {
                if (isLast == false) {
                  pageController.nextPage(
                    duration: const Duration(
                      milliseconds: 750,
                    ),
                    curve: Curves.fastLinearToSlowEaseIn,
                  );
                } else {
                  submit();
                }
              },
              child: isLast
                  ? const Text(AppString.getStarted)
                  : const Text(
                      AppString.next,
                    ),
            ),
            const SizedBox(
              height: AppSize.s40,
            )
          ],
        ),
      ),
    );
  }

  Widget buildItemBuilder(OnBoardingModel onBoardingModel) => Column(
        children: [
          Image(
            image: AssetImage(onBoardingModel.image),
            fit: BoxFit.cover,
            height: 270,
          ),
          const SizedBox(
            height: AppSize.s50,
          ),
          Text(
            textAlign: TextAlign.center,
            onBoardingModel.title,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const SizedBox(
            height: AppSize.s30,
          ),
          Text(
            textAlign: TextAlign.center,
            onBoardingModel.body,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  height: 2,
                ),
          ),
        ],
      );
}
