// S-Cube files
import 'package:evdock/app/controller/reset_password.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  static const name = "/reset_password";
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetX<ResetPasswordController>(
      init: ResetPasswordController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Reset Password",
            ),
            elevation: 1,
          ),
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
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
                        top: size.height * 25 / 100,
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
                            "Reset password",
                            style: TextStyle(
                              fontSize: 20,
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
                                  textInputAction: TextInputAction.done,
                                  decoration: const InputDecoration(
                                    hintText: 'New Password',
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return "Password is required";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _.rp.password = value!.trim();
                                  },
                                ),
                                TextFormField(
                                  textInputAction: TextInputAction.done,
                                  decoration: const InputDecoration(
                                    hintText: 'Confirm Password',
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return "Password is required";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _.rp.confirmpassword = value!.trim();
                                  },
                                ),
                                const SizedBox(height: 24),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            //Get.offAllNamed(DashboardScreen.name);
                                            _.resetpassword();
                                          },
                                          child: const Text(
                                            "Save",
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          )),
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
