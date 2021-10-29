import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String? weekDay;
  final String? totalSum;
  final double? percent;
  const ChartBar({this.weekDay, this.totalSum, this.percent});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            totalSum!,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            height: 100,
            width: 20,
            decoration: BoxDecoration(
              border:
                  Border.all(width: 1, color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: percent! * 100,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Text(
            weekDay!,
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
