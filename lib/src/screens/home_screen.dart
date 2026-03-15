import 'package:flutter/material.dart';
import 'package:flutter_asshole/src/routes/route_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: RouteInfo.home.length,
        itemBuilder: (context, index) {
          final routeInfo = RouteInfo.home[index];
          return ListTile(
            title: Text(routeInfo.name),
            onTap: () {
              context.go(routeInfo.route.path);
            },
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 8),
      ),
    );
  }
}
