import 'package:dio/dio.dart';
import 'package:evdock/app/common/api.common.dart';
import 'package:evdock/app/common/constants.common.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NetworkService extends GetxService {
  NetworkService._();
  final _dio = Dio(BaseOptions(
    baseUrl: kBaseUrl,
  ));
  Dio get dio => _dio;
  final box = GetStorage();

  static NetworkService get instance {
    final _networkService = NetworkService._();
    return _networkService;
  }

  String? get accessToken => box.read<String>(accessTokenKey);
  set accessToken(String? value) => box.write(accessTokenKey, value);

  String? get refreshToken => box.read<String>(refreshTokenKey);
  set refreshToken(String? value) => box.write(refreshTokenKey, value);

  String? get userPhone => box.read<String>(userPhoneKey);
  set userPhone(String? value) => box.write(userPhoneKey, value);

  String? get userName => box.read<String>(userNameKey);
  set userName(String? value) => box.write(userNameKey, value);

  String? get vehicleNumber => box.read<String>(vehicleNumberKey);
  set vehicleNumber(String? value) => box.write(vehicleNumberKey, value);

  String? get bookingId => box.read<String>(bookingIdKey);
  set bookingId(String? value) => box.write(bookingIdKey, value);

// S-Cube code starts
  String? get userId => box.read<String>(userIdKey);
  set userId(String? value) => box.write(userIdKey, value);


// S-Cube code ends
}
