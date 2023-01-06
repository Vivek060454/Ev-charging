// S-Cube files
import 'dart:math';

import 'package:evdock/app/controller/account_tab.controller.dart';
import 'package:evdock/app/controller/edit_profile.controller.dart';
import 'package:evdock/app/data/getuserdetails.data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../common/utils.common.dart';
import '../data/delete_account.data.dart';

class EditProfile extends StatelessWidget {
  AccountTabController act = AccountTabController();
  static const name = "/edit_profile";
  final GetUserDetails getUserDetails;
   EditProfile({Key? key, required this.getUserDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetX<EditProfileController>(
      init: EditProfileController(getUserDetails),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("EditProfile"),
            elevation: 1,
          ),
          body: Stack(
            children: [
              Container(
                decoration:  const BoxDecoration(
                   /* color: Get.theme.cardColor*/
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.white,
                      Colors.green,
                    ],
                  ),
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
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Edit Profile",
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
                                  initialValue: getUserDetails.username,
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
                                    _.ep.username = value!.trim();
                                  },
                                ),
                                TextFormField(
                                  initialValue: getUserDetails.email,
                                  textInputAction: TextInputAction.next,
                                  decoration:
                                      const InputDecoration(hintText: 'Email'),
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return "Email is required";
                                    } else if (!value.trim().isEmail) {
                                      return "Enter a valid Email";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    //_.getUserDetails.email= value!.trim();
                                    _.ep.email = value!.trim();
                                  },
                                ),
                                TextFormField(
                                  enabled: false,
                                  initialValue: getUserDetails.mobileno,
                                  textInputAction: TextInputAction.done,
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
                                    _.ep.mobilenumber = value!.trim();
                                  },
                                ),
                                const SizedBox(height: 24),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            _.editprofilefromApi();
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
                                    ]),
                                Container(
                                  height: 300,
                                  alignment: Alignment.center,
                                  child:  ElevatedButton(
                                      onPressed:() {
                                        _.deleteAccountApi();

                                      },
                                      child:  const Text(
                                        "Delete Account",
                                        style: TextStyle(
                                          fontSize: 12,

                                        ),
                                      )),
                                )
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
