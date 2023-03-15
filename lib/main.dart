import 'package:flutter/material.dart';
import 'package:flutter_learn/screens/memory_game_screen.dart';
import 'package:flutter_learn/widgets/dismiss_keyboard_widget.dart';
import 'package:provider/provider.dart';

import 'provider/memory_game_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MemoryGameProvider viewModel = MemoryGameProvider();
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: DismissKeyboard(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MemoryGameScreen(),
        ),
      ),
    );
  }
}
