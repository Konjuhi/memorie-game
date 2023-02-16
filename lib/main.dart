import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContentViewScreen(),
    );
  }
}

class ContentViewScreen extends StatefulWidget {
  const ContentViewScreen({Key? key}) : super(key: key);

  @override
  State<ContentViewScreen> createState() => _ContentViewScreenState();
}

class _ContentViewScreenState extends State<ContentViewScreen> {
  List<String> emojis = [
    '🚕',
    '🚗',
    '🚒',
    '🛵',
    '🚌',
    '🚕',
    '🚗',
    '🚒',
    '🛵',
    '🚌',
  ];

  List<Widget> cards = [];
  int emojiCount = 5;
  int lastCardIndex = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < emojiCount; i++) {
      cards.add(CardView(content: emojis[i]));
      cards.add(const SizedBox(width: 10));
      lastCardIndex = i * 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, bottom: 50, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              children: cards,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (emojiCount > 1) {
                          cards.removeAt(lastCardIndex);
                          cards.removeAt(lastCardIndex);
                          emojiCount -= 1;
                          lastCardIndex -= 2;
                        }
                      });
                    },
                    iconSize: 45,
                    icon: const Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (emojiCount < emojis.length) {
                          String newEmoji = emojis[emojiCount];
                          cards.add(CardView(content: newEmoji));
                          cards.add(const SizedBox(width: 10));
                          emojiCount += 1;
                          lastCardIndex += 2;
                        }
                      });
                    },
                    iconSize: 45,
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardView extends StatefulWidget {
  const CardView({
    Key? key,
    this.isFaceUp = true,
    this.content,
  }) : super(key: key);
  final bool isFaceUp;
  final String? content;

  @override
  CardViewState createState() => CardViewState();
}

class CardViewState extends State<CardView> {
  late bool _isFaceUp;

  @override
  void initState() {
    super.initState();
    _isFaceUp = widget.isFaceUp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            _isFaceUp = !_isFaceUp;
          },
        );
      },
      child: _isFaceUp
          ? Container(
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: Colors.red,
                ),
              ),
              child: FittedBox(
                fit: BoxFit.none,
                child: Text(
                  widget.content!,
                  style: const TextStyle(
                    fontSize: 35,
                  ),
                ),
              ),
            )
          : Container(
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 45,
                  color: Colors.red,
                ),
                color: Colors.red,
              ),
            ),
    );
  }
}
