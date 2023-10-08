import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do/screens/settings/settings_tab.dart';
import 'package:to_do/screens/tasks/tasks_tab.dart';

import '../provider/layout_provider.dart';

class HomeLayOut extends StatelessWidget {
  HomeLayOut({Key? key}) : super(key: key);
  static const String routeName = "home";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LayoutProvider(),
      builder: (context, child) {
        var pro = Provider.of<LayoutProvider>(context);
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          appBar: AppBar(
            title: Text("To-Do"),
          ),
          bottomNavigationBar: BottomAppBar(
            notchMargin: 5,
            shape: const CircularNotchedRectangle(),
            child: BottomNavigationBar(
              currentIndex: pro.index,
              onTap: (value) {
                pro.currentIcndex(value);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                      size: 30,
                    ),
                    label: ""),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: Colors.white, width: 3.w)),
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          body: bodies[pro.index],
        );
      },
    );
  }

  List<Widget> bodies = [TaskTab(), SettingTab()];
}
