import 'dart:math';

import 'package:flutter/material.dart';

class ImplicitWithValueNotifierAnimation extends StatelessWidget {
  ImplicitWithValueNotifierAnimation({super.key});

  final firstSize = ValueNotifier<bool>(true);
  final color = ValueNotifier<Color>(Colors.red);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        firstSize.value = !firstSize.value;

        final random = Random();

        color.value = Color.fromRGBO(
          random.nextInt(255),
          random.nextInt(255),
          random.nextInt(255),
          1,
        );
      },
      child: AnimatedBuilder(
        animation: Listenable.merge([firstSize, color]),
        builder: (context, child) {
          return AnimatedContainer(
            duration: const Duration(seconds: 2),
            height: firstSize.value ? 100 : 200,
            width: firstSize.value ? 100 : 200,
            color: color.value,
          );
        },
      ),
    );
  }
}
