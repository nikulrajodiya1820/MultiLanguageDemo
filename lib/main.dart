import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multilanguage_demo/app_localization.dart';

void main() {
  runApp(
    EasyLocalization(child: MyApp(),supportedLocales: [
        Locale("en","US"),
          Locale('hi',"IN")
    ],
    path: "assets/json",
    fallbackLocale: Locale("en","US"),
    ));
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
  //  Multilanguage.setLanguage(path: Languages.en, context: context);
    return MaterialApp(
      // supportedLocales: [
        
      // ],
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      // localizationsDelegates: [
      //   AppLocalization.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate
      // ],
      // localeResolutionCallback:(locale,supportedLocales) {
      //     for(var supportedLocale in supportedLocales)
      //     {
      //       if(supportedLocale.languageCode==locale.languageCode && supportedLocale.countryCode==locale.countryCode)
      //       {
      //         return supportedLocale;
      //       }
      //     }
      //     return supportedLocales.first;
      // },
      home: Scaffold(
        appBar: AppBar(
          title: Text("title").tr()
        ),
        body: Center(
          child: Column(
            children: [
              RaisedButton(
               onPressed: (){
                context.locale=Locale("hi","IN");
               },
                child: Text('Hindi Language'),
              ),
              RaisedButton(
               onPressed: (){
                context.locale=Locale("en","US");
               },
                child: Text('English Language'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

