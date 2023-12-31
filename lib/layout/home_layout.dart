import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do/screens/settings/settings_tab.dart';
import 'package:to_do/screens/tasks/task_bottom_sheet.dart';
import 'package:to_do/screens/tasks/tasks_tab.dart';

import '../provider/layout_provider.dart';

class HomeLayOut extends StatefulWidget {
  HomeLayOut({Key? key}) : super(key: key);
  static const String routeName = "home";

  @override
  State<HomeLayOut> createState() => _HomeLayOutState();
}

class _HomeLayOutState extends State<HomeLayOut> {
  String title = " To-Do";

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
            backgroundColor: Colors.blue,
            title: Text(title),
            elevation: 0,
          ),
          bottomNavigationBar: BottomAppBar(
            color: Theme.of(context).colorScheme.primary,
            notchMargin: 5,
            shape: const CircularNotchedRectangle(),
            child: BottomNavigationBar(
              selectedItemColor: Colors.blue,
              backgroundColor: Colors.transparent,
              currentIndex: pro.index,
              onTap: (value) {
                value == 0 ? title = "To-Do" : title = "Settings";
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
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: Colors.white, width: 3.w)),
            onPressed: () {
              showTBottomSheet();
            },
            child: const Icon(Icons.add),
          ),
          body: bodies[pro.index],
        );
      },
    );
  }

  List<Widget> bodies = [TaskTab(), SettingTab()];

  showTBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: TaskBottomSheet(),
      ),
      isScrollControlled: true,
    );
  }
}
