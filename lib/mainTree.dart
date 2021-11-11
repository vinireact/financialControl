import 'package:flutter/material.dart';
import 'package:lion_tax/Widgets/chart.dart';
import 'package:lion_tax/Widgets/label.dart';
import 'package:lion_tax/Widgets/modalForm.dart';
import 'package:lion_tax/Widgets/token.dart';

class MainTree extends StatefulWidget {
  @override
  _MainTreeState createState() => _MainTreeState();
}

class _MainTreeState extends State<MainTree> {
  List<Token>? masterListToken = [
    Token(
      title: 'Kimono',
      value: 476.99,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    Token(
      title: 'Supermercado',
      value: 148.86,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Token(
      title: 'Hebalife',
      value: 252.73,
      date: DateTime.now().subtract(Duration(days: 1)),
    )
  ];

  void register(String txt, double value) {
    Token aux = Token(title: txt, value: value, date: DateTime.now());
    setState(() {
      masterListToken!.add(aux);
    });
    Navigator.of(context).pop();
  }

  void removeLabel(String id) {
    setState(() {
      masterListToken!.removeWhere((e) => e.id == id);
    });
  }

  List<Token>? get _masterListTokenFilter {
    return masterListToken!
        .where(
          (element) => element.date!.isAfter(
            DateTime.now().subtract(Duration(days: 7)),
          ),
        )
        .toList();
  }

  void openModal() {
    showModalBottomSheet(
      context: context,
      builder: (_) => ModalForm(
        fn: register,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listWidget = [
      Chart(
        masterListTokenFilter: _masterListTokenFilter,
      ),
      ...masterListToken!
          .map(
            (e) => Label(
              token: e,
              fn: removeLabel,
            ),
          )
          .toList()
    ];

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.payments_outlined),
        title: Text(
          'Controle financeiro',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: openModal, icon: Icon(Icons.add))],
      ),
      body: masterListToken!.isEmpty
          ? Center(
              child: TextButton(
                onPressed: openModal,
                child: Text(
                  'Clique aqui para começar.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListView.builder(
                itemCount: listWidget.length,
                itemBuilder: (ctx, index) => listWidget[index],
              ),
            ),
    );
  }
}
