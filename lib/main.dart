import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do/layout/home_layout.dart';
import 'package:to_do/provider/settings_provider.dart';
import 'package:to_do/screens/auth/auth_taps.dart';
import 'package:to_do/screens/edit_task/edit_task_screen.dart';
import 'package:to_do/shared/styles/my_theme.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(create: (BuildContext context)=>SettingProvider(),
  child:  EasyLocalization(supportedLocales: [Locale("en"),Locale("ar")],
  path: 'assets/translations',
  fallbackLocale: Locale('en'),
  child: const MyApp())));
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
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
       debugShowCheckedModeBanner : false,

        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        themeMode: pro.mode,
        initialRoute: HomeLayOut.routeName ,
        routes:{
         HomeLayOut.routeName:(context) => HomeLayOut(),
         EditTask.routeName:  (context) => EditTask(),
          AuthTap.routrName:  (context) => AuthTap(),
        },
      ),
    );
  }
}
