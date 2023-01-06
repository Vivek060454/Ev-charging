import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:evdock/app/common/api.common.dart';
import 'package:evdock/app/common/enum.dart';
import 'package:evdock/app/common/utils.common.dart';
import 'package:evdock/app/data/forgot_password.data.dart';
import 'package:evdock/app/data/reset_password.data.dart';
import 'package:evdock/app/data/sign_in.data.dart';
import 'package:evdock/app/data/sign_up.data.dart';
import 'package:evdock/app/service/network.service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final NetworkService _networkService = Get.find();

  Future<ResponseStatus> signIn(SignInData input) async {
    final data = input.toJson();

    final fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken != null) {
      log("FCM Token => $fcmToken");
      data["fcmToken"] = fcmToken;
    }

    try {
      final response = await _networkService.dio.post(signInUrl, data: data);
      if (response.statusCode == 200) {
        final data = response.data["payload"];
        _networkService.accessToken = data["accessToken"];
        _networkService.refreshToken = data["refreshToken"];
        _networkService.userPhone = input.username;
        _networkService.userName = data["username"];
        _networkService.userId = data["userId"];
        return ResponseStatus.success;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 404) {
        return ResponseStatus.failure;
      } else if (e.response?.data["errors"] != null) {
        final error = e.response?.data["errors"];
        if (error["message"].toString().toLowerCase() == "bad credentials") {
          return ResponseStatus.failure;
        }
      }
      return ResponseStatus.error;
    } catch (_) {
      return ResponseStatus.error;
    }
    return ResponseStatus.failure;
  }

  Future<int> signUp(SignUpData input) async {
    final data = input.toJson();
    log("$data");
    try {
      final response = await _networkService.dio.post(signUpUrl, data: data);
      return response.statusCode ?? 500;
    } on DioError catch (e) {
      return e.response?.statusCode ?? 500;
    } catch (e) {
      log("$e");
      return 500;
    }
  }

  Future<bool?> verifyOtp(
      {required String mobileNumber, required String otp}) async {
    try {
      final data = {
        "mobilenumber": mobileNumber,
        "otp": otp,
      };
      final response =
          await _networkService.dio.post(mobileOtpVerificationUrl, data: data);

      if (response.statusCode == 200) {
        return response.data["payload"] as bool;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool> signOut() async {
    try {
      final phone = _networkService.userPhone;
      final data = {"username": phone};
      final response = await _networkService.dio.post(signOutUrl, data: data);
      if (response.statusCode == 200) {
        clearUser();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  clearUser() {
    _networkService.accessToken = null;
    _networkService.refreshToken = null;
    _networkService.userName = null;
    /*_networkService.userPhone = null;*/
    _networkService.vehicleNumber = null;
    _networkService.userId = null;
    _networkService.bookingId = null;
  }

// S-Cube code starts
  ForgotPasswordData fpd = ForgotPasswordData();

  Future<bool?> resetPassword(ResetPasswordData input) async {
    try {
      final String? userUpdate = _networkService.userPhone;
      input.mobileUser_Id = userUpdate;
      /*fpd.mobileNo = userUpdate;*/
      final _data = input.toJson();
      String link = resetpasswordUrl;
      final response = await _networkService.dio.post(link, data: _data);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on DioError catch (e) {
      if (e.response?.data != null) {
        showToast("${e.response?.data["errors"]?["message"]}");
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<int> forgotPassword(ForgotPasswordData input) async {
    /*final String? userUpdate = _networkService.userPhone;
    input.mobileNo = userUpdate;*/
    final data = input;
    log("$data");
    print(data);
    String s = generateOtpUrl;
    print(s);
    try {
      final response = await _networkService.dio.post(s, data: input);
      print(response);
      return response.statusCode ?? 200;
    } on DioError catch (e) {
      return e.response?.statusCode ?? 500;
    } catch (e) {
      log("$e");
      return 500;
    }
  }

  Future<bool?> MobileverifyOtp(
      {required String mobileNo, required String otp, String? mobileUser_Id}) async {
    try {
      final data = {
        "mobileNo": mobileNo,
        "otp": otp,
      };
      print(data);
      final response =
          await _networkService.dio.post(validateOtpUrl, data: data);
      print(response);
      if (response.statusCode == 200) {
        return response.data["payload"] as bool;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
// S-Cube code ends
}
