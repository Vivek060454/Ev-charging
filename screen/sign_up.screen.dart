import 'package:evdock/app/common/api.common.dart';
import 'package:evdock/app/controller/sign_up.controller.dart';
import 'package:evdock/app/screen/forgotpassword.screen.dart';
import 'package:evdock/app/screen/sign_in.screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  static const name = "/sign_up";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetX<SignUpController>(
      init: SignUpController(),
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
                        top: size.height * 20 / 100,
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
                            "Sign Up",
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
                                  decoration:
                                      const InputDecoration(hintText: 'Name'),
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return "Username is required";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _.signUpData.username = value!.trim();
                                  },
                                ),
                                TextFormField(
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
                                    _.signUpData.email = value!.trim();
                                  },
                                ),
                                TextFormField(
                                  textInputAction: TextInputAction.next,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      hintText: 'Password'),
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return "Password is required";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _.signUpData.password = value!.trim();
                                  },
                                ),
                                TextFormField(
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
                                    _.signUpData.mobilenumber = value!.trim();
                                  },
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 40,
                                      child: Checkbox(
                                        activeColor: Get.theme.primaryColor,
                                        value: _.termsAccept,
                                        onChanged: (value) {
                                          _.termsAccept = value;
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: RichText(
                                        text: TextSpan(
                                          text: "I agree to the ",
                                          style: TextStyle(
                                              color: Get.theme.textTheme
                                                  .bodyText1!.color),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              _.termsAccept = !_.termsAccept;
                                            },
                                          children: [
                                            TextSpan(
                                              text: "Terms & Conditions",
                                              style: const TextStyle(
                                                  color: Colors.blue),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  FlutterWebBrowser.openWebPage(
                                                      url: termsPage);
                                                },
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 30,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red,
                                      ),
                                      onPressed: () {
                                        FocusScope.of(context).unfocus();
                                        // Get.offAllNamed(DashboardScreen.name);
                                        _.signUp();
                                      },
                                      child: const Text("Register")),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Flexible(
                                        child:
                                            Text("Already Have an account?")),
                                    TextButton(
                                      onPressed: () {
                                        Get.offNamed(SignInScreen.name);
                                      },
                                      child: const Text("Sign In"),
                                    )
                                  ],
                                ),
                                // S-Cube code starts
                                // S-Cube code ends
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
