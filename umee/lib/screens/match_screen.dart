import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../models/user_model.dart';
import '../widgets/user_card.dart';

class MatchScreen extends StatefulWidget {
    const MatchScreen({super.key});

    @override
    State<MatchScreen> createState() => _MatchScreenState();
    }

    class _MatchScreenState extends State<MatchScreen> {
        late CardSwiperController _controller = CardSwiperController();
        late Key _deckKey;
        late List<UserCard> _cards;
        bool _isDeckEmpty = false;

        @override
        void initState() {
            super.initState();
            _resetDeck();
        }

        void _resetDeck() {
            _controller = CardSwiperController();
            _cards = mockMatchers.map((u) => UserCard(u)).toList();
            _deckKey = UniqueKey();        // forces the swiper to rebuild
            _isDeckEmpty = false;
        }

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(title: const Text("Find Friends")),
                body: SafeArea(
                    child: _isDeckEmpty
                    // ——— EMPTY STATE ———
                        ? Center(
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                                const Icon(Icons.sentiment_dissatisfied,
                                    size: 80, color: Colors.grey),
                                const SizedBox(height: 16),
                                const Text(
                                    "No more matches!",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.yellowAccent,
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                                const SizedBox(height: 8),
                                ElevatedButton(
                                    onPressed: () {
                                        setState(() {
                                            // reset the deck
                                            _resetDeck();
                                        });
                                    },
                                    child: const Text("Try Again"),
                                ),
                            ],
                        ),
                    )

                    // ——— SWIPE + BUTTONS STATE ———
                        : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            // Swipe area
                            Flexible(
                                child: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.85,
                                    height: MediaQuery.of(context).size.height * 0.65,
                                    child: CardSwiper(
                                        key: _deckKey,
                                        controller: _controller,
                                        cardsCount: _cards.length,
                                        numberOfCardsDisplayed: 3,
                                        backCardOffset: const Offset(30, 30),
                                        padding: EdgeInsets.zero,
                                        cardBuilder: (ctx, i, _,
                                            __) => _cards[i],
                                        onSwipe: (_, __, ___) => true,
                                        onEnd: () {
                                            setState(() {
                                                _isDeckEmpty = true;
                                            });
                                        },
                                    ),
                                ),
                            ),

                            // Buttons row
                            Padding(
                                padding: const EdgeInsets.only(bottom: 24),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceEvenly,
                                    children: [
                                        FloatingActionButton(
                                            heroTag: 'undo',
                                            onPressed: _controller.undo,
                                            child: const Icon(
                                                Icons.rotate_left),
                                        ),
                                        FloatingActionButton(
                                            heroTag: 'dislike',
                                            backgroundColor: Colors.red,
                                            onPressed: () =>
                                                _controller.swipe(
                                                    CardSwiperDirection.left),
                                            child: const Icon(Icons.close),
                                        ),
                                        FloatingActionButton(
                                            heroTag: 'like',
                                            backgroundColor: Colors.green,
                                            onPressed: () =>
                                                _controller.swipe(
                                                    CardSwiperDirection.right),
                                            child: const Icon(Icons.favorite),
                                        ),
                                        FloatingActionButton(
                                            heroTag: 'SuperLike',
                                            backgroundColor: Colors.blue,
                                            onPressed: () =>
                                            _controller.swipe(
                                                CardSwiperDirection.top
                                            ),
                                            child: const Icon(Icons.star)
                                        )
                                    ],
                                ),
                            ),
                        ],
                    ),
                ),
            );
        }
    }
