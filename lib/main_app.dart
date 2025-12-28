import 'package:flutter/material.dart';
import 'package:v2ray_vpn/l10n/app_localizations.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context){
        return AppLocalizations.of(context)!.appName;
      },
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Container(),
    );
  }
}
