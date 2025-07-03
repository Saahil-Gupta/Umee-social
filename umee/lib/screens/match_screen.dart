import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../data/match_data.dart';
import '../models/user_model.dart';
import '../widgets/user_card.dart';

class MatchScreen extends StatefulWidget {
    const MatchScreen({Key? key}) : super(key: key);

    @override
    State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
    late CardSwiperController _controller;
    late List<UserProfile> _availableUsers;
    late List<UserCard> _cards;
    late Key _deckKey;
    bool _isDeckEmpty = false;

    @override
    void initState() {
        super.initState();
        _resetDeck();
    }

    void _resetDeck() {
        // 1) clear previous matches
        matchedUsers.clear();
        // 2) initialize available users from mockUsers
        _availableUsers = List.from(mockMatchers);
        // 3) reset controller and key
        _controller = CardSwiperController();
        _deckKey = UniqueKey();
        // 4) build card widgets list
        _buildCards();
        // 5) update empty state
        setState(() {
            _isDeckEmpty = _availableUsers.isEmpty;
        });
    }

    void _buildCards() {
        _cards = _availableUsers.map((u) => UserCard(u)).toList();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(backgroundColor: Colors.black12,
                leadingWidth: 128,
            leading: Padding(
                padding: const EdgeInsets.all(8.0),
            child: Image.asset(
                'assets/images/umeelogo.png',
                width: 48,
                height: 48,
                fit: BoxFit.contain,
            ),
            ),
                title: const Text("Find Friends!", style: TextStyle(color: Colors.yellow),),
                centerTitle: true,
            ),
            body: SafeArea(
                child: _isDeckEmpty ? _buildEmpty() : _buildSwiper(context),
            ),
        );
    }

    Widget _buildEmpty() {
        return Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                    const Icon(Icons.sentiment_dissatisfied, size: 80, color: Colors.grey),
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
                        onPressed: _resetDeck,
                        child: const Text("Try Again"),
                    ),
                ],
            ),
        );
    }

    Widget _buildSwiper(BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Flexible(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.65,
                        child: CardSwiper(
                            key: _deckKey,
                            controller: _controller,
                            cardsCount: _cards.length,
                            // numberOfCardsDisplayed: _cards.length < 3 ? _cards.length : 3,
                            numberOfCardsDisplayed: 1   ,
                            backCardOffset: Offset.zero,
                            padding: EdgeInsets.zero,
                            cardBuilder: (ctx, i, _, __) => _cards[i],
                            onSwipe: (prevIndex, _, direction) {
                                // ensure valid index
                                if (prevIndex < 0 || prevIndex >= _availableUsers.length) return true;
                                final user = _availableUsers[prevIndex];
                                if (direction == CardSwiperDirection.right) {
                                    matchedUsers.add(user);
                                }
                                setState(() {
                                    _availableUsers.removeAt(prevIndex);
                                    _buildCards();
                                    _deckKey = UniqueKey();
                                    _isDeckEmpty = _availableUsers.isEmpty;
                                });
                                return true;
                            },
                        ),
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                            FloatingActionButton(
                                heroTag: 'undo',
                                onPressed: _controller.undo,
                                child: const Icon(Icons.rotate_left, color: Colors.black,
                                ),
                            ),
                            FloatingActionButton(
                                heroTag: 'dislike',
                                backgroundColor: Colors.red,
                                onPressed: () => _controller.swipe(CardSwiperDirection.left),
                                child: const Icon(Icons.close, color: Colors.black,),
                            ),
                            FloatingActionButton(
                                heroTag: 'like',
                                backgroundColor: Colors.green,
                                onPressed: () => _controller.swipe(CardSwiperDirection.right),
                                child: const Icon(Icons.favorite, color: Colors.black,
                                ),
                            ),
                            FloatingActionButton(
                                heroTag: 'superlike',
                                backgroundColor: Colors.blue,
                                onPressed: () => _controller.swipe(CardSwiperDirection.top),
                                child: const Icon(Icons.star, color: Colors.black,
                                ),
                            ),
                        ],
                    ),
                ),
            ],
        );
    }
}