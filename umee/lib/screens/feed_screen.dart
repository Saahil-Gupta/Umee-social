import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
    const FeedScreen({super.key});
    @override
    State<FeedScreen> createState() => _FeedScreenState();

    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text("Feed",
                style: TextStyle(color: Colors.yellow),
            ),
                centerTitle: true,
                backgroundColor: Colors.black,
            ),
            body: Center(child: Text(
                "Community Feed",
                style: TextStyle(fontSize: 24, color: Colors.yellow[700])),
            ));
    }
}

class _FeedScreenState extends State<FeedScreen> {
    final List <String> _communities = [
        'Anytime Fitness Center',
        'Goldie\'s Gym',
        'Sam\'s Book Club',

    ];

    final Map<String, List<Map<String, String>>> _allMessages = {
        'Anytime Fitness Center' : [
            {
                'author': 'Anytime Fitness Center',
                'text': 'New Zumba Class starting from next week!!',
            },
            {
                'author': 'Alice',
                'text': 'Anyone tried the new protein shake at the cafe?',
            },
            {
                'author': 'Bob',
                'text': 'Leg day was brutal today 🔥',
            },
        ],
        'Goldie\'s Gym': [
            {
                'author': 'Goldie\'s Gym',
                'text': '🔥 New HIIT class kicks off Monday at 6 AM! Sign up at the front desk.',
            },
            {
                'author': 'Jake',
                'text': 'Just crushed a 200 kg deadlift PR—feeling unstoppable! 💪',
            },
            {
                'author': 'Lara',
                'text': 'Who’s free to spot me on bench press tomorrow? Let me know! 🏋️‍♀️',
            },
        ],
        'Sam\'s Book Club': [
            {
                'author': 'Sam\'s Book Club',
                'text': '📚 This month’s read: *The Midnight Library* by Matt Haig. Discussion Fri at 7 PM!',
            },
            {
                'author': 'Emma',
                'text': 'Just hit that twist in chapter 12—mind officially blown! 😱 Anyone else?',
            },
            {
                'author': 'Noah',
                'text': 'Looking for similar uplifting novels—recommendations welcome! ✨',
            },
        ],
    };

    late String _selectedCommunity;
    late List<Map<String, String>> _messages;

    final TextEditingController _textController = TextEditingController();

    @override
    void initState() {
        super.initState();
        _selectedCommunity = _communities.first;
        _messages = List.from(_allMessages[_selectedCommunity]!);
    }

    void _sendMessage() {
        final text = _textController.text.trim();
        if (text.isEmpty) return;
        setState(() {
            _messages.insert(0, {'author': 'You', 'text': text});
            _textController.clear();
        });
    }

    void _attachFile() {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Attachment picker in the next update!')),
        );
    }

    void _onCommunityChanged(String? community) {
        if (community == null) return;
        setState(() {
            _selectedCommunity = community;
            _messages = List.from(_allMessages[community]!);
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('$_selectedCommunity',
                    style: TextStyle(color: Colors.yellow),),
                centerTitle: true,
                backgroundColor: Colors.black,
                actions: [
                    PopupMenuButton<String>(
                        icon: const Icon(Icons.arrow_drop_down, color: Colors.yellow),
                        onSelected: _onCommunityChanged,
                        itemBuilder: (ctx) => _communities.map((c) {
                            return PopupMenuItem(value: c, child: Text(c));
                        }).toList(),
                    ),
                    const SizedBox(width: 12),
                ],
                // leading: DropdownButtonHideUnderline(
                //     child: DropdownButton<String>(
                //         value: _selectedCommunity,
                //         icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                //         dropdownColor: Colors.deepPurple,
                //         style: const TextStyle(color: Colors.white, fontSize: 16),
                //         onChanged: _onCommunityChanged,
                //         items: _communities.map((c) {
                //             return DropdownMenuItem(
                //                 value: c,
                //                 child: Text(c),
                //             );
                //         }).toList(),
                //
                //     ),
                // ),
            ),
            body: SafeArea(
                child: Column(
                    children: [
                        Expanded(
                            child: ListView.builder(
                                padding: const EdgeInsets.all(16),
                                itemCount: _messages.length,
                                itemBuilder: (ctx, i) {
                                    final msg = _messages[i];
                                    final bool isAnnouncement = msg['author'] == _selectedCommunity;
                                    return Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8),
                                        child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                CircleAvatar(
                                                    child: Text(msg['author']![0]),
                                                ),
                                                const SizedBox(width: 12),
                                                Expanded(
                                                    child: Container(
                                                        padding: const EdgeInsets.all(12),
                                                        decoration: BoxDecoration(
                                                            color: Colors.grey[200],
                                                            borderRadius: BorderRadius.circular(8),
                                                        ),
                                                        child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                                Row(
                                                                    children: [
                                                                        Text(msg['author']!,
                                                                            style: const TextStyle(
                                                                                fontWeight: FontWeight.bold
                                                                            ),
                                                                        ),
                                                                        if (isAnnouncement) ...[
                                                                            const SizedBox(width: 4),
                                                                            const Icon(Icons.verified,
                                                                                size: 18, color: Colors.blue),
                                                                        ],
                                                                    ],
                                                                ),
                                                                const SizedBox(height: 4),
                                                                Text(msg['text']!),
                                                            ],
                                                        ),
                                                    ),
                                                ),
                                            ],
                                        ),
                                    );
                                },
                            ),
                        ),
                        // Bottom Talk Bar
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 2,
                                        offset: const Offset(0, -1),
                                    ),
                                ],
                            ),
                            child: Row(
                                children: [
                                    IconButton(onPressed: _attachFile,
                                        icon: const Icon(Icons.add_circle_outline),
                                    ),
                                    Expanded(
                                        child: TextField(
                                            controller: _textController,
                                            decoration: const InputDecoration(
                                                hintText: 'Write a message....',
                                                border: InputBorder.none,
                                            ),
                                            onSubmitted: (_) => _sendMessage(),
                                        ),
                                    ),
                                    IconButton(onPressed: _sendMessage, icon: const Icon(Icons.send),
                                    ),
                                ],
                            ),
                        ),
                    ]
                ),
            ),
        );
    }
}

