import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wespend/framework/dependency_injection/inject.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wespend/ui/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wespend/ui/utils/app_constants.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await configureMainDependencies(environment: AppConstants.appEnv);



  await Hive.initFlutter();
  await Hive.openBox(AppConstants.userBoxName);
  await Hive.openBox(AppConstants.zoomBoxName);

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const <Locale>[Locale('en'), Locale('ar')],
        useOnlyLangCode: true,
        path: 'assets/lang',
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      AppConstants.constant.globalRef = ref;
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
        builder: (context, child){
          return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: AppConstants.appName,
              theme: ThemeData(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                scaffoldBackgroundColor: const Color(0xFF0D0A1E),
              ),
              supportedLocales: EasyLocalization.of(context)!.supportedLocales,
              // scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
              localizationsDelegates: context.localizationDelegates,
              locale: EasyLocalization.of(context)!.locale,
              routerConfig: appRouter

          );
        }

    );
  }
}
