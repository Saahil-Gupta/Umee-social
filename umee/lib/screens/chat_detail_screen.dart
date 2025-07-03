// lib/screens/chat_detail_screen.dart

import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'profile_detail_screen.dart';

class ChatDetailScreen extends StatefulWidget {
  final UserProfile user;
  const ChatDetailScreen({required this.user, Key? key}) : super(key: key);

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _msgs = [
    {'from': 'them', 'text': 'Hey there!'},
    {'from': 'me',   'text': 'Hello! How’s it going?'},
  ];

  void _send() {
    final txt = _controller.text.trim();
    if (txt.isEmpty) return;
    setState(() {
      _msgs.add({'from': 'me', 'text': txt});
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.user.name,
      style: TextStyle(color: Colors.white),
      ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          // ▼ Info Bar (tappable to view profile)
          Material(
            color: Colors.grey[300],
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(widget.user.imageUrl),
              ),
              title: Text(widget.user.name),
              subtitle: Text(widget.user.bio),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileDetailScreen(user: widget.user),
                  ),
                );
              },
            ),
          ),

          // ▲ Chat messages ▲
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _msgs.length,
              itemBuilder: (ctx, i) {
                final m = _msgs[i];
                final isMe = m['from'] == 'me';
                return Align(
                  alignment:
                  isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.blue[200] : Colors.grey[400],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(m['text']!,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),

          // ▼ Input bar ▼
          SafeArea(
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.attach_file,
                  color: Colors.white,),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Attachment coming soon!')),
                    );
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Type a message',
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black,
                    ),
                    onSubmitted: (_) => _send(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send,
                  color: Colors.white,),
                  onPressed: _send,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
