import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/layout/home_layout.dart';
import 'package:to_do/shared/styles/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  const Size(407,870),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
       debugShowCheckedModeBanner : false,
        initialRoute:HomeLayOut.routeName ,
        theme: MyTheme.lightTheme,
        routes:{
         HomeLayOut.routeName:(context) => HomeLayOut(),
        },
      ),
    );
  }
}
