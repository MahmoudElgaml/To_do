import 'package:flutter/material.dart';
import 'package:to_do/shared/styles/colors.dart';

class Filed extends StatelessWidget {
  String choise;
  Filed({required this.choise});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  double.infinity,
      margin: EdgeInsets.all(18),
      padding: const EdgeInsets.only(top: 10,left: 15,bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: primaryColor)
      ),
      child: Row(
        children: [
          Text(
            choise,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.w300),
          ),
          Spacer(),
          Icon(Icons.arrow_drop_down_outlined,color: primaryColor,),
        ],
      ),
    );
  }
}
