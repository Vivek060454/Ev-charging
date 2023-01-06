import 'package:evdock/app/model/transaction.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel transaction;
  final VoidCallback onReceipt;
  const TransactionTile({
    Key? key,
    required this.transaction,
    required this.onReceipt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Get.theme.cardColor),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "₹${transaction.amount}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    transaction.transactionDate,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    transaction.remark,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            if (transaction.receipt != null)
              ElevatedButton(
                child: const Text("Receipt"),
                onPressed: onReceipt,
              )
          ],
        ));
  }
}
