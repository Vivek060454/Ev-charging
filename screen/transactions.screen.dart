import 'package:evdock/app/controller/transactions.controller.dart';
import 'package:evdock/app/widget/transaction_tile.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionsScreen extends StatelessWidget {
  static const name = "/transactions";
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<TransactionsController>(
      init: TransactionsController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("Transactions")),
          body: Column(
            children: [
              if (_.loading)
                const Expanded(
                    child: Center(
                  child: CircularProgressIndicator(),
                ))
              else if (!_.loading && _.transactions.isEmpty)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("No transactions found"),
                        TextButton(
                          onPressed: _.getTransactions,
                          child: const Text("Try again"),
                        )
                      ],
                    ),
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: _.transactions.length,
                    itemBuilder: (BuildContext context, int index) {
                      final transaction = _.transactions[index];
                      return TransactionTile(
                        transaction: transaction,
                        onReceipt: () async {
                          if (transaction.receipt != null) {
                            _.downloadAndOpenFile(transaction.receipt!);
                          }
                        },
                      );
                    },
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
