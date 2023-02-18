import 'package:flutter/material.dart';
import 'package:flutter_learn/widgets/memory_game_widget.dart';
import 'package:provider/provider.dart';

import '../provider/memory_game_provider.dart';

class MemoryGameScreen extends StatelessWidget {
  const MemoryGameScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MemoryGameProvider>(builder: (context, viewModel, child) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return MemoryGameWidget(
                      card: viewModel.cards![index],
                      viewModel: viewModel,
                    );
                  },
                  itemCount: viewModel.cards?.length,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
