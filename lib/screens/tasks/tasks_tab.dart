import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/screens/tasks/task_item.dart';
import 'package:to_do/shared/firebase/firebase-function.dart';

class TaskTab extends StatefulWidget {
  const TaskTab({Key? key}) : super(key: key);

  @override
  State<TaskTab> createState() => _TaskTabState();
}

var selectedDate = DateTime.now();

class _TaskTabState extends State<TaskTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CalendarTimeline(
            initialDate: selectedDate,
            lastDate: DateTime.now().add(Duration(days: 365)),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            dayColor: Theme.of(context).colorScheme.onSurface,
            onDateSelected: (DateTime) {
              selectedDate = DateTime;
              setState(() {});
            },
            dotsColor: Colors.transparent,
            activeDayColor: Theme.of(context).colorScheme.onSurface,
            leftMargin: 30,
            monthColor: Theme.of(context).primaryColor,
          ),
          StreamBuilder(
            stream: FirebaseFunctions.getTask(selectedDate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text("somting went wrong"));
              }
              List<TaskModel> tasks =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => TaskItem(tasks[index],index+1),
                  itemCount: tasks.length,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
