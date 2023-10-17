import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/models/task_model.dart';

class TaskItem extends StatelessWidget {
  TaskModel taskModel;

  TaskItem(this.taskModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(12),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 60.h,
              width: 2.w,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.r)),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskModel.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  taskModel.description,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.black,
                    ),
                    Text(
                      DateTime.now().toString().substring(1, 10),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black),
                    )
                  ],
                )
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.done),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r))),
            )
          ],
        ),
      ),
    );
  }
}
