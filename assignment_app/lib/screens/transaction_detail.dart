import 'package:assignment_app/services/models.dart';
import 'package:assignment_app/shared_functions.dart';
import 'package:assignment_app/widgets/transaction_properties.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionDetails extends StatelessWidget {
  final Transaction transaction;

  TransactionDetails(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Transaction Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TransactionProperty('Date', formattedDate(transaction.date!)),
              SizedBox(
                height: 20,
              ),
              TransactionProperty('Amount', transaction.amount!),
              SizedBox(
                height: 20,
              ),
              TransactionProperty(
                'BIC',
                transaction.bic!,
              ),
              SizedBox(
                height: 20,
              ),
              TransactionProperty(
                'Currency Code',
                transaction.currencyCode!,
              ),
              SizedBox(
                height: 20,
              ),
              TransactionProperty(
                'Description',
                transaction.description!,
              ),
              SizedBox(
                height: 20,
              ),
              TransactionProperty('IBAN', transaction.iban!),
              SizedBox(
                height: 20,
              ),
              TransactionProperty(
                'Transaction Type',
                toBeginningOfSentenceCase(transaction.type as String)!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
