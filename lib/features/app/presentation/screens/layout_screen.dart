// ignore_for_file: avoid_print

import 'package:bottom_bar/bottom_bar.dart';
import 'package:ecommerce_app/core/global/theme/app_colors/app_colors_light.dart';
import 'package:ecommerce_app/core/global/theme/app_fonts.dart';
import 'package:ecommerce_app/core/global/theme/app_text_styles.dart';
import 'package:ecommerce_app/core/services/services_locator.dart';
import 'package:ecommerce_app/core/utils/app_string.dart';

import 'package:ecommerce_app/features/app/presentation/controller/appBloc/bloc.dart';
import 'package:ecommerce_app/features/app/presentation/controller/appBloc/events.dart';

import 'package:ecommerce_app/features/app/presentation/controller/appBloc/states.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  // var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print('layout build');
    double displayWidth = MediaQuery.of(context).size.width;
    print(displayWidth);
    return BlocBuilder<AppBloc, AppStates>(builder: (context, state) {
      print('Layout build');
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: const Icon(Icons.search_rounded), onPressed: (() {})),
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () {},
            ),
          ],
        ),
        drawer: const Drawer(),
        body:
            //const LayoutBodyComponnent(),
            sl<AppBloc>().screens[state.currentIndex],
        bottomNavigationBar: Material(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: BottomBar(
              selectedIndex: state.currentIndex,
              onTap: (int index) {
                context.read<AppBloc>().add(ChangeBottomNavBarEvent(index));
                index = state.currentIndex;
                HapticFeedback.lightImpact();
              },
              textStyle: getSemiBoldStyle(
                color: AppColorsLight.primaryColor,
                fontsize: AppFontSize.s15,
              ),
              items: const <BottomBarItem>[
                BottomBarItem(
                  icon: Icon(Icons.home),
                  title: Text(AppString.home),
                  activeColor: AppColorsLight.primaryColor,
                ),
                BottomBarItem(
                  icon: Icon(Icons.favorite),
                  title: Text(AppString.favorite),
                  activeColor: AppColorsLight.primaryColor,
                ),
                BottomBarItem(
                  icon: Icon(Icons.shopping_bag),
                  title: Text(AppString.cart),
                  activeColor: AppColorsLight.primaryColor,
                ),
                BottomBarItem(
                  icon: Icon(Icons.person),
                  title: Text(AppString.profile),
                  activeColor: AppColorsLight.primaryColor,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
  


// Container(
//           margin: EdgeInsets.all(displayWidth * .05),
//           //ذا يعني أن ارتفاع العنصر سيكون يساوي 15.5% من عرض الشاشة الحالي للجهاز.
//           height: displayWidth * .155,
//           decoration: BoxDecoration(
//             color: AppColorsLight.white,
//             boxShadow: [
//               BoxShadow(
//                 color: AppColorsLight.black.withOpacity(.1),
//                 blurRadius: AppSize.s30,
//                 offset: const Offset(0, 10),
//               ),
//             ],
//             borderRadius: BorderRadius.circular(AppSize.s50),
//           ),
//           child: ListView.builder(
//             itemCount: 4,
//             scrollDirection: Axis.horizontal,
//             padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
//             itemBuilder: (context, index) => InkWell(
//               onTap: (() {
//                 context.read<AppBloc>().add(ChangeBottomNavBarEvent(index));
//                 // index = state.currentIndex;
//                 // setState(() {});
//                 //اعطاء تأثير بصري و حسي عند الضغط
//                 HapticFeedback.lightImpact();
//               }),
//               //اللون الذي يظهر عند الضغط ع العنصر
//               splashColor: Colors.transparent,
//               //  ن يتم عرض اي تاثير بصري عند النقر على العنصر وهنا قمنا باعطاءه الون الشفاف  اي انه ل
//               //  اللون الذي يظهر عند تجديد العنصر
//               highlightColor: Colors.transparent,
//               child: Stack(
//                 children: [
//                   AnimatedContainer(
//                     duration: const Duration(seconds: 1),
//                     curve: Curves.fastLinearToSlowEaseIn,
//                     width: index == state.currentIndex
//                         ? displayWidth * .32
//                         : displayWidth * .18,
//                     alignment: Alignment.center,
//                     child: AnimatedContainer(
//                       duration: const Duration(seconds: 1),
//                       curve: Curves.fastLinearToSlowEaseIn,
//                       height:
//                           index == state.currentIndex ? displayWidth * .12 : 0,
//                       width:
//                           index == state.currentIndex ? displayWidth * .32 : 0,
//                       decoration: BoxDecoration(
//                         color: index == state.currentIndex
//                             ? AppColorsLight.primaryColor.withOpacity(.2)
//                             : Colors.transparent,
//                         borderRadius: BorderRadius.circular(50),
//                       ),
//                     ),
//                   ),
//                   AnimatedContainer(
//                     duration: const Duration(seconds: 1),
//                     curve: Curves.fastLinearToSlowEaseIn,
//                     width: index == state.currentIndex
//                         ? displayWidth * .31
//                         : displayWidth * .18,
//                     alignment: Alignment.center,
//                     child: Stack(children: [
//                       Row(
//                         children: [
//                           AnimatedContainer(
//                             duration: const Duration(seconds: 1),
//                             curve: Curves.fastLinearToSlowEaseIn,
//                             width: index == state.currentIndex
//                                 ? displayWidth * .13
//                                 : 0,
//                           ),
//                           AnimatedOpacity(
//                             opacity: index == state.currentIndex ? 1 : 0,
//                             duration: const Duration(seconds: 1),
//                             curve: Curves.fastLinearToSlowEaseIn,
//                             child: Text(
//                               index == state.currentIndex
//                                   ? listOfString[index]
//                                   : '',
//                               style: getSemiBoldStyle(
//                                 color: AppColorsLight.primaryColor,
//                                 fontsize: AppFontSize.s15,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           AnimatedContainer(
//                             duration: const Duration(seconds: 1),
//                             curve: Curves.fastLinearToSlowEaseIn,
//                             width: index == state.currentIndex
//                                 ? displayWidth * .03
//                                 : 20,
//                           ),
//                           Icon(
//                             listOfIcons[index],
//                             size: displayWidth * .076,
//                             color: index == state.currentIndex
//                                 ? AppColorsLight.primaryColor
//                                 : Colors.black26,
//                           )
//                         ],
//                       )
//                     ]),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
