import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitAnimation extends StatefulWidget {
  const ImplicitAnimation({super.key});

  @override
  State<ImplicitAnimation> createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  bool firstSize = true;
  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          firstSize = !firstSize;

          final random = Random();

          color = Color.fromRGBO(
            random.nextInt(255),
            random.nextInt(255),
            random.nextInt(255),
            1,
          );
        });
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        height: firstSize ? 100 : 200,
        width: firstSize ? 100 : 200,
        color: color,
      ),
    );
  }
}
