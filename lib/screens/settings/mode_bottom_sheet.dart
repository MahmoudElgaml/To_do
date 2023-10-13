import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do/provider/settings_provider.dart';

class ModeBottemSheet extends StatelessWidget {
  const ModeBottemSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<SettingProvider>(context);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(18.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              pro.changeMode(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Text(
              "Light",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 19,
          ),
          InkWell(
            onTap: () {
              pro.changeMode(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Text(
              "Dark",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
