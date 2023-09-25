import 'package:flutter/material.dart';
import 'package:todo_app/presentation/screen/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        // appBar: AppBar(
        //   title: const Text('Riverpod Todo App'),
        // ),
        body: SafeArea(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
