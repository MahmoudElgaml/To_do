import 'package:flutter/material.dart';
import 'package:to_do/screens/tasks/add_task_filed.dart';

class TaskBottomSheet extends StatefulWidget {
  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  var selectDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Add new task",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 10),
          TaskFiled(true, titleController),
          const SizedBox(height: 10),
          TaskFiled(false, descriptionController),
          Text(
            "select Date",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          InkWell(
            onTap: () {
              showDate(context);
            },
            child: Text(
              selectDate.toString().substring(0,10),
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("AddTask"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  showDate(BuildContext context) async{
  var changetime = await showDatePicker(
      builder: (context, child) {
         return Theme(data:Theme.of(context).copyWith(
           colorScheme: const ColorScheme.light(
             primary: Colors.blue,
           )
         ) , child: child!);
      },
      context: context,
      initialDate: selectDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365),

      ),

    );
  if (changetime==null){
    return;
  }
  else{
    selectDate=changetime;
  }
  setState(() {

  });

  }
}
