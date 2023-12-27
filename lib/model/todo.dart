import 'package:hive/hive.dart';
part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String title;

  @HiveField(2)
  int dateTime;

  @HiveField(3)
  bool isDone;

  Todo({
    required this.title,
    required this.dateTime,
    this.isDone = false,
  });
}
//Hive라는 데이터베이스에 저장할 수 있는 객체로 변화