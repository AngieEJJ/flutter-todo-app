import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/main_screen.dart';

late final Box<Todo> todos; //어디서든 쓸 수 있도록 탑레벨 생성

void main() async {
  await Hive.initFlutter(); //hive 초기화하는 방법
  Hive.registerAdapter(TodoAdapter()); //hive가 인식할 수 있도록 생성자 등록
  todos = await Hive.openBox<Todo>(
      'todolist.db'); //db에 접근할 수 있는 todos라는 객체 생성 (Box= 데이터페이스)
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}
