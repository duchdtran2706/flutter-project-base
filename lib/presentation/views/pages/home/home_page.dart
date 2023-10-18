import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_base/presentation/base/base_page.dart';
import 'package:flutter_project_base/presentation/views/pages/home/home_cubit.dart';
import 'package:flutter_project_base/presentation/views/pages/home/home_state.dart';

@RoutePage()
class HomePage extends BasePage<HomeCubit, HomeState> {
  const HomePage({super.key});

  @override
  Widget builder(context, cubit, state) {
    return const Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
