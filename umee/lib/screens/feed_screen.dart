import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(title: Text("Feed")),
        body: Center(child: Text(
            "Community Feed",
            style: TextStyle(fontSize: 24, color: Colors.yellow[700])),
        ));
    }
}
