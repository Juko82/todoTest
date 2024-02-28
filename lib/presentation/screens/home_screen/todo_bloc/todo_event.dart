// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class TodoGetDataEvent extends TodoEvent {
  final String userId;
  TodoGetDataEvent({required this.userId});
}

class TodoRecordDataEvent extends TodoEvent {
  final String newTask;
  TodoRecordDataEvent({required this.newTask});
}

class TodoClearState extends TodoEvent {}

class TodoRemoveDataEvent extends TodoEvent {
  final String task;
  TodoRemoveDataEvent({required this.task});
}
