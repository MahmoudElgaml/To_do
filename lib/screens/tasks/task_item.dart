import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(12),
        width: double.infinity,
        height: 100.h,
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
                  "play basket Ball",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.black
                  ),
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
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black
                      ),
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
