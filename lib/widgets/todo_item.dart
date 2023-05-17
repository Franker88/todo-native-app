import 'package:flutter/material.dart';
import 'package:recipe_app/constants/coolors.dart';
import 'package:recipe_app/model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  // ignore: prefer_typing_uninitialized_variables
  final onToDoChanged;
  // ignore: prefer_typing_uninitialized_variables
  final onDeleteItem;
  const ToDoItem({super.key, required this.todo, this.onToDoChanged, this.onDeleteItem});

 @override
 Widget build(BuildContext context){
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: ListTile(
      onTap: (){
        onToDoChanged(todo);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      tileColor: Colors.white,
      leading: Icon(
        todo.isDone ? Icons.check_box : Icons.check_box_outline_blank, color: CoolorsLight.tdBlue,),
      title: Text(
        todo.todoText,
        style: TextStyle(
          fontSize: 16,
          color: CoolorsLight.tdGrey,
          decoration: todo.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Container(
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.symmetric(vertical: 12),
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: CoolorsLight.tdRed,
          borderRadius: BorderRadius.circular(5),
        ),
        child: IconButton(
          onPressed: (){
            onDeleteItem(todo.id);
          }, 
          icon: const Icon(Icons.delete), 
          color: Colors.white,
          iconSize: 15,
        ),
      ),
    ),
  );
 }
}