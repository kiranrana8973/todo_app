import 'package:flutter/material.dart';
import 'package:todo_app/presentation/widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 40),
          HeaderWidget(),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
