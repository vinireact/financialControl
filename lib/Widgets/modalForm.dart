import 'package:flutter/material.dart';
import 'package:lion_tax/Widgets/lionTaxButton.dart';

class ModalForm extends StatefulWidget {
  Function(String, double) fn;

  ModalForm({required this.fn});

  @override
  _ModalFormState createState() => _ModalFormState();
}

class _ModalFormState extends State<ModalForm> {
  TextEditingController? txtController = TextEditingController();

  TextEditingController? valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Título',
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                hintText: 'Ex. Supermercado',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              controller: txtController,
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                hintText: 'Ex. 100.00',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              controller: valueController,
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: LionTaxButton(
                txt: 'REGISTRAR',
                fn: () => widget.fn(
                  txtController!.text.isEmpty
                      ? 'Sem título'
                      : txtController!.text,
                  valueController!.text.isEmpty
                      ? 0.0
                      : (double.parse(valueController!.text)),
                ),
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
