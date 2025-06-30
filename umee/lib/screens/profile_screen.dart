import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
    final Map<String, String> mockUser = {
        'name': 'Saahil Dev',
        'bio': 'CS Student • Loves Flutter & Football ⚽',
        'image':
            'https://avatars.githubusercontent.com/u/583231?v=4',
    };

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: Text('Your Profile'),
            centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
            children: [
                CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(mockUser['image']!),
                ),
                SizedBox(height: 20),
                Text(
                mockUser['name']!,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.yellow[700]),
                ),
                SizedBox(height: 10),
                Text(
                mockUser['bio']!,
                style: TextStyle(fontSize: 16, color: Colors.yellow[700]),
                textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Edit feature coming soon 😉"),
                    ));
                },
                child: Text("Edit Profile"),
                ),
            ],
            ),
        ),
        );
    }
}
