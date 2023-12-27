import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/screens/create_screen.dart';
import 'package:todo_app/todo_item.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo 리스트'),
      ),
      body: ListView(
        children: todos.values
            .map((e) => TodoItem(
                  todo: e,
                  onClicked: (todo) async {
                    todo.isDone = !todo.isDone;
                    await todo.save();

                    setState(() {});
                  },
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateScreen()),
          ); // navigator push가 완료될 떄 까지 기다리다가 setstate 실행하면 main 화면이 전체적으로 다시 빌드

          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
