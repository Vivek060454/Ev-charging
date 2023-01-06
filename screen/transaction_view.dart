import 'dart:developer';

import 'package:evdock/app/common/enum.dart';
import 'package:evdock/app/common/utils.common.dart';
import 'package:evdock/app/model/ccavenue_details.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TransactionViewScreen extends StatelessWidget {
  static const name = "/transaction_view";
  final String url;
  final CcAvenueDetailsModel ccAvenueDetailsModel;
  const TransactionViewScreen(
      {Key? key, required this.url, required this.ccAvenueDetailsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final cancel = (await showConfirmationDialog(
                title: "Are you sure?",
                content: "Do you want to cancel the transaction?")) ??
            false;
        if (cancel) {
          Get.back(result: TransactionStatus.cancelled);
        }
        return false;
      },
      child: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onPageStarted: (value) {
          log(value);
          showLoadingDialog();
        },
        onPageFinished: (value) {
          removeDialog();
        },
        javascriptChannels: {
          JavascriptChannel(
            name: "responseHandler",
            onMessageReceived: (response) {
              log("${response.message} message");
              final message = response.message;
              switch (message.trim().toLowerCase()) {
                case "cancelled":
                  Get.back(
                      result: TransactionStatus.cancelled, closeOverlays: true);
                  break;
                case "success":
                  Get.back(
                      result: TransactionStatus.success, closeOverlays: true);
                  break;
                case "failure":
                  Get.back(
                      result: TransactionStatus.failure, closeOverlays: true);
                  break;
                default:
                  Get.back(
                      result: TransactionStatus.other, closeOverlays: true);
                  break;
              }
            },
          )
        },
      ),
    );
  }
}
