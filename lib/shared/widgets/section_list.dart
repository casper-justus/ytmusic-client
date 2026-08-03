library ytmusic_client.shared.widgets.section_list;

import 'package:flutter/material.dart';

class SectionList<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext, T, int) itemBuilder;
  final double itemWidth;
  final double spacing;

  const SectionList({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.itemWidth = 160,
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: itemWidth + 72, // item height + text space
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length,
        separatorBuilder: (_, __) => SizedBox(width: spacing),
        itemBuilder: (context, index) => SizedBox(
          width: itemWidth,
          child: itemBuilder(context, items[index], index),
        ),
      ),
    );
  }
}

class SectionGrid<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext, T, int) itemBuilder;
  final int crossAxisCount;
  final double childAspectRatio;
  final double spacing;

  const SectionGrid({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.crossAxisCount = 2,
    this.childAspectRatio = 0.75,
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) =>
          itemBuilder(context, items[index], index),
    );
  }
}
