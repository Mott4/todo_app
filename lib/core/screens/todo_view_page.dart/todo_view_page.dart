import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/providers/todo_provider.dart';
import 'package:todo_app/core/wigdets/todo_action.dart';

class TodoPageView extends StatefulWidget {
  const TodoPageView({super.key});

  @override
  State<TodoPageView> createState() => _TodoPageViewState();
}

// -----------------------------------------------------------------------------
class _TodoPageViewState extends State<TodoPageView> {
  final _textFieldController = TextEditingController();
  String newTask = '';
// -----------------------------------------------------------------------------

// Criando initState() para adicionar os ouvintes ao controller
  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      newTask = _textFieldController.text;
    });
  }

// -----------------------------------------------------------------------------
  //descartando o controller
  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

// -----------------------------------------------------------------------------
  void _submit() {
    Provider.of<TodoProvider>(context, listen: false).addNewTask(newTask);
    Navigator.pop(context);
    _textFieldController.clear();
  }
// -----------------------------------------------------------------------------

  Future<void> _showAddTextDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            ElevatedButton(
              onPressed: _submit,
              child: const Text("Enviar"),
            ),
          ],
          // -----------------------------------------------------------------
          title: const Text("Adicione uma nova task"),
          content: TextField(
            controller: _textFieldController,
            autofocus: true,
            decoration: const InputDecoration(hintText: "Adicione uma nova task"),
            onSubmitted: (_) => _submit(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Todos App')),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const TodoAction(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTextDialog();
        },
        tooltip: 'Adicione uma nova task',
        backgroundColor: const Color.fromARGB(255, 158, 203, 226),
        elevation: 0,
        child: const Icon(Icons.add),
      ),
    );
  }
}
