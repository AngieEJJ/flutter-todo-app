import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/screens/create_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo 리스트'),
      ),
      body: ListView(
          children: todos.values
              .map((todo) => ListTile(
                    title: Text(todo.title),
                    subtitle: Text('${todo.dateTime}'),
                  ))
              .toList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('tapped!');
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
