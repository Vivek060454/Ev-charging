import 'package:evdock/app/controller/account_tab.controller.dart';
import 'package:evdock/app/model/complaint_List.model.dart';
import 'package:evdock/app/model/post.model.dart';
import 'package:evdock/app/screen/new_complaints.screen.dart';
import 'package:evdock/app/widget/complaint_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/add_vehicle.model.dart';
import '../model/response_complaints.model.dart';
import '../widget/add_vehicle.tile.widget.dart';
import '../widget/complaint_response.tile.dart';

class ResponseComplaintsScreen extends StatelessWidget {
  static const name ="/complaints_screen";
  const ResponseComplaintsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Response Status"),
          elevation: 1,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: Get.height * 280/ 400,
                alignment: Alignment.center,
                /*padding: const EdgeInsets.all(1),*/
                decoration: const BoxDecoration(),
                child: ListView.builder(
                  itemCount: ResponseComplaintDataList.ResponsecomplaintList.length,
                  itemBuilder: (BuildContext context,  int index) {
                    var Response = ResponseComplaintDataList.ResponsecomplaintList[index];
                    return ResponseComplaintTile(ResponseComplaintData: Response);
                  },),
              ),
            ]
        )
    );
  }
}