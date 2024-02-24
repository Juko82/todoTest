part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class TodoLoadingState extends TodoState {}

final class TodoLoadedState extends TodoState {
  final UserEntities model;

  TodoLoadedState({required this.model});
}

final class TodoUpdateState extends TodoState {
  final UserEntities model;

  TodoUpdateState({required this.model});
}

final class TodoErrorState extends TodoState {}
