import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';


const String keyRoleType = 'keyRoleType';
const String keyEntityUuid = 'keyEntityUuid';
const String keyUserUuid = 'keyUserUuid';
const String keyClientUuid = 'keyClientUuid';
const String keyDestinationUuid = 'keyDestinationUuid';
const String keyEntityType = 'keyEntityType';
const String keyRoleUuid = 'keyRoleUuid';
const String keyEmail = 'keyEmail';
const String keyContactNumber = 'keyContactNumber';
const String keyAppOtpSeconds = 'keyAppOtpSeconds';
const String keyAppLanguageUuid = 'keyAppLanguageUuid';
const String keyUserType = 'keyUserType';
const String keyAppLanguage = 'keyAppLanguage';
const String keyTextDirection = 'keyTextDirection';
const String keyFCMToken = 'keyFCMToken';
const String keyDeviceId = 'keyDeviceId';
const String keyCurrency = 'keyCurrency';
const String keyPermissions = 'keyPermissions';

class Session {
  Session._();


  static Session session = Session._();

  static var sessionBox = Hive.box(AppConstants.userBoxName);
  static String keyUserAccessToken = 'keyUserAuthToken';


  static String get userAccessToken => sessionBox.get(keyUserAccessToken) ?? '';

  static String get fcmToken => sessionBox.get(keyFCMToken) ?? '';
  static String get deviceId => sessionBox.get(keyDeviceId) ?? '';

  static set userAccessToken(String? userAccessToken) => saveLocalData(keyUserAccessToken, userAccessToken);

  static set fcmToken(String? fcmToken) => saveLocalData(keyFCMToken, fcmToken);

  static set deviceId(String? deviceId) => saveLocalData(keyDeviceId, deviceId);

  static String getAppLanguage() => (sessionBox.get(keyAppLanguage) ?? '');


  static String keyAesIv = 'keyAesIv';

  static String get aesIv => sessionBox.get(keyAesIv) ?? '';

  static set aesIv(String aesIv) => saveLocalData(keyAesIv, aesIv);

  static String keyAesKey = 'keyAesKey';

  static String get aesKey => sessionBox.get(keyAesKey) ?? '';

  static set aesKey(String aesKey) => saveLocalData(keyAesKey, aesKey);

  static String keyIsRtL = 'keyIsRtL';

  static bool get isRTL => sessionBox.get(keyIsRtL) ?? false;

  static set isRTL(bool isRTL) => saveLocalData(keyIsRtL, isRTL);

  static List<String> getCacheData(String key) => ((jsonDecode(sessionBox.get(key) ?? jsonEncode([]))) as List).map((e) => e.toString()).toList();

  static setCacheData(String key, List<String> cacheData) => saveLocalData(key, jsonEncode(cacheData));


  static String getUserType() => (sessionBox.get(keyUserType) ?? '');

  static set userType(String userType) => (saveLocalData(keyUserType, userType));

  static String getRoleType() => (sessionBox.get(keyRoleType) ?? '');

  static set roleType(String roleType) => (saveLocalData(keyRoleType, roleType));

  static String getRoleUuid() => (sessionBox.get(keyRoleUuid) ?? '');

  static set roleUuid(String roleUuid) => (saveLocalData(keyRoleUuid, roleUuid));

  static String getEntityUuid() => (sessionBox.get(keyEntityUuid) ?? '');
  static String getEntityType() => (sessionBox.get(keyEntityType) ?? '');

  static set entityUuid(String entityUuid) => (saveLocalData(keyEntityUuid, entityUuid));
  static set entityType(String entityType) => (saveLocalData(keyEntityType, entityType));

 static String getUserUuid() => (sessionBox.get(keyUserUuid) ?? '');

  static set userUuid(String userUuid) => (saveLocalData(keyUserUuid, userUuid));

 static String getClientUuid() => (sessionBox.get(keyClientUuid) ?? '');

  static set clientUuid(String clientUuid) => (saveLocalData(keyClientUuid, clientUuid));

 static String getDestinationUuid() => (sessionBox.get(keyDestinationUuid) ?? '');

  static set destinationUuid(String destinationUuid) => (saveLocalData(keyDestinationUuid, destinationUuid));

  static String get contactNumber => (sessionBox.get(keyContactNumber) ?? '');

  static set contactNumber(String contactNumber) => (saveLocalData(keyContactNumber, contactNumber));

  static String get email => (sessionBox.get(keyEmail) ?? '');

  static set email(String email) => (saveLocalData(keyEmail, email));


  static String keyLanguageModel = 'keyLanguageModel';

  static set languageModel(String languageRes) => saveLocalData(keyLanguageModel, languageRes);

  static String get languageModel => (sessionBox.get(keyLanguageModel) ?? '');

  static set appCurrency(String currency) => saveLocalData(keyCurrency, currency);

  static String get appCurrency => (sessionBox.get(keyCurrency) ??AppConstants.currency);

  static void saveLocalData(String key, dynamic value) {
    sessionBox.put(key, value);
  }

  static String getPermissionFromHive() => (sessionBox.get(keyPermissions));

  // ///Session Logout
  // static Future sessionLogout(WidgetRef ref, BuildContext context) async {
  //   String appLanguageUUid = getAppLanguage();
  //   String languageRes = languageModel;
  // }

  ///Session Logout
  static Future sessionLogout(WidgetRef ref, BuildContext context) async {
    String appLanguageUUid = getAppLanguage();
    ref.read(loginController).disposeController(isNotify: true);

    if(Session.deviceId.isNotEmpty){
      await ref.read(loginController).logoutApi(context).then((value) async {
        if(value.success?.status == ApiEndPoints.apiStatus_200){
          await Session.sessionBox.clear().then((value) {

            Session.saveLocalData(keyAppLanguage, appLanguageUUid);
            showLog('appLanguageUUid : ${Session.getAppLanguage()}');

            showLog('===========================YOU LOGGED OUT FROM THE APP==============================');
            Router.neglect(context, (){
              ref.read(navigationStackController).pushAndRemoveAll( const NavigationStackItem.login());
            });

          });
        }
      },);
    }
    else{
      await Session.sessionBox.clear().then((value) {
        Session.saveLocalData(keyAppLanguage, appLanguageUUid);

        Router.neglect(context, (){
          ref.read(navigationStackController).pushAndRemoveAll( const NavigationStackItem.login());
        });
      });
    }
  }

}
