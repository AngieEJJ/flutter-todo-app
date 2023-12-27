import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(Todo) onClicked; //Todo객체를 부르는 함수
  final Function(Todo) onDelete;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onClicked,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onClicked(todo); //listtile을 클릭하면 onClikced 함수에 todo를 전달한다.
//callback: 여기서 수행한 내용을 바깥에 적용시키는 것 = 밖에 통지해서 알려줘야함.
      },
      leading: todo.isDone
          ? const Icon(Icons.check_circle, color: Colors.green)
          : const Icon(Icons.check_circle),
      title: Text(todo.title),
      subtitle: Text(
        DateFormat.yMMMd()
            .format(DateTime.fromMicrosecondsSinceEpoch(todo.dateTime)),
      ),
      trailing: todo.isDone
          ? GestureDetector(
              onTap: () {
                onDelete(todo);
              },
              child: const Icon(Icons.delete_forever))
          : null,
    );
  }
}
