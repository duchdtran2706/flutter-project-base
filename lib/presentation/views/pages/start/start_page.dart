import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_base/presentation/base/base_page.dart';
import 'package:flutter_project_base/presentation/router/app_router.gr.dart';
import 'package:flutter_project_base/presentation/views/pages/start/start_cubit.dart';
import 'package:flutter_project_base/presentation/views/pages/start/start_state.dart';
import 'package:flutter_project_base/presentation/views/widgets/app_navigation_bar.dart';

@RoutePage()
class StartPage extends BasePage<StartCubit, StartState> {
  const StartPage({super.key});

  @override
  Widget builder(BuildContext context, StartCubit cubit, StartState state) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        ShoppingRoute(),
        CouponRoute(),
        StoreRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabRouter) {
        return AppNavigationBar(
          selectedIndex: tabRouter.activeIndex,
          onDestinationSelected: tabRouter.setActiveIndex,
        );
      },
    );
  }
}
