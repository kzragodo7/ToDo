
import 'package:flutter/material.dart';
import '.../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  Widget build(BuildContext context) {
    return Scaffold{
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('To DO'),
        elevation: 0,
      ),
      body: ListView(
        children: [
          ToDoTile(),
          ToDoTile(),
          ToDoTile(),
          ToDoTile(),
        ],
      ),
    };
  }
}
