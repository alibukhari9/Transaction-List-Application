import 'package:flutter/material.dart';

class TransactionProperty extends StatelessWidget {
  final String label;
  final String property;
  TransactionProperty(this.label, this.property);

  @override
  Widget build(BuildContext context) {
    return Text(this.label + ':  ' + this.property,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal));
  }
}
