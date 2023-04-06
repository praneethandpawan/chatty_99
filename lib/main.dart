import 'package:chatty/common/utils/FirebaseMassagingHandler.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:chatty/common/langs/translation_service.dart';
import 'package:chatty/common/routes/pages.dart';
import 'package:chatty/common/store/store.dart';
import 'package:chatty/common/style/style.dart';
import 'package:chatty/common/utils/utils.dart';
import 'package:chatty/global.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

Future<void> main() async {
  await Global.init();
  runApp(MyApp());
  firebaseInit().whenComplete(() {
    FirebaseMassagingHandler.config();
  });
}
//8012010862
Future firebaseInit() async {
  FirebaseMessaging.onBackgroundMessage(
    FirebaseMassagingHandler.firebaseMessagingBackground,
  );
  if (GetPlatform.isAndroid) {
    FirebaseMassagingHandler.flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!
        .createNotificationChannel(FirebaseMassagingHandler.channel_call);
    FirebaseMassagingHandler.flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!
        .createNotificationChannel(FirebaseMassagingHandler.channel_message);
  }
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 780),
      builder: (context , child) => RefreshConfiguration(
        headerBuilder: () => ClassicHeader(),
        footerBuilder: () => ClassicFooter(),
        hideFooterWhenNotFull: true,
        headerTriggerDistance: 80,
        maxOverScrollExtent: 100,
        footerTriggerDistance: 150,
        child: GetMaterialApp(
          title: 'Groupiee',
          theme: AppTheme.light,
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          builder: EasyLoading.init(),
          translations: TranslationService(),
          navigatorObservers: [AppPages.observer],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: ConfigStore.to.languages,
          locale: ConfigStore.to.locale,
          fallbackLocale: Locale('en', 'US'),
          enableLog: true,
          logWriterCallback: Logger.write,
        ),
      ),
    );
  }
}



