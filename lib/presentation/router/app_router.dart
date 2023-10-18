import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, initial: true),
    AutoRoute(page: StartRoute.page,children: [
      AutoRoute(page: HomeRoute.page),
      AutoRoute(page: ShoppingRoute.page),
      AutoRoute(page: CouponRoute.page),
      AutoRoute(page: StoreRoute.page),
      AutoRoute(page: ProfileRoute.page),
    ]),
  ];
}
