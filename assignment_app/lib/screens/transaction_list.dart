import 'package:assignment_app/services/models.dart';
import 'package:assignment_app/services/providers.dart';
import 'package:assignment_app/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionsList extends StatefulWidget {
  @override
  _TransactionsListState createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  TransactionProviders? transactionProviders;
  List<Transaction> searchList = [];
  // int? num;
  bool isLoaded = false;
  bool isSearchList = false;
  TextEditingController searchController = new TextEditingController();

  @override
  void didChangeDependencies() {
    transactionProviders =
        Provider.of<TransactionProviders>(context, listen: false);
    transactionProviders!.loadTransactions().then((v) {
      setState(() {
        isLoaded = true;
        // sortTransactions();
      });
    });
    super.didChangeDependencies();
  }

  // void sortTransactions() {
  //   transactionProviders.transactionList
  //       .sort((a, b) => a.date.compareTo(b.date));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: TextField(
                onSubmitted: (v) {
                  searchList = transactionProviders!.transactionList!
                      .where((element) =>
                          element.type!.toLowerCase().contains(v.toLowerCase()))
                      .toList();

                  if (v.isEmpty) {
                    setState(() {
                      isSearchList = false;
                    });
                  } else {
                    setState(() {
                      isSearchList = true;
                    });
                  }
                },
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search By Transaction Type',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            (isLoaded)
                ? Expanded(
                    child: ListView.builder(
                      itemBuilder: (ctx, index) {
                        return TransactionItem(isSearchList
                            ? searchList[index]
                            : transactionProviders!.transactionList![index]);
                      },
                      itemCount: isSearchList
                          ? searchList.length
                          : transactionProviders!.transactionList!.length,
                    ),
                  )
                : Center(
                    child: Text('Loading'),
                  )
          ],
        ),
      ),
    );
  }
}
