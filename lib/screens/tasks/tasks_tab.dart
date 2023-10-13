import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do/screens/tasks/task_item.dart';

class TaskTab extends StatelessWidget {
  const TaskTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 365)),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            dayColor: Theme.of(context).colorScheme.onSurface,
            onDateSelected: (DateTime) {},
            dotsColor: Colors.transparent,
            activeDayColor: Theme.of(context).colorScheme.onSurface,
            leftMargin: 30,
            monthColor: Theme.of(context).primaryColor,

          ),
          TaskItem(),
        ],
      ),
    );
  }
}
