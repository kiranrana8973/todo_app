import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/core/providers/remainng_todo_provider.dart';
import 'package:todo_app/presentation/controller/todo_controller.dart';
import 'package:todo_app/presentation/widgets/header_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            Expanded(
              child: Padding(
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
                      const TopRow(),
                      const Header(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            labelText: 'What do you want to do?',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            text: '${ref.watch(remianingTodoProvider)} of ',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            children: [
                              TextSpan(
                                // Display total no of todos
                                text: ref
                                    .watch(todoControllerProvider)
                                    .todos
                                    .length
                                    .toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                text: ' tasks completed',
                                style: TextStyle(),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TabBar(
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        controller: _tabController,
                        labelColor: Colors.black,
                        tabs: const [
                          Tab(text: 'All'),
                          Tab(text: 'Active'),
                          Tab(text: 'Favourite'),
                          Tab(text: 'Done'),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            CommonTodo(allTodoProvider),
                            CommonTodo(activeTodoProvider),
                            CommonTodo(pinnedTodoProvider),
                            CommonTodo(completedTodoProvider),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}

class CommonTodo extends ConsumerWidget {
  const CommonTodo(this.todoProvider, {super.key});

  final StateProvider todoProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: todos.todos.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
          height: 70,
          child: InkWell(
            onTap: () {
              ref
                  .read(todoControllerProvider.notifier)
                  .updateTodo(todos.todos[index]);
            },
            child: ListTile(
              leading: Radio(
                value: todos.todos[index].isCompleted,
                groupValue: true,
                onChanged: (value) {},
              ),
              title: Text(todos.todos[index].title),
              trailing: IconButton(
                onPressed: () {
                  ref
                      .read(todoControllerProvider.notifier)
                      .updatePinned(todos.todos[index]);
                },
                icon: Icon(Icons.star,
                    color: todos.todos[index].isPinned
                        ? Colors.yellow
                        : Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
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
    );
  }
}

class TopRow extends StatelessWidget {
  const TopRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
