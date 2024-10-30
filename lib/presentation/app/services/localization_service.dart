import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controller/language_controller.dart';


class LocalizationService extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {};

  static Future<void> initLanguages() async {
    final keys = await readJson();
    Get.clearTranslations();
    Get.addTranslations(keys);
  }

  static Future<Map<String, Map<String, String>>> readJson() async {
    final languageController = Get.put(LanguageController());

    // Load the main languages.json file
    final mainRes = await rootBundle.loadString('assets/l18n/languages.json');
    final mainData = jsonDecode(mainRes);
    // Get the list of language file names
    List<dynamic> languagesList = mainData;

    final keys = <String, Map<String, String>>{};

    for (String fileName in languagesList) {
      final res = await rootBundle.loadString('assets/l18n/$fileName');
      final data = jsonDecode(res);
      final listData = I18nModel.fromJson(data);

      List<String> parts = listData.code!.split('_');
      String languageCode = parts[0];
      String countryCode = parts[1];

      languageController.languages.add({
        'code': "${languageCode}_$countryCode",
        'name': listData.name.toString(),
      });
      languageController.localeLanguages.add(Locale(languageCode, countryCode));
      final String? translationKey = listData.code;
      keys[translationKey!] = listData.texts!;
    }

    return keys;
  }
}

class I18nModel {
  String? name;
  String? code;
  Map<String, String>? texts;

  I18nModel(
      {this.name, this.code, this.texts});

  I18nModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    if (json['texts'] != null) {
      texts = Map<String, String>.from(json['texts']);
    }
  }
}