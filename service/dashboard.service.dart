import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:evdock/app/common/api.common.dart';
import 'package:evdock/app/common/utils.common.dart';
import 'package:evdock/app/data/Booking_History.data.dart';
import 'package:evdock/app/data/Charge_now.data.dart';
import 'package:evdock/app/data/add_car.data.dart';
import 'package:evdock/app/data/add_vehicle.data.dart';
import 'package:evdock/app/data/book_point.data.dart';
import 'package:evdock/app/data/cancelbooking.data.dart';
import 'package:evdock/app/data/delete_account.data.dart';
import 'package:evdock/app/data/delete_vehicle.data.dart';
import 'package:evdock/app/data/editprofile.data.dart';
import 'package:evdock/app/data/getuserdetails.data.dart';
import 'package:evdock/app/data/nearby_points.data.dart';
import 'package:evdock/app/data/stop_Charging.data.dart';
import 'package:evdock/app/model/Upcoming_bookings.model.dart';
import 'package:evdock/app/model/add_vehicle.model.dart';
import 'package:evdock/app/model/car.model.dart';
import 'package:evdock/app/model/ccavenue_details.model.dart';
import 'package:evdock/app/model/charging_points.model.dart';
import 'package:evdock/app/model/charging_status.model.dart';
import 'package:evdock/app/model/slotdate.model.dart';
import 'package:evdock/app/model/slot_booking.model.dart';
import 'package:evdock/app/model/transaction.model.dart';
import 'package:evdock/app/model/user_car.model.dart';
import 'package:evdock/app/service/network.service.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../data/MyBookings_Upcoming.data.dart';
import '../data/Newslotbooking.data.dart';
import '../data/Sample_SlotDate.data.dart';
import '../data/complaints.data.dart';
import '../data/new_complaints.data.dart';
import '../data/response_complaints.data.dart';
import '../data/slot_Booking.data.dart';
import '../data/slot_date.data.dart';
import '../model/complaint_List.model.dart';
import '../model/response_complaints.model.dart';

class DashboardService extends GetxService {
  final NetworkService _networkService = Get.find();

  String? get userName => _networkService.userName;
  String? get userPhone => _networkService.userPhone;

  String? get vehicleNumber => _networkService.vehicleNumber;
  set vehicleNumber(String? value) => _networkService.vehicleNumber = value;

  /*String? get bookingid => _networkService.bookingId;
  set bookingid(String? value) => _networkService.bookingId = value;*/

