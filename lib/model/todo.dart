class ToDo {
  String id;
  String todoText;
  late bool isDone;

  // ignore: non_constant_identifier_names
  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList(){
    return [
      ToDo(id: "01", todoText: "Make a new ToDo!", isDone: false),
    ];
  }
}