import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/models/task_model.dart';
import 'package:to_do/screens/tasks/add_task_filed.dart';
import 'package:to_do/shared/firebase/firebase-function.dart';
import 'package:to_do/shared/styles/colors.dart';

class EditTask extends StatefulWidget {
  EditTask({Key? key}) : super(key: key);
  static const String routeName = "edit";

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  var titleContoller = TextEditingController();

  var desContoller = TextEditingController();

  DateTime selectDate = DateTime(1);

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as TaskModel;

    if (selectDate == DateTime(1)) {
      selectDate = DateTime.fromMillisecondsSinceEpoch(args.date);
      titleContoller.text = args.title;
      desContoller.text = args.description;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
        backgroundColor: primaryColor,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Container(
            color: primaryColor,
            height: 157.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Edit task",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TaskFiled(true, titleContoller),
                    SizedBox(
                      height: 10.h,
                    ),
                    TaskFiled(false, desContoller),
                    Text(
                      "Select Time",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () {
                        showDate(context);
                      },
                      child: Text(
                        selectDate.toString().substring(0, 10),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        args.title = titleContoller.text;
                        args.description = desContoller.text;
                        args.date = selectDate.millisecondsSinceEpoch;
                        FirebaseFunctions.updateTask(args);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                      ),
                      child: const Text("Save Changes"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showDate(BuildContext context) async {
    var changetime = await showDatePicker(
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
              primary: Colors.blue,
            )),
            child: child!);
      },
      context: context,
      initialDate: selectDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365),
      ),
    );
    if (changetime == null) {
      return;
    } else {
      selectDate = changetime;
    }
    setState(() {});
  }
}
