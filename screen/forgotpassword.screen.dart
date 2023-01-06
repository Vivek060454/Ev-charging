// S-Cube files
import 'package:evdock/app/controller/forgot_password.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  static const name = "/forgot_password";
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetX<ForgotPasswordController>(
      init: ForgotPasswordController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Forgot Password",
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
                            "Forgot password",
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
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  decoration: const InputDecoration(
                                    hintText: 'Phone',
                                  ),
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return "Phone is required";
                                    } else if (value.trim().length != 10) {
                                      return "Enter valid phone number";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _.fp.mobileNo = value!.trim();
                                  },
                                ),
                                const SizedBox(height: 24),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            _.forgotpassword();
                                          },
                                          child: const Text(
                                            "Send",
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
