// ignore_for_file: avoid_print

import 'package:ecommerce_app/core/services/services_locator.dart';
import 'package:ecommerce_app/features/home/presentation/componnents/category_details_componnent.dart';

import 'package:ecommerce_app/features/home/presentation/controller/home_bloc/bloc.dart';
import 'package:ecommerce_app/features/home/presentation/controller/home_bloc/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorieDetials extends StatelessWidget {
  // final int id;
  // final String name;
  final Map<String, dynamic> arguments;

  const CategorieDetials({
    super.key,
    required this.arguments,

    // required this.id,
    // required this.name,
  });

  @override
  Widget build(BuildContext context) {
    // final id = ModalRoute.of(context)!.settings.arguments as int;
    return BlocProvider.value(
      value: sl<HomeBloc>()
        ..add(
          GetCatDetailsEvent(
            catId: arguments['id'],
          ),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(arguments['name']),
        ),
        body: const CategoryDetialsComponnent(),
      ),
    );
  }
}
