import 'package:flutter/material.dart';
import 'package:v2ray_vpn/l10n/app_localizations.dart';

class ErrorPage extends StatelessWidget {
  final String? error;
  const ErrorPage({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error ?? AppLocalizations.of(context)!.anUnknownErrorHasOccurred),
      ),
   );
  }
}
