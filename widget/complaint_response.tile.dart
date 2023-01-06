import 'package:evdock/app/controller/account_tab.controller.dart';
import 'package:evdock/app/controller/new_complaints.controller.dart';
import 'package:evdock/app/screen/complaints.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ResponseComplaintTile extends StatelessWidget {
  AccountTabController ATC = AccountTabController();
  final  ResponseComplaintData;
  ResponseComplaintTile({
    Key? key,
    this. ResponseComplaintData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        /*mainAxisAlignment: MainAxisAlignment.center,*/
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            width: size.width * 0.99,
            height: size.height * 0.14,
            decoration:  BoxDecoration(
                color: Get.theme.cardColor, borderRadius: BorderRadius.circular(5)),
            child: Stack(
              /*alignment: Alignment.center,*/
              children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${ResponseComplaintData.commentDate}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              ),
                        ).marginOnly(top: 1, left: 2, right: 1),
                      ),
                    ],
                  ),
                    Row(
                      children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                              "${ResponseComplaintData.comments}",
                              style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      ),
                            ).marginOnly(top: 20, left: 2, right: 1),
                                    ),
                                  ),

                      ],
                    ),
              ],
            ),
          )
        ],
      ),
    );
  }
}