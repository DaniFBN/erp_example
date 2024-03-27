// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HorizontalItem {
  final double percentage;
  final String label;

  const HorizontalItem({
    required this.percentage,
    required this.label,
  });
}

class Graph extends StatelessWidget {
  final double internalPaintGap;
  final double gap;
  final double height;
  final double width;
  final List<String> verticalItems;
  final List<HorizontalItem> horizontalItems;

  const Graph({
    super.key,
    required this.internalPaintGap,
    required this.gap,
    required this.height,
    required this.width,
    required this.verticalItems,
    required this.horizontalItems,
  });

  @override
  Widget build(BuildContext context) {
    final heightPerItem = (height - gap) / verticalItems.length;
    final widthPerItem =
        (width - gap - internalPaintGap) / horizontalItems.length;

    print(widthPerItem);

    return Container(
      color: Colors.grey,
      width: width,
      height: height,
      child: Stack(
        children: [
          ...List.generate(verticalItems.length, (index) {
            final item = verticalItems.elementAt(index);

            return Positioned(
              left: 0,
              width: width,
              bottom: (heightPerItem * index) + gap,
              child: VerticalItem(
                gap: gap,
                label: item,
              ),
            );
          }),
          ...List.generate(horizontalItems.length, (index) {
            final item = horizontalItems.elementAt(index);

            final firstPosition = ((width / 2) * -1) + gap + internalPaintGap;

            print(firstPosition);

            final position = widthPerItem * (index);

            return Positioned(
              bottom: 0,
              left: firstPosition + position,
              width: width,
              child: HorizontalItemWidget(
                gap: gap,
                item: item,
                height: height,
              ),
            );
          }),
        ],
      ),
    );
  }
}

class HorizontalItemWidget extends StatelessWidget {
  final double gap;
  final HorizontalItem item;
  final double height;

  const HorizontalItemWidget({
    super.key,
    required this.gap,
    required this.item,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 8,
          height: height * item.percentage,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(500),
              topRight: Radius.circular(500),
            ),
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: gap,
          child: Text(item.label),
        ),
      ],
    );
  }
}

class VerticalItem extends StatelessWidget {
  final String label;
  final double gap;

  const VerticalItem({
    super.key,
    required this.label,
    required this.gap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: gap,
          child: Text(label),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Container(
            height: 2,
            decoration: const BoxDecoration(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
