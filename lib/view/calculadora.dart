import 'package:flutter/material.dart';

enum _Operations {
  sum,
  sub,
  mult,
  div,
}

class Calculadora extends StatelessWidget {
  String? inputValue1;
  String? inputValue2;

  dialog({required BuildContext context, required String message}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message),
      ),
    );
  }

  ElevatedButton renderOperationBtn({
    required BuildContext context,
    required String label,
    required _Operations operation,
  }) {
    return ElevatedButton(
      child: Text(label),
      onPressed: () => calculadora(
        context: context,
        inputValue1: inputValue1,
        inputValue2: inputValue2,
        operation: operation,
      ),
    );
  }

  double calcular({
    required double value1,
    required double value2,
    required _Operations operation,
  }) {
    double result;
    switch (operation) {
      case _Operations.sum:
        result = value1 + value2;
        break;
      case _Operations.sub:
        result = value1 - value2;
        break;
      case _Operations.mult:
        result = value1 * value2;
        break;
      case _Operations.div:
        result = value1 / value2;
        break;
      default:
        throw Exception('Operação inválida!');
    }
    return result;
  }

  calculadora({
    required BuildContext context,
    required String? inputValue1,
    required String? inputValue2,
    required _Operations operation,
  }) {
    String message;
    if (inputValue1 == null) {
      message = 'Preencha o campo "Valor 1"';
    } else if (inputValue2 == null) {
      message = 'Preencha o campo "Valor 2"';
    } else {
      try {
        if (double.tryParse(inputValue1) == null) {
          message = 'Valor 1 inválido!';
        } else if (double.tryParse(inputValue2) == null) {
          message = 'Valor 2 inválido!';
        } else {
          double value1 = double.parse(inputValue1);
          double value2 = double.parse(inputValue2);
          double result = calcular(
            value1: value1,
            value2: value2,
            operation: operation,
          );
          message = 'O resultado é: $result';
        }
      } catch (e) {
        message = e.toString();
      }
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
        title: const Text('Calculadora'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Valor 1',
                  hintText: 'Digite o primeiro valor',
                ),
                onChanged: (value) => inputValue1 = value,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Valor 2',
                  hintText: 'Digite o segundo valor',
                ),
                onChanged: (value) => inputValue2 = value,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  renderOperationBtn(
                    context: context,
                    label: 'Somar',
                    operation: _Operations.sum,
                  ),
                  renderOperationBtn(
                    context: context,
                    label: 'Subtrair',
                    operation: _Operations.sub,
                  ),
                  renderOperationBtn(
                    context: context,
                    label: 'Multiplicar',
                    operation: _Operations.mult,
                  ),
                  renderOperationBtn(
                    context: context,
                    label: 'Dividir',
                    operation: _Operations.div,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
