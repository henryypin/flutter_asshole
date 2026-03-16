import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_asshole/src/paint/shader_painter.dart';
import 'package:flutter_asshole/src/utils/image_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum _Tab {
  color,
  blackAndWhite,
  pixelated;

  String get label {
    switch (this) {
      case _Tab.color:
        return '彩色';
      case _Tab.blackAndWhite:
        return '黑白';
      case _Tab.pixelated:
        return '馬賽克';
    }
  }

  String get sharderPath {
    switch (this) {
      case _Tab.color:
        return 'assets/shaders/color.frag';
      case _Tab.blackAndWhite:
        return 'assets/shaders/black_and_white.frag';
      case _Tab.pixelated:
        return 'assets/shaders/pixelated.frag';
    }
  }
}

class ShaderScreen extends ConsumerStatefulWidget {
  const ShaderScreen({super.key});

  @override
  ConsumerState<ShaderScreen> createState() => _ShaderScreenState();
}

class _ShaderScreenState extends ConsumerState<ShaderScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final ui.Image? _image;
  List<FragmentShader?> _shaders = const [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _Tab.values.length, vsync: this);
    _loadImage();
    _loadShaders();
  }

  Future<void> _loadImage() async {
    _image = await ImageUtil.loadImageFromAsset("assets/images/doraemon.png");
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadShaders() async {
    final programs = await Future.wait(
      _Tab.values.map((tab) => FragmentProgram.fromAsset(tab.sharderPath)),
    );
    if (!mounted) return;
    setState(() {
      _shaders = programs.map((program) => program.fragmentShader()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shader")),
      body: ListView(
        children: [
          () {
            final width = 300.0;
            final height = 300.0;
            if (_shaders.isEmpty) {
              return SizedBox(
                width: width,
                height: height,
                child: const CircularProgressIndicator(),
              );
            }

            return CustomPaint(
              size: Size(width, height),
              painter: ShaderPainter(
                shader: _shaders[_tabController.index]!,
                image: _image!,
              ),
            );
          }(),
          TabBar(
            controller: _tabController,
            tabs: _Tab.values.map((tab) => Tab(text: tab.label)).toList(),
          ),
        ],
      ),
    );
  }
}
