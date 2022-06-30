import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ElevatedButton renderButao({
      required String title,
      required VoidCallback onPressed,
    }) {
      return ElevatedButton(
        child: Text(title),
        onPressed: onPressed,
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            renderButao(
              title: 'Contador',
              onPressed: () => Navigator.pushNamed(context, '/contador'),
            ),
            renderButao(
              title: 'Hello, World',
              onPressed: () => Navigator.pushNamed(context, '/hello-world'),
            ),
            renderButao(
              title: 'Calcular idade',
              onPressed: () => Navigator.pushNamed(context, '/idade'),
            ),
            renderButao(
              title: 'Calculadora',
              onPressed: () => Navigator.pushNamed(context, '/calculadora'),
            ),
          ],
        ),
      ),
    );
  }
}
