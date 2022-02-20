import 'package:bookmystall/app/data/Request/ApiRequest.dart';
import 'package:bookmystall/app/modules/login/models/otp_model.dart';
import 'package:bookmystall/app/modules/login/models/verify_otp_model.dart';

class LoginProvider {
  void requestOtp({
    required int phoneNumber,
    Function()? beforeSend,
    Function(OtpModel otpModel)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    print('--------------$phoneNumber--------------------');
    ApiRequest(
      url:
          'http://bookmystall.in/dev/public/api/Authentication/GetOTP/$phoneNumber',
      data: null,
    ).get(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        if (onSuccess != null) onSuccess(OtpModel.fromJson(data));
      },
      onError: (error) => {
        if (onError != null) onError(onError),
      },
    );
  }

  void verifyOtp({
    required VerifyOtpRequestModel verifyOtpRequestModel,
    Function()? beforeSend,
    Function(VerifyOtpResponseModel otpModel)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(
      url: 'http://bookmystall.in/dev/api/Authentication/Login',
      body: verifyOtpRequestModel.toJson(),
      data: null,
    ).post(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        if (onSuccess != null) onSuccess(VerifyOtpResponseModel.fromJson(data));
      },
      onError: (error) => {
        if (onError != null) onError(onError),
      },
    );
  }
}
