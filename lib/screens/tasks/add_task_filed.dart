import 'package:flutter/material.dart';
import 'package:to_do/shared/styles/colors.dart';

class TaskFiled extends StatelessWidget {
  bool isTitle;
  TaskFiled(this.isTitle, this.controller,{super.key});
 TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if(value==null||value.isEmpty){
          return isTitle?"please enter title":"please enter description";
        }
        return null;

      },
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: primaryColor),
        ),
        label:  Text(
          isTitle?"Add Title":"Add Description",
          style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
