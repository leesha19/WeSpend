
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


@LazySingleton(as: AuthRepository, env: Env.environments)
class AuthApiRepository implements AuthRepository {
  final DioClient apiClient;

  AuthApiRepository(this.apiClient);

  @override
  Future forgotPasswordApi(String request) async {
    try {
      Response? response = await apiClient.postRequest(ApiEndPoints.forgotPassword, request);
      CommonResponseModel responseModel = commonResponseModelFromJson(response.toString());
      return ApiResult.success(data: responseModel);
    } catch (err) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(err));
    }
  }

  @override
  Future loginApi(String request) async {
    try {
      Response? response = await apiClient.postRequest(ApiEndPoints.login, request);
      LoginResponseModel responseModel = loginResponseModelFromJson(response.toString());
      return ApiResult.success(data: responseModel);
    } catch (err) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(err));
    }
  }

  @override
  Future resendOtpApi(String request) async {
    try {
      Response? response = await apiClient.postRequest(ApiEndPoints.resendOtp, request);
      CommonResponseModel responseModel = commonResponseModelFromJson(response.toString());
      return ApiResult.success(data: responseModel);
    } catch (err) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(err));
    }
  }

  @override
  Future resetPasswordApi(String request) async{
    try {
      Response? response = await apiClient.postRequest(ApiEndPoints.resetPassword, request);
      CommonResponseModel responseModel = commonResponseModelFromJson(response.toString());
      return ApiResult.success(data: responseModel);
    } catch (err) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(err));
    }
  }

  @override
  Future verifyOtpApi(String request) async{
    try {
      Response? response = await apiClient.putRequest(ApiEndPoints.verifyOtp, request);
      CommonResponseModel responseModel = commonResponseModelFromJson(response.toString());
      return ApiResult.success(data: responseModel);
    } catch (err) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(err));
    }
  }

  @override
  Future getLanguageListAPI() async{
    try {
      Response? response = await apiClient.getRequest(ApiEndPoints.getLanguageList);
      GetLanguageListResponseModel responseModel = getLanguageListResponseModelFromJson(response.toString());
      if (responseModel.status == ApiEndPoints.apiStatus_200) {
        return ApiResult.success(data: responseModel);
      } else {
        return ApiResult.failure(error: NetworkExceptions.defaultError(responseModel.message ?? ''));
      }
    } catch (err) {
      showLog('error $err');
      return ApiResult.failure(error: NetworkExceptions.getDioException(err));
    }
  }

  // @override
  // Future registerDeviceApi(String request) async{
  //   try {
  //     Response? response = await apiClient.postRequest(ApiEndPoints.deviceDetail,request);
  //     CommonResponseModel responseModel =  commonResponseModelFromJson(response.toString());
  //     return ApiResult.success(data: responseModel);
  //   } catch (err) {
  //     return ApiResult.failure(error: NetworkExceptions.getDioException(err));
  //   }
  // }
  //
  @override
  Future deleteDeviceTokenApi(String deviceId) async{
    try {
      Response? response = await apiClient.deleteRequest(ApiEndPoints.deleteDeviceDetail(deviceId),'');
      CommonResponseModel responseModel =  commonResponseModelFromJson(response.toString());
      return ApiResult.success(data: responseModel);
    } catch (err) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(err));
    }
  }

  @override
  Future logoutApi(String uniqueDeviceId) async{
    try {
      Response? response = await apiClient.deleteRequest(ApiEndPoints.logout,uniqueDeviceId);
      CommonResponseModel responseModel =  commonResponseModelFromJson(response.toString());
      return ApiResult.success(data: responseModel);
    } catch (err) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(err));
    }
  }


}
