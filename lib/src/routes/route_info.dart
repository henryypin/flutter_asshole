import 'package:flutter_asshole/src/screens/shader_screen.dart';
import 'package:go_router/go_router.dart';

class RouteInfo {
  final String name;
  final GoRoute route;

  const RouteInfo({required this.name, required this.route});

  static List<RouteInfo> get home => [
    RouteInfo(
      name: 'Shader',
      route: GoRoute(
        path: "/shader",
        builder: (context, state) => const ShaderScreen(),
      ),
    ),
  ];
}
