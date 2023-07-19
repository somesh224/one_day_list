import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../model/to_do.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const ToDoItem(
      {super.key, required this.todo, this.onToDoChanged, this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: ListTile(
            onTap: () {
              // print('clicked');
              onToDoChanged(todo);
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            tileColor: Colors.white,
            leading: Icon(
              todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
              color: tdBlue,
            ),
            title: Text(
              todo.todoText!,
              style: TextStyle(
                fontSize: 16,
                color: tdBlack,
                decoration: todo.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: Container(
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.symmetric(vertical: 12),
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: tdRed, borderRadius: BorderRadius.circular(5)),
              child: IconButton(
                color: Colors.white,
                iconSize: 18,
                icon: const Icon(Icons.delete),
                onPressed: () {
                  // print('clicked on delete');
                  onDeleteItem(todo.id);
                },
              ),
            ),
          )),
    );
  }
}
