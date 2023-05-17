import 'package:flutter/material.dart';
import 'package:recipe_app/constants/coolors.dart';
import 'package:recipe_app/custom/drawer_custom.dart';
import 'package:recipe_app/custom/search_box.dart';
import 'package:recipe_app/model/todo.dart';
import 'package:recipe_app/widgets/todo_item.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  _handleToDoChange(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }
  _deleteTodoItem(String id){
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }
  _addTodoItem(String toDo){
    setState(() {
      todosList.add(ToDo(id: DateTime.now().microsecondsSinceEpoch.toString(), todoText: toDo));
    });
    _todoController.clear();
  }

  _runFilter(String enteredKeyword){
    List<ToDo> results = [];
    if( enteredKeyword.isEmpty){
      results = todosList;
    }else{
      results = todosList
      .where((item) => item.todoText
        .toLowerCase()
        .contains(enteredKeyword.toLowerCase()))
      .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

 @override
 Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      backgroundColor: CoolorsLight.tdBGBlue,
    ),
    drawer: const DrawerCustom(),
    body: Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            children: [
              SearchBox(runFilter: _runFilter),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50, bottom: 20,left: 10),
                      child: const Text(
                        "All ToDos",
                        style: TextStyle(
                          fontSize: 30, 
                          fontWeight: FontWeight.w500),
                        ),
                    ),
                    for( ToDo todo in _foundToDo.reversed)
                      ToDoItem(
                        todo: todo,
                        onToDoChanged: _handleToDoChange,
                        onDeleteItem: _deleteTodoItem,
                      ),
                    const SizedBox(
                      height: 40,
                    )    
                  ],
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10,
                      spreadRadius: 0.0,
                    ),],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    style: const TextStyle(color: Colors.black),
                    controller: _todoController,
                    decoration: const InputDecoration(
                      hintText: "Add a new todo item",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20, right: 20,),
                child: ElevatedButton(
                  onPressed: (){
                    _addTodoItem(_todoController.text);
                    FocusManager.instance.primaryFocus?.unfocus();
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CoolorsLight.tdBlue,
                    minimumSize: const Size(60, 60),
                    elevation: 10,
                  ),
                  child: const Text("+", style: TextStyle(fontSize: 40),)
                ),
              )
            ],
          ),
        )
      ]
    )
  );
 }
}
