class UserModel {
  String? id;
  List<String>? todoList;

  UserModel({this.id, this.todoList});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todoList =
        json.containsKey('todoList') ? json['todoList'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['todoList'] = todoList;
    return data;
  }
}
