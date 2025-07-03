// lib/widgets/user_card.dart

import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserCard extends StatelessWidget {
    final UserProfile user;

    const UserCard(this.user, {Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        final communities = user.communities ?? [];

        return Container(
            width: double.infinity,
            height: double.infinity,
            clipBehavior: Clip.hardEdge, // enforce rounded corners on children
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                    BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                    ),
                ],
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Flexible(
                        flex: 3,
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(user.imageUrl),
                                    fit: BoxFit.cover,
                                ),
                            ),
                        ),
                    ),

                    Expanded(
                        flex: 2,
                        child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    // Name
                                    Text(
                                        user.name,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                        ),
                                    ),
                                    const SizedBox(height: 8),

                                    // Bio
                                    Text(
                                        user.bio,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                        ),
                                    ),
                                    const SizedBox(height: 8),

                                    // Communities, if any
                                    if (communities.isNotEmpty) ...[
                                        Wrap(
                                            spacing: 6,
                                            runSpacing: 4,
                                            children: communities.map((comm) {
                                                return Chip(
                                                    label: Text(
                                                        comm,
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.white,
                                                        ),
                                                    ),
                                                    backgroundColor: Theme.of(context).primaryColor,
                                                    visualDensity: VisualDensity.compact,
                                                    padding: const EdgeInsets.symmetric(horizontal: 4),
                                                );
                                            }).toList(),
                                        ),
                                    ],
                                ],
                            ),
                        ),
                    ),
                ],
            ),
        );
    }
}
