import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Idade extends StatelessWidget {
  String anoNascimento = '';

  dialog({required BuildContext context, required String message}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message),
      ),
    );
  }

  calcularIdade({
    required BuildContext context,
    required String input,
  }) {
    String message = 'Erro: O ano de nascimento precisa ser um número inteiro';
    if (int.tryParse(input) != null) {
      int anoNascimento = int.parse(input);
      message = 'Sua idade: ${DateTime.now().year - anoNascimento}';
    }
    dialog(
      context: context,
      message: message,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcular idade'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Ano de nascimento',
                  hintText: 'Digite o ano de seu nascimento',
                ),
                onChanged: (value) => anoNascimento = value,
              ),
              ElevatedButton(
                child: const Text('Calcular idade'),
                onPressed: () => calcularIdade(
                  context: context,
                  input: anoNascimento,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
