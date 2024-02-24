

class UserEntities {
  String id;
  List<String> todoList;
  UserEntities({required this.id, required this.todoList}) ;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['todoList'] = todoList;
    return data;
  }
  
}