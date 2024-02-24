



import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testing_app/core/constants/params.dart';
import 'package:testing_app/data/repositories/firestore_repo_impl.dart';
import 'package:testing_app/data/models/user_model.dart';
import 'package:testing_app/domain/entities/user_entitities.dart';
import 'package:testing_app/domain/usecases/firestore_usecases.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final FirestoreRepositoriesImpl repositories;
 late UserEntities user;
 bool dataRequst = false;
  TodoBloc({required this.repositories}) : super(TodoInitial()) {
    on<TodoGetDataEvent>((event, emit) => _getData(event, emit));
    on<TodoRecordDataEvend>((event, emit) => _record(event, emit));
    on<TodoClearState>((event, emit) => _clear(event, emit));
  }
 

  _clear(TodoClearState event, Emitter emit) {
    dataRequst = false;
    emit(TodoInitial());
  }

  _record(TodoRecordDataEvend event, Emitter emit)  {
    user.todoList.add(event.newTask);
    RecordToStorage(repositories: repositories).call(params: UserParams(id: user.id, todoList: user.todoList));
    emit(TodoLoadedState(model: user));
  }

  _getData(TodoGetDataEvent event, Emitter emit) async {
    if (dataRequst == true) return;

    emit(TodoLoadingState());
    try {
      final UserModel data = await GetDataStorage(repositories: repositories).call(params: UserParams(id: event.userId, todoList: []));
      user = UserEntities(id: data.id!, todoList: data.todoList!);
      dataRequst = true;
      emit(
        TodoLoadedState(
          model: user,
        ),
      );
    } catch (e) {
      if (e is Exception) {
          user = UserEntities(id: event.userId, todoList: []);
          RecordToStorage(repositories: repositories).call(params: UserParams(id: user.id, todoList: user.todoList));
          emit(TodoLoadedState(model: user));
      }
      emit(TodoErrorState());
    }
  }
}
