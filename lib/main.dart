import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// To install Riverpod, we need to add this widget above everything else.
// This should not be inside "MyApp" but as direct parameter to "runApp".
void main() => runApp(const ProviderScope(child: MyApp()));

final tasksProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier(tasks: [
    Task(id: 1, label: 'Load rocket with supplies'),
    Task(id: 2, label: 'Launch rocket'),
    Task(id: 3, label: 'Circle the home planet'),
    Task(id: 4, label: 'Head out to the first moon'),
    Task(id: 5, label: 'Launch moon lander #1')
  ]);
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App')),
      body: Column(
        children: [
          AppProgressBar(),
          ListTask()
        ],
      ),
    );
  }
}

class AppProgressBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var tasks = ref.watch(tasksProvider);
    var numCompletedTasks  = tasks.where((task) {return task.checked == true;}).length;
    return LinearProgressIndicator(value: numCompletedTasks / tasks.length);
  }
}

class ListTask extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var tasks = ref.watch(tasksProvider);
    return Column(children: tasks.map((task) => TaskItem(task: task)).toList());
  }
}

class TaskItem extends ConsumerWidget {
  final Task task;

  TaskItem({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(children: [
        Checkbox(
            value: task.checked,
            onChanged: (checkedState) =>
                ref.read(tasksProvider.notifier).toggle(task.id)
        ),
        SizedBox(width: 16),
        Text(task.label)
      ]),
    );
  }
}

class Task {
  final int id;
  final String label;
  final bool checked;

  Task({required this.id, required this.label, this.checked = false});

  Task updateCheckedStatus(bool checked) =>
      Task(id: id, label: label, checked: checked);
}

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier({tasks}) : super(tasks);

  void add(Task task) {
    state = [...state, task];
  }

  void toggle(int taskId) {
    state = [
      for (final item in state)
        if (item.id == taskId) item.updateCheckedStatus(!item.checked) else item
    ];
  }
}
