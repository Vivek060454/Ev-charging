import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AmountSheet extends StatelessWidget {
  const AmountSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String? amount;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Get.theme.cardColor),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Enter Amount",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                hintText: "Amount",
                labelText: "Amount",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Amount is required";
                } else if (double.parse(value) <= 0) {
                  return "Enter a valid amount";
                }
                return null;
              },
              onSaved: (value) {
                amount = value;
              },
            ),
            const SizedBox(height: 12),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Get.back(result: amount);
                      }
                    },
                    child: const Text("Confirm"))),
          ],
        ),
      ),
    );
  }
}
