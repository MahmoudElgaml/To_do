import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do/layout/home_layout.dart';
import 'package:to_do/provider/settings_provider.dart';
import 'package:to_do/shared/styles/my_theme.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(create: (BuildContext context)=>SettingProvider(),
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<SettingProvider>(context);
    return ScreenUtilInit(
      designSize:  const Size(407,870),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
       debugShowCheckedModeBanner : false,
        initialRoute:HomeLayOut.routeName ,
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        themeMode: pro.mode,
        routes:{
         HomeLayOut.routeName:(context) => HomeLayOut(),
        },
      ),
    );
  }
}
