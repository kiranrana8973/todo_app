import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: const [
                            Text('All'),
                            Text('Active'),
                            Text('Favourite'),
                            Text('Done'),
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
