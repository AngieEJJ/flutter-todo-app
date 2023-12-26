import 'package:flutter/material.dart';
import 'package:todo_app/create_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo 리스트'),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('title1'),
            subtitle: Text('subtitle1'),
          ),
          ListTile(
            title: Text('title2'),
            subtitle: Text('subtitle2'),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
