part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class TodoGetDataEvent extends TodoEvent {
  final String userId;
  TodoGetDataEvent({required this.userId});
}


class TodoRecordDataEvend extends TodoEvent {
  final String newTask;
  TodoRecordDataEvend({ required this.newTask});
}

class TodoClearState extends TodoEvent {}