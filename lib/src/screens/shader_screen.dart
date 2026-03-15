import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShaderScreen extends ConsumerStatefulWidget {
  const ShaderScreen({super.key});

  @override
  ConsumerState<ShaderScreen> createState() => _ShaderScreenState();
}

class _ShaderScreenState extends ConsumerState<ShaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shader")),
      body: ListView(
        children: [
          Image.asset("assets/images/doraemon.png", width: 300, height: 300),
        ],
      ),
    );
  }
}
