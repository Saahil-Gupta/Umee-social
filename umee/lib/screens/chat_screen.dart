import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'chat_detail_screen.dart';
import '../data/match_data.dart';

class ChatScreen extends StatelessWidget {
    const ChatScreen({super.key});

    @override
    Widget build(BuildContext context) {
        // Show only the users you’ve swiped right on
        final List<UserProfile> matches = matchedUsers;

        // If you haven’t matched with anyone yet
        if (matches.isEmpty) {
            return Scaffold(
                appBar: AppBar(title: const Text('Chats',
                    style: TextStyle(color: Colors.yellow),
                ),
                    centerTitle: true,
                    backgroundColor: Colors.black,
                ),
                body: const Center(
                    child: Text(
                        'No matches yet!\nSwipe to find friends.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                ),
            );
        }

        // Otherwise, list out your matches
        return Scaffold(
            appBar: AppBar(title: const Text('Chats',
            style: TextStyle(color: Colors.yellow),
            ),
                centerTitle: true,
            backgroundColor: Colors.black,
            ),
            body: ListView.separated(
                itemCount: matches.length,
                separatorBuilder: (_, __) => const Divider(
                    color: Colors.white54,
                    height: 1,
                    thickness: 1,
                ),
                itemBuilder: (context, i) {
                    final user = matches[i];
                    return ListTile(
                        leading: CircleAvatar(
                            backgroundImage: AssetImage(user.imageUrl),
                        ),
                        title: Text(user.name,
                        style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,),),
                        subtitle: Text(user.bio, maxLines: 1, overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.grey[200],
                        ),
                        ),
                        onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ChatDetailScreen(user: user),
                                ),
                            );
                        },
                    );
                },
            ),
        );
    }
}
