import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  String? name;

  dialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
      ),
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Nome',
                hintText: 'Digite o seu nome completo',
              ),
              onChanged: (value) => name = value,
            ),
            ElevatedButton(
              child: const Text('Ok'),
              onPressed: () => dialog(context, 'Hello World $name'),
            ),
          ],
        ),
      ),
    );
  }
}
