// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_app/core/providers/todo_provider.dart';

// class TextFieldController extends StatefulWidget {
//   const TextFieldController({super.key});

//   @override
//   State<TextFieldController> createState() => _TextFieldControllerState();
// }

// class _TextFieldControllerState extends State<TextFieldController> {
//   final _textFieldController = TextEditingController();
//   String newTask = '';

// // Criando initState() para adicionar os ouvintes ao controller
//   @override
//   void initState() {
//     super.initState();
//     _textFieldController.addListener(() {
//       newTask = _textFieldController.text;
//     });
//   }

// // -----------------------------------------------------------------------------
// //descartando o controller
//   @override
//   void dispose() {
//     _textFieldController.dispose();
//     super.dispose();
//   }

// // -----------------------------------------------------------------------------
//   void _submit() {
//     Provider.of<TodoProvider>(context, listen: false).addNewTask(newTask);
//     Navigator.pop(context);
//     _textFieldController.clear();
//   }
// // -----------------------------------------------------------------------------

  

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
