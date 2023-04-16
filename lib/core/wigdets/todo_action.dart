import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/providers/todo_provider.dart';

class TodoAction extends StatelessWidget {
  const TodoAction({super.key});

  Container _taskContainer(TodoProvider task, int index) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 158, 203, 226),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: checkedCircleBox(task, index),
    );
  }

  ListTile checkedCircleBox(TodoProvider task, int index) {
    return ListTile(
      leading: Checkbox(
        checkColor: Colors.white,
        activeColor: const Color.fromARGB(255, 99, 170, 206),
        shape: const CircleBorder(),
        onChanged: ((_) => task.toggleCompleted(task.allTasks[index])),
        value: task.allTasks[index].completed,
      ),
      // -----------------------------------------------------------------------
      title: Text(
        style: TextStyle(
          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          decoration: task.allTasks[index].completed
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
        // ---------------------------------------------------------------------
        task.allTasks[index].todoTitle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TodoProvider>(context);
    return ListView.builder(
      itemCount: task.allTasks.length,
      itemBuilder: ((context, index) =>
          // -------------------------------------------------------------------
          Dismissible(
            background: Container(
              color: Colors.white,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 6,
              ),
              child: const Icon(Icons.delete,
                  color: Color.fromARGB(255, 224, 46, 34), size: 34),
            ),
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: _taskContainer(task, index),
            ),
            onDismissed: (_) {
              task.deleteTask(task.allTasks[index]);
            },
          )),
    );
  }
}
