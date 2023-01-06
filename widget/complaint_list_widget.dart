import 'package:evdock/app/common/utils.common.dart';
import 'package:evdock/app/controller/new_complaints.controller.dart';
import 'package:evdock/app/screen/complaints.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/account_tab.controller.dart';
import '../controller/add_vehicle.controller.dart';
import '../data/response_complaints.data.dart';

class ComplaintTile extends StatelessWidget {
  AccountTabController ATC = AccountTabController();
  final ComplaintData;
  ComplaintTile({
    Key? key,
    this.ComplaintData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child:
            /* mainAxisAlignment: MainAxisAlignment.center,*/
             Row(
              children: [
             Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              width: size.width * 0.99,
              height: size.height * 0.25,
              padding: const EdgeInsets.all(2),
              /*margin: const EdgeInsets.only(left: 8, right: 8),*/
              decoration: BoxDecoration(
                /*gradient: const LinearGradient(
                  colors: <Color>[
                    Color(0xECF1F8FF),
                    Color(0xECF1F8FF),
                    Color(0xECF1F8FF),
                  ],
                ),
                color: Colors.white,*/color: Get.theme.cardColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                /* alignment: Alignment.topLeft*/
                children: [
                  Row(
                    /*mainAxisAlignment: MainAxisAlignment.start,*/
                    children: [
                      const Text(
                        "${"UserName:-"}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ).marginOnly(top: 1, left: 1, right: 1),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            ComplaintData.userName,
                            style: const TextStyle(
                              fontSize: 15, /*fontWeight: FontWeight.w500*/
                            ),
                          ).marginOnly(top: 1, left: 1, right: 1),
                        ),
                      )
                    ],
                  ),
                  Row(
                    /*mainAxisAlignment: MainAxisAlignment.spaceBetween,*/
                    children: [
                      const Text(
                        "${"Complaint Date:-"}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ).marginOnly(top: 35, left: 1, right: 1),
                      Expanded(
                        child: Text(
                          ComplaintData.complaintDate,
                          style: const TextStyle(
                            fontSize: 15, /*fontWeight: FontWeight.w500*/
                          ),
                        ).marginOnly(top: 35, left: 1, right: 120),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Details:-",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ).marginOnly(top: 60, left: 1, right: 2),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            "${ComplaintData.complaintDetail}",
                            style: const TextStyle(
                              fontSize: 15, /*fontWeight: FontWeight.w500*/
                            ),
                          ).marginOnly(
                            top: 60,
                            left: 5,
                            right: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Category:-",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ).marginOnly(top: 135, left: 1, right: 5),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            "${ComplaintData.complaintCategory}",
                            style: const TextStyle(
                              fontSize: 15, /*fontWeight: FontWeight.w500*/
                            ),
                          ).marginOnly(
                            top: 135,
                            left: 1,
                            right: 100,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            padding: const EdgeInsets.all(6.0),
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {
                            ("${ATC.getResponseComplaintsfromApi(ComplaintData!.complaintId)}\n");
                          },
                          child: const Text(
                            "Response",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Status:-",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ).marginOnly(top: 95, left: 1, right: 1),
                      Expanded(
                        child: Text(
                          ComplaintData.complaintStatus,
                          style: const TextStyle(
                            fontSize: 14, /*fontWeight: FontWeight.w500*/
                          ),
                        ).marginOnly(
                          top: 97,
                          left: 10,
                          right: 10,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
