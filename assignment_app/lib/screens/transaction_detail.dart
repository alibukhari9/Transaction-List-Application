import 'package:assignment_app/services/models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionDetails extends StatelessWidget {
  Transaction transaction;

  TransactionDetails(this.transaction);
  String formattedDate() {
    var format = DateFormat('dd-MMM-yyyy');
    var dateString = format.format(transaction.date);
    return dateString;
  }

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
              Text('Date:  ' + formattedDate(),
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              SizedBox(
                height: 20,
              ),
              Text('Amount:  ' + transaction.amount,
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              SizedBox(
                height: 20,
              ),
              Text('BIC:  ' + transaction.bic,
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              SizedBox(
                height: 20,
              ),
              Text('Currency Code:  ' + transaction.currencyCode,
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              SizedBox(
                height: 20,
              ),
              Text('Description:  ' + transaction.description,
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              SizedBox(
                height: 20,
              ),
              Text('IBAN:  ' + transaction.iban,
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              SizedBox(
                height: 20,
              ),
              Text(
                  'Transaction Type:  ' +
                      toBeginningOfSentenceCase(transaction.type),
                  style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
            ],
          ),
        ),
      ),
    );
  }
}
