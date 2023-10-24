import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:sophie_messenger_app/base/blocs/lang_bloc.dart';
import 'package:sophie_messenger_app/base/blocs/theme_bloc.dart';
import 'package:sophie_messenger_app/handlers/shared_handler.dart';
import 'package:sophie_messenger_app/network/network_handler.dart';
import 'package:sophie_messenger_app/routers/navigator.dart';
import 'package:sophie_messenger_app/routers/routers.dart';
import 'package:sophie_messenger_app/utilities/theme/colors/colors.dart';
import 'package:sophie_messenger_app/utilities/theme/colors/light_theme.dart';
import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';

import 'handlers/localization_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedHandler.init();
  NetworkHandler.init();
  runApp(MyApp());


}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    langBloc.initLang();
    themeBloc.initTheme();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
      stream: langBloc.langStream,
      builder: (context, snapshot) {
        return StreamBuilder<ColorsTheme?>(
            stream: themeBloc.themeStream,
            builder: (context, snapshot) {
              ColorsTheme theme = themeBloc.theme.valueOrNull ?? LightTheme();
              SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
                systemNavigationBarColor: Colors.transparent,
                systemNavigationBarIconBrightness: Brightness.dark,
              ));
              return MaterialApp(
                title: 'Project Title',
                theme: ThemeData(
                    pageTransitionsTheme: const PageTransitionsTheme(
                      builders: {
                        TargetPlatform.android:
                            CupertinoPageTransitionsBuilder(),
                        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                      },
                    ),
                    textTheme: TextTheme(
                      bodyText1: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    appBarTheme: AppBarTheme(
                      centerTitle: true,
                      backgroundColor: HexColor("56cfca"),
             
                      elevation: 0.0,
                      iconTheme: IconThemeData(color: Colors.black,size: 26,),
                      actionsIconTheme: IconThemeData(color: Colors.black,size: 26,),
                      titleTextStyle: AppTextStyles.w700.copyWith(fontSize: 20)

                     
                    ),
                   
                    colorScheme: ColorScheme(
                      primary: theme.primary,
                      onBackground: theme.background,
                      onError: theme.error,
                      onSecondary: theme.secondery,
                      onSurface: Colors.white,
                      background: theme.background,
                      secondary: theme.secondery,
                      surface: Color(0xFF0A0E21),
                      error: theme.error,
                      onPrimary: theme.primary,
                      brightness: Brightness.light,
                    ),
                    fontFamily:
                        langBloc.lang.valueOrNull == 'en' ? "roboto" : "cairo",
                    scaffoldBackgroundColor: Colors.white,
                    backgroundColor: Colors.white),
                debugShowCheckedModeBanner: false,
                initialRoute: Routes.splash,
                navigatorKey: CustomNavigator.navigatorState,
                navigatorObservers: [CustomNavigator.routeObserver],
                scaffoldMessengerKey: CustomNavigator.scaffoldState,
                onGenerateRoute: CustomNavigator.onCreateRoute,

                // to tell the app what the language should support
                supportedLocales: const [Locale("en"), Locale("ar")],

                // to tell the app what the components should follow the determined language
                localizationsDelegates: const [
                  AppLocale.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],

             localeResolutionCallback: (currentLang, supportedLangs) {
                  // String? savedLgnCode = pref!.getString("lgnCode");
                  if (currentLang != null) {
                    for (Locale locale in supportedLangs) {
                      if (locale.languageCode == currentLang.languageCode)
                       {
                         return locale;
                       }
                    }
                  }
                  return supportedLangs.first;
                },
                locale: Locale(langBloc.lang.valueOrNull ?? "en"),
                // home:CustomNavigator.push(Routes.splash),
              );
            });
      },
    );
  }
}

