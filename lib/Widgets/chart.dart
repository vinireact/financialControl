import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lion_tax/Widgets/chartBar.dart';
import 'package:lion_tax/Widgets/token.dart';

class Chart extends StatelessWidget {
  final List<Token>? masterListTokenFilter;
  const Chart({this.masterListTokenFilter});

  List<Map<String, Object>> listMap() => List.generate(
        7,
        (index) {
          DateTime weekDay = DateTime.now().subtract(Duration(days: index));
          double totalSum = 0.00;
          for (Token aux in masterListTokenFilter!) {
            bool sameDay = aux.date!.day == weekDay.day;
            bool sameMonth = aux.date!.month == weekDay.month;
            bool sameYear = aux.date!.year == weekDay.year;
            if (sameDay && sameMonth && sameYear) {
              totalSum = totalSum + aux.value!;
            }
          }
          return {
            'day': DateFormat.E().format(weekDay),
            'value': totalSum,
          };
        },
      ).reversed.toList();

  String? weekDayTranslated(String source) {
    if (source == 'Mon') {
      return 'Seg';
    } else if (source == 'Tue') {
      return 'Ter';
    } else if (source == 'Wed') {
      return 'Qua';
    } else if (source == 'Thu') {
      return 'Qui';
    } else if (source == 'Fri') {
      return 'Sex';
    } else if (source == 'Sat') {
      return 'Sab';
    } else if (source == 'Sun') {
      return 'Dom';
    }
  }

  double _percentage(double value) {
    double aux = listMap().fold(
      0.0,
      (previousValue, element) =>
          (previousValue) + (element['value'] as double),
    );
    double percentage = aux == 0 ? 0.0 : value / aux;
    return percentage;
  }

  String _valueConvert(double value) {
    if (value >= 100000.00) {
      return '+100k';
    } else if (value >= 90000.00) {
      return '+90k';
    } else if (value >= 80000.00) {
      return '+80k';
    } else if (value >= 70000.00) {
      return '+70k';
    } else if (value >= 60000.00) {
      return '+60k';
    } else if (value >= 50000.00) {
      return '+50k';
    } else if (value >= 40000.00) {
      return '+40k';
    } else if (value >= 30000.00) {
      return '+30k';
    } else if (value >= 20000.00) {
      return '+20k';
    } else if (value >= 10000.00) {
      return '+10k';
    } else if (value >= 9000.00) {
      return '+9k';
    } else if (value >= 8000.00) {
      return '+8k';
    } else if (value >= 7000.00) {
      return '+7k';
    } else if (value >= 6000.00) {
      return '+6k';
    } else if (value >= 5000.00) {
      return '+5k';
    } else if (value >= 4000.00) {
      return '+4k';
    } else if (value >= 3000.00) {
      return '+3k';
    } else if (value >= 2000.00) {
      return '+2k';
    } else if (value >= 1000.00) {
      return '+1k';
    } else {
      return value.toStringAsFixed(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: listMap()
                .map(
                  (e) => ChartBar(
                    weekDay: weekDayTranslated(e['day'].toString()),
                    totalSum: _valueConvert((e['value'] as double)),
                    percent: _percentage(e['value'] as double),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
