import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: Text("Chat"),
            centerTitle: true,
        ),
        body: Center(
            child: Text(
                "Chat Screen",
                style: TextStyle(fontSize: 24, color: Colors.yellow[700]),
            ),
        )
        );
    }
}
