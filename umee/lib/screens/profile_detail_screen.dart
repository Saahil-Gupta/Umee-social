import 'package:flutter/material.dart';
import '../models/user_model.dart';

class ProfileDetailScreen extends StatelessWidget {
  final UserProfile user;
  const ProfileDetailScreen({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(user.imageUrl),
            ),
            const SizedBox(height: 20),
            Text(
              user.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color:Colors.white),
            ),
            const SizedBox(height: 12),
            Text(
              user.bio,
              style: const TextStyle(fontSize: 16, color: Colors.yellowAccent),
              textAlign: TextAlign.center,
            ),
            // Add more details or actions here as desired
          ],
        ),
      ),
    );
  }
}