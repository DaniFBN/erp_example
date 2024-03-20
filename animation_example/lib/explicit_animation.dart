import 'dart:math';

import 'package:flutter/material.dart';

class ExplicitAnimation extends StatefulWidget {
  const ExplicitAnimation({super.key});

  @override
  State<ExplicitAnimation> createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> firstSize;
  late final Animation<Color?> color;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    firstSize = Tween<double>(
      begin: 100,
      end: 200,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.elasticInOut));

    final random = Random();
    color = ColorTween(
      begin: Colors.red,
      end: Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1,
      ),
    ).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.value == 0) {
          controller.forward();
        } else {
          controller.reverse();
        }
      },
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Container(
            height: firstSize.value,
            width: firstSize.value,
            color: color.value,
          );
        },
      ),
    );
  }
}
