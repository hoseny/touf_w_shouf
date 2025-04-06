import 'package:flutter/cupertino.dart';

bool isEnglish(BuildContext context) {
  return Localizations.localeOf(context).languageCode == 'en';
}
