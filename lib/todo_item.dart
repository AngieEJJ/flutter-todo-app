import 'package:flutter/material.dart';

import 'model/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(Todo) onClicked; //Todo객체를 부르는 함수

  const TodoItem({
    super.key,
    required this.todo,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onClicked(todo);
//callback: 여기서 수행한 내용을 바깥에 적용시키는 것 = 밖에 통지해서 알려줘야함.
      },
      leading: todo.isDone
          ? const Icon(Icons.check_circle, color: Colors.green)
          : const Icon(Icons.check_circle),
      title: Text(todo.title),
      subtitle: Text('${todo.dateTime}'),
    );
  }
}
