import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils_export.dart';

class LanguageController extends GetxController{

  LanguageModel languageModel = LanguageModel(languageCode: "", countryCode: "");

  List<Locale> supportedLocale = [];
  List<Map<String, String>> languages = [];
  List<Locale> localeLanguages = [];
  String prefSelectedLanguageCode = "SelectedLanguageCode";
  String prefSelectedCountryCode = "SelectedCountryCode";

  setLocale(String languageCode, String countryCode) async {
    LocalStorageDb.writeSecureData(prefSelectedLanguageCode, languageCode);
    LocalStorageDb.writeSecureData(prefSelectedCountryCode, countryCode);
    languageModel = LanguageModel(languageCode: languageCode,countryCode: countryCode);
    Get.updateLocale(Locale(languageCode,countryCode));
  }

  Future<Locale> getSupportedLocale(String countryCode) async {
    Locale matchingLocale = supportedLocale.firstWhere((locale) {
      return locale.countryCode == countryCode;
    }, orElse: () => const Locale("en", "US"));

    return matchingLocale;
  }

  Future<Locale> getLocale() async {
    String languageCode = LocalStorageDb.readSecureData(prefSelectedLanguageCode);
    String countryCode = LocalStorageDb.readSecureData(prefSelectedCountryCode);
    if (languageCode == "" && languageCode == "") {
      Locale locale = await getSupportedLocale(countryCode);
      countryCode = locale.countryCode ?? "US";
      languageCode = locale.languageCode;
    }
    languageModel = LanguageModel(languageCode: languageCode,countryCode: countryCode);


    return _locale(languageCode, countryCode);
  }

  Locale _locale(String languageCode, String countryCode) {
    return languageCode.isNotEmpty ? Locale(languageCode, countryCode) : const Locale('en', 'US');
  }
}

class LanguageModel {
  LanguageModel({ this.languageCode, this.countryCode});

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      languageCode: json['languageCode'] as String?,
      countryCode: json['countryCode'] as String?,
    );
  }

  String? languageCode;
  String? countryCode;

  Map<String, dynamic> toJson() {
    return {
      'languageCode': languageCode,
      'countryCode': countryCode,
    };
  }
}