  Future<List<ChargingPointModel>?> getNearbyChargingPoints(
      NearbyPointsData data) async {
    try {
      log("$data");
      final response = await _networkService.dio
          .post(getNearByChargingStationsUrl, data: data.toJson());

      if (response.statusCode == 200) {
        return chargingPointsModelFromJson(
            jsonEncode(response.data["payload"]));
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool?> bookPoint(BookPointData data) async {
    try {
      final phone = _networkService.userPhone;
      data.mobileUserId = phone;
      final _data = data.toJson();
      log("$data");
      final response = await _networkService.dio.post(
        addChargingRequestUrl,
        data: _data,
      );
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
  Future<List<slotDate>?> slotDates(slotDate sd) async{
        String url = slotDateUrl;
        print(url);
    try{
      final response = await _networkService.dio.get(url);
      print(response);
      if(response.statusCode == 200){
        /*return slotDateFromMap(jsonEncode(response.data["payload"]));*/
        var responseData = jsonEncode(response.data["payload"]);
        return slotdateDataList.slotDateList = slotDateFromMap(responseData);
      }
    }on DioError catch (e){
      if(e.response?.data != null){
        showToast("${e.response?.data["errors"]?["message"]}");
      }
      return null;
    }catch (e){
      return null;
    }
  }
  Future<List<slotBooking>?> getslot(sB) async {
    String url = slotBookingUrl;
    print(url);
    try {
      final response = await _networkService.dio.post(url, data: sB);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var responseData = jsonEncode(response.data["payload"]);
        print(jsonEncode(response.data["payload"]));
        return slotbookingDataList.slotBookingList=slotBookingFromMap(responseData);
        /*slotBookingFromJson(jsonEncode(response.data["payload"]));*/
      }
    } on DioError catch (e) {
      if (e.response?.data != null) {
        showToast("${e.response?.data["errors"]?["message"]}");
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool?> getNewBooking(NewSlot data) async{
    final phone = _networkService.userPhone;
    data.userContactNo = phone;
    final _data = data.toJson();
    String url = newslotBookingUrl;
    print(url);
    print(data.chargingPointId);
    print(data.connectorId);
    print(data.requestedBookingDate);
    print(data.userContactNo);
    print(data.custName);
    print(data.custMobileNo);
    print(data.custVehicleNo);
    print(data.requestedAmount);
    try{
      final response = await _networkService.dio.post(url, data: _data);
      print(response);
      print(response.data["payload"]);
      if(response.statusCode == 200){
        return true;
      }
      return false;
    } on DioError catch (e){
      if (e.response?.data != null) {
       showToast("${e.response?.data["errors"]?["message"]}");
      }
     // return null;
    } catch (e){
     /* return null;*/
    }
  }
 /* Future<bool?> getsampleslotsdate(Date dd) async {
    print(SampleSlotDateUrl);
    try {
      final response = await _networkService.dio.post(SampleSlotDateUrl, data: dd);
      print(response.data["data"]);
      if (response.statusCode == 200) {
        return response.data["data"];
      }
      return null;
    }  on DioError catch (e) {
      if (e.response?.data != null) {
        print("MMM");
        showToast("${e.response?.data["errors"]?["message"]}");
      }
      return null;
    } catch (e) {
      return null;
    }
  }*/

  Future<double?> getWalletBalance() async {
    try {
      final phone = _networkService.userPhone;
      final data = {
        "mobileUser_Id": phone,
      };
      final response = await _networkService.dio.post(getWalletBalanceUrl, data: data);
      if (response.statusCode == 200) {
        return double.parse(response.data["payload"]["balance"]);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool?> addWalletMoneyTransaction({
    required String amount,
    required String transactionId,
    required String orderId,
    required String razorSignature,
  }) async {
    try {
      final phone = _networkService.userPhone;
      final data = {
        "mobileUser_Id": phone,
        "requestAmount": amount,
        "transactionId": transactionId,
        "orderId": orderId,
        "razorSignature": razorSignature
      };
      log("$data");
      final response = await _networkService.dio
          .post(addWalletMoneyTransactionUrl, data: data);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return null;
    }
  }

  Future<String?> addWalletMoneyRequest(String amount) async {
    try {
      final phone = _networkService.userPhone;
      final data = {
        "mobileUser_Id": phone,
        "requestAmount": amount,
      };
      log("$data");
      final response =
          await _networkService.dio.post(addWalletMoneyRequestUrl, data: data);
      if (response.statusCode == 200) {
        return response.data["payload"]["orderId"];
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<List<TransactionModel>?> getTransactions() async {
    try {
      final phone = _networkService.userPhone;
      final data = {"mobileUser_Id": phone};
      final response =
          await _networkService.dio.post(getChargingTrHistoryUrl, data: data);
      return transactionModelFromJson(jsonEncode(response.data["payload"]));
    } catch (e) {
      return null;
    }
  }
  Future<List<upcomingBookings>?> getupcomingBooking(upcomingBookings ub) async{
    final phone = _networkService.userPhone;
    ub.custMobileNo = phone;
    String url = upcongBookingsUrl;
    print(url);
    url = url + phone!;
    try {
      final response = await _networkService.dio.get(url, options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ));
      print(response);
      if (response.statusCode == 200) {
       /* print(response);
        print(jsonEncode(response.data["payload"]));*/
        print(upcomingBookingsFromJson(jsonEncode(response.data["payload"])));

        return upcomingBookingsFromJson(jsonEncode(response.data["payload"]));
      }
    }on DioError catch (e) {
      if (e.response?.data != null) {
        showToast("${e.response?.data["errors"]?["message"]}");
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool?> getcancelBooking(String bookingId) async{
   String url = canceluBookingUrl;
   url = url + bookingId;
   print(url);
   try {
     final response = await _networkService.dio.get(url,options: Options(
       headers: {
         "Content-Type": "application/json",
       },
     ));
     if(response.statusCode == 200) {
        print(response.data["payload"]);
       return true;
     }
   }on DioError catch (e) {
     if (e.response?.data != null) {
       showToast("${e.response?.data["errors"]?["message"]}");
     }
     return null;
   }catch (e) {
     return null;
   }
  }

  Future<bool?> getchargeNow(String bookingReqId) async{
    String url = chargenowforupcomingBookingUrl;
    final data ={
      "bookingReqId":bookingReqId,
    };
    url = url;
    print(url);
    try {
      final response = await _networkService.dio.post(url,data: data, options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ));
      if(response.statusCode == 200) {
        print(response.data["payload"]);
        return true;
      }
      return false;
    }on DioError catch (e) {
      if (e.response?.data != null) {
        showToast("${e.response?.data["errors"]?["message"]}");
        print("11");
      }
      return null;
    }catch (e) {
      return null;
    }
  }
  Future<List<Bookinghistory>?> getbookinghistory(Bookinghistory Bh) async{
    final String? history = _networkService.userPhone;
    String url = bookinghistoryUrl + history!;
    print(url);
    try {
      final response = await _networkService.dio.get(url, options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ));
      print(response);
      if (response.statusCode == 200) {
        /* print(response);
        print(jsonEncode(response.data["payload"]));*/
        print(upcomingBookingsFromJson(jsonEncode(response.data["payload"])));

        return BookinghistoryFromJson(jsonEncode(response.data["payload"]));
      }
    }on DioError catch (e) {
      if (e.response?.data != null) {
        showToast("${e.response?.data["errors"]?["message"]}");
      }
      return null;
    } catch (e) {
      return null;
    }
  }


  Future<List<UserCarModel>?> getUserCars() async {
    try {
      final phone = _networkService.userPhone;
      final response = await _networkService.dio.get("$getUserCarsUrl/$phone",
          options: Options(
            headers: {
              "Content-Type": "application/json",
            },
          ));
      return userCarModelFromJson(jsonEncode(response.data['payload']));
    } catch (e) {
      print("121");
      return null;
    }
  }

  Future<bool?> addUserCar(AddCarData input) async {
    input.mobileUserId = _networkService.userPhone;
    final data = input.toJson();
    try {
      await _networkService.dio.post(addUserCarsUrl, data: data);
      return true;
    } catch (e) {
      return null;
    }
  }

  Future<List<CarModel>?> getCarModels() async {
    try {
      final response = await _networkService.dio.get(getCarModelsUrl);
      return carModelFromJson(jsonEncode(response.data["payload"]));
    } catch (e) {
      return null;
    }
  }

  Future<File?> downloadAndGetFile(
      {required String url, required String name}) async {
    try {
      final dir = await getTemporaryDirectory();
      final file = File("${dir.path}/$name");
      if (await file.exists()) {
        return file;
      }
      final response = await _networkService.dio.get(url,
          options: Options(
            responseType: ResponseType.bytes,
          ));
      await file.writeAsBytes(response.data);
      return file;
    } catch (e) {
      return null;
    }
  }

  Future<List<ChargingStatusModel>?> getUserChargingStatus() async {
    try {
      final phone = _networkService.userPhone;
      final data = {"mobileUser_Id": phone};
      final response =
          await _networkService.dio.post(getUserChargingStatusUrl, data: data);
      print(response.data["payload"]);
      return chargingStatusModelFromJson(jsonEncode(response.data["payload"]));
    } catch (e) {
      return null;
    }
  }
  Future<bool?> getstopChargingNow(String request_id /*stopCharging input*/) async {
    String url = StopChargingUrl;
    //final data = input.toJson();
    //data.requestId = StopChargingUrl;
    url = url+request_id;
    print(url);
    try {
      final response = await _networkService.dio.get(url,options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ));
      print(response.toString());
      if(response.statusCode == 200){
        print(response.data["payload"]);
        return true;
      }
    }  on DioError catch (e) {
      if (e.response?.data != null) {
        print("mm");
        showToast("${e.response?.data["errors"]?["message"]}");
      }
      return null;
    } catch (e) {
      return null;
    }
  }
  /*Future<bool?> getcancelBooking(String bookingId) async{
    String url = canceluBookingUrl;
    url = url + bookingId;
    print(url);
    try {
      final response = await _networkService.dio.get(url,options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ));
      if(response.statusCode == 200) {
        print(response.data["payload"]);
        return true;
      }
    }on DioError catch (e) {
      if (e.response?.data != null) {
        showToast("${e.response?.data["errors"]?["message"]}");
      }
      return null;
    }catch (e) {
      return null;
    }
  }*/

  Future<CcAvenueDetailsModel?> getCCAvenueDetails(String amount) async {
    try {
      final phone = _networkService.userPhone;
      final data = {
        "requestAmount": amount,
        "mobileUser_Id": phone,
      };
      final response =
          await _networkService.dio.post(getCCAvenueDetailsUrl, data: data);
      return CcAvenueDetailsModel.fromJson(response.data["payload"]);
    } catch (e) {
      return null;
    }
  }

// S-Cube code starts
  Future<bool?> editprofileDetails(EditProfile data) async {
    try {
      final String? userUpdate = _networkService.userPhone;
      /*print(userUpdate);*/
      data.mobilenumber = userUpdate;
      final _data = data.toJson();
      /*print(phone);*/
      String link = editprofileUrl;

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

  Future<GetUserDetails?> getUserDetails(GetUserDetails data) async {
    final String? userid = _networkService.userId;
    String url = getuserdetails + userid!;
    final response = await _networkService.dio.get(url);

    return getuserdetailsFromJson(jsonEncode(response.data["payload"]));
  }



  Future<List<AddVehicle>?> getVehicleDetails(AddVehicle dat) async {
    try {
      final Vphone = _networkService.userPhone;
      dat.id = Vphone;
      String url = getVehicledetails;
      url = url + Vphone!;
      final response = await _networkService.dio
          .get(url, options: Options(contentType: Headers.jsonContentType));
      if (response.statusCode == 200) {
        print(response.data);
        var responseData = jsonEncode(response.data["payload"]);
        return AddVehicleDataList.vehicleList = addvehicleFromMap(responseData);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<List<ComplaintsList>?> complaintList(ComplaintsList data) async {
    try {
      final c = _networkService.userPhone;
      print(c);
      print(data);
      String url = complaintListUrl;
      url = url + c!;
      print(url);
      final response = await _networkService.dio
          .get(url, options: Options(contentType: Headers.jsonContentType));
      print(response.data);
      if (response.statusCode == 200) {
        var responseData = jsonEncode(response.data["payload"]);
        return ComplaintDataList.complaintList =
            ComplaintsListFromMap(responseData);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<List<ResponseComplaints>?> Responsecomplaints(
      String complaintId) async {
    try {
      print(complaintId);
      String url = responseListbyIdUrl;
      url = url + complaintId;
      print(url);
      final response = await _networkService.dio
          .get(url, options: Options(contentType: Headers.jsonContentType));
      // print(response.data);
      if (response.statusCode == 200) {
        var responseData =
            jsonEncode(response.data["payload"]["commentsResponse"]);
        print(responseData);
        return ResponseComplaintDataList.ResponsecomplaintList =
            ResponseComplaintsFromMap(responseData);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool?> newComplaints(newcomplaints data) async {
    try {
      final String? userUpdate = _networkService.userPhone;
      data.userContactNo = userUpdate;
      String url = newcomplaintsUrl;
      print(url);
      final _data = data.toJson();
      final response = await _networkService.dio.post(url, data: _data);
      print(response);
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
  deleteVehicleDetails(deleteVehicle da) async {
    try {
      String link = deleteVehicledetails;
      final response = await _networkService.dio.post(link,
          data: da, options: Options(contentType: Headers.jsonContentType));
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool?> deleteaccount(deleteAccount da) async {
    final String? userdelete = _networkService.userPhone;
    String url = deleteaccountUrl;
    da.mobileUserId = userdelete;
    print(url);
    final response = await _networkService.dio.post(url, data: da,options: Options(contentType: Headers.jsonContentType));
    print(response);
    if (response.statusCode == 200) {
      return true;
    }
    return null;
  }
// S-Cube code ends
}
