import 'package:flutter/material.dart';
import 'package:flutter_learn/models/card_model.dart';

class AspectRatioWidget<Item extends CardModel> extends StatelessWidget {
  final List<Item> items;
  final double aspectRatio;
  final Function(Item) content;

  const AspectRatioWidget({
    Key? key,
    required this.items,
    required this.aspectRatio,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => _buildLayout(context, constraints),
    );
  }

  Widget _buildLayout(BuildContext context, BoxConstraints constraints) {
    final width =
        _widthThatFits(items.length, constraints.maxWidth, aspectRatio);
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (constraints.maxWidth / width).floor(),
              childAspectRatio: aspectRatio * 0.7,
              crossAxisSpacing: 7,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return content(items[index]);
            },
          ),
        ),
      ],
    );
  }

  double _widthThatFits(int itemCount, double width, double itemAspectRatio) {
    var columnCount = 1;
    var rowCount = itemCount;

    do {
      final itemWidth = width / columnCount;
      final itemHeight = itemWidth / itemAspectRatio;

      if (rowCount * itemHeight < width) {
        break;
      }

      columnCount += 1;
      rowCount = (itemCount + (columnCount - 1)) ~/ columnCount;
    } while (columnCount < itemCount);

    if (columnCount > itemCount) {
      columnCount = itemCount;
    }

    return (width / columnCount).floorToDouble();
  }
}
