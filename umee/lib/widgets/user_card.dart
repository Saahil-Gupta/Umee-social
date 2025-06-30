import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserCard extends StatelessWidget {
    final UserProfile user;

    const UserCard(this.user, {super.key});

    @override
    Widget build(BuildContext context) {
        return Container(
            width: double.infinity,
            height: double.infinity,
            clipBehavior: Clip.hardEdge,                   // enforce rounded corners on children
            decoration: BoxDecoration(
                color: Colors.white,                         // card background
                borderRadius: BorderRadius.circular(20),     // matching radius
                boxShadow: [                                 // subtle drop-shadow
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                    ),
                ],
            ),
            child: Column(
                children: [
                    // Image section (flexible height)
                    Flexible(
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(user.imageUrl),
                                    fit: BoxFit.cover,
                                ),
                            ),
                        ),
                    ),

                    // Text section
                    Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(
                                    user.name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                    user.bio,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                    ),
                                ),
                            ],
                        ),
                    ),
                ],
            ),
        );
    }
}
