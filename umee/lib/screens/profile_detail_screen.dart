// lib/screens/profile_detail_screen.dart

import 'package:flutter/material.dart';
import '../models/user_model.dart';

class ProfileDetailScreen extends StatelessWidget {
  final UserProfile user;
  const ProfileDetailScreen({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Safely handle nullable communities
    final communities = user.communities ?? [];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          user.name,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.deepPurple.shade100,
              backgroundImage: AssetImage(user.imageUrl),
            ),
            const SizedBox(height: 20),
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              user.bio,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // Communities section
            if (communities.isNotEmpty) ...[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Communities',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple.shade700,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: communities.map((comm) {
                  return Chip(
                    label: Text(
                      comm,
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.deepPurple,
                    visualDensity: VisualDensity.compact,
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
            ],
            // Additional details or actions here
          ],
        ),
      ),
    );
  }
}
