import 'package:auto_route/auto_route.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'app_router.gr.dart';
part 'app_router.g.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: SplashRoute.page, path: '/'),
        AutoRoute(page: BottomBarRoute.page, path: '/bottom-page')
      ];
}

@riverpod
AppRouter appRouter(AppRouterRef ref) {
  return AppRouter();
}
