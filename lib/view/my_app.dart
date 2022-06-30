import 'package:flutter/material.dart';
import 'package:revisao_flutter/view/calculadora.dart';
import 'package:revisao_flutter/view/hello_world.dart';
import 'package:revisao_flutter/view/idade.dart';
import 'package:revisao_flutter/view/menu.dart';
import 'package:revisao_flutter/view/my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const Menu(),
        '/contador': (context) => const MyHomePage(
              title: 'Contador',
            ),
        '/hello-world': (context) => HelloWorld(),
        '/idade': (context) => Idade(),
        '/calculadora': (context) => Calculadora(),
      },
    );
  }
}
