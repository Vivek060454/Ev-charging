import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/new_complaints.controller.dart';

import '../service/network.service.dart';

class NewComplaints extends StatelessWidget {
  final NetworkService _networkService = Get.find();
  static const name = "/new_complaints";
   NewComplaints({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetX<NewComplaintsController>(
      init: NewComplaintsController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("New Complaints"),
            elevation: 1,
          ),
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  /*gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.white,
                      Colors.green,
                    ],
                  ),*/
                ),
              ),
              ListView(
                children: [
                  Center(
                    child: Container(
                      width: size.width * 80 / 100,
                      margin: EdgeInsets.only(
                        top: size.height * 25 / 150,
                      ),
                      // alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),color: Get.theme.cardColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "New Complaints",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Form(
                            key: _.formKey,
                            autovalidateMode: _.autovalidateMode,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  enabled: false,
                                  initialValue: _networkService.userName,
                                  textInputAction: TextInputAction.next,
                                  decoration:
                                  const InputDecoration(hintText: 'Name'),
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return "Username is required";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _.ep.userName = value!.trim();
                                  },
                                ),
                                TextFormField(
                                  enabled: false,
                                  initialValue: _networkService.userPhone,
                                  textInputAction: TextInputAction.next,
                                  decoration:
                                  const InputDecoration(hintText: 'Phone'),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return "Phone is required";
                                    } else if (value.trim().length != 10) {
                                      return "Enter a valid phone number";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _.ep.userContactNo = value!.trim();
                                  },
                                ),
                                TextFormField(
                                  textInputAction: TextInputAction.done,
                                  decoration:
                                  const InputDecoration(hintText: 'Specify Category of Complaint'),
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return " Category is required";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    //_.getUserDetails.email= value!.trim();
                                    _.ep.complaintCategory = value!.trim();
                                  },
                                ),
                                TextFormField(
                                 /* initialValue: nc.complaintDetail,*/
                                  textInputAction: TextInputAction.next,
                                  decoration:
                                  const InputDecoration(hintText: 'Specify  Complaint'),
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return "Complaint is required";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    //_.getUserDetails.email= value!.trim();
                                    _.ep.complaintDetail = value!.trim();
                                  },
                                ),
                                const SizedBox(height: 24),
                                Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            _.newComplaints();
                                          },
                                          child: const Text(
                                            "Save",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          )),
                                      const SizedBox(height: 12),
                                      ElevatedButton(
                                          onPressed: () {
                                           Get.back();
                                          },
                                          child: const Text(
                                            "Cancel",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          )),
                                    ])
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}