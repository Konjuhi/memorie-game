import 'package:flutter/material.dart';
import 'package:flutter_learn/representer_view.dart';

import 'emoji_memory_game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EmojiMemoryGame viewModel = EmojiMemoryGame();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContentView(
        viewModel: viewModel,
      ),
    );
  }
}

// class ContentViewScreen extends StatefulWidget {
//   const ContentViewScreen({Key? key}) : super(key: key);
//   final EmojiMemoryGame viewModel;
//
//   @override
//   State<ContentViewScreen> createState() => _ContentViewScreenState();
// }
//
// class _ContentViewScreenState extends State<ContentViewScreen> {
//   List<String> emojis = [
//     '🚕',
//     '🚗',
//     '🚒',
//     '🛵',
//     '🚌',
//     '🚕',
//     '🚗',
//     '🚒',
//     '🛵',
//     '🚌',
//   ];
//
//   List<Widget> cards = [];
//   int emojiCount = 5;
//   int lastCardIndex = 0;
//
//   // void generateCards() {
//   //   cards.clear();
//   //   for (int i = 0; i < emojiCount; i++) {
//   //     cards.add(CardView(content: emojis[i]));
//   //     cards.add(const SizedBox(width: 10));
//   //     lastCardIndex = i * 2;
//   //   }
//   // }
//
//   @override
//   void initState() {
//     super.initState();
//     // generateCards();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     for (int i = 0; i < emojiCount; i++) {
//       cards.add(CardView(content: emojis[i]));
//       cards.add(const SizedBox(width: 10));
//       lastCardIndex = i * 2;
//     }
//     return Scaffold(
//       body: Padding(
//         padding:
//             const EdgeInsets.only(left: 10, right: 10, bottom: 50, top: 50),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//               child: GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 5,
//                   mainAxisSpacing: 15,
//                   crossAxisSpacing: 20,
//                 ),
//                 itemCount: emojiCount,
//                 itemBuilder: (BuildContext context, int index) {
//                   return CardView(content: emojis[index]);
//                 },
//               ),
//             ),
//             //const Spacer(),
//             // Padding(
//             //   padding: const EdgeInsets.only(left: 50, right: 50),
//             //   child: Row(
//             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //     crossAxisAlignment: CrossAxisAlignment.center,
//             //     children: [
//             //       IconButton(
//             //         onPressed: () {
//             //           setState(() {
//             //             if (emojiCount > 1) {
//             //               cards.removeAt(lastCardIndex);
//             //               emojiCount -= 1;
//             //               lastCardIndex -= 2;
//             //             }
//             //           });
//             //         },
//             //         iconSize: 50,
//             //         icon: const Icon(
//             //           Icons.remove_circle_outline,
//             //           color: Colors.blue,
//             //         ),
//             //       ),
//             //       IconButton(
//             //         onPressed: () {
//             //           setState(() {
//             //             if (emojiCount < emojis.length) {
//             //               String newEmoji = emojis[emojiCount];
//             //               cards.add(CardView(content: newEmoji));
//             //               cards.add(const SizedBox(width: 10));
//             //               emojiCount += 1;
//             //               lastCardIndex += 2;
//             //             }
//             //           });
//             //         },
//             //         iconSize: 50,
//             //         icon: const Icon(
//             //           Icons.add_circle_outline,
//             //           color: Colors.blue,
//             //         ),
//             //       )
//             //     ],
//             //   ),
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CardView extends StatefulWidget {
//   const CardView({
//     Key? key,
//     this.isFaceUp,
//     this.content,
//   }) : super(key: key);
//   final bool? isFaceUp;
//   final String? content;
//
//   @override
//   CardViewState createState() => CardViewState();
// }
//
// class CardViewState extends State<CardView> {
//   bool _isFaceUp = true;
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _isFaceUp = widget.isFaceUp;
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(
//           () {
//             _isFaceUp = !_isFaceUp;
//           },
//         );
//       },
//       child: _isFaceUp
//           ? Container(
//               width: 70,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   width: 2,
//                   color: Colors.red,
//                 ),
//               ),
//               child: FittedBox(
//                 fit: BoxFit.none,
//                 child: Text(
//                   widget.content!,
//                   style: const TextStyle(
//                     fontSize: 35,
//                   ),
//                 ),
//               ),
//             )
//           : Container(
//               width: 70,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   width: 45,
//                   color: Colors.red,
//                 ),
//                 color: Colors.red,
//               ),
//             ),
//     );
//   }
// }
