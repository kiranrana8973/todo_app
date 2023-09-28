import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/presentation/controller/todo_controller.dart';
import 'package:todo_app/presentation/widgets/header_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var todos = ref.watch(todoControllerProvider);

    if (todos.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return SizedBox.expand(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 40),
            const HeaderWidget(),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.web),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.web_asset),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.menu),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: RichText(
                          text: const TextSpan(
                            text: 'My',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                            ),
                            children: [
                              TextSpan(
                                text: ' Todopad',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          labelText: 'First name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: const TextSpan(
                          text: '6 of ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                              text: '12',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: ' tasks completed',
                              style: TextStyle(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
