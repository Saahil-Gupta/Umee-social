// lib/screens/profile_screen.dart

import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
    const ProfileScreen({Key? key}) : super(key: key);

    @override
    State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
    // Mutable user profile
    UserProfile user = UserProfile(
        name: 'Saahil Dev',
        bio: 'CS Student • Loves Flutter & Football ⚽',
        imageUrl: 'assets/images/man5.jpg',
        communities: ['Anytime Fitness'],
    );

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
                backgroundColor: Colors.black,
                title: const Text(
                    'Your Profile',
                    style: TextStyle(color: Colors.yellowAccent),
                ),
                centerTitle: true,
                iconTheme: const IconThemeData(color: Colors.deepPurple),
            ),
            body: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.deepPurple.shade100,
                            backgroundImage: AssetImage(user.imageUrl),
                        ),
                        const SizedBox(height: 20),
                        Text(
                            user.name,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow.shade600,
                            ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                            user.bio,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.deepPurple.shade200,
                            ),
                            textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        if (user.communities != null && user.communities!.isNotEmpty) ...[
                            Wrap(
                                spacing: 8,
                                alignment: WrapAlignment.center,
                                children: (user.communities ?? [])
                                    .map((comm) {
                                    return Chip(
                                        label: Text(
                                            comm,
                                            style: const TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: Colors.deepPurple,
                                    );
                                }).toList(),
                            ),
                            const SizedBox(height: 24),
                        ],
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 12),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                ),
                            ),
                            onPressed: () async {
                                final updated = await Navigator.push<UserProfile>(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => EditProfileScreen(initialProfile: user),
                                    ),
                                );
                                if (updated != null) {
                                    setState(() {
                                        user = updated;
                                    });
                                }
                            },
                            child: const Text(
                                'Edit Profile',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}
