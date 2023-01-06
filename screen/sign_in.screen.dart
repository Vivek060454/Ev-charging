import 'package:evdock/app/controller/sign_in.controller.dart';
import 'package:evdock/app/screen/sign_up.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'forgotpassword.screen.dart';

class SignInScreen extends StatelessWidget {
  static const name = "/sign_in";
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetX<SignInController>(
      init: SignInController(),
      builder: (_) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  color: Get.theme.primaryColor.withOpacity(.5),
                  image: const DecorationImage(
                    image: AssetImage("assets/bg.jpeg"),
                    fit: BoxFit.cover,
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
                          color: Colors.white.withOpacity(.9),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 32,
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
                                    _.signInData.username = value!.trim();
                                  },
                                ),
                                TextFormField(
                                  textInputAction: TextInputAction.done,
                                  decoration: const InputDecoration(
                                    hintText: 'Password',
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return "Password is required";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _.signInData.password = value!.trim();
                                  },
                                ),
                                const SizedBox(height: 24),
                                SizedBox(
                                  width: 100,
                                  height: 30,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red,
                                      ),
                                      onPressed: () {
                                        FocusScope.of(context).unfocus();
                                        _.signIn();
                                      },
                                      child: const Text("Sign In")),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Flexible(
                                        child: Text("Don't have an account?")),
                                    TextButton(
                                      onPressed: () {
                                        Get.offNamed(SignUpScreen.name);
                                      },
                                      child: const Text("Sign Up"),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Flexible(
                                        child: Text("Forget Password?")),
                                    TextButton(
                                      onPressed: () {
                                        /* Get.offNamed(ForgotPassword.name);*/
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const ForgotPassword()),
                                        );
                                      },
                                      child: const Text("ForgotPassword"),
                                    )
                                  ],
                                ),
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
