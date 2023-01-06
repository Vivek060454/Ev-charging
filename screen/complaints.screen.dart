import 'package:evdock/app/controller/account_tab.controller.dart';
import 'package:evdock/app/model/complaint_List.model.dart';
import 'package:evdock/app/screen/new_complaints.screen.dart';
import 'package:evdock/app/widget/complaint_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/new_complaints.controller.dart';
import '../model/add_vehicle.model.dart';
import '../widget/add_vehicle.tile.widget.dart';

class Complaints extends StatelessWidget {
  NewComplaintsController c = NewComplaintsController();
  static const name ="/complaints_screen";
   Complaints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
      return Scaffold(
        appBar: AppBar(
          title: const Text("Complaints"),
          elevation: 1,
        ),
        body:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(

                  height: Get.height * 310/ 450,
                  alignment: Alignment.center,
                  /*padding: const EdgeInsets.all(1),*/
                  decoration: const BoxDecoration(),
                  child: ListView.builder(
                    itemCount: ComplaintDataList.complaintList.length,
                    itemBuilder: (BuildContext context,  int index) {
                      var Complaint = ComplaintDataList.complaintList[index];
                      return ComplaintTile(ComplaintData: Complaint);
                    },),
                ),
                const SizedBox(height:60,),
                Column(
                  children: [
                    Container(
                        alignment: Alignment.bottomRight,
                        child:FloatingActionButton.extended(
                          onPressed: () {
                            /*arguments: {"point": point});*/
                           /* c.getUserComplaintDetailsApi();*/
                            Get.to(()=> NewComplaints());
                          },
                          label: const Text('New Complaints'),
                          icon: const Icon(Icons.add),
                          backgroundColor: Colors.green,
                        )
                    ),
                  ],
                ),
              ]
            )
      );
    }
  }
