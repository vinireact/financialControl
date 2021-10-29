import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lion_tax/Widgets/token.dart';

class Label extends StatelessWidget {
  final Token? token;
  final Function(String) fn;
  const Label({this.token, required this.fn});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      child: Card(
        elevation: 4,
        child: Row(
          children: [
            Container(
              height: 35,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                border:
                    Border.all(width: 1, color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  'R\$' + token!.value!.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    token!.title!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text(
                    DateFormat('dd MMM y').format(token!.date!),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: IconButton(
                onPressed: () => fn(token!.id!),
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
