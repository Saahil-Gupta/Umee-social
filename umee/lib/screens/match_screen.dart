import 'package:flutter/material.dart';

class MatchScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: Text("Match"),
            centerTitle: true,
        ),
        body: Center(
            child: Text(
                "Match Screen",
                style: TextStyle(fontSize: 24, color: Colors.yellow[700]),
            ),
        )
        );
    }
}
