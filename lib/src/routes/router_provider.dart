import 'package:flutter_asshole/src/routes/route_info.dart';
import 'package:flutter_asshole/src/screens/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const HomeScreen(),
        routes: RouteInfo.home.map((info) => info.route).toList(),
      ),
    ],
  );
}
