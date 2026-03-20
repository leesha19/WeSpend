import 'dart:convert';


bool enableLogoutDialog = true;

InterceptorsWrapper networkInterceptor() {
  CancelToken cancelToken = CancelToken();
  return InterceptorsWrapper(
    onRequest: (request, handler) {
      List<String> apiEndPointWhereTokenNotRequired = [];
      for (var apiEndPoint in apiEndPointWhereTokenNotRequired) {
        if (request.uri.path == (apiEndPoint)) {
          request.headers.remove('Authorization');
        }
      }
      request.cancelToken = cancelToken;
      handler.next(request);
    },
    onResponse: (response, handler) {
      showLog('response.realUri.path>>>>${response.realUri.path}');
      // List<String> whiteListAPIs = ['/country/export'];
      try {
        if ((!whiteListAPIs.contains(response.realUri.path)) && (response.data is Map || (response.data is String && response.data.toString().isNotEmpty))) {
          CommonErrorModel commonModel = CommonErrorModel.fromJson(jsonDecode(response.toString()));
          if (commonModel.status != ApiEndPoints.apiStatus_200 /*&& commonModel.status != 500*/ ) {
            if (globalNavigatorKey.currentState?.context != null) {
              handler.next(response);
              return;
            }
          } else if (commonModel.status == 500) {
            // globalRef!.read(navigationStackController).pushAndRemoveAll(const NavigationStackItem.error(errorType: ErrorType.error403));
          }
        }
        handler.next(response);
      } catch (e, s) {
        AppConstants.constant.showLog('${AppConstants.stacktrace} $s');
        handler.reject(DioException(requestOptions: response.requestOptions, response: response, error: const NetworkExceptions.unexpectedError()), false);
      }
    },
    onError: (error, handler) {
      final response = error.response;

      showLog('object onErroronError ${error.response}');
      List<String> whiteListAPIs = [/*ApiEndPoints.storeUploadImage('')*/];
      bool isWhiteListed = false;
      for (var apiEndPoint in whiteListAPIs) {
        if (response?.realUri.path.contains(apiEndPoint) ?? false) {
          isWhiteListed = true;
          break;
        }
      }
      try {
        if(error.response !=null){
          if ((!isWhiteListed) &&
              /// If bytes is error response
              (error.requestOptions.responseType == ResponseType.bytes?
              (utf8.decode(response?.data).isNotEmpty)
              /// String respose
                  :(response?.data is Map || (response?.data is String && response!.data.toString().isNotEmpty)))
          ) {
            CommonErrorModel commonModel = CommonErrorModel.fromJson(jsonDecode(error.requestOptions.responseType == ResponseType.bytes ? utf8.decode(response?.data): response.toString()));
            if (commonModel.status != ApiEndPoints.apiStatus_200) {
              if (globalNavigatorKey.currentState?.context != null) {
                showErrorDialogue(
                  context: globalNavigatorKey.currentContext!,
                  dismissble: false,
                  // height: MediaQuery.sizeOf(globalNavigatorKey.currentContext!).height * 0.45,
                  width: MediaQuery.sizeOf(globalNavigatorKey.currentContext!).width * 0.3,
                  buttonText: LocaleKeys.keyOk.localized,
                  onTap: ()async
                  {
                    if(commonModel.status == ApiEndPoints.apiStatus_401 || commonModel.status == ApiEndPoints.apiStatus_406){
                      String appLanguageUUid = Session.getAppLanguage();
                      await Session.sessionBox.clear().then((value) {
                        Session.saveLocalData(keyAppLanguage, appLanguageUUid);
                        showLog('appLanguageUUid : ${Session.getAppLanguage()}');

                        showLog('===========================YOU LOGGED OUT FROM THE APP==============================');
                        Navigator.of(globalNavigatorKey.currentState!.context).pop();
                        AppConstants.constant.globalRef?.read(navigationStackController).pushAndRemoveAll( const NavigationStackItem.login());

                      });

                    }
                    else {
                      Navigator.pop(globalNavigatorKey.currentContext!);
                    }

                  },
                  animation: Assets.anim.animErrorJson.keyName,
                  successMessage:
                  commonModel.errorMessage == null ? (commonModel.message ?? '') : (commonModel.errorMessage ?? ''),

                );
                handler.reject(error);
                return;
              }
              else{
                var errorData = NetworkExceptions.getDioException(error);
                String errorMsg = NetworkExceptions.getErrorMessage(errorData);
                if (globalNavigatorKey.currentState?.context != null) {
                  showErrorDialogue(
                      context: globalNavigatorKey.currentContext!,
                      dismissble: false,
                      //  height: MediaQuery.sizeOf(globalNavigatorKey.currentContext!).height * 0.45,
                      width: MediaQuery.sizeOf(globalNavigatorKey.currentContext!).width * 0.3,
                      buttonText: LocaleKeys.keyOk.localized,
                      onTap: ()async
                      {
                        if(commonModel.status == ApiEndPoints.apiStatus_401 ){
                          String appLanguageUUid = Session.getAppLanguage();
                          await Session.sessionBox.clear().then((value) {
                            Session.saveLocalData(keyAppLanguage, appLanguageUUid);
                            showLog('appLanguageUUid : ${Session.getAppLanguage()}');

                            showLog('===========================YOU LOGGED OUT FROM THE APP==============================');
                            Navigator.of(globalNavigatorKey.currentState!.context).pop();
                            AppConstants.constant.globalRef?.read(navigationStackController).pushAndRemoveAll( const NavigationStackItem.login());

                          });


                        }
                        else {
                          Navigator.pop(globalNavigatorKey.currentContext!);
                        }

                      },
                      animation: Assets.anim.animErrorJson.keyName,
                      successMessage:errorMsg
                  );

                  return;
                }

              }
              handler.reject(error);
            }
          }
          else{
            handler.reject(error);
            return;
          }
        }else{
          var errorData = NetworkExceptions.getDioException(error);
          String errorMsg = NetworkExceptions.getErrorMessage(errorData);
          if (globalNavigatorKey.currentState?.context != null) {
            showErrorDialogue(
                context: globalNavigatorKey.currentContext!,
                dismissble: false,
                //  height: MediaQuery.sizeOf(globalNavigatorKey.currentContext!).height * 0.45,
                width: MediaQuery.sizeOf(globalNavigatorKey.currentContext!).width * 0.3,
                buttonText: LocaleKeys.keyOk.localized,
                onTap: ()async
                {
                  Navigator.pop(globalNavigatorKey.currentContext!);
                },
                animation: Assets.anim.animErrorJson.keyName,
                successMessage:errorMsg
            );
            handler.reject(error);
            return;
          }

        }

        // handler.next(response as DioException);
        handler.next(error);

      } catch (e) {
        handler.reject(
          DioException(requestOptions: response!.requestOptions, response: response, error: const NetworkExceptions.unexpectedError()),
        );
      }
      handler.next(error);
    },
  );
}