import 'package:flutter/material.dart';
import 'package:to_do/screens/settings/filed.dart';
import 'package:to_do/screens/settings/mode_bottom_sheet.dart';

import 'lang_bottem_sheet.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({Key? key}) : super(key: key);

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Language", style: Theme.of(context).textTheme.bodySmall),
            InkWell(
              onTap: () {
                showLangBottom();
                setState(() {});
              },
              child: Filed(choise: "English"),
            ),
            Text("Mode", style: Theme.of(context).textTheme.bodySmall),
            InkWell(
              onTap: () {
                showModeBottom();
              },
              child: Filed(choise: "light"),
            ),
          ],
        ),
      ),
    );
  }

  showLangBottom() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LangBottemSheet(),
    );
  }

  showModeBottom() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ModeBottemSheet(),
    );
  }
}